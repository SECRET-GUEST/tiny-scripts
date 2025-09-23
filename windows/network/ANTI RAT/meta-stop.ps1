# manage-oculus-services.ps1
# Enable / disable Oculus / Meta / OVR / RemoteDesktopCompanion services
# - Automatic UAC elevation
# - Detection of relevant services
# - Menu: disable/enable all or individually

# Force UTF-8 output in console
try {
    chcp 65001 > $null
} catch { }

$OutputEncoding = [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

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
        $psi.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
        $psi.Verb = 'runas'
        try { [System.Diagnostics.Process]::Start($psi) | Out-Null; exit 0 }
        catch { Write-Host 'Elevation cancelled or failed. Exiting.'; exit 1 }
    }
}
Assert-Elevation

# --- helpers ---
function Get-TargetServices {
    # Filter by Name or DisplayName
    $svcs = Get-Service | Where-Object {
        $_.Name -match '^(OVR.*|Oculus.*|RemoteDesktopCompanion)$' -or
        $_.DisplayName -match '(Oculus|OVR|Meta|Remote\s*Desktop\s*Companion)'
    }
    # Add StartupType via CIM for clarity
    foreach ($s in $svcs) {
        $cim = Get-CimInstance Win32_Service -Filter "Name='$($s.Name)'" -ErrorAction SilentlyContinue
        [PSCustomObject]@{
            Name        = $s.Name
            DisplayName = $s.DisplayName
            Status      = $s.Status
            StartType   = if ($cim) { $cim.StartMode } else { "<unknown>" }  # Auto | Manual | Disabled
            CanStop     = $s.CanStop
        }
    }
}

function Disable-ServiceSafe([string]$name) {
    try {
        Write-Host "Stopping ${name}..." -ForegroundColor Yellow
        Stop-Service -Name $name -Force -ErrorAction SilentlyContinue
    } catch {
        Write-Host "Stop failed for ${name}: $_" -ForegroundColor Red
    }
    try {
        Write-Host "Disabling ${name} (StartupType=Disabled)..." -ForegroundColor Yellow
        Set-Service -Name $name -StartupType Disabled -ErrorAction Stop
        Write-Host "=> ${name} disabled." -ForegroundColor Green
    } catch {
        Write-Host "Disable failed for ${name}: $_" -ForegroundColor Red
    }
}

function Enable-ServiceSafe([string]$name) {
    try {
        Write-Host "Enabling ${name} (StartupType=Automatic)..." -ForegroundColor Yellow
        Set-Service -Name $name -StartupType Automatic -ErrorAction Stop
        try { Start-Service -Name $name -ErrorAction SilentlyContinue } catch {}
        Write-Host "=> ${name} enabled." -ForegroundColor Green
    } catch {
        Write-Host "Enable failed for ${name}: $_" -ForegroundColor Red
    }
}

function Show-Services($list) {
    if (-not $list -or $list.Count -eq 0) {
        Write-Host "No Oculus/Meta/OVR/RemoteDesktopCompanion service detected." -ForegroundColor Cyan
        return
    }
    $list | Sort-Object DisplayName | Format-Table Name, DisplayName, Status, StartType, CanStop -AutoSize
}

# --- main ---
$services = @(Get-TargetServices)

Write-Host ""
Write-Host "Detected services:" -ForegroundColor Cyan
Show-Services $services
Write-Host ""

if (-not $services -or $services.Count -eq 0) {
    Read-Host -Prompt "Press Enter to close"
    exit 0
}

Write-Host "Choose an action:" -ForegroundColor Cyan
Write-Host "  [1] Disable ALL detected services (stop + StartupType=Disabled)"
Write-Host "  [2] Enable  ALL detected services (StartupType=Automatic + start)"
Write-Host "  [3] Interactive mode (choose per service)"
Write-Host "  [Q] Quit"
$choice = Read-Host -Prompt "Your choice (1/2/3/Q)"

switch ($choice.ToUpper()) {
    '1' {
        foreach ($s in $services) { Disable-ServiceSafe $s.Name }
    }
    '2' {
        foreach ($s in $services) { Enable-ServiceSafe $s.Name }
    }
    '3' {
        foreach ($s in $services) {
            Write-Host ""
            Write-Host "Service: $($s.DisplayName)  (Name=$($s.Name), Status=$($s.Status), StartType=$($s.StartType))" -ForegroundColor Cyan
            $c = Read-Host -Prompt "Action? [D]=Disable, [A]=Enable, [S]=Skip"
            switch ($c.ToUpper()) {
                'D' { Disable-ServiceSafe $s.Name }
                'A' { Enable-ServiceSafe $s.Name }
                default { Write-Host "Skip $($s.Name)" -ForegroundColor DarkGray }
            }
        }
    }
    default {
        Write-Host "Cancelled." -ForegroundColor DarkGray
    }
}

Write-Host ""
Write-Host "State after operations:" -ForegroundColor Cyan
$services = @(Get-TargetServices)
Show-Services $services
Write-Host ""
Read-Host -Prompt "Done. Press Enter to exit"
