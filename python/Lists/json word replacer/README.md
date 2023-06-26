
[![Python](https://img.shields.io/badge/Python-3.8-blue.svg)](https://www.python.org/)
[![PyQt5](https://img.shields.io/badge/PyQt5-5.15.2-blue.svg)](https://pypi.org/project/PyQt5/)
[![OS](https://img.shields.io/badge/OS-Windows%20%7C%20MacOS%20%7C%20Linux-informational.svg)](https://www.python.org/)
```
     ██╗███████╗ ██████╗ ███╗   ██╗    ██╗    ██╗ ██████╗ ██████╗ ██████╗ ███████╗    ██████╗ ███████╗██████╗ ██╗      █████╗  ██████╗███████╗██████╗ 
     ██║██╔════╝██╔═══██╗████╗  ██║    ██║    ██║██╔═══██╗██╔══██╗██╔══██╗██╔════╝    ██╔══██╗██╔════╝██╔══██╗██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗
     ██║███████╗██║   ██║██╔██╗ ██║    ██║ █╗ ██║██║   ██║██████╔╝██║  ██║███████╗    ██████╔╝█████╗  ██████╔╝██║     ███████║██║     █████╗  ██████╔╝
██   ██║╚════██║██║   ██║██║╚██╗██║    ██║███╗██║██║   ██║██╔══██╗██║  ██║╚════██║    ██╔══██╗██╔══╝  ██╔═══╝ ██║     ██╔══██║██║     ██╔══╝  ██╔══██╗
╚█████╔╝███████║╚██████╔╝██║ ╚████║    ╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝███████║    ██║  ██║███████╗██║     ███████╗██║  ██║╚██████╗███████╗██║  ██║
 ╚════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝     ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝  ╚═╝
                                                                                                                                                      
```
# JSON Word Replacer

This script provides a user interface to replace words in JSON files located within a selected directory. It uses the PyQt5 library to build the interface.

## Usage

0. Install Python on your machine: https://www.python.org/downloads/

1. Save the script in a file at the root of your project folder.

2. Open a terminal or command prompt and navigate to your project folder.

3. Run the script. You will see a GUI with a "Open Directory" button.

4. Click the "Open Directory" button to select the directory containing the JSON files.

5. Enter the word you want to replace and the replacement word in the provided text fields.

6. Click the "Launch" button to start the process. The button becomes clickable once a directory is selected.

7. The script will go through each JSON file in the selected directory, replacing the chosen word where it appears and saving the changes.

Note: Please back up your JSON files before using this tool to prevent unintended data loss.

## Explanation

- The script starts by building a PyQt5-based user interface with two buttons, two labels, and two text input fields.

- When the "Open Directory" button is clicked, a directory selection dialog is opened, and the chosen directory is stored.

- The text input fields accept the word to be replaced and its replacement.

- When the "Launch" button is clicked, the script goes through each JSON file in the selected directory, replacing occurrences of the chosen word and saving the file with the changes made.

- The "Launch" button only becomes enabled after a directory is selected.

Please ensure you have the necessary dependencies installed and Python version matches with the required one.
