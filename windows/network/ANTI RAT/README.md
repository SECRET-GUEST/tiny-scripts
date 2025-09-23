[![WinDdos](https://img.shields.io/badge/WinDdos-blue?logo=windows&logoColor=white&style=for-the-badge)](https://www.microsoft.com/en-us/windows)

```
 █████╗ ███╗   ██╗████████╗██╗    ██████╗  █████╗ ████████╗
██╔══██╗████╗  ██║╚══██╔══╝██║    ██╔══██╗██╔══██╗╚══██╔══╝
███████║██╔██╗ ██║   ██║   ██║    ██████╔╝███████║   ██║   
██╔══██║██║╚██╗██║   ██║   ██║    ██╔══██╗██╔══██║   ██║   
██║  ██║██║ ╚████║   ██║   ██║    ██║  ██║██║  ██║   ██║   
╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   
```

# 🛡️ Windows Security Utilities (PowerShell)

A small collection of PowerShell scripts for investigating suspicious activity on Windows systems.  
These tools were written for **educational and defensive purposes only** – they are **not offensive hacking tools**.

---


## Overview
This repository provides a set of PowerShell utilities that can help identify, monitor, and manage potentially suspicious activity on Windows systems.  

The goal is to assist in **triage and defense** against unwanted software (e.g., RATs, hidden processes, or unnecessary vendor services).

---

## Features
- Detects suspicious persistence mechanisms (registry autoruns, scheduled tasks, temp executables).  
- Maps running processes to their active network connections.  
- Provides a **share-safe reporting mode** (no personal file paths exposed).  
- Manages Oculus/Meta background services that often remain active even when the headset is not used.  
- Runs with **automatic elevation (UAC prompt)**.  

---

## Scripts

### 🔎 `rat-detector.ps1`
Performs a broad system triage:
- Looks for autorun entries, scheduled tasks, temp executables, and suspicious processes.  
- Summarizes potential indicators of compromise.  
- Useful as a **first-line investigation** if a RAT or unwanted persistence is suspected.  

---

### 🌐 `space_connexions.ps1`
Maps **active network connections** to their owning processes:
- Lists PIDs, process names, command lines, and target remote IPs.  
- Helps to spot unknown processes “phoning home”.  

---

### 🌍 `space_connexions - share.ps1`
A **safe-to-share version** of the above:
- Same connection mapping, but without personal file paths or command-lines.  
- Masks IPs by default (`x.x.x.x`).  
- Generates a **shareable report** for collaborative analysis.  

---

### 🎮 `metastop.ps1`
Utility for managing **Oculus/Meta/OVR services**:
- Detects related services (`OVRService`, `RemoteDesktopCompanion`, etc.).  
- Interactive menu:
  - Disable services (stop + prevent from auto-starting).  
  - Enable services again when needed.  
- Helpful if Meta/Oculus background processes keep running unnecessarily.  

---

## Usage

Run each script with PowerShell (Windows 10/11).  
Make sure you **right-click → Run as Administrator** or simply double-click: elevation is requested automatically.

Example (in terminal):

```powershell
powershell -ExecutionPolicy Bypass -File .\rat-detector.ps1
````

---

## Notes & Limitations

* These scripts are for **personal defense & educational research**.
* They do **not replace an EDR or antivirus**.
* If something suspicious is found, follow up with a trusted security solution.
* Scripts tested on **Windows 10/11**; may require small adjustments on older versions.

---

## License

MIT License.
Free to use, modify, and share — attribution appreciated.

```

