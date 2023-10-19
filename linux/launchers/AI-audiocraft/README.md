
```
 █████╗ ██╗   ██╗██████╗ ██╗ ██████╗  ██████╗██████╗  █████╗ ███████╗████████╗
██╔══██╗██║   ██║██╔══██╗██║██╔═══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝
███████║██║   ██║██║  ██║██║██║   ██║██║     ██████╔╝███████║█████╗     ██║   
██╔══██║██║   ██║██║  ██║██║██║   ██║██║     ██╔══██╗██╔══██║██╔══╝     ██║   
██║  ██║╚██████╔╝██████╔╝██║╚██████╔╝╚██████╗██║  ██║██║  ██║██║        ██║   
╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝        ╚═╝   
```

# Audiocraft Installer

This repository provides a script to facilitate the installation and setup of Audiocraft, a project by Facebook Research, on your machine. Audiocraft explores novel interfaces for crafting audio, enabling users to combine the expressiveness of parametric models with the creative possibilities afforded by a wide array of readily-available sounds.

Before running the installer, it is recommended to install `ffmpeg` on your machine to ensure smooth operation of Audiocraft. You can install `ffmpeg` using the following command:

```bash
sudo apt install ffmpeg
```

## Installation

To install Audiocraft and its dependencies, simply run the provided script `install.sh` by executing the following command in your terminal:

```bash
bash install.sh
```

This script will:

- Create a `dependencies` directory to store Miniconda and other necessary files.
- Download Miniconda if it's not already downloaded.
- Install Miniconda if it's not already installed.
- Activate Conda environment.
- Create a new Conda environment named `audiocraft` with Python 3.9 if it doesn't already exist.
- Activate the `audiocraft` environment.
- Clone the official Audiocraft repository from Facebook Research if it's not already cloned.
- Install the required Python packages listed in `requirements.txt`.
- Launch the Audiocraft demo application.

## Official Audiocraft Repository

For more information about Audiocraft, including the source code and additional documentation, please visit the [official Audiocraft repository on GitHub](https://github.com/facebookresearch/audiocraft).