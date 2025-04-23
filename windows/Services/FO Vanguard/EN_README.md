![Batch Script](https://img.shields.io/badge/script-batch-DDFF00)
```
 ██████╗██╗   ██╗████████╗    ██╗   ██╗ █████╗ ███╗   ██╗ ██████╗ ██╗   ██╗ █████╗ ██████╗ ██████╗ 
██╔════╝██║   ██║╚══██╔══╝    ██║   ██║██╔══██╗████╗  ██║██╔════╝ ██║   ██║██╔══██╗██╔══██╗██╔══██╗
██║     ██║   ██║   ██║       ██║   ██║███████║██╔██╗ ██║██║  ███╗██║   ██║███████║██████╔╝██║  ██║
██║     ██║   ██║   ██║       ╚██╗ ██╔╝██╔══██║██║╚██╗██║██║   ██║██║   ██║██╔══██║██╔══██╗██║  ██║
╚██████╗╚██████╔╝   ██║        ╚████╔╝ ██║  ██║██║ ╚████║╚██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝
 ╚═════╝ ╚═════╝    ╚═╝         ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
```

# Riot Vanguard Manager

## Description
This batch script provides a simple interface to manage Riot Vanguard, the anti-cheat system used by Riot Games for games like Valorant. It allows users to easily activate or deactivate Riot Vanguard without having to manually adjust system services.

## Features
- Activate Riot Vanguard
- Deactivate Riot Vanguard
- Automatic request for administrator privileges

## Requirements
- Windows operating system
- Administrator privileges (the script will attempt to elevate if not run as admin)

## Usage
1. Run the `EN_FO_vanguard.bat` file.
2. If not run as administrator, the script will attempt to elevate privileges.
3. Choose from the menu:
   - Press 1 to activate Riot Vanguard
   - Press 2 to deactivate Riot Vanguard

## How it works
- Activation: Sets Vanguard services (vgc and vgk) to start automatically and starts them.
- Deactivation: Stops Vanguard services and sets them to disabled.

## Note
This script modifies system services. Use it responsibly and only if you understand the implications of activating or deactivating Riot Vanguard.

## Disclaimer
This tool is not affiliated with or endorsed by Riot Games. Use at your own risk.