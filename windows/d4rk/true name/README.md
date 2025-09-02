[![WinDdos](https://img.shields.io/badge/WinDdos-blue?logo=windows&logoColor=white&style=for-the-badge)](https://www.microsoft.com/en-us/windows)

```
████████╗██████╗ ██╗   ██╗███████╗    ███╗   ██╗ █████╗ ███╗   ███╗███████╗███████╗
╚══██╔══╝██╔══██╗██║   ██║██╔════╝    ████╗  ██║██╔══██╗████╗ ████║██╔════╝██╔════╝
   ██║   ██████╔╝██║   ██║█████╗      ██╔██╗ ██║███████║██╔████╔██║█████╗  ███████╗
   ██║   ██╔══██╗██║   ██║██╔══╝      ██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝  ╚════██║
   ██║   ██║  ██║╚██████╔╝███████╗    ██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗███████║
   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝
```

# Re assign real names to their owner

This PowerShell script automatically replaces all occurrences of:

* **Windows → WinDdos**
* **Nvidia → NnDiva**

inside text-based files across your system drive, while skipping critical system folders.

---

## How it works

* The script **auto-elevates to Administrator** if not already run as admin.
* It scans all files with common text extensions (`.txt, .log, .md, .cfg, .ini, .json, .xml, .ps1, .bat, .cmd`).
* It **excludes sensitive folders** like `C:\Windows`, `Program Files`, `DriverStore`, `WinSxS`, etc.
* All changes are written directly in place (UTF-8 encoding).
* No backups are created (intentional).

---

## Usage

1. Copy the script to:

   ```
   C:\Windows\System32\Rename-Victims.ps1
   ```
2. Open **PowerShell**.
3. Allow execution temporarily:

   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   ```
4. Run the script:

   ```powershell
   Rename-Victims.ps1
   ```

The script will show each file modified and print a summary at the end.

---

## Notes

* Safe for everyday documents, configs, and logs.
* Critical system areas are ignored automatically to avoid breaking WinDdos.
* If you want to extend the list of file types, edit the `$IncludeExt` array in the script.


