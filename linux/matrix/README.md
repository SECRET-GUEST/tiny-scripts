```
███╗   ███╗ █████╗ ████████╗██████╗ ██╗██╗  ██╗    ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ 
████╗ ████║██╔══██╗╚══██╔══╝██╔══██╗██║╚██╗██╔╝    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
██╔████╔██║███████║   ██║   ██████╔╝██║ ╚███╔╝     ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
██║╚██╔╝██║██╔══██║   ██║   ██╔══██╗██║ ██╔██╗     ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║██║██╔╝ ██╗    ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝    ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝
```

# Synapse Server for Matrix

This folder contains scripts that facilitate the installation, management, and renewal of the SSL certificate for a Matrix Synapse server on your Raspberry Pi. Below is a description of each script and instructions on how to use them.

## 💎 Recommendations

You can use [this script launcher](https://github.com/SECRET-GUEST/tiny-scripts/tree/ALL/linux/launchers/script%20launcher) to execute these scripts easily via a terminal. This tool lists all the scripts in the folder and allows you to choose which one you want to execute.

## 1. Install_server_Synaptic_matrix.sh

This script automates the installation of Synapse, Nginx, and Certbot. It also configures Nginx to serve Synapse, obtains an SSL certificate with Certbot, and sets up the UFW firewall.

**Usage**:
```bash
chmod +x Install_server_Synaptic_matrix.sh
./Install_server_Synaptic_matrix.sh
```

**Notes**:
- You will need to provide your Matrix server domain name when running the script.
- Ensure that the domain name points to the IP address of your Raspberry Pi before running the script.

## 2. renew_cert.sh

This script allows you to renew the SSL certificate for your server. It is advisable to set up a cron job to run this script regularly.

**Usage**:
```bash
chmod +x renew_cert.sh
./renew_cert.sh
```

**Setting up a Cron job for automatic renewal**:
```bash
crontab -e
```
Add the following line to renew the certificate every day at 2 AM:
```bash
0 2 * * * /path/to/script/renew_cert.sh
```

## 3. start_server.sh

This script launches the Synapse server and Nginx, and creates a log file on the desktop.

**Usage**:
```bash
chmod +x start_server.sh
./start_server.sh
```

**Notes**:
- This script should be executed each time you want to start your Synapse server.
- An `error.logs` file will be created on your desktop, containing the server logs.

---

These scripts greatly simplify the installation and management process of your Synapse server on Raspberry Pi. Ensure to read and understand the scripts before executing them, and feel free to modify them according to your specific needs.