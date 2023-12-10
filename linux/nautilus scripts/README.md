```
███╗   ██╗ █████╗ ██╗   ██╗████████╗██╗██╗     ██╗   ██╗███████╗
████╗  ██║██╔══██╗██║   ██║╚══██╔══╝██║██║     ██║   ██║██╔════╝
██╔██╗ ██║███████║██║   ██║   ██║   ██║██║     ██║   ██║███████╗
██║╚██╗██║██╔══██║██║   ██║   ██║   ██║██║     ██║   ██║╚════██║
██║ ╚████║██║  ██║╚██████╔╝   ██║   ██║███████╗╚██████╔╝███████║
╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝╚══════╝ ╚═════╝ ╚══════╝
```

# Nautilus Scripts

## Introduction
This guide will help you add and use custom scripts in Nautilus, the default file manager for many Linux distributions. In the script folder, you'll find several practical scripts crafted for this purpose. 

For additional resources, check out the French tutorials for Linux installations at [SECRET-GUEST's LINUX GitHub](https://github.com/SECRET-GUEST/LINUX). 

You can also enhance your Nautilus contextual menu with more actions by visiting [SECRET-GUEST's actions-for-nautilus GitHub repository](https://github.com/SECRET-GUEST/actions-for-nautilus).

## Installing Scripts
1. **Create Scripts Directory**: Open a terminal and create a directory for scripts if it doesn’t already exist:
   ```bash
   mkdir -p ~/.local/share/nautilus/scripts
   ```
2. **Add Scripts**: Place your scripts in this directory. For example:
   ```bash
   cp /path/to/your/script ~/.local/share/nautilus/scripts/
   ```
3. **Make the Script Executable**: Ensure the script is executable:
   ```bash
   chmod +x ~/.local/share/nautilus/scripts/script_name
   ```

## Using Scripts
- After adding your scripts, restart Nautilus:
  ```bash
  nautilus -q
  ```
- Right-click on a file or folder in Nautilus. You will find your scripts under the "Scripts" menu.

## Conclusion
These steps allow you to easily integrate custom functionalities into your file manager, making Nautilus more powerful and tailored to your specific needs.