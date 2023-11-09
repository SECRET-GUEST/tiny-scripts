```
██╗███████╗ ██████╗ ███╗   ███╗ █████╗ ██╗  ██╗███████╗██████╗ 
██║██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║ ██╔╝██╔════╝██╔══██╗
██║███████╗██║   ██║██╔████╔██║███████║█████╔╝ █████╗  ██████╔╝
██║╚════██║██║   ██║██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝  ██╔══██╗
██║███████║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗██║  ██║
╚═╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
```
# SD Card Management Script

This repository contains a simple yet powerful script for managing SD card images for systems like Raspberry Pi. The script is available in both English and French, catering to a wider range of users.

## Description

The `sdcard_manager.sh` script provides an interactive way to either create a compressed image of an existing SD card system or to write a compressed image back to an SD card. This can be particularly useful for Raspberry Pi users who need to backup or clone their setups efficiently.

### English Version

The English version of the script prompts the user with clear, concise instructions in English. It's designed for ease of use and includes safety checks to prevent accidental data loss.

### French Version

La version française offre les mêmes fonctionnalités que la version anglaise.

## How to Use

1. Clone the repository or download the desired script directly.
2. Give execute permissions to the script with `chmod +x sdcard_manager.sh`.
3. Run the script with `./sdcard_manager.sh` and follow the interactive prompts.

## Script Launcher Integration

In addition to the SD card management scripts, this repository also points to a versatile script launcher which can serve as a starting point for running multiple scripts. The launcher is part of a collection of tiny, useful scripts and [can be found here](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/launchers/script%20launcher).

## Prerequisites

Before running the SD card management script, ensure you have `dd` and `gzip` installed on your system. For the image shrinking feature, `wget` should be able to retrieve the `pishrink.sh` script from its repository.

## Safety and Disclaimer

The SD card management script involves operations that can result in data loss if not used carefully. Always ensure you are selecting the correct SD card device and have backups of your data before proceeding.
