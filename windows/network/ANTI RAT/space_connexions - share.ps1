<#
.SYNOPSIS
  “Share-safe” report of external connections per process (no full paths/command lines).

.PARAMETER RevealIPs
  Do NOT mask IP addresses (show full IPs). Default = masked.

.PARAMETER IncludeHash
  Add SHA256 of executables (still without showing file paths).

.PARAMETER Csv
  Also export a shareable CSV file (in addition to the .txt).
#>

[CmdletBinding()]
param(
  [switch]$RevealIPs,
  [switch]$IncludeHash,
  [switch]$Csv
)

Set-StrictMode -Version Latest

function Assert-Elevation {
  $id = [Security.Principal.WindowsIdentity]::GetCurrent()
  $pr = [Security.Principal.WindowsPrincipal]::new($id)
  if (-not $pr.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host 'Elevation required - relaunching as Administrator...'
    $psExe = (Get-Command powershell -ErrorAction SilentlyContinue).Source
    if (-not $psExe) { $psExe = 'powershell' }
    $psi = [System.Diagnostics.ProcessStartInfo]::new()
    $psi.FileName = $psExe
    $psi.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" " + `
                     (@($RevealIPs,$IncludeHash,$Csv) | ForEach-Object {
                        if ($_){ '-'+($_.GetType().Name) }}) -join ' '
    $psi.Verb = "runas"
    try { [System.Diagnostics.Process]::Start($psi) | Out-Null; exit 0 }
    catch { Write-Host 'Elevation cancelled or failed. Exiting.'; exit 1 }
  }
}

function IsPrivateIP($ip){
  if (-not $ip) { return $true }
  if ($ip -in @('0.0.0.0','::','127.0.0.1','::1')) { return $true }
  if ($ip -match ':') { return $false } # treat IPv6 as external (no masking granularity)
  if ($ip -match '^10\.') { return $true }
  if ($ip -match '^172\.(1[6-9]|2[0-9]|3[0-1])\.') { return $true }
  if ($ip -match '^192\.168\.') { return $true }
  if ($ip -match '^169\.254\.') { return $true }
  return $false
}

function Mask-IP($ip){
  if ($RevealIPs) { return $ip }
  if (-not $ip) { return $ip }
  if ($ip -match ':') { return 'IPv6:masked' }
  # IPv4 → replace final octet
  $parts = $ip.Split('.')
  if ($parts.Count -eq 4) { $parts[3] = 'x'; return ($parts -join '.') }
  return $ip
}

function Categorize-Path($path){
  # Do not leak full path → return only a category
  try {
    if (-not $path) { return 'Other' }
    $p = $path.ToLowerInvariant()
    if ($p -like 'c:\windows\system32*')     { return 'System32' }
    if ($p -like 'c:\windows*')              { return 'Windows' }
    if ($p -like 'c:\program files*' -or
        $p -like 'c:\program files (x86)*')  { return 'ProgramFiles' }
    if ($p -like '*\appdata\*' -or
        $p -like '*\temp\*'    -or
        $p -like '*\downloads\*')           { return 'AppData-Temp-Downloads' }
    return 'Other'
  } catch { return 'Other' }
}

function Get-SignedStatus($path){
  try {
    if (-not $path -or -not (Test-Path $path)) { return 'Unknown' }
    $sig = Get-AuthenticodeSignature -FilePath $path -ErrorAction SilentlyContinue
    if (-not $sig) { return 'Unknown' }
    switch ($sig.Status) {
      'Valid'     { return 'Signed-Valid' }
      'NotSigned' { return 'Unsigned' }
      default     { return "Signed-$($sig.Status)" }
    }
  } catch { return 'Unknown' }
}

# --- start ---
Assert-Elevation

$timestamp = (Get-Date).ToString('yyyyMMdd_HHmmss')
$outdir    = Join-Path $env:TEMP "shareable_conns_$timestamp"
New-Item -ItemType Directory -Path $outdir -Force | Out-Null
$outfile   = Join-Path $outdir "shareable_conns_$timestamp.txt"
$outcsv    = Join-Path $outdir "shareable_conns_$timestamp.csv"

Set-Content -Path $outfile -Value "" -Encoding UTF8
function Write-Out([string]$t){ $t | Out-File -FilePath $outfile -Append -Encoding UTF8 }

Write-Out "Shareable Connections Report - $(Get-Date)"
Write-Out "Output: $outdir"
Write-Out "Notes: IPs masked by default; no file paths or command lines are shown."
Write-Out ("-"*70)

# Collect connections
try {
  $allConns = Get-NetTCPConnection -State Established -ErrorAction Stop
} catch {
  Write-Out "Get-NetTCPConnection not available. Exiting (no raw netstat in shareable mode)."
  Start-Process notepad.exe $outfile
  Read-Host -Prompt 'Press Enter to close'
  exit 1
}

$ext = $allConns | Where-Object { -not (IsPrivateIP $_.RemoteAddress) -and $_.RemoteAddress }

if (-not $ext -or $ext.Count -eq 0){
  Write-Out "No external (non-private) established TCP connections detected."
  Write-Out ("-"*70)
  Start-Process notepad.exe $outfile
  Read-Host -Prompt 'Press Enter to close'
  exit 0
}

# Build entries per connection (no cleartext paths)
$rows = @()
foreach ($c in $ext){
  $ProcId = $c.OwningProcess
  $p = Get-Process -Id $ProcId -ErrorAction SilentlyContinue
  $pname = if ($p) { $p.ProcessName } else { "<no-process>" }

  # Retrieve path to categorize & check signature, but DO NOT STORE IT
  $ppath = $null
  try { if ($p){ $ppath = $p.Path } } catch {}
  $origin = Categorize-Path $ppath
  $signed = Get-SignedStatus $ppath

  $hash = $null
  if ($IncludeHash -and $ppath -and (Test-Path $ppath)){
    try { $hash = (Get-FileHash -Path $ppath -Algorithm SHA256 -ErrorAction SilentlyContinue).Hash } catch {}
  }

  $rows += [PSCustomObject]@{
    PID          = $ProcId
    ProcessName  = $pname
    Origin       = $origin
    Signed       = $signed
    RemoteIP     = (Mask-IP $c.RemoteAddress)
    RemotePort   = $c.RemotePort
    LocalPort    = $c.LocalPort
    SHA256       = if ($IncludeHash) { if ($hash){$hash}else{'<n/a>'} } else { '<omitted>' }
  }
}

# Group by process for a shareable summary
$byProc = $rows | Group-Object PID | Sort-Object Count -Descending

Write-Out ""
Write-Out "Summary per process:"
Write-Out ("{0,-8} {1,-24} {2,-8} {3,-22} {4,-14}" -f "PID","ProcessName","#Conns","Origin","Signed")
foreach($g in $byProc){
  $head = $g.Group | Select-Object -First 1
  Write-Out ("{0,-8} {1,-24} {2,-8} {3,-22} {4,-14}" -f $head.PID,$head.ProcessName,$g.Count,$head.Origin,$head.Signed)
}
Write-Out ""

# Sample of remote endpoints per process (masked unless -RevealIPs)
Write-Out "Top remote endpoints per process (masked unless -RevealIPs):"
foreach($g in $byProc){
  $head = $g.Group | Select-Object -First 1
  $remotes = $g.Group | Select-Object -ExpandProperty RemoteIP | Group-Object | Sort-Object Count -Descending | Select-Object -First 5
  $rlist = ($remotes | ForEach-Object { "$($_.Name)×$($_.Count)" }) -join ", "
  if (-not $rlist) { $rlist = "<none>" }
  Write-Out ("PID {0} ({1}): {2}" -f $head.PID, $head.ProcessName, $rlist)
}
Write-Out ("-"*70)

# Optional CSV
if ($Csv){
  try { $rows | Select-Object PID,ProcessName,Origin,Signed,RemoteIP,RemotePort,LocalPort,SHA256 | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $outcsv } catch {}
  Write-Out "CSV exported: $outcsv"
}

Write-Out "Shareable report generated."
Start-Process notepad.exe $outfile
Read-Host -Prompt 'Press Enter to close'
