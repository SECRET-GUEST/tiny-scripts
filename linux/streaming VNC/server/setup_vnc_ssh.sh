#!/bin/bash

# Mise à jour des paquets
sudo apt-get update

# Installation des paquets nécessaires
sudo apt-get install -y x11vnc pulseaudio openssh-server ufw

# Configuration de x11vnc avec un mot de passe
x11vnc -storepasswd /etc/x11vnc.pass

# Configuration de PulseAudio pour accepter les connexions réseau sur le port par défaut (4713)
echo 'load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1;192.168.1.0/24' | sudo tee -a /etc/pulse/default.pa

# Création d'une paire de clés SSH pour l'authentification
ssh-keygen -t rsa -b 8192 -f ~/.ssh/id_rsa

# Copie de la clé publique sur le Raspberry Pi (remplacez 'raspberry_user' par votre utilisateur sur le Raspberry Pi et 'raspberry_ip' par l'adresse IP de votre Raspberry Pi)
ssh-copy-id -p 6554 raspberry_user@raspberry_ip

# Modification de la configuration SSH pour utiliser le port 6554
echo "Port 6554" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "L'installation est terminée."
