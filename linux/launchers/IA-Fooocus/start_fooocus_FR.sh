#!/bin/bash
# Obtenir le répertoire du script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
# Définir le répertoire de travail sur le répertoire du script
cd "$SCRIPT_DIR"

# Nom de l'environnement virtuel
ENV_NAME="py3_VENV_fooocus"
# URL du dépôt Git pour Fooocus
GIT_REPO="https://github.com/SECRET-GUEST/Fooocus.git"
# Chemin du dossier Fooocus
FOOCUS_DIR="Fooocus"

# Vérifier et créer l'environnement virtuel si nécessaire
if [ ! -d "$ENV_NAME" ]; then
    echo "Création de l'environnement virtuel $ENV_NAME..."
    python3 -m venv $ENV_NAME
fi

# Activer l'environnement virtuel
source $ENV_NAME/bin/activate

# Vérifier si le dossier Fooocus existe et contient le fichier entry_with_update.py
if [ ! -d "$FOOCUS_DIR" ] || [ ! -f "$FOOCUS_DIR/entry_with_update.py" ]; then
    echo "Installation nécessaire pour Fooocus..."
    
    # Cloner le dépôt Fooocus si nécessaire
    if [ ! -d "$FOOCUS_DIR" ]; then
        echo "Clonage du dépôt Fooocus..."
        git clone $GIT_REPO
    fi

    # Se déplacer dans le dossier Fooocus et installer les dépendances
    cd $FOOCUS_DIR
    echo "Installation des dépendances..."
    pip install -r requirements_versions.txt
else
    # Se déplacer dans le dossier Fooocus
    cd $FOOCUS_DIR
fi

# Menu de choix pour lancer Fooocus
echo "Choisissez votre présélection :"
echo "1) Anime"
echo "2) Realistic"
echo "3) Sans présélection"
echo ""
echo -n "Votre réponse : "
read choice

case $choice in
    1)
        echo "Lancement de la présélection Anime..."
        python entry_with_update.py --preset anime
        ;;
    2)
        echo "Lancement de la présélection Realistic..."
        python entry_with_update.py --preset realistic
        ;;
    3)
        echo "Lancement de Fooocus sans présélection..."
        python entry_with_update.py
        ;;
    *)
        echo "Choix invalide. Fin du programme."
        exit 1
        ;;
esac

# Désactivation de l'environnement virtuel
deactivate
