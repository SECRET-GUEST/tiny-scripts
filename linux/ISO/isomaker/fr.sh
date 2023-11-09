#!/bin/bash

# Fonction pour créer une image compressée de la carte SD
create_image() {
  read -p "Insérez le chemin du périphérique de la carte SD (par exemple, /dev/sdc): " sd_device

  if [ ! -e "$sd_device" ]; then
    echo "Le périphérique $sd_device n'existe pas. Veuillez vérifier et réessayer."
    exit 1
  fi

  read -p "Insérez le chemin complet où sauvegarder l'image compressée (par exemple, /home/user/sdcard.img.gz): " img_path

  # Création d'une image brute
  sudo dd if=$sd_device of="$img_path" bs=4M status=progress && sync

  # Réduction de l'image avec PiShrink et compression
  wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh -O pishrink.sh
  chmod +x pishrink.sh
  sudo ./pishrink.sh "$img_path"
  gzip -f "$img_path"
  echo "Image créée et compressée avec succès."
}

# Fonction pour écrire une image sur une carte SD
write_image() {
  read -p "Insérez le chemin de l'image à écrire (par exemple, /home/user/sdcard.img.gz): " img_path

  if [ ! -f "$img_path" ]; then
    echo "Le fichier $img_path n'existe pas. Veuillez vérifier et réessayer."
    exit 1
  fi

  read -p "Insérez le chemin du périphérique de la carte SD (par exemple, /dev/sdc): " sd_device

  if [ ! -e "$sd_device" ]; then
    echo "Le périphérique $sd_device n'existe pas. Veuillez vérifier et réessayer."
    exit 1
  fi

  # Décompression de l'image
  gzip -dk "$img_path" && \

  # Écriture de l'image sur la carte SD
  img_uncompressed_path="${img_path%.*}"
  sudo dd if="$img_uncompressed_path" of="$sd_device" bs=4M status=progress && sync

  echo "Image écrite sur la carte SD avec succès."
}

# Menu principal
echo "Que souhaitez-vous faire ?"
echo "1. Créer une image d'un système existant"
echo "2. Écrire une image sur une carte SD"
echo "3. Quitter"
read -p "Sélectionnez une option [1-3]: " action

case $action in
  1)
    create_image
    ;;
  2)
    write_image
    ;;
  3)
    echo "Opération annulée."
    exit 0
    ;;
  *)
    echo "Option invalide: $action"
    exit 1
    ;;
esac
