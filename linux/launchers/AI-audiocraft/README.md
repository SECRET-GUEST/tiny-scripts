
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

You can use only the French or the English installer, it doesn't matter.

## Installation

1. It's recommended to install `ffmpeg` on your machine before proceeding with the Audiocraft installation. You can install `ffmpeg` using the following command:

```bash
sudo apt install ffmpeg
```

2. Make the installer script executable by running the following command in your terminal:

```bash
chmod +x install.sh
```

3. To **INSTALL** and/or **RUN** Audiocraft along with its dependencies, simply execute the provided script `install.sh`:

```bash
./install.sh
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

## Customizing Audiocraft Launch

You can customize the way Audiocraft is launched by creating a `commands.txt` file in the same directory as the `install.sh` script. In this file, you can specify arguments to be passed to the Audiocraft demo application. Here is an example of how your `commands.txt` file could look:

```plaintext
# Specify the IP to listen on for connections to Gradio
--listen=0.0.0.0
# Specify username for authentication
--username=your_username
# Specify password for authentication
--password=your_password
# Specify the port for the server listener to run on
--server_port=8000
# If you want to open the Gradio UI in the browser, add the argument
--inbrowser
# If you want to share the Gradio UI, add the argument
--share
```

The script `install.sh` will read this file and pass the specified arguments to the Audiocraft demo application when it is launched.

## Official Audiocraft Repository

For more information about Audiocraft, including the source code and additional documentation, please visit the [official Audiocraft repository on GitHub](https://github.com/facebookresearch/audiocraft).
