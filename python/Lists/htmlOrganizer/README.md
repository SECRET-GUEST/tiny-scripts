[![Python](https://img.shields.io/badge/Python-3.8-blue.svg)](https://www.python.org/)
[![OS](https://img.shields.io/badge/OS-Windows%20%7C%20MacOS%20%7C%20Linux-informational.svg)](https://www.python.org/)
```
██╗  ██╗████████╗███╗   ███╗██╗         ███████╗██╗██╗     ███████╗     ██████╗ ██████╗  ██████╗  █████╗ ███╗   ██╗██╗███████╗███████╗██████╗ 
██║  ██║╚══██╔══╝████╗ ████║██║         ██╔════╝██║██║     ██╔════╝    ██╔═══██╗██╔══██╗██╔════╝ ██╔══██╗████╗  ██║██║╚══███╔╝██╔════╝██╔══██╗
███████║   ██║   ██╔████╔██║██║         █████╗  ██║██║     █████╗      ██║   ██║██████╔╝██║  ███╗███████║██╔██╗ ██║██║  ███╔╝ █████╗  ██████╔╝
██╔══██║   ██║   ██║╚██╔╝██║██║         ██╔══╝  ██║██║     ██╔══╝      ██║   ██║██╔══██╗██║   ██║██╔══██║██║╚██╗██║██║ ███╔╝  ██╔══╝  ██╔══██╗
██║  ██║   ██║   ██║ ╚═╝ ██║███████╗    ██║     ██║███████╗███████╗    ╚██████╔╝██║  ██║╚██████╔╝██║  ██║██║ ╚████║██║███████╗███████╗██║  ██║
╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝╚══════╝╚══════╝     ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝
                                                                                                                                              
```
[![PyQt5](https://img.shields.io/badge/PyQt5-5.15.2-blue.svg)](https://pypi.org/project/PyQt5/)

# HTML File Organizer

This script provides a user interface for organizing HTML files in a selected directory. It uses the PyQt5 library to create the interface.

## Usage

0. Install Python on your machine: https://www.python.org/downloads/

1. Save the script in a file at the root of your project folder.

2. Open a terminal or command prompt and navigate to your project folder.

3. Run the script. You will see a GUI with a "Open Directory" and "Organize HTML Files" buttons.

4. Click the "Open Directory" button to select the directory containing the HTML files.

5. Click the "Organize HTML Files" button to start the organization process. This button becomes clickable once a directory is selected.

6. The script will go through each HTML file in the selected directory, create a new folder with the same name (without .html) for each unique HTML file, create an empty JSON file with the same name inside this new folder, and move the HTML file into this new folder.

Note: Please back up your HTML files before using this tool to prevent unintended data loss.

## Explanation

- The script starts by building a PyQt5-based user interface with two buttons.

- When the "Open Directory" button is clicked, a directory selection dialog is opened, and the chosen directory is stored.

- When the "Organize HTML Files" button is clicked, the script goes through each HTML file in the selected directory.

- For each HTML file, the script creates a new folder with the same name (without .html), creates an empty JSON file with the same name inside this new folder, and then moves the HTML file into this new folder.

- The "Organize HTML Files" button only becomes enabled after a directory is selected.

Please ensure you have the necessary dependencies installed and Python version matches with the required one.
