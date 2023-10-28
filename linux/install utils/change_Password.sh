#!/bin/bash

# Vérifie si le script est exécuté en tant que root
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant que root" 
   exit 1
fi

confirmation="2"
while [ "$confirmation" == "2" ]; do
    # Demande les informations à l'utilisateur
    read -p "Entrez le nom d'utilisateur : " username
    read -p "Entrez l'hostname : " hostname
    read -p "Entrez le nom de la machine : " machinename

    # Affiche les informations entrées
    echo "Voici les informations que vous avez entrées :"
    echo "Nom d'utilisateur : $username"
    echo "Hostname : $hostname"
    echo "Nom de la machine : $machinename"

    # Demande la confirmation
    echo -e "\n1) Oui \n2) Non\n"
    read -p "Votre réponse : " confirmation

    # Efface l'écran si l'utilisateur choisit 'Non'
    if [ "$confirmation" == "2" ]; then
        clear
    fi
done

# Demande le mot de passe
read -s -p "Entrez le mot de passe pour $username : " userpass
echo

# Crée le nouvel utilisateur
adduser --gecos "$username" --disabled-password $username
echo "$username:$userpass" | chpasswd

# Verrouille le mot de passe de root
passwd -l root

# Ajoute l'utilisateur au groupe sudo
usermod -aG sudo $username

# Change l'hostname et le nom de la machine
hostnamectl set-hostname $hostname
echo $machinename > /etc/machine-info

# Instructions pour changer de session et supprimer l'ancien utilisateur
echo -e "\nVeuillez changer de session pour le nouvel utilisateur avec la commande suivante :"
echo "su - $username"
echo -e "\nPour supprimer l'ancien utilisateur définitivement, utilisez la commande suivante après vous être connecté en tant que $username :"
echo "sudo deluser --remove-home kali"
