#!/bin/bash

# Function to display choices
display_choices() {
    echo ""
    echo "$1"
    shift
    local count=1
    while [[ $# -gt 0 ]]; do
        echo "$count) $1"
        shift
        count=$((count + 1))
    done
    echo ""
    echo -n "Your answer: "
}

# Directory to store the package lists
pkg_dir="$(pwd)/PACKAGES"

# Ensure the directory for the package lists exists
mkdir -p "$pkg_dir"

while true; do
    clear
    # Ask the user if they want to create or install
    display_choices "Do you want to create a package list or install packages?" "Create a list" "Install packages"
    read action

    # Perform the action
    case "$action" in
        1)
            # Get the current date
            date=$(date +%d-%m-%Y)
            # Initial path of the package list file
            pkg_file="$pkg_dir/packages_$date.txt"
            # Ensure the package list file has a unique name
            counter=1
            while [[ -e $pkg_file ]]; do
                counter=$((counter+1))
                pkg_file="$pkg_dir/packages_${date}_$counter.txt"
            done
            # Create a list of installed packages
            echo "Creating the package list..."
            dpkg --get-selections | grep -v deinstall | awk '{print $1}' > "$pkg_file"
            if [ $? -eq 0 ]; then
                echo "Package list created: $pkg_file"
            else
                echo "Error: creating the package list failed."
                exit 1
            fi
            ;;

        2)
            # Get the list of package list files
            mapfile -t pkg_files < <(find "$pkg_dir" -name 'packages_*.txt')
            # Check if there are any package list files
            if [ ${#pkg_files[@]} -eq 0 ]; then
                echo "No package list files found."
                exit 1
            fi
            clear
            # Display the package list files
            echo "Select a package list file:"
            # Create an array to store only the file names without the path or extension
            pkg_file_names=()
            for file in "${pkg_files[@]}"; do
                pkg_file_names+=("$(basename "$file" .txt)")
            done
            # Present choices to the user
            select choice in "${pkg_file_names[@]}"
            do
                if [[ -z "$choice" ]]; then
                    echo "Invalid selection. Please try again."
                    continue
                fi
                # Find the index of the user's choice
                for index in "${!pkg_file_names[@]}"; do
                    if [[ "${pkg_file_names[$index]}" == "$choice" ]]; then
                        pkg_file="${pkg_files[$index]}"
                        break
                    fi
                done
                # Update the list of available packages
                echo "Updating the list of packages..."
                sudo apt update
                # Install packages from the package list file
                echo "Installing packages from $choice..."
                while IFS= read -r package
                do
                    sudo apt install -y "$package"
                done < "$pkg_file"
                echo "Package installation completed."
                break
            done
            ;;


    esac

    clear
    # Ask the user if they want to quit or perform another action
    display_choices "Do you want to perform another action?" "Yes" "No"
    read another_action
    if [[ $another_action -eq 2 ]]; then
        break
    elif [[ $another_action -ne 1 ]]; then
        echo "Invalid choice. Please try again."
    fi
done

echo "End of script. Goodbye!"
