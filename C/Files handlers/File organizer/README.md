```
███████╗██╗██╗     ███████╗███████╗     ██████╗ ██████╗  ██████╗  █████╗ ███╗   ██╗██╗███████╗███████╗██████╗ 
██╔════╝██║██║     ██╔════╝██╔════╝    ██╔═══██╗██╔══██╗██╔════╝ ██╔══██╗████╗  ██║██║╚══███╔╝██╔════╝██╔══██╗
█████╗  ██║██║     █████╗  ███████╗    ██║   ██║██████╔╝██║  ███╗███████║██╔██╗ ██║██║  ███╔╝ █████╗  ██████╔╝
██╔══╝  ██║██║     ██╔══╝  ╚════██║    ██║   ██║██╔══██╗██║   ██║██╔══██║██║╚██╗██║██║ ███╔╝  ██╔══╝  ██╔══██╗
██║     ██║███████╗███████╗███████║    ╚██████╔╝██║  ██║╚██████╔╝██║  ██║██║ ╚████║██║███████╗███████╗██║  ██║
╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝     ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝
```
![C](https://img.shields.io/badge/C-GCC-purple)
![ALPHA](https://img.shields.io/badge/ALPHA-red) 

# File Organizer Script 🧾

The File Organizer Script is a concise and efficient solution developed in C, designed to automate the process of sorting and organizing files within a directory and its subdirectories. This script serves as a streamlined, GUI-free counterpart to the [Files Organizer](https://github.com/SECRET-GUEST/file_organizer) tool, providing a lighter, less intrusive approach to file organization, especially beneficial for handling recovered data.

## 🌟 Features
- Efficiently sorts files into folders based on their extensions.
- Removes empty directories after the organization.
- Operates recursively on all subdirectories.
- Lightweight and GUI-free, optimal for users who prefer script-based solutions.

## 📋 Usage
This script is designed to be compiled and run from the command line. Modify the `inputDirectory` and `outputDirectory` constants in the script to your desired paths before compiling.

### Compiling the Script
```sh
gcc -o organize_script organize_files.c
```

### Running the Script
```sh
./organize_script
```

or if you need permissions for managing files :
```
sudo ./organize_script
```



## 🛠️ Customization

Users can easily modify the `inputDirectory` and `outputDirectory` variables in the script to fit their needs, setting them to the paths where the script should collect and organize files, respectively.
