#!/bin/bash

# Vérifie si le script est exécuté en tant que root
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant que root"
   exit 1
fi

# Crée une sauvegarde du fichier de configuration actuel
sudo cp /etc/systemd/resolved.conf /etc/systemd/resolved.conf.backup

# Modifie le fichier de configuration pour utiliser les serveurs DNS de Quad9
sudo sed -i 's/#DNS=/DNS=9.9.9.9 149.112.112.112/' /etc/systemd/resolved.conf

# Redémarre systemd-resolved pour appliquer les changements
sudo systemctl restart systemd-resolved

echo "Les serveurs DNS ont été changés pour Quad9."
