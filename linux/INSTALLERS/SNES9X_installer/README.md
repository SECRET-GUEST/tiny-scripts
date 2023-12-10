![Debian](https://img.shields.io/badge/Debian_Based_Systems-red)
```
███████╗███╗   ██╗███████╗███████╗ █████╗ ██╗  ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
██╔════╝████╗  ██║██╔════╝██╔════╝██╔══██╗╚██╗██╔╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
███████╗██╔██╗ ██║█████╗  ███████╗╚██████║ ╚███╔╝     ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
╚════██║██║╚██╗██║██╔══╝  ╚════██║ ╚═══██║ ██╔██╗     ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
███████║██║ ╚████║███████╗███████║ █████╔╝██╔╝ ██╗    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝ ╚════╝ ╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
```
![Ubuntu 22.04 LTS](https://img.shields.io/badge/Ubuntu-22.04_LTS-grey?colorA=orange)
![Snes9X Version](https://img.shields.io/badge/Snes9X-1.62.3-grey?colorA=purple)

# Snes9X Installer Script for Debian-based Systems

This script facilitates the installation of the Snes9X emulator on Debian-based systems, including Ubuntu 22.04.

## Usage and Arguments

To use the script, run it in a terminal. You can execute the script in automatic or manual mode.

- `-a` or `--auto`: Installs Snes9X automatically in the default directory (`~/snes9x`).
- Without argument: You will be prompted to choose the installation directory.

### Default Installation Directory

In automatic mode, the script installs Snes9X in the current user home `/snes9x` directory.

## Dependencies

The script installs the following packages:


- `portaudio19-dev`: For enhanced audio processing and playback support.
- `libgtk-3-dev` and `libgtkmm-3.0-dev`: For GTK+ graphical user interface elements.
- `libsdl2-dev`: For handling graphics rendering and input management.
- `libepoxy-dev`: To manage OpenGL function pointers, important for accurate game graphics emulation.
- `libx11-dev`, `libxrandr-dev`, and `libxv-dev`: For X11 windowing system compatibility.
- `libpulse-dev` and `libasound2-dev`: For advanced sound system compatibility.
- `libpng-dev` and `zlib1g-dev`: For handling PNG images and compression.
- `libwayland-dev` and `wayland-protocols`: For Wayland display protocol support.
- `gettext`: For internationalization and localization.
- `libminizip-dev`: For handling ZIP file compression and decompression.

These additional dependencies, especially `portaudio19-dev`, `libepoxy-dev`, and Wayland related packages, are not explicitly listed in the [official Snes9X FAQ](https://www.snes9x.com/phpbb3/viewtopic.php?f=6&t=2611) but are included to enhance the emulator's functionality and compatibility with a broader range of Linux environments and hardware configurations.

full list : 
```bash
portaudio19-dev 
libgtk-3-dev
libgtkmm-3.0-dev
libsdl2-dev
libepoxy-dev
libx11-dev
libpulse-dev
libasound2-dev
libpng-dev
zlib1g-dev
libxv-dev
libxrandr-dev
libwayland-dev
wayland-protocols
gettext
libminizip-dev
```

## Possible Errors

- **Insufficient Permissions**: If you try to install the software in a directory where you do not have the necessary permissions, the script will fail. Ensure you have the required permissions in the chosen directory.
- **Unsupported File Systems**: Attempting to install on an NTFS disk (typically used in dual-boot with Windows) might lead to issues if the disk is locked by Windows (e.g., due to fast startup or an ongoing update).

## Contributing

Contributions are welcome. If you encounter any issues or have suggestions, please feel free to open an issue or a pull request.

---

*This script is designed to work with Debian-based systems, including Ubuntu 22.04 LTS, and Snes9X version 1.62.3. It may not function as intended with other versions or distributions.*

For more information about Snes9X, visit their [official website](https://www.snes9x.com/).
