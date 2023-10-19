#!/bin/bash

# Obtenez le chemin du répertoire contenant ce script
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Définissez le chemin d'accès au dossier des dépendances
DEPENDENCIES_DIR="$SCRIPT_DIR/dependencies"

# Créez le dossier des dépendances s'il n'existe pas
mkdir -p "$DEPENDENCIES_DIR"

# Téléchargez Miniconda s'il n'est pas déjà téléchargé
if [[ ! -f "$DEPENDENCIES_DIR/Miniconda3-latest-Linux-x86_64.sh" ]]; then
    wget -P "$DEPENDENCIES_DIR" https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi

# Installez Miniconda si nécessaire
if ! command -v conda &>/dev/null; then
    bash "$DEPENDENCIES_DIR/Miniconda3-latest-Linux-x86_64.sh" -b -p "$DEPENDENCIES_DIR/miniconda"
    export PATH="$DEPENDENCIES_DIR/miniconda/bin:$PATH"
fi

# Activez Conda
source "$DEPENDENCIES_DIR/miniconda/bin/activate"

# Créez l'environnement Conda s'il n'existe pas
ENV_NAME="venv"  # Changez cela au nom d'environnement que vous souhaitez
if ! conda info --envs | grep -q "$ENV_NAME"; then
    conda create -p "$DEPENDENCIES_DIR/$ENV_NAME" python=3.9 -y
fi

# Activez l'environnement mon_env
conda activate "$DEPENDENCIES_DIR/$ENV_NAME"

# Vérifiez si l'environnement mon_env est activé
if [[ $CONDA_DEFAULT_ENV != "$DEPENDENCIES_DIR/$ENV_NAME" ]]; then
    echo "L'environnement virtuel $ENV_NAME n'est pas activé. Arrêt du script."
    exit 1
fi

# Mettez à jour typing_extensions
pip install --upgrade typing_extensions

# Clonez le dépôt audiocraft s'il n'existe pas
REPO_NAME="audiocraft"  # Changez cela au nom de répertoire que vous souhaitez
if [[ ! -d "$SCRIPT_DIR/$REPO_NAME" ]]; then
    git clone https://github.com/facebookresearch/audiocraft.git "$SCRIPT_DIR/$REPO_NAME"
    cd "$SCRIPT_DIR/$REPO_NAME/"
    python -m pip install -r requirements.txt
else
    cd "$SCRIPT_DIR/$REPO_NAME/"
fi

# Lancez l'application dans un processus en arrière-plan
python -m demos.musicgen_app --inbrowser
