# rat-detector-fixed.ps1
Set-StrictMode -Version Latest

Function Assert-Elevation {
    $current = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($current)
    $isAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if (-not $isAdmin) {
        Write-Host 'Elevation required - relaunching as Administrator...'
        $psExe = (Get-Command powershell -ErrorAction SilentlyContinue).Source
        if (-not $psExe) { $psExe = 'powershell' }
        $psi = New-Object System.Diagnostics.ProcessStartInfo
        $psi.FileName = $psExe
        $psi.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
        $psi.Verb = "runas"
        try {
            [System.Diagnostics.Process]::Start($psi) | Out-Null
            Write-Host 'Relaunched elevated. Exiting current process.'
            Exit 0
        } catch {
            Write-Host 'Elevation cancelled or failed. Exiting.'
            Exit 1
        }
    } else {
        Write-Host 'Administrator mode detected, continuing...'
    }
}

Assert-Elevation

$timestamp = (Get-Date).ToString('yyyyMMdd_HHmmss')
$outdir = Join-Path -Path $env:TEMP -ChildPath ("rat_triage_$timestamp")
New-Item -Path $outdir -ItemType Directory -Force | Out-Null

Function Save-Text {
    param($path, $obj)
    $obj | Out-File -FilePath $path -Encoding UTF8
}

# System info
Save-Text (Join-Path $outdir '00_systeminfo.txt') (systeminfo)
Save-Text (Join-Path $outdir '00_whoami_hostname.txt') ("User: $(whoami)`nHost: $env:COMPUTERNAME")

# Processes safe (no inline try/catch)
$procList = @()
Get-Process -ErrorAction SilentlyContinue | ForEach-Object {
    $p = $_
    $path = $null
    try { $path = (Get-Process -Id $p.Id -ErrorAction Stop).Path } catch {}
    # safe retrieval of StartTime without inline try/catch:
    $st = $null
    $procObj = Get-Process -Id $p.Id -ErrorAction SilentlyContinue
    if ($procObj) {
        $st = $procObj.StartTime 2>$null
    }
    $procList += [PSCustomObject]@{
        Name = $p.ProcessName
        Id = $p.Id
        CPU = $p.CPU
        Path = $path
        StartTime = $st
    }
}
$procList | Sort-Object -Property CPU -Descending | Format-Table -AutoSize | Out-String | Save-Text (Join-Path $outdir '01_process_list.txt')

# Hash executables in AppData/Temp (same logic que précédemment)
$susPaths = $procList | Where-Object { $_.Path -and ($_.Path -match '\\AppData\\|\\Temp\\|\\AppData\\Roaming') }
$hashes = @()
foreach ($p in $susPaths) {
    if (Test-Path $p.Path) {
        try {
            $h = Get-FileHash -Path $p.Path -Algorithm SHA256 -ErrorAction Stop
            $hashes += [PSCustomObject]@{Name=$p.Name; Id=$p.Id; Path=$p.Path; SHA256=$h.Hash}
        } catch {
            $hashes += [PSCustomObject]@{Name=$p.Name; Id=$p.Id; Path=$p.Path; SHA256='ERROR'}
        }
    }
}
if ($hashes.Count -gt 0) { $hashes | Format-Table | Out-String | Save-Text (Join-Path $outdir '02_sus_process_hashes.txt') }

# Network connections
$net = @()
try { $net = Get-NetTCPConnection -ErrorAction Stop | Select-Object State,LocalAddress,LocalPort,RemoteAddress,RemotePort,OwningProcess } catch { netstat -ano > (Join-Path $outdir '03_netstat_fallback.txt') }
if ($net) { $net | Format-Table -AutoSize | Out-String | Save-Text (Join-Path $outdir '03_net_connections.txt') }

# Reste du script: services, tasks, autoruns, recent files, logs, heuristics
# (copie les sections précédentes inchangées, elles n'utilisent pas try inline)
# Services
$svcs = Get-WmiObject -Class Win32_Service | Select-Object Name,DisplayName,State,StartMode,PathName
$svcs | Format-Table -AutoSize | Out-String | Save-Text (Join-Path $outdir '05_services.txt')

# Scheduled tasks
try { $tasks = Get-ScheduledTask | Select-Object TaskName,State,Author,Actions } catch { $tasks = (schtasks /query /fo LIST /v) }
Save-Text (Join-Path $outdir '06_scheduled_tasks.txt') ($tasks | Out-String)

# Run keys
$runKeys = @('HKLM:\Software\Microsoft\Windows\CurrentVersion\Run','HKCU:\Software\Microsoft\Windows\CurrentVersion\Run','HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run')
$autoruns = @()
foreach ($k in $runKeys) {
    try {
        $vals = Get-ItemProperty -Path $k -ErrorAction Stop
        $props = $vals.PSObject.Properties | Where-Object { $_.Name -notin @('PSPath','PSParentPath','PSChildName','PSDrive','PSProvider') }
        foreach ($p in $props) { $autoruns += [PSCustomObject]@{Key=$k; Name=$p.Name; Value=$p.Value} }
    } catch {}
}
if ($autoruns.Count -gt 0) { $autoruns | Format-Table | Out-String | Save-Text (Join-Path $outdir '07_autoruns.txt') }

