#!/bin/bash

# Définissez le chemin d'accès au dossier des dépendances
DEPENDENCIES_DIR=dependencies

# Créez le dossier des dépendances s'il n'existe pas
mkdir -p $DEPENDENCIES_DIR

# Téléchargez Miniconda s'il n'est pas déjà téléchargé
if [[ ! -f "$DEPENDENCIES_DIR/Miniconda3-latest-Linux-x86_64.sh" ]]; then
    wget -P $DEPENDENCIES_DIR https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi

# Installez Miniconda si nécessaire
if ! command -v conda &>/dev/null; then
    bash Miniconda3-latest-Linux-x86_64.sh -b -p $PWD/miniconda
    export PATH="$PWD/miniconda/bin:$PATH"
fi

# Activez Conda
source miniconda/bin/activate

# Vérifiez si Conda est activé
if ! command -v conda &>/dev/null; then
    echo "L'environnement virtuel n'a pas démarré. Arrêt du script."
    exit 1
fi

# Créez l'environnement Conda s'il n'existe pas
if ! conda info --envs | grep -q 'audiocraft'; then
    conda create -n audiocraft python=3.9 -y
fi

# Activez l'environnement audiocraft
conda activate audiocraft

# Clonez le dépôt audiocraft s'il n'existe pas
if [[ ! -d "audiocraft" ]]; then
    git clone https://github.com/facebookresearch/audiocraft.git
    cd audiocraft/
    python -m pip install -r requirements.txt
else
    cd audiocraft/
fi

# Lancez l'application
python -m demos.musicgen_app