[![Python](https://img.shields.io/badge/Python-3.8-blue.svg)](https://www.python.org/)
[![PyQt5](https://img.shields.io/badge/PyQt5-5.15.2-blue.svg)](https://pypi.org/project/PyQt5/)
[![BeautifulSoup](https://img.shields.io/badge/BeautifulSoup-4.9.3-blue.svg)](https://pypi.org/project/beautifulsoup4/)
[![OS](https://img.shields.io/badge/OS-Windows%20%7C%20MacOS%20%7C%20Linux-informational.svg)](https://www.python.org/)
[![IDE](https://img.shields.io/badge/IDE-PyCharm-blueviolet.svg)](https://www.jetbrains.com/pycharm/)

# HTML-JSON Parser

This script provides a user interface for parsing HTML files and updating them based on the contents of a corresponding JSON file. It uses the PyQt5 library to create the interface, and BeautifulSoup to parse and manipulate the HTML.

## Usage

0. Install Python on your machine: https://www.python.org/downloads/

1. Save the script in a file at the root of your project folder.

2. Open a terminal or command prompt and navigate to your project folder.

3. Run the script. You will see a GUI with a "Select Directory" button.

4. Click the "Select Directory" button to select the directory containing the HTML and corresponding JSON files.

5. Click the "Parse Files" button to start the parsing and updating process. This button becomes clickable once a directory is selected.

6. The script will go through each HTML file in the selected directory, identify corresponding JSON files, parse the HTML, update it based on the JSON contents, and save the changes.

Note: Please back up your HTML files before using this tool to prevent unintended data loss.

## Explanation

- The script starts by building a PyQt5-based user interface with two buttons.

- When the "Select Directory" button is clicked, a directory selection dialog is opened, and the chosen directory is stored.

- When the "Parse Files" button is clicked, the script goes through each HTML file in the selected directory, identifies corresponding JSON files, and loads the JSON data.

- The script then parses the HTML using BeautifulSoup. For each key-value pair in the JSON data, it finds a span element with an id attribute matching the key. If such a span element is found, its contents are replaced with the corresponding value from the JSON data.

- The updated HTML is then saved back to the file.

- The "Parse Files" button only becomes enabled after a directory is selected.

Please ensure you have the necessary dependencies installed and Python version matches with the required one.
