#!/bin/bash
# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
# Go to that directory
cd "$SCRIPT_DIR"

# Name of the virtual environment
ENV_NAME="py3_VENV_fooocus"
# Git repository URL for Fooocus
GIT_REPO="https://github.com/SECRET-GUEST/Fooocus.git"
# Path to the Fooocus directory
FOOCUS_DIR="Fooocus"

# Check and create the virtual environment if necessary
if [ ! -d "$ENV_NAME" ]; then
    echo "Creating the virtual environment $ENV_NAME..."
    python3 -m venv $ENV_NAME
fi

# Activate the virtual environment
source $ENV_NAME/bin/activate

# Check if the Fooocus directory exists and contains the file entry_with_update.py
if [ ! -d "$FOOCUS_DIR" ] || [ ! -f "$FOOCUS_DIR/entry_with_update.py" ]; then
    echo "Fooocus installation required..."

    # Clone the Fooocus repository if necessary
    if [ ! -d "$FOOCUS_DIR" ]; then
        echo "Cloning the Fooocus repository..."
        git clone $GIT_REPO
    fi

    # Move to the Fooocus directory and install dependencies
    cd $FOOCUS_DIR
    echo "Installing dependencies..."
    pip install -r requirements_versions.txt
else
    # Move to the Fooocus directory
    cd $FOOCUS_DIR
fi

# Menu for launching Fooocus
echo "Choose your preset:"
echo "1) Anime"
echo "2) Realistic"
echo "3) No preset"
echo ""
echo -n "Your choice: "
read choice

case $choice in
    1)
        echo "Launching with Anime preset..."
        python entry_with_update.py --preset anime
        ;;
    2)
        echo "Launching with Realistic preset..."
        python entry_with_update.py --preset realistic
        ;;
    3)
        echo "Launching Fooocus without preset..."
        python entry_with_update.py
        ;;
    *)
        echo "Invalid choice. Ending program."
        exit 1
        ;;
esac

# Deactivate the virtual environment
deactivate
