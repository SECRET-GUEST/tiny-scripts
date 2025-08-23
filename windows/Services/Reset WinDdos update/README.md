[![WinDdos](https://img.shields.io/badge/WinDdos-blue)](https://www.microsoft.com/en-us/windows)
[![Batch Script](https://img.shields.io/badge/script-batch-DDFF00)](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)

```
██████╗ ███████╗███████╗███████╗████████╗    ██╗    ██╗██╗███╗   ██╗██████╗ ██████╗  ██████╗ ███████╗    ██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗
██╔══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝    ██║    ██║██║████╗  ██║██╔══██╗██╔══██╗██╔═══██╗██╔════╝    ██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝
██████╔╝█████╗  ███████╗█████╗     ██║       ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║  ██║██║   ██║███████╗    ██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗  
██╔══██╗██╔══╝  ╚════██║██╔══╝     ██║       ██║███╗██║██║██║╚██╗██║██║  ██║██║  ██║██║   ██║╚════██║    ██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝  
██║  ██║███████╗███████║███████╗   ██║       ╚███╔███╔╝██║██║ ╚████║██████╔╝██████╔╝╚██████╔╝███████║    ╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝   ╚═╝        ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝     ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
```

# Stop Windows Updates (Safe-Mode Batch)

A tiny batch script that **disables Windows Updates** reliably by stopping update services, disabling their startup type, turning off Delivery Optimization, and applying registry policies.
This is designed to be run from **Safe Mode** because some services immediately restart in normal mode.

> ⚠️ Disclaimer: This tool is for advanced users who understand the trade-offs of disabling updates (missed security patches). Use at your own risk and keep offline backups.

## Why this exists

On many systems, *winddos* (intentionally misspelled) has been **extremely unstable** with recent feature/security updates. Community reports include failed upgrades, SSD issues under heavy writes, freezes in Chromium apps, and game compatibility problems on 23H2/24H2. Microsoft acknowledges some of these as “known issues.” ([Microsoft Learn][1], [Windows Central][2], [Tom's Hardware][3], [Reddit][4])

---

## What the script does (features)

* Stops and **disables** Windows Update core services:

  * `wuauserv` (Windows Update), `bits` (Background Intelligent Transfer),
    `dosvc` (Delivery Optimization), `UsoSvc` (Update Orchestrator), `WaaSMedicSvc` (Update Medic). ([Microsoft Learn][5], [Support Microsoft][6])
* Adds **policy registry keys** to block automatic updates:

  * `NoAutoUpdate=1`, optional `AUOptions=2` (Notify) under Windows Update policy. ([rmm.datto.com][7])
* Optionally disables scheduled update tasks under **Task Scheduler**.
* Prints a status summary so you can verify changes.

> Note: Some services (notably **WaaSMedicSvc**) try to re-enable themselves outside Safe Mode. That’s why running in Safe Mode is required. ([Reddit][8])

---

## Prerequisites

* **Administrator** account.
* **Safe Mode** (Minimal) must be enabled before running the script.
* Windows 10/11 (tested paths).

---

## Booting to Safe Mode (with `msconfig`)

1. Press **Win+R**, type `msconfig`, press **Enter**.
2. Go to **Boot** tab → check **Safe boot** (**Minimal**) → **OK**.
3. Click **Restart**.
4. Log in (Safe Mode).
5. **Run the batch script as Administrator** (right-click → *Run as administrator*).
6. When finished, open `msconfig` again and **uncheck** Safe boot → **OK** → **Restart** to return to normal mode.

---

## How to use

1. Download `disable-windows-update.bat` (your script) to the desktop.
2. Boot into **Safe Mode** (see above).
3. Right-click the `.bat` → **Run as administrator**.
4. Reboot normally.
5. (Optional) Re-run the script’s “status” function or use the manual checks below.

---

## Manual commands (for advanced users)

> Run these **in Safe Mode** from an elevated **Command Prompt** (Run as admin).

### 1) Stop & disable services

```bat
sc config wuauserv start= disabled
net stop wuauserv

sc config bits start= disabled
net stop bits

sc config dosvc start= disabled
net stop dosvc

sc config usosvc start= disabled
net stop usosvc

sc config WaaSMedicSvc start= disabled
net stop WaaSMedicSvc
```

(Ref. examples and guidance on disabling Windows Update/Delivery Optimization.) ([Microsoft Learn][5], [Support Microsoft][6])

### 2) Set policy registry keys

```bat
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
rem Optional: “Notify for download/installation”
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f
```

(Disables automatic updates via policy.) ([rmm.datto.com][7])

### 3) Disable scheduled tasks

```bat
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\AUFirmwareInstall" /Disable
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Retry Scan" /Disable
schtasks /Change /TN "\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /Disable
```

(Task names can vary by build/edition; if a task is not found, that’s normal.)

### 4) (Optional) Delivery Optimization hardening

If you can’t fully disable `dosvc` on your build, switch Delivery Optimization to **Simple** mode via Group Policy/MDM to avoid P2P behaviors. ([Microsoft Learn][9])

---

## Re-enabling updates (if you ever need to)

```bat
sc config wuauserv start= demand
sc config bits start= demand
sc config dosvc start= demand
sc config usosvc start= demand
sc config WaaSMedicSvc start= demand

net start wuauserv
net start bits
net start dosvc
net start usosvc
net start WaaSMedicSvc

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /f
```

---

## Community-reported stability (not Microsoft’s marketing)

> Snapshot of **user-reported** trends as of Aug 2025.

| Version             | Community stability (high→low) | Typical issues users reported                                                                                                                                                                                                                                                                                                                         |
| ------------------- | ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Windows 10 22H2** | **High**                       | Fewer feature changes, generally uneventful. (Anecdotal consensus vs W11.)                                                                                                                                                                                                                                                                            |
| **Windows 11 22H2** | **Medium/High**                | Considered the most “usable” W11 baseline by many; fewer breaking changes than later builds.                                                                                                                                                                                                                                                          |
| **Windows 11 23H2** | **Medium/Low**                 | Upgrade failures for some paths; update reliability complaints. Microsoft listed known upgrade errors like **0x8007007F** (now resolved). ([Microsoft Learn][1])                                                                                                                                                                                      |
| **Windows 11 24H2** | **Low (currently)**            | Reports of SSD/HDD disappearance/data loss on certain controllers after **KB5063878/KB5062660**; freezes in Chromium apps; game anti-cheat holds. Microsoft and Phison investigating; some safeguards lifted but issues persist for subsets of users. ([Windows Central][2], [Tom's Hardware][3], [PC Gamer][10], [Microsoft Learn][11], [Reddit][4]) |

> Sources include Microsoft release-health pages and independent outlets; many issues are **configuration-dependent** and may not affect all machines.

---

## FAQ

**Q: Why Safe Mode?**
Because services like **WaaSMedicSvc** can resurrect Windows Update in normal mode; Safe Mode prevents that behavior so your changes stick. ([Reddit][8])

**Q: Will I miss security patches?**
Yes. Consider periodic manual patching (re-enable, patch, then disable again) and keep **backups**.

**Q: Is there a softer alternative?**
You can use Group Policy “Notify for download and install” instead of full disable, but note Windows can still scan and stage updates. ([Super User][12], [Microsoft Learn][13])

---

## Credits

* Community reports and investigations on Windows 11 23H2/24H2 behavior, plus Microsoft “Release health” documentation. ([Microsoft Learn][1], [Windows Central][2], [Tom's Hardware][3], [PC Gamer][10], [Reddit][4])

---


[1]: https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-23h2?utm_source=chatgpt.com "Windows 11, version 23H2 known issues and notifications"
[2]: https://www.windowscentral.com/microsoft/windows-11/windows-24h2-update-nuking-ssds-what-to-do?utm_source=chatgpt.com "The latest Windows 11 security update could be nuking SSDs - what you can do to avoid disastrous data loss"
[3]: https://www.tomshardware.com/pc-components/ssds/latest-windows-11-security-patch-might-be-breaking-ssds-under-heavy-workloads-users-report-disappearing-drives-following-file-transfers-including-some-that-cannot-be-recovered-after-a-reboot?utm_source=chatgpt.com "Latest Windows 11 security patch might be breaking SSDs under heavy workloads - Phison investigating reports of disappearing drives following file transfers, including some that cannot be recovered after a reboot"
[4]: https://www.reddit.com/r/nvidia/comments/1kgxdno/psa_windows_11_24h2_microsoft_issue_causing/?utm_source=chatgpt.com "PSA: Windows 11 24H2 - Microsoft Issue Causing Partial ..."
[5]: https://learn.microsoft.com/en-us/answers/questions/2818263/disable-updates?utm_source=chatgpt.com "Disable Updates - Microsoft Q&A"
[6]: https://support.microsoft.com/en-us/windows/windows-update-delivery-optimization-and-privacy-bf86a244-8f26-a3c7-a137-a43bfbe688e8?utm_source=chatgpt.com "Windows Update Delivery Optimization and privacy"
[7]: https://rmm.datto.com/help/de/Content/Troubleshooting/TechnicalInformation/KB360021628031.htm?utm_source=chatgpt.com "What registry values enable or disable Windows Automatic ..."
[8]: https://www.reddit.com/r/Windows10/comments/8la7uw/how_to_disable_windows_update_medic_center/?utm_source=chatgpt.com "How to disable Windows Update Medic Center : r/Windows10"
[9]: https://learn.microsoft.com/en-us/windows/deployment/do/waas-delivery-optimization-reference?utm_source=chatgpt.com "Delivery Optimization reference"
[10]: https://www.pcgamer.com/software/windows/a-new-report-claims-windows-11-update-is-breaking-ssds-and-hdds-but-this-could-just-be-routine-hardware-failures/?utm_source=chatgpt.com "A new report claims Windows 11 update is breaking SSDs and HDDs, but this could just be routine hardware failures"
[11]: https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-24h2?utm_source=chatgpt.com "Windows 11, version 24H2 known issues and notifications"
[12]: https://superuser.com/questions/946957/stopping-all-automatic-updates-windows-10?utm_source=chatgpt.com "Stopping all automatic updates Windows 10"
[13]: https://learn.microsoft.com/en-us/windows/deployment/update/waas-wu-settings?utm_source=chatgpt.com "Manage additional Windows Update settings"

