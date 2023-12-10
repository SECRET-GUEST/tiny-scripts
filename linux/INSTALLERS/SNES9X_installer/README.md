![Debian-Based Systems](https://img.shields.io/badge/Debian_Based_Systems-Compatible-cyan?colorA=red)
![Ubuntu 22.04 LTS](https://img.shields.io/badge/Ubuntu-22.04_LTS-orange.svg)
![Snes9X Version](https://img.shields.io/badge/Snes9X-1.62.3-purple.svg)
```
███████╗███╗   ██╗███████╗███████╗ █████╗ ██╗  ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
██╔════╝████╗  ██║██╔════╝██╔════╝██╔══██╗╚██╗██╔╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
███████╗██╔██╗ ██║█████╗  ███████╗╚██████║ ╚███╔╝     ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
╚════██║██║╚██╗██║██╔══╝  ╚════██║ ╚═══██║ ██╔██╗     ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
███████║██║ ╚████║███████╗███████║ █████╔╝██╔╝ ██╗    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝ ╚════╝ ╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
```

# Snes9X Installer Script for Debian-based Systems

This script facilitates the installation of the Snes9X emulator on Debian-based systems, including Ubuntu 22.04.

## Usage and Arguments

To use the script, run it in a terminal. You can execute the script in automatic or manual mode.

- `-a` or `--auto`: Installs Snes9X automatically in the default directory (`~/snes9x`).
- Without argument: You will be prompted to choose the installation directory.

### Default Installation Directory

In automatic mode, the script installs Snes9X in the `~/snes9x` directory.

## Dependencies

The script installs the following packages:

- `libgtk-3-dev`
- `libgtkmm-3.0-dev`
- `libsdl2-dev`
- `libepoxy-dev`
- `libx11-dev`
- `libpulse-dev`
- `libasound2-dev`
- `portaudio19-dev`
- `libpng-dev`
- `zlib1g-dev`
- `libxv-dev`
- `libxrandr-dev`
- `libwayland-dev`
- `wayland-protocols`
- `gettext`
- `libminizip-dev`

## Possible Errors

- **Insufficient Permissions**: If you try to install the software in a directory where you do not have the necessary permissions, the script will fail. Ensure you have the required permissions in the chosen directory.
- **Unsupported File Systems**: Attempting to install on an NTFS disk (typically used in dual-boot with Windows) might lead to issues if the disk is locked by Windows (e.g., due to fast startup or an ongoing update).

## Contributing

Contributions are welcome. If you encounter any issues or have suggestions, please feel free to open an issue or a pull request.

---

*This script is designed to work with Debian-based systems, including Ubuntu 22.04 LTS, and Snes9X version 1.62.3. It may not function as intended with other versions or distributions.*

For more information about Snes9X, visit their [official website](https://www.snes9x.com/).
