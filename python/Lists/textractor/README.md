[![Python](https://img.shields.io/badge/Python-3.8-blue.svg)](https://www.python.org)
[![OS](https://img.shields.io/badge/OS-Windows%20%7C%20MacOS%20%7C%20Linux-informational.svg)](https://www.python.org)



```
████████╗███████╗██╗  ██╗████████╗    ███████╗██╗  ██╗████████╗██████╗  █████╗  ██████╗████████╗ ██████╗ ██████╗ 
╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝    ██╔════╝╚██╗██╔╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
   ██║   █████╗   ╚███╔╝    ██║       █████╗   ╚███╔╝    ██║   ██████╔╝███████║██║        ██║   ██║   ██║██████╔╝
   ██║   ██╔══╝   ██╔██╗    ██║       ██╔══╝   ██╔██╗    ██║   ██╔══██╗██╔══██║██║        ██║   ██║   ██║██╔══██╗
   ██║   ███████╗██╔╝ ██╗   ██║       ███████╗██╔╝ ██╗   ██║   ██║  ██║██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║
   ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝       ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                                                                                                                 
```
[![PyQt5](https://img.shields.io/badge/PyQt5-5.15.2-blue.svg)](https://pypi.org/project/PyQt5)
[![BeautifulSoup](https://img.shields.io/badge/BeautifulSoup-4.9.3-blue.svg)](https://pypi.org/project/beautifulsoup4)

# HTML Text Extractor

This script provides a user interface for extracting text from HTML files and saving them as JSON. It is useful for extracting localized strings, translatable texts, or any content contained within HTML tags with specific ids and classes. The interface is built using PyQt5, and BeautifulSoup is used to parse the HTML.

## Usage

0. Install Python on your machine httpswww.python.orgdownloads

1. Save the script in a file at the root of your project folder.

2. Open a terminal or command prompt and navigate to your project folder.

3. Run the script. You will see a GUI with options to select a directory, select individual files, include subdirectories, and start the extraction process.

4. Select the directory containing the HTML files or select specific HTML files to extract texts from.

5. Tick the Include subfolders checkbox if you want to include HTML files in subfolders of the selected directory.

6. Click the Extract Texts button to start the extraction process. 

7. The script will extract the inner text of each HTML tag with a class of text and an id attribute, and save the id-text pairs in a JSON file for each HTML file processed.

Note Please back up your HTML files before using this tool to prevent unintended data loss.

## Explanation

- The script starts by building a PyQt5-based user interface with options to select a directory, select individual files, include subdirectories, and start the extraction process.

- When the Extract Texts button is clicked, the script goes through each HTML file in the selected directory or the selected files, depending on the user's input.

- The script then parses each HTML file using BeautifulSoup. It finds all tags with a class of text and an id attribute, extracts their inner text, and stores the id-text pairs in a dictionary.

- The dictionary is then saved as a JSON file, with the filename derived from the original HTML file.

- Once all selected files have been processed, a message is displayed to indicate that the extraction process is complete.

Please ensure you have the necessary dependencies installed and Python version matches with the required one.
