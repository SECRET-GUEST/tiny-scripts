![Python](https://img.shields.io/badge/Python-3.x-blue)
![Ruby](https://img.shields.io/badge/Ruby-Compatible-red)
![PyInstaller](https://img.shields.io/badge/PyInstaller-Compatible-orange)

```

██╗███╗   ██╗███╗   ██╗ ██████╗     ███████╗███████╗████████╗██╗   ██╗██████╗ 
██║████╗  ██║████╗  ██║██╔═══██╗    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
██║██╔██╗ ██║██╔██╗ ██║██║   ██║    ███████╗█████╗     ██║   ██║   ██║██████╔╝
██║██║╚██╗██║██║╚██╗██║██║   ██║    ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ 
██║██║ ╚████║██║ ╚████║╚██████╔╝    ███████║███████╗   ██║   ╚██████╔╝██║     
╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝     
                                                                              
```

# 🚀 fast MSI installer for python softwares

This repository contains essential files to help you package and distribute your Python application seamlessly. Below, we breakdown what each file does and the necessary steps to utilize them:

## 📦 Repository Contents

1. **`dir.spec`**: A PyInstaller configuration file to help you create a standalone application. Detailed guidelines on how to configure this file are found in the section below.
   
2. **`setup.iss`**: An Inno Setup script to create an installer for your application. A comprehensive guide on setting up this file is available further down in this README.
   
3. **`build.bat`**: A batch file containing the command `pyinstaller dir.spec` to easily run PyInstaller with the specified configuration file.

## 🛠  Step-by-Step Setup Guide 🛠 

### Step 1: Setting Up PyInstaller

1. **Install PyInstaller**: Before you begin, ensure to install PyInstaller by running the command:

   ```bash
   pip install pyinstaller
   ```

2. **Configure `dir.spec` File**: Open the `dir.spec` file and configure it according to your project's requirements. Detailed guidance on how to do this is provided in the subsequent section of this README.

3. **Run `build.bat` File**: Double-click on the `build.bat` file to automatically run the PyInstaller with the configured `.spec` file. Alternatively, open a command prompt in the directory containing the `dir.spec` file and run the command manually:

   ```bash
   pyinstaller dir.spec
   ```

   This step generates an executable file for your application.

### Step 2: Setting Up Inno Setup

1. **Install Inno Setup**: Download and install Inno Setup from the [official website](https://jrsoftware.org/isdl.php).

2. **Configure `setup.iss` File**: Open the `setup.iss` file and set it up with the correct paths, names, and other settings specific to your application. A guide on this configuration can be found in the subsequent section of this README. For more information, refer to the [official documentation](https://jrsoftware.org/ishelp/) or consult GPT or whatever for guidance.

3. **Build the Installer**: After setting up the `setup.iss` file, use Inno Setup to build your installer.

Now you are all set to distribute your application with a professional installer.

---


### 💎 Understanding the `.spec` File

#### `block_cipher = None`

This line is defining a block cipher object to encrypt your Python byte-code. In this case, it's set to `None`, meaning no encryption is used.

#### `a = Analysis([...])`

This section is responsible for gathering necessary data to package the script:

- **First Argument** (`["C:\\ YOUR PATH TO THE SCRIPTS \\main.py"]`): The path to your main Python script that you want to package.
- **`pathex`**: A list of paths to add to the Python path before the Analysis phase.
- **`binaries`**: A list of additional binaries to include.
- **`datas`**: A list of tuples where each tuple contains a file path and a destination directory.
- **`hiddenimports`**: A list of module names that PyInstaller is unable to detect are used by your script, and should be included.
- **`hookspath`**: A list of paths to search for hooks.
- **`hooksconfig`**: A dictionary of hooks configurations.
- **`runtime_hooks`**: A list of scripts to be run at runtime (before your script starts).
- **`excludes`**: A list of modules to exclude from the package.

#### `pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)`

This line creates a `.pyz` archive, which contains all your script's Python files, both your own and those from the Python standard library.

#### `exe = EXE(pyz, [...])`

This section defines the properties of the executable file:

- **`pyz`**: The previously created `.pyz` archive.
- **`a.scripts`**: The list of script files (your `main.py` in this case).
- **`a.binaries`**, **`a.zipfiles`**, **`a.datas`**: The binaries, zip files, and data files gathered during the analysis phase.
- **`name`**: The name of the final executable.
- **`icon`**: The path to the icon file for the executable.
- Other options control the behavior of the executable, like debugging options and whether it should be a console application.

#### `coll = COLLECT(exe, a.binaries, a.zipfiles, a.datas, strip=False, upx=False, upx_exclude=[], name='NAME OF THE SOFTWARE')`

This line gathers all the necessary components into a collection, preparing them to be packaged into a final executable or directory.

You will replace the placeholders with the actual paths, names, and other settings specific to your application before running PyInstaller with this `.spec` file.


---

### 🔧 Understanding the `setup.iss` Script

This script is used to create an installer for your application using Inno Setup. Here is a breakdown of each section:

#### `[Setup]`

This section defines the basic settings for your installer:

- **`SetupIconFile`**: Specifies the path to the icon file used for the setup program.
- **`AppName`**: The name of your application.
- **`AppVersion`**: The version number of your application.
- **`DefaultDirName`**: The default directory where the application will be installed.
- **`OutputBaseFilename`**: The name of the output installer file.
- **`ArchitecturesInstallIn64BitMode`**: Specifies the architecture mode for the installation (x64 for 64-bit).
- **`LicenseFile`**: The path to the license file to be included in the installer.
- **`WizardStyle`**: Sets the visual style of the installer.
- **`WizardResizable`**: Allows the user to resize the installer window.
- **`DisableDirPage`**: Allows or disallows the user to change the installation directory.
- **`AlwaysShowDirOnReadyPage`**: Shows the installation directory on the ready page of the installer.
- **`AppendDefaultDirName`**: Appends the application name to the default directory name.

#### `[Files]`

This section specifies the files to be included in the installation:

- **`Source`**: The source directory containing the files to be included in the installer (usually the `dist` directory created by PyInstaller). The `Flags` option specifies various attributes like ignoring version, creating subdirectories, etc.

#### `[Tasks]`

This section defines tasks that can be performed during the installation:

- A task to create a desktop icon is defined here, which is unchecked by default.

#### `[Icons]`

This section defines the icons to be created by the installer:

- An icon on the desktop linked to the application executable.

#### `[Run]`

This section specifies commands to be run at the end of the installation process:

- Runs the application executable, allowing the user to launch the program directly after installation.

Remember to replace all placeholders with actual paths, names, and other settings specific to your application before using this script to create an installer with Inno Setup.


