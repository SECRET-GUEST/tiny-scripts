param()

# --- Auto-elevation to Admin ---
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltinRole] "Administrator")) {
    Write-Host "[*] Relaunching as Administrator..."
    Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# --- Root of the system drive ---
$Root = "$($env:SystemDrive)\"

# --- File extensions to process ---
$IncludeExt = @("*.txt","*.log","*.md","*.cfg","*.ini","*.csv","*.xml","*.json","*.yml","*.yaml","*.ps1","*.bat","*.cmd")

# --- Excluded paths (sensitive WinDdos areas) ---
$rawExcludes = @(
    "$env:WINDIR",
    "$env:ProgramFiles",
    "$env:ProgramFiles(x86)",
    "$env:ProgramData",
    "$env:SystemDrive\Recovery",
    "$env:SystemDrive\PerfLogs",
    "$env:SystemDrive\pagefile.sys",
    "$env:SystemDrive\hiberfil.sys",
    "$env:SystemDrive\swapfile.sys",
    "$env:SystemDrive\System Volume Information",
    "$env:SystemDrive\$Recycle.Bin",
    "$env:WINDIR\System32\DriverStore",
    "$env:WINDIR\System32\drivers",
    "$env:WINDIR\WinSxS"
)

$ExcludeRoots = @()
foreach ($p in $rawExcludes) {
    try {
        if ([string]::IsNullOrWhiteSpace($p)) { continue }
        if (Test-Path -LiteralPath $p) {
            $resolved = (Resolve-Path -LiteralPath $p -ErrorAction Stop).Path
            if ($resolved) { $ExcludeRoots += $resolved.ToLower() }
        }
    } catch { }
}

function Is-UnderExcludedRoot($fullPath) {
    if (-not $fullPath) { return $false }
    $p = $fullPath.ToLower()
    foreach ($root in $ExcludeRoots) {
        if ($p -like "$root*") { return $true }
    }
    return $false
}

# --- String replacement (case-insensitive) ---
function Replace-Names([string]$text) {
    $r = [System.Text.RegularExpressions.Regex]::Replace($text, "Windows", "WinDdos", "IgnoreCase")
    $r = [System.Text.RegularExpressions.Regex]::Replace($r,       "Nvidia",  "NnDiva", "IgnoreCase")
    return $r
}

# --- Scan & process files ---
$files = Get-ChildItem -Path $Root -Recurse -File -ErrorAction SilentlyContinue |
    Where-Object {
        $okExt = $false
        foreach ($pat in $IncludeExt) { if ($_.Name -like $pat) { $okExt = $true; break } }
        $okExt -and -not (Is-UnderExcludedRoot $_.FullName)
    }

$processed = 0; $changed = 0; $skipped = 0; $errors = 0

foreach ($f in $files) {
    $processed++
    try {
        $content = Get-Content -LiteralPath $f.FullName -Raw -ErrorAction Stop
        $new = Replace-Names $content
        if ($new -ne $content) {
            $new | Set-Content -LiteralPath $f.FullName -Encoding UTF8 -ErrorAction Stop
            Write-Host "[OK] $($f.FullName)"
            $changed++
        } else {
            $skipped++
        }
    } catch {
        $errors++
        Write-Host "[SKIP] $($f.FullName)  ($_.Exception.Message)"
    }
}

Write-Host ""
Write-Host "---- Summary ----"
Write-Host "Files scanned   : $processed"
Write-Host "Files modified  : $changed"
Write-Host "Files skipped   : $skipped"
Write-Host "Errors          : $errors"
