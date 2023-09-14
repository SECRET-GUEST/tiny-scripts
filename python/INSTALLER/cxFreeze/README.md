![Python](https://img.shields.io/badge/Python-3.x-blue)

```
 ██████╗██╗  ██╗    ███████╗██████╗ ███████╗███████╗███████╗███████╗
██╔════╝╚██╗██╔╝    ██╔════╝██╔══██╗██╔════╝██╔════╝╚══███╔╝██╔════╝
██║      ╚███╔╝     █████╗  ██████╔╝█████╗  █████╗    ███╔╝ █████╗  
██║      ██╔██╗     ██╔══╝  ██╔══██╗██╔══╝  ██╔══╝   ███╔╝  ██╔══╝  
╚██████╗██╔╝ ██╗    ██║     ██║  ██║███████╗███████╗███████╗███████╗
 ╚═════╝╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝
                                                                    
```


#  💼 Creating an MSI Installer using `cx_Freeze` 

While creating an MSI installer using `cx_Freeze` is possible, it is somewhat deprecated and might not offer the flexibility and customization options that are easily achievable with Inno Setup. However, if you still wish to proceed with `cx_Freeze`, here is a guide to help you navigate the process:

## Pre-requisites

1. **Install `cx_Freeze`**: Before starting, ensure that `cx_Freeze` is installed in your Python environment. You can install it using the following command:

   ```bash
   pip install cx-freeze
   ```

## 🔧 Understanding the Files in the Repository

1. **`generate.bat`**: This batch file contains the command `python setup.py bdist_msi`, which you can run by double-clicking the file or directly in the command prompt. Here's a breakdown of the command:
   
   - `python setup.py`: This runs the `setup.py` script using Python.
   - `bdist_msi`: This is an option that tells the script to build an MSI installer.

2. **`setup.py`**: This is a Python script that uses `cx_Freeze` to build the MSI installer. Let's break down the sections of this script:

   - **Import Statements**: Import necessary modules, including `cx_Freeze`.
   
   - **`build_exe_options`**: A dictionary containing options for the build:
     
     - `packages`: A list of all packages that your application uses. It's crucial to include every package used in your software. You might use a tool like `pipreqs` to automatically generate a list of dependencies.
     - `excludes`: Packages that should be excluded from the build.
     - `include_files`: Additional files to include in the build (like icons and stylesheets).
   
   - **`base`**: Specifies the base option for the executable. For GUI applications on Windows, it should be set to `"Win32GUI"`.
   
   - **`setup` Function**: Defines various attributes for the setup process, including:
     
     - `name`: The name of your software.
     - `version`: The version number of your software.
     - `description`: A brief description of your software.
     - `options`: Specifies the `build_exe_options` defined earlier.
     - `executables`: Defines the properties of the executable to be created, including the icon and shortcut details.
     - `license`: Specifies the path to the license file.

### Customizing and Running the Script

To successfully create an MSI installer, follow these steps:

1. **Specify All Packages**: Ensure to list all packages used by your software in the `"packages"` option in the `build_exe_options` dictionary.
   
2. **Customize the Script**: Modify other options in the script as per your requirements, including adding the correct paths to icons and other files.
   
3. **Run the `generate.bat` File**: Double-click the `generate.bat` file or run the command `python setup.py bdist_msi` directly in the command prompt to initiate the build process.

Once completed, you will find the MSI installer in the `build` directory.

