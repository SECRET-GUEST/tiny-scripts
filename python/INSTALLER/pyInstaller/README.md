Pyinstaller configuration file
```
██████╗ ██╗   ██╗██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗      ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
██╔══██╗╚██╗ ██╔╝██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
██████╔╝ ╚████╔╝ ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
██╔═══╝   ╚██╔╝  ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
██║        ██║   ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
╚═╝        ╚═╝   ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 
                                                                                                                                          
```
![Python](https://img.shields.io/badge/Python-3.x-blue)
![Ruby](https://img.shields.io/badge/Ruby-Compatible-red)
![PyInstaller](https://img.shields.io/badge/PyInstaller-Compatible-orange)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow)

# 📦 PyInstaller Configuration for Single Executable and Directory-based Applications

This repository provides two PyInstaller configuration files (`*.spec`) for creating standalone applications with different packaging options:

1. `ONE_EXE_FILE_PYINSTALLER_CONFIG.spec`: Creates a portable single-executable application.
2. `DIRECTORY_EXE_PYINSTALLER.spec`: Creates a directory-based application with all the necessary files.

Both configurations allow you to easily package your Python applications with PyInstaller, including custom icons and additional data files.

# 📌 Usage

1. Copy the appropriate `.spec` file into your project directory.

2. Edit the `.spec` file and replace the placeholders with the correct paths, icon names, and application names.

3. Install PyInstaller if you haven't already:

```bash
pip install pyinstaller
```
Run PyInstaller with the .spec file and the --clean flag to build your application:

```bash
pyinstaller --clean YOUR_SPEC_FILE_NAME.spec
```

This will create a standalone application in the dist directory of your project.
