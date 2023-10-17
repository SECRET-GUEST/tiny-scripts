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

# Check if dconf-cli is installed, if not install it
if ! command -v dconf &> /dev/null
then
    echo "dconf-cli is not installed. Installing now..."
    sudo apt-get install dconf-cli -y
    if [ $? -ne 0 ]; then
        echo "Error: Unable to install dconf-cli. Please try again later."
        exit 1
    fi
fi

# Backup directory
backup_dir="$(pwd)/SAVES"

# Ensure the backup directory exists
mkdir -p "$backup_dir"

while true; do
    clear
    # Ask the user whether to backup or restore
    display_choices "Would you like to backup or restore?" "Backup" "Restore"
    read action

    # Perform the action
    case "$action" in
        1)
            # Get the current date
            date=$(date +%d-%m-%Y)
            # Initial backup file path
            backup_file="$backup_dir/backup_$date.dconf"
            # Ensure the backup file has a unique name
            counter=1
            while [[ -e $backup_file ]]; do
                counter=$((counter+1))
                backup_file="$backup_dir/backup_${date}_$counter.dconf"
            done
            # Backup the configurations
            echo "Backing up..."
            dconf dump / > "$backup_file"
            if [ $? -eq 0 ]; then
                echo "Backup completed: $backup_file"
            else
                echo "Error: Backup failed."
                exit 1
            fi  

            ;;
        2)
            # Get the list of backup files
            backups=($(ls "$backup_dir" | grep -E 'backup_[0-9]{2}-[0-9]{2}-[0-9]{4}(_[0-9]+)?.dconf'))
            # Check if there are any backup files
            if [ ${#backups[@]} -eq 0 ]; then
                echo "No backup files found."
                exit 1
            fi
            clear
            # Display the backup files
            echo "Select a backup file:"
            select backup in "${backups[@]}"
            do
                if [ -z "$backup" ]; then
                    echo "Invalid selection. Please try again."
                    continue
                fi
                # Restore the configuration
                echo "Restoring from $backup..."
                dconf load / < "$backup_dir/$backup"
                if [ $? -eq 0 ]; then
                    echo "Restore completed."
                else
                    echo "Error: Restore failed."
                fi
                break
            done
            ;;
        *)
            echo "Invalid action. Please try again."
            continue
            ;;
    esac

    clear
    # Ask the user whether to perform another action
    display_choices "Would you like to perform another action?" "Yes" "No"
    read another_action
    if [[ $another_action -eq 2 ]]; then
        break
    elif [[ $another_action -ne 1 ]]; then
        echo "Invalid choice. Please try again."
    fi
done

echo "End of script. Goodbye!"
