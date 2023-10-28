#!/bin/bash

# Fonction pour nettoyer les configurations et arrêter les services
function cleanup {
    sudo ufw delete allow 6554
    pulseaudio --kill
    echo "La règle UFW a été supprimée et PulseAudio a été arrêté."
}

# Installer un piège pour appeler la fonction de nettoyage lors de la sortie du script
trap cleanup EXIT

# Activer UFW pour le port 6554
sudo ufw allow 6554

# Démarrer le serveur PulseAudio
pulseaudio -D

# Démarrer le serveur VNC dans un terminal et obtenir son PID
gnome-terminal -- bash -i -c "x11vnc -usepw -rfbport 6554; exec bash -i" &
VNC_PID=$!

# Attendre que le serveur VNC se termine
wait $VNC_PID

echo "Le serveur VNC s'est terminé."
