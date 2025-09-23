# Identify processes maintaining external (non-private) connections
# Fixes: $PID conflict + consistent UTF-8 file output

Set-StrictMode -Version Latest

Function Assert-Elevation {
    $id = [Security.Principal.WindowsIdentity]::GetCurrent()
    $pr = New-Object Security.Principal.WindowsPrincipal($id)
    if (-not $pr.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host 'Elevation required - relaunching as Administrator...'
        $psExe = (Get-Command powershell -ErrorAction SilentlyContinue).Source
        if (-not $psExe) { $psExe = 'powershell' }
        $psi = New-Object System.Diagnostics.ProcessStartInfo
        $psi.FileName = $psExe
        $psi.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
        $psi.Verb = "runas"
        try {[System.Diagnostics.Process]::Start($psi) | Out-Null; Exit 0}
        catch {Write-Host 'Elevation cancelled or failed. Exiting.'; Exit 1}
    } else { Write-Host 'Administrator mode detected, continuing...' }
}

Function IsPrivateIP($ip) {
    if (-not $ip) { return $true }
    if ($ip -in @('0.0.0.0','::','127.0.0.1','::1')) { return $true }
    if ($ip -match ':') { return $false } # treat IPv6 as external here
    if ($ip -match '^10\.') { return $true }
    if ($ip -match '^172\.(1[6-9]|2[0-9]|3[0-1])\.') { return $true }
    if ($ip -match '^192\.168\.') { return $true }
    if ($ip -match '^169\.254\.') { return $true }
    return $false
}

# --- Start (elevation) ---
Assert-Elevation

# --- Output (consistent UTF-8) ---
$timestamp = (Get-Date).ToString('yyyyMMdd_HHmmss')
$outdir    = Join-Path -Path $env:TEMP -ChildPath "weird_conns_$timestamp"
New-Item -Path $outdir -ItemType Directory -Force | Out-Null
$outfile   = Join-Path $outdir "weird_conns_report_$timestamp.txt"

# IMPORTANT: initialize in UTF-8 (otherwise Notepad may show garbled text)
Set-Content -Path $outfile -Value "" -Encoding UTF8

Function Write-Out { param($text) $text | Out-File -FilePath $outfile -Append -Encoding UTF8 }

# --- Header ---
Write-Out "Weird connections report - generated on $(Get-Date)"
Write-Out "Output folder: $outdir"
Write-Out ("-" * 70)
Write-Out ""

# --- Collect connections ---
Write-Out "Collecting established TCP connections..."
try {
    $allConns = Get-NetTCPConnection -State Established -ErrorAction Stop
} catch {
    Write-Out "Get-NetTCPConnection failed: $_"
    $ns = netstat -ano 2>$null
    Write-Out "Netstat fallback output:"
    Write-Out $ns
    Write-Out ""
    Write-Host "Get-NetTCPConnection unavailable; netstat output saved to report. Exiting."
    Start-Process notepad.exe $outfile
    Read-Host -Prompt 'Press Enter to close'
    Exit 1
}

$extConns = $allConns | Where-Object { -not (IsPrivateIP $_.RemoteAddress) -and $_.RemoteAddress -ne $null }

if (-not $extConns -or $extConns.Count -eq 0) {
    Write-Out "No external (non-private) established TCP connections detected."
    Write-Out ""
    Write-Out "End of report."
    Start-Process notepad.exe $outfile
    Read-Host -Prompt 'Press Enter to close'
    Exit 0
}

Write-Out "External connections found: $($extConns.Count)"
Write-Out ""

# --- Details per process ---
$processEntries = @()

foreach ($c in $extConns) {
    $ProcId = $c.OwningProcess   # <-- renamed (avoid $PID confusion)
    $proc = Get-Process -Id $ProcId -ErrorAction SilentlyContinue

    $procPath  = $null
    $cmdLine   = $null
    $parentPid = $null

    if ($proc) {
        try { $procPath = $proc.Path } catch {}
        try {
            $wmi = Get-CimInstance Win32_Process -Filter "ProcessId=$ProcId" -ErrorAction SilentlyContinue
            if ($wmi) { $cmdLine = $wmi.CommandLine; $parentPid = $wmi.ParentProcessId }
        } catch {}
    }

    $sha256 = $null
    if ($procPath -and (Test-Path $procPath)) {
        try { $h = Get-FileHash -Path $procPath -Algorithm SHA256 -ErrorAction SilentlyContinue
              if ($h) { $sha256 = $h.Hash } } catch {}
    }

    $processEntries += [PSCustomObject]@{
        PID         = $ProcId
        ProcessName = if ($proc) { $proc.ProcessName } else { "<no-process>" }
        Path        = $procPath
        ParentPID   = $parentPid
        CommandLine = $cmdLine
        SHA256      = $sha256
        Local       = "$($c.LocalAddress):$($c.LocalPort)"
        Remote      = "$($c.RemoteAddress):$($c.RemotePort)"
    }
}

