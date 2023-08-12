[![Python](https://img.shields.io/badge/Python-3.8-blue.svg)](https://www.python.org/)
[![OS](https://img.shields.io/badge/OS-Windows%20%7C%20MacOS%20%7C%20Linux-informational.svg)](https://www.python.org/)
```
██████╗  █████╗ ███╗   ██╗██████╗  ██████╗ ███╗   ██╗ █████╗ ███╗   ███╗███████╗██████╗ 
██╔══██╗██╔══██╗████╗  ██║██╔══██╗██╔═══██╗████╗  ██║██╔══██╗████╗ ████║██╔════╝██╔══██╗
██████╔╝███████║██╔██╗ ██║██║  ██║██║   ██║██╔██╗ ██║███████║██╔████╔██║█████╗  ██████╔╝
██╔══██╗██╔══██║██║╚██╗██║██║  ██║██║   ██║██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝  ██╔══██╗
██║  ██║██║  ██║██║ ╚████║██████╔╝╚██████╔╝██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
                                                                                        

```
[![PyQt5](https://img.shields.io/badge/PyQt5-5.15.2-blue.svg)](https://pypi.org/project/PyQt5/)

# File Renamer with GUI

This script provides a user interface for managing and renaming files in a directory. It uses the PyQt5 library to create the interface.

## Usage

0. Install Python on your machine: https://www.python.org/downloads/

1. Save the script in a file at the root of your project folder.

2. Open a terminal or command prompt and navigate to your project folder.

3. Run the script. You will see a GUI with multiple buttons.

4. Drag'n'Drop txt files or use the 'Open file .txt' button to open a text file which contains the list of new names.

5. Use the 'Delete clones' button to remove duplicates from the names list.

6. Use the 'Select folder' button to select the directory containing the files you wish to rename.

7. Click the 'Start' button to start the renaming process. This button becomes clickable once a directory is selected and a file of names is loaded.

8. The script will go through each file in the selected directory, and rename it with a name from the names list.

Note: Please back up your files before using this tool to prevent unintended data loss.

## Explanation

- The script starts by building a PyQt5-based user interface with multiple buttons.

- The 'Open file .txt' button opens a dialog to select a text file. The selected file is read and the contents are displayed in a text box in the GUI.

- The 'Delete clones' button removes any duplicate lines from the text box.

- The 'Select folder' button opens a dialog to select a directory. The path to the selected directory is stored for the renaming process.

- The 'Start' button initiates the renaming process. The script iterates over each file in the selected directory. For each file, it generates a new name from the names list, ensures that this name is not already in use, and renames the file.

- A progress bar is displayed during the renaming process.

Please ensure you have the necessary dependencies installed and Python version matches with the required one.


## Complete version

You can find a complete version with other options here : [Macara GitHub Repository.](https://github.com/SECRET-GUEST/Macara)
