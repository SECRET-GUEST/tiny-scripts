#!/bin/bash

# Vérifie si le script est exécuté en tant que root
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant que root" 
   exit 1
fi

# Démarrage de Synapse et Nginx
sudo systemctl start matrix-synapse
sudo systemctl start nginx

# Récupération de l'adresse IP publique
public_ip=$(curl -s http://ifconfig.me)

# Affichage du nom de domaine pour l'accès via Element
echo "Pour accéder à votre serveur Matrix via Element, utilisez l'adresse : https://$public_ip" > ~/Desktop/error.logs

# Ajout des logs de Synapse au fichier error.logs
sudo journalctl -u matrix-synapse -f >> ~/Desktop/error.logs &
