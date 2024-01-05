# Fooocus Installation Script

This README provides an overview of the installation script for the Fooocus AI, a powerful tool for [description of what Fooocus does]. The main repository for Fooocus can be found at: [https://github.com/lllyasviel/Fooocus](https://github.com/lllyasviel/Fooocus).

## Overview

The provided Bash script automates the setup and launch process for Fooocus on Linux systems. It handles the creation of a Python virtual environment, cloning the Fooocus repository, and installing necessary dependencies. Additionally, it offers a simple menu to choose presets for running Fooocus.

## Features

- **Automatic Environment Setup**: The script automatically sets up a Python virtual environment (`py3_VENV_fooocus`) to avoid conflicts with existing Python installations and dependencies.

- **Repository Cloning**: If the Fooocus directory doesn't exist, the script clones the Fooocus repository from GitHub.

- **Dependency Installation**: Automatically installs required Python packages listed in `requirements_versions.txt`.

- **Preset Selection Menu**: Provides a user-friendly menu to choose between different Fooocus presets (Anime, Realistic, or No preset).

## Usage

1. **Download the Script**: Download the installation script from [source of the script].

2. **Run the Script**: Make the script executable with `chmod +x your_script_name.sh` and then run it using `./your_script_name.sh`.

3. **Choose Preset**: When prompted, choose your desired preset by entering `1` for Anime, `2` for Realistic, or `3` for no preset.

## Prerequisites

- Linux Operating System.
- Python 3.10 or higher installed on your system.
- `git` and `python3-venv` packages installed.

Please ensure that Python 3.10 (or a higher version) is installed on your system, as Fooocus requires it for proper functionality.

## Notes

- Verify that your system meets all the prerequisites before running the script.
- The script should be run from a location where it has permissions to create directories and files.
- For detailed information about Fooocus and its capabilities, refer to the [official Fooocus repository](https://github.com/lllyasviel/Fooocus).