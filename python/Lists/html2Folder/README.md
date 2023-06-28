[![Python](https://img.shields.io/badge/Python-3.8-blue.svg)](https://www.python.org/)
[![OS](https://img.shields.io/badge/OS-Windows%20%7C%20MacOS%20%7C%20Linux-informational.svg)](https://www.python.org/)

```
██╗  ██╗████████╗███╗   ███╗██╗         ██████╗     ███████╗ ██████╗ ██╗     ██████╗ ███████╗██████╗ 
██║  ██║╚══██╔══╝████╗ ████║██║         ╚════██╗    ██╔════╝██╔═══██╗██║     ██╔══██╗██╔════╝██╔══██╗
███████║   ██║   ██╔████╔██║██║          █████╔╝    █████╗  ██║   ██║██║     ██║  ██║█████╗  ██████╔╝
██╔══██║   ██║   ██║╚██╔╝██║██║         ██╔═══╝     ██╔══╝  ██║   ██║██║     ██║  ██║██╔══╝  ██╔══██╗
██║  ██║   ██║   ██║ ╚═╝ ██║███████╗    ███████╗    ██║     ╚██████╔╝███████╗██████╔╝███████╗██║  ██║
╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝╚══════╝    ╚══════╝    ╚═╝      ╚═════╝ ╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═╝
                                                                                                     
```

[![PyQt5](https://img.shields.io/badge/PyQt5-5.15.2-blue.svg)](https://pypi.org/project/PyQt5/)

# HTML File Extractor

This script provides a user interface for extracting all HTML files from a selected directory and its subdirectories, and moving them to the selected directory. It uses the PyQt5 library to create the interface.

## Usage

0. Install Python on your machine: https://www.python.org/downloads/

1. Save the script in a file at the root of your project folder.

2. Open a terminal or command prompt and navigate to your project folder.

3. Run the script. You will see a GUI with a "Select Folder" and a "Run Script" button.

4. Click the "Select Folder" button to select the directory from which you want to extract HTML files.

5. Click the "Run Script" button to start the extraction process. This button becomes clickable once a directory is selected.

6. The script will go through each file in the selected directory and its subdirectories. If a file ends with '.html', it will be moved to the selected directory.

Note: Please back up your files before using this tool to prevent unintended data loss.

## Explanation

- The script starts by building a PyQt5-based user interface with two buttons.

- When the "Select Folder" button is clicked, a directory selection dialog is opened, and the chosen directory is stored.

- When the "Run Script" button is clicked, the script walks through the selected directory and its subdirectories.

- For each file, the script checks if the file ends with '.html'. If it does, the file is moved to the selected directory.

- The "Run Script" button only becomes enabled after a directory is selected.

Please ensure you have the necessary dependencies installed and Python version matches with the required one.