# --- Summary ---
$grouped = $processEntries | Group-Object PID

Write-Out "Summary per process (unique PIDs):"
Write-Out ("{0,-8} {1,-25} {2,-10} {3,-20}" -f "PID","ProcessName","#Conns","RemoteSample")
foreach ($g in $grouped) {
    $ProcId       = $g.Name   # <-- renamed (avoid $PID confusion)
    $procName     = ($g.Group | Select-Object -First 1).ProcessName
    $connCount    = $g.Count
    $remoteSample = ($g.Group | Select-Object -First 1).Remote
    Write-Out ("{0,-8} {1,-25} {2,-10} {3,-20}" -f $ProcId, $procName, $connCount, $remoteSample)
}
Write-Out ""
Write-Out "Detailed entries:"
Write-Out ("-" * 70)

foreach ($e in $processEntries | Sort-Object PID) {
    $p_Path   = if ($e.Path) { $e.Path } else { "<unknown>" }
    $p_Parent = if ($e.ParentPID) { $e.ParentPID } else { "<unknown>" }
    $p_Cmd    = if ($e.CommandLine) { $e.CommandLine } else { "<none>" }
    $p_Hash   = if ($e.SHA256) { $e.SHA256 } else { "<n/a>" }

    Write-Out ("PID        : {0}" -f $e.PID)
    Write-Out ("Process    : {0}" -f $e.ProcessName)
    Write-Out ("Path       : {0}" -f $p_Path)
    Write-Out ("ParentPID  : {0}" -f $p_Parent)
    Write-Out ("CmdLine    : {0}" -f $p_Cmd)
    Write-Out ("SHA256     : {0}" -f $p_Hash)
    Write-Out ("Local      : {0}" -f $e.Local)
    Write-Out ("Remote     : {0}" -f $e.Remote)
    Write-Out ("-" * 40)
}

# --- Heuristics ---
$totalExtConns = $extConns.Count
$uniquePids    = ($processEntries | Select-Object -ExpandProperty PID | Sort-Object -Unique).Count
$fromAppData   = ($processEntries | Where-Object { $_.Path -and ($_.Path -match '\\AppData\\|\\Temp\\|\\Downloads') }).Count

$days = 7
$folders = @("$env:USERPROFILE\AppData\Roaming","$env:USERPROFILE\AppData\Local\Temp","$env:USERPROFILE\Downloads")
$recentExeFiles = @()
foreach ($f in $folders) {
    if (Test-Path $f) {
        try {
            $recentExeFiles += Get-ChildItem -Path $f -Recurse -ErrorAction SilentlyContinue |
                Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -gt (Get-Date).AddDays(-$days) -and ($_.Extension -match '\.exe|\.dll|\.ps1') } |
                Select-Object FullName,LastWriteTime
        } catch {}
    }
}
$exeRecentCount = $recentExeFiles.Count

Write-Out ""
Write-Out "HEURISTIC SUMMARY"
Write-Out ("-" * 30)
Write-Out ("Total external established connections : {0}" -f $totalExtConns)
Write-Out ("Unique processes involved              : {0}" -f $uniquePids)
Write-Out ("Processes from AppData/Temp/Downloads : {0}" -f $fromAppData)
Write-Out ("Recent executables in AppData/Temp/Downloads (last {0} days) : {1}" -f $days, $exeRecentCount)

$riskMsg = ""
if ($fromAppData -gt 0 -and $totalExtConns -gt 5) {
    $riskMsg = "VERY LIKELY: C2/beaconing + persistence. Strong signs of active compromise."
} elseif ($totalExtConns -gt 5) {
    $riskMsg = "LIKELY: Many external connections, investigate further."
} elseif ($fromAppData -gt 0) {
    $riskMsg = "POSSIBLE: Processes from AppData/Temp/Downloads found, suspicious."
} else {
    $riskMsg = "LOWER RISK: No strong persistence indicators found in these checks."
}
Write-Out ""
Write-Out "Assessment: $riskMsg"
Write-Out ""
Write-Out "Recommended immediate actions:"
Write-Out "1) Isolate the machine from network."
Write-Out "2) Do not use for sensitive operations. From a clean device, change passwords."
Write-Out "3) Optionally, backup only user documents (no executables) and reinstall."
Write-Out ""
Write-Out "Report generation complete."

Start-Process notepad.exe $outfile
Read-Host -Prompt 'Press Enter to close and exit'
