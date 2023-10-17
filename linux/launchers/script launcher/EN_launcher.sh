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
    echo -n "Your choice: "
}

# Directory containing the scripts
script_dir="$(pwd)/scripts"

# Ensure the script directory exists
if [[ ! -d $script_dir ]]; then
    echo "The directory $script_dir does not exist."
    exit 1
fi

while true; do
    clear
    # Get the list of bash scripts
    mapfile -t scripts < <(find "$script_dir" -maxdepth 1 -type f -name '*.sh')
    # Check if there are bash scripts
    if [ ${#scripts[@]} -eq 0 ]; then
        echo "No bash scripts found."
        exit 1
    fi
    # Create an array to store only the names of the scripts without the path or extension
    script_names=()
    for script in "${scripts[@]}"; do
        script_names+=("$(basename "$script" .sh)")
    done
    # Display the bash scripts
    display_choices "Which script do you want to run?" "${script_names[@]}"
    read action
    # Verify the validity of the user's choice
    if [[ $action -gt 0 ]] && [[ $action -le ${#script_names[@]} ]]; then
        # Get the selected script
        selected_script="${scripts[$action-1]}"
        # Run the selected script
        echo "Running ${script_names[$action-1]}..."
        source "$selected_script"
    else
        echo "Invalid selection. Please try again."
        continue
    fi

    clear
    # Ask the user if they want to exit or run another script
    display_choices "Do you want to run another script?" "Yes" "No"
    read another_action
    if [[ $another_action -eq 2 ]]; then
        break
    elif [[ $another_action -ne 1 ]]; then
        echo "Invalid choice. Please try again."
    fi
done

echo "End of script. Goodbye!"
