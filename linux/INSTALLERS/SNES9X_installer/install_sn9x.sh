#!/bin/bash

# Capture user's home directory
user_home=$HOME

# Find the desktop directory using xdg-user-dir
if command -v xdg-user-dir &> /dev/null; then
    user_desktop=$(xdg-user-dir DESKTOP)
else
    user_desktop="$HOME/Desktop" # Default fallback if xdg-user-dir is not available
fi

# Check for auto install flag
auto_install=false
if [ "$1" == "-a" ] || [ "$1" == "--auto" ]; then
    auto_install=true
    install_dir="$user_home/snes9x"
    echo "Installing in the default directory: $install_dir"
else
    echo "Please enter the directory where you want to install Snes9X:"
    read install_dir
fi

# Install dependencies
sudo apt-get install -y libgtk-3-dev libgtkmm-3.0-dev libsdl2-dev libepoxy-dev libx11-dev libpulse-dev libasound2-dev portaudio19-dev libpng-dev zlib1g-dev libxv-dev libxrandr-dev libwayland-dev wayland-protocols gettext libminizip-dev

# Clone and install Snes9X
git clone https://github.com/snes9xgit/snes9x.git "$install_dir"
cd "$install_dir"
git submodule update --init --recursive
cd gtk
cmake -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -S . -B build
cd build
ninja
sudo ninja install

# Create application icon for both desktop and menu
desktop_entry="[Desktop Entry]
Version=1.62.3
Type=Application
Terminal=false
Exec=$install_dir/gtk/build/snes9x-gtk
Name=Snes9X
Icon=$install_dir/win32/rsrc/icon4.ico
Categories=Game;"

echo "$desktop_entry" | sudo tee /usr/share/applications/snes9x.desktop

# Create desktop shortcut if requested or in auto mode
if [[ $auto_install = true ]] || { [[ $auto_install = false ]] && { read -p "Do you want to create a desktop shortcut? (y/n) " desktop_choice; [[ $desktop_choice == "y" ]]; }; }; then
    if [ -d "$user_desktop" ]; then
        echo "$desktop_entry" > "$user_desktop/snes9x.desktop"
        chmod +x "$user_desktop/snes9x.desktop"
    else
        echo "Desktop directory not found. Skipping desktop shortcut creation."
    fi
fi

echo "Snes9X installation complete."
