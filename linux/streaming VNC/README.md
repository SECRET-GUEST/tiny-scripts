
```
███████╗████████╗██████╗ ███████╗ █████╗ ███╗   ███╗██╗███╗   ██╗ ██████╗     ███████╗████████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔════╝     ██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
███████╗   ██║   ██████╔╝█████╗  ███████║██╔████╔██║██║██╔██╗ ██║██║  ███╗    ███████╗   ██║   ███████║   ██║   ██║██║   ██║██╔██╗ ██║
╚════██║   ██║   ██╔══██╗██╔══╝  ██╔══██║██║╚██╔╝██║██║██║╚██╗██║██║   ██║    ╚════██║   ██║   ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
███████║   ██║   ██║  ██║███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝    ███████║   ██║   ██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
```

![Bash Script](https://img.shields.io/badge/script-bash-green) 
![LINUX](https://img.shields.io/badge/Debian-LINUX-orange)

# Configuration and Use of VNC Server and SSH Tunnel

This project contains scripts to configure a VNC server with audio streaming on a Linux machine, and establish a SSH tunnel from a Raspberry Pi to access the VNC server and audio.

## Folder Structure

- `server/`: Contains scripts for configuring and launching the VNC server on the Linux machine.
- `viewer/`: Contains scripts for configuring and launching the VNC client on the Raspberry Pi.

## Script Details

### Server (Linux machine):

- `server/setup_vnc_ssh.sh`:
  - This script installs the necessary packages for the VNC server, PulseAudio, and SSH server.
  - Configures x11vnc with a password.
  - Configures PulseAudio to accept network connections.
  - Generates a SSH key pair and copies the public key to the Raspberry Pi for password-less authentication.

- `server/raspberry_ssh_vnc.sh`:
  - This script launches the VNC server and PulseAudio.
  - Configures UFW (Uncomplicated Firewall) to allow only connections to port 6554 (used for VNC and SSH) from the Raspberry Pi.
  - Waits for the VNC server to terminate before deleting the UFW rule and stopping PulseAudio.

### Viewer (Raspberry Pi):

- `viewer/setup.sh`:
  - This script installs the necessary packages for the VNC client, PulseAudio volume control, and SSH client on the Raspberry Pi.

- `viewer/launch.sh`:
  - This script establishes a SSH tunnel to the Linux machine, redirecting the necessary ports for VNC and audio.
  - Waits for the user to press Enter to close the connection, then closes the SSH tunnel.

## 💎 Recommendations  

In your quest for more tools to enhance your desktop productivity, these additional repositories are worth a look:

- [LNK reader](https://github.com/SECRET-GUEST/windows_link_reader): Allow dual boot Linux users to work with Windows shortcuts.
- [File organizer ](https://github.com/SECRET-GUEST/file_organizer) : A versatile tool for sorting and organizing files efficiently, ideal for managing recovered data.

Looking for more? Discover user-friendly, GUI-free script here: 
- [Tiny Scripts](https://github.com/SECRET-GUEST/tiny-scripts)

## 📥 Installation

1. **On the Linux machine**:
   - Run `server/setup_vnc_ssh.sh` to configure the server.
   - Run `server/raspberry_ssh_vnc.sh` to launch the VNC server and PulseAudio.

2. **On the Raspberry Pi**:
   - Run `viewer/setup.sh` to configure the VNC client.
   - Run `viewer/launch.sh` to establish the tunneled connection via SSH and access the VNC server and audio.

## 📜 License

This repository is released under the [MIT License](LICENSE). Please see the `LICENSE` file for more information.

## ❓ Support & Questions

If you have any questions or need support, please feel free to open an issue, a new discussion, or join my twitter.


```
     _ ._  _ , _ ._            _ ._  _ , _ ._    _ ._  _ , _ ._      _ ._  _ , _ .__  _ , _ ._   ._  _ , _ ._   _ , _ ._   .---.  _ ._   _ , _ .__  _ , _ ._   ._  _ , _ ._      _ ._  _ , _ .__  _ , _ . .---<__. \ _
   (_ ' ( `  )_  .__)        (_ ' ( `  )_  .__ (_ ' ( `  )_  .__)  (_ '    ___   ._( `  )_  .__)  ( `  )_  .__)   )_  .__)/     \(_ ' (    )_  ._( `  )_  .__)  ( `  )_  .__)  (_ ' ( `  )_  ._( `` )_  . `---._  \ \ \
 ( (  (    )   `)  ) _)    ( (  (    )   `)  ) (  (    )   `)  ) _ (  (   (o o) )     )   `)  ) _    )   `)  ) _    `)  ) \.@-@./(  (    )   `)     )   `)  ) _    )   `)  ) _ (  (    )   `)         `) ` ),----`- `.))  
(__ (_   (_ . _) _) ,__)  (__ (_   (_ . _) _) _ (_   (_ . _) _) ,__ (_   (  V  ) _) (_ . _) _) ,_  (_ . _) _) ,_ . _) _) ,/`\_/`\ (_   (  . _) _) (_ . _) _) ,_  (_ . _) _) ,__ (_   (_ . _) _) (__. _) _)/ ,--.   )  |
    `~~`\ ' . /`~~`           `~~`\ ' . /`~~`   `~~`\ ' . /`~~`     `~~`/--m-m- ~~`\ ' . /`~~`   `\ ' . /`~~`  `\ ' . /  //  _  \\ ``\ '  . /`~~`\ ' . /`~~`   `\ ' . /`~~`     `~~`\ ' . /`~~`\ ' . /`~~/_/    >     |
         ;   ;                     ;   ;             ;   ;               ;   ;      ;   ;          ;   ;         ;   ;  | \     )|_   ;    ;      ;   ;          ;   ;               ;   ;      ;   ;    |,\__-'      |
         /   \                     /   \             /   \               /   \      /   \          /   \         /   \ /`\_`>  <_/ \  /    \      /   \          /   \               /   \      /   \     \__         \
________/_ __ \___________________/_ __ \___________/_ __ \______ __ ___/_ __ \____/_ __ \________/_ __ \_______/_ __ \\__/'---'\__/_/_  __ \____/_ __ \________/_ __ \_____ _______/_ __ \____/_ __ \____ __\___      )
```