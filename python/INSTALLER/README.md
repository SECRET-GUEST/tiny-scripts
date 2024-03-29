```
██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
```


# Quick Python Application Packaging

This repository facilitates the swift creation of an executable (.exe) application from a Python script. It contains three folders, each equipped with different tools and configuration files to compile your Python software into a standalone application and, optionally, package it into an installer. 

You can also test my build template here :  [pyBuilder](https://github.com/SECRET-GUEST/pyTemplate)

Here’s a brief description of what each folder contains:

## 1. **Inno Setup**

This is a comprehensive method that combines PyInstaller for compiling the Python script and Inno Setup for creating a quick and customizable MSI installer. The folder contains `.spec` and `.iss` configuration files to streamline the process. The accompanying README file in this folder provides full instructions on setting it up.

### Recommended Package:
- [Inno Setup](https://jrsoftware.org/isdl.php)
- [PyInstaller](https://www.pyinstaller.org/)
- [Ruby](https://www.ruby-lang.org/en/)

## 2. **PyInstaller**

This folder contains the necessary files to quickly compile a Python script into a standalone application using PyInstaller and a Ruby configuration file. It is an efficient method for generating a rapid application executable. 

**Further instructions and details can be found in the corresponding README file inside this folder.**

### Recommended Packages:
- [PyInstaller](https://www.pyinstaller.org/)
- [Ruby](https://www.ruby-lang.org/en/)

## 3. **cxFreeze**

In this folder, you will find the resources to create an MSI installer for your Python application using the `cxFreeze` Python library. However, it's worth noting that this method is somewhat outdated compared to the more customizable Inno Setup method, which is detailed next. Detailed guidance on how to use `cxFreeze` is available in the README file within this folder.

### Recommended Package:
- [cxFreeze](https://cx-freeze.readthedocs.io/)


  
## Getting Started

To begin, navigate to the respective folders for detailed instructions outlined in the corresponding README files. The configuration files in each folder are quite intuitive to edit and set up. Installing the recommended packages for each method will ensure a smooth process.

Feel free to explore each method and choose the one that best suits your project requirements. Happy coding!
