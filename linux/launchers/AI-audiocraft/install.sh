#!/bin/bash

# Get the path of the directory containing this script
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Set the path to the dependencies folder
DEPENDENCIES_DIR="$SCRIPT_DIR/dependencies"

# Create the dependencies folder if it does not exist
mkdir -p "$DEPENDENCIES_DIR"

# Download Miniconda if it hasn't been downloaded yet
if [[ ! -f "$DEPENDENCIES_DIR/Miniconda3-latest-Linux-x86_64.sh" ]]; then
    wget -P "$DEPENDENCIES_DIR" https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi

# Install Miniconda if necessary
if ! command -v conda &>/dev/null; then
    bash "$DEPENDENCIES_DIR/Miniconda3-latest-Linux-x86_64.sh" -b -p "$DEPENDENCIES_DIR/miniconda"
    export PATH="$DEPENDENCIES_DIR/miniconda/bin:$PATH"
fi

# Activate Conda
source "$DEPENDENCIES_DIR/miniconda/bin/activate"

# Create the Conda environment if it does not exist
ENV_NAME="venv"  # Change this to the environment name you want
if ! conda info --envs | grep -q "$ENV_NAME"; then
    conda create -p "$DEPENDENCIES_DIR/$ENV_NAME" python=3.9 -y
fi

# Activate the environment my_env
conda activate "$DEPENDENCIES_DIR/$ENV_NAME"

# Check if the environment my_env is activated
if [[ $CONDA_DEFAULT_ENV != "$DEPENDENCIES_DIR/$ENV_NAME" ]]; then
    echo "The virtual environment $ENV_NAME is not activated. Stopping the script."
    exit 1
fi

# Update typing_extensions
pip install --upgrade typing_extensions

# Clone the audiocraft repository if it does not exist
REPO_NAME="audiocraft"  # Change this to the directory name you want
if [[ ! -d "$SCRIPT_DIR/$REPO_NAME" ]]; then
    git clone https://github.com/facebookresearch/audiocraft.git "$SCRIPT_DIR/$REPO_NAME"
    cd "$SCRIPT_DIR/$REPO_NAME/"
    python -m pip install -r requirements.txt
else
    cd "$SCRIPT_DIR/$REPO_NAME/"
fi

# Launch the application in a background process
python -m demos.musicgen_app --inbrowser
