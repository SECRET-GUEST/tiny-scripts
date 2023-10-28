```
 ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ ██╗   ██╗██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ ██║   ██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗██║   ██║██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║
██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║██║   ██║██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝╚██████╔╝██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
```

# User Configuration on Kali Linux

This folder contains scripts for configuring a secure and personalized user environment on Kali Linux. These scripts will allow you to change DNS settings, set up the keyboard layout in French, and create a new secure user.

## 💎 Recommendations

You can use [this script launcher](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/launchers/script%20launcher) to execute these scripts easily via a terminal. This tool lists all the scripts in the folder and lets you choose which one you want to execute.

## 🛠️ Script Usage

### change_DNS.sh

This script modifies the DNS settings of your system to use Quad9 DNS servers.

**Usage**:
```bash
chmod +x change_DNS.sh
./change_DNS.sh
```

**Notes**:
- This script must be run as root.
- A backup of the current configuration file is created before applying the changes.


### new_secure_user.sh

This script creates a new secure user, locks the root password, and adds the new user to the sudo group.

**Usage**:
```bash
chmod +x new_secure_user.sh
./new_secure_user.sh
```

**Notes**:
- You will be prompted to provide a username, a hostname, and a machine name.
- You will also be prompted to provide a password for the new user.
- Instructions for switching sessions and deleting the old user will be displayed at the end of the script.