# Recent files
$days = 7
$folders = @("$env:USERPROFILE\AppData\Roaming","$env:USERPROFILE\AppData\Local\Temp","$env:USERPROFILE\Downloads")
$recentFiles = @()
foreach ($f in $folders) {
    if (Test-Path $f) {
        try {
            $recentFiles += Get-ChildItem -Path $f -Recurse -ErrorAction SilentlyContinue |
                Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -gt (Get-Date).AddDays(-$days) } |
                Select-Object FullName,Length,LastWriteTime
        } catch {}
    }
}
if ($recentFiles.Count -gt 0) { $recentFiles | Sort-Object LastWriteTime -Descending | Format-Table -AutoSize | Out-String | Save-Text (Join-Path $outdir '08_recent_files.txt') }

# Event logs
try { Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=(Get-Date).AddDays(-3)} -MaxEvents 500 | Out-String | Save-Text (Join-Path $outdir '09_system_errors.txt') } catch {}
try { Get-WinEvent -FilterHashtable @{LogName='Application'; Level=2; StartTime=(Get-Date).AddDays(-3)} -MaxEvents 500 | Out-String | Save-Text (Join-Path $outdir '10_application_errors.txt') } catch {}
try { Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4688; StartTime=(Get-Date).AddDays(-3)} -MaxEvents 500 | Out-String | Save-Text (Join-Path $outdir '11_security_proc_creation_4688.txt') } catch {}

# Installed programs
$unkeys = @('HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall','HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall','HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall')
foreach ($k in $unkeys) {
    try { Get-ItemProperty -Path ($k + '\*') -ErrorAction SilentlyContinue | Select-Object DisplayName,DisplayVersion,Publisher,InstallDate | Out-String | Save-Text (Join-Path $outdir '12_installed_programs.txt') } catch {}
}

# DNS cache
try { Get-DnsClientCache | Select-Object Name,RecordType,TimeToLive | Out-String | Save-Text (Join-Path $outdir '13_dns_cache.txt') } catch {}

# Firewall outbound
try { Get-NetFirewallRule -Direction Outbound | Select-Object Name,DisplayName,Enabled,Profile,Action | Out-String | Save-Text (Join-Path $outdir '14_firewall_outbound.txt') } catch {}

# Heuristics summary (identique)
$susIndicators = @()
if ($autoruns.Count -gt 0) { $susIndicators += ("Run entries detected: {0}" -f $autoruns.Count) }
if (($svcs | Where-Object { $_.PathName -and ($_.PathName -match 'AppData|Temp') }).Count -gt 0) { $susIndicators += 'Service binary in AppData/Temp detected' }
if (($tasks | Out-String) -match '(\\|AppData|Temp|powershell.exe|cmd.exe)') { $susIndicators += 'Scheduled tasks reference suspicious paths' }
$remoteSuspicious = @()
if ($net) {
    foreach ($c in $net | Where-Object { $_.State -eq 'Established' -and $_.RemoteAddress }) {
        $ra = $c.RemoteAddress
        if (-not ($ra -match '^10\.|^172\.|^192\.168\.|^169\.254\.|^127\.0\.0\.1|^0\.0\.0\.0')) {
            $remoteSuspicious += $c
        }
    }
}
$remoteCount = $remoteSuspicious.Count
if ($remoteCount -gt 0) {
    $susIndicators += ("Established connections to non-private addresses: {0}" -f $remoteCount)
    $topRemotes = $remoteSuspicious | Group-Object RemoteAddress | Sort-Object Count -Descending | Select-Object -First 5
    $susIndicators += ('Top remote endpoints (sample): ' + ($topRemotes | ForEach-Object { "$($_.Name) ($($_.Count))" } | Out-String))
}
if ($recentFiles.Count -gt 0) {
    $countTempBins = ($recentFiles | Where-Object { $_.FullName -match '\.exe$|\.dll$|\.ps1$' }).Count
    if ($countTempBins -gt 0) { $susIndicators += ("Executable files recent in AppData/Temp/Downloads: {0}" -f $countTempBins) }
}
if ($susPaths.Count -gt 0) { $susIndicators += ("Running processes from AppData/Temp: {0}" -f $susPaths.Count) }

$summary = @()
$summary += "=== Heuristic summary generated on $(Get-Date) ===`n"
if ($susIndicators.Count -eq 0) {
    $summary += 'No major heuristic indicators found. This DOES NOT exclude stealthy infections. Recommend deeper forensics if needed.'
} else {
    $summary += 'Indicators found:'
    $summary += ($susIndicators -join "`n")
    $summary += "`nProbable origin (heuristic):"
    if ($remoteCount -gt 5 -or ($remoteCount -gt 0 -and $susPaths.Count -gt 0)) { $summary += '- Very likely: C2 / beaconing activity.' }
    elseif ($autoruns.Count -gt 0 -and ($recentFiles.Count -gt 0)) { $summary += '- Likely: dropped malware persisting via Run/task/service.' }
    elseif (($svcs | Where-Object { $_.PathName -and ($_.PathName -match 'AppData|Temp') }).Count -gt 0) { $summary += '- Likely: persistence via service.' }
    else { $summary += '- Low to moderate suspicion: follow-up recommended.' }
    $summary += "`nImmediate recommended actions:"
    $summary += '1) Isolate the machine from the network.'
    $summary += '2) Dump memory and collect artifacts, then clone disk image. If not possible, reinstall OS.'
    $summary += '3) Change sensitive passwords from a known-clean machine.'
    $summary += '4) Scan with updated EDR/AV and consult logs/SIEM.'
}

Save-Text (Join-Path $outdir '99_summary.txt') $summary
$summary | Out-String | Write-Host
Write-Host ("Triage finished. Results in: {0}" -f $outdir)



# open in notepad
Start-Process notepad.exe (Join-Path $outdir '99_summary.txt')

