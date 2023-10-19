#!/bin/bash

# Define the path to the dependencies folder
DEPENDENCIES_DIR=dependencies

# Create the dependencies folder if it does not exist
mkdir -p $DEPENDENCIES_DIR

# Download Miniconda if it has not been downloaded yet
if [[ ! -f "$DEPENDENCIES_DIR/Miniconda3-latest-Linux-x86_64.sh" ]]; then
    wget -P $DEPENDENCIES_DIR https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi

# Install Miniconda if necessary
if ! command -v conda &>/dev/null; then
    bash Miniconda3-latest-Linux-x86_64.sh -b -p $PWD/miniconda
    export PATH="$PWD/miniconda/bin:$PATH"
fi

# Activate Conda
source miniconda/bin/activate

# Check if Conda is activated
if ! command -v conda &>/dev/null; then
    echo "The virtual environment has not started. Stopping the script."
    exit 1
fi

# Create the Conda environment if it does not exist
if ! conda info --envs | grep -q 'audiocraft'; then
    conda create -n audiocraft python=3.9 -y
fi

# Activate the audiocraft environment
conda activate audiocraft

# Clone the audiocraft repository if it does not exist
if [[ ! -d "audiocraft" ]]; then
    git clone https://github.com/facebookresearch/audiocraft.git
    cd audiocraft/
    python -m pip install -r requirements.txt
else
    cd audiocraft/
fi

# Launch the application
python -m demos.musicgen_app
