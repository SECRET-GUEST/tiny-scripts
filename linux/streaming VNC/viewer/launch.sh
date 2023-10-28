#!/bin/bash

# Remplacez 'linux_user' par votre utilisateur sur la machine Linux
# et 'linux_ip' par l'adresse IP de votre machine Linux.

# Création du tunnel SSH pour le VNC et l'audio
ssh -L 6554:localhost:6554 -L 4713:localhost:4713 linux_user@linux_ip -p 6554 -N &

# Obtenir le PID du processus SSH
SSH_PID=$!

# Attendre que l'utilisateur appuie sur Entrée pour fermer la connexion
read -p "Appuyez sur Entrée pour fermer la connexion..."

# Fermeture du tunnel SSH
kill $SSH_PID

echo "La connexion est terminée."
