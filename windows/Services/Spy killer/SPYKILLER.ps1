# Script : Anti-Spy Windows Purge
# Mode   : PowerShell (Admin required)


# Check for Administrator rights
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    Write-Host "⚠️ This script must be run as Administrator!" -ForegroundColor Red
    Start-Sleep -Seconds 2
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Write-Host "`n[+] Administrator mode confirmed." -ForegroundColor Green

# Disable Microsoft telemetry-related services

Write-Host "[*] Disabling telemetry and diagnostic services..."

$services = @(
    "DiagTrack",          # Connected User Experiences and Telemetry
    "dmwappushservice",   # Device Management WAP Push service
    "WMPNetworkSvc",      # Windows Media Player Network Sharing
    "MapsBroker",         # Windows Location Services
    "Fax"                 # Legacy fax service
)

foreach ($svc in $services) {
    Stop-Service -Name $svc -ErrorAction SilentlyContinue
    Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
    Write-Host "  - Disabled service: $svc"
}

#Remove Cortana appx package

Write-Host "`n[*] Removing Cortana package..."

Get-AppxPackage -AllUsers Microsoft.549981C3F5F10 | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq "Microsoft.549981C3F5F10"} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue

# Remove OneDrive if present

Write-Host "`n[*] Uninstalling OneDrive..."

Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2
$onedrivePath = "$env:SystemRoot\System32\OneDriveSetup.exe"
if (Test-Path $onedrivePath) {
    & "$onedrivePath" /uninstall
    Write-Host "  - OneDrive has been uninstalled."
} else {
    Write-Host "  - OneDrive not found or already removed."
}

# Disable Bing integration in Windows Search

Write-Host "`n[*] Disabling Bing in Windows Search..."

$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
If (!(Test-Path $regPath)) { New-Item -Path $regPath -Force }
Set-ItemProperty -Path $regPath -Name "BingSearchEnabled" -Value 0
Set-ItemProperty -Path $regPath -Name "CortanaConsent" -Value 0

# Keep Windows Search indexing enabled for usability

Write-Host "`n[*] Indexing is kept enabled to preserve search usability."

# Remove AdobeGC log (Adobe Genuine Spyware)

Write-Host "`n[*] Removing AdobeGC log files (Adobe spyware)..."

$adobeLogPath = "C:\ProgramData\Adobe\AdobeGCClient\logs\adobegc.log"
if (Test-Path $adobeLogPath) {
    Remove-Item $adobeLogPath -Force -ErrorAction SilentlyContinue
    Write-Host "  - Deleted: adobegc.log"
} else {
    Write-Host "  - AdobeGC log not found."
}

# Remove Microsoft bloatware apps (excluding gaming-related)

Write-Host "`n[*] Removing unused Microsoft bloatware (non-gaming only)..."

$bloatApps = @(
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MixedReality.Portal",
    "Microsoft.People",
    "Microsoft.SkypeApp",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo"
)

foreach ($app in $bloatApps) {
    Get-AppxPackage -AllUsers $app | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq $app} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
    Write-Host "  - Removed: $app"
}

# Done

Write-Host "`n✅ Spyware cleanup complete. Please restart your PC to finalize the purge." -ForegroundColor Cyan
