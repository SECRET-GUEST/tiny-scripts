#!/bin/bash

# Fonction pour afficher les choix
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
    echo -n "Votre réponse : "
}

# Vérifier si dconf-cli est installé, sinon l'installer
if ! command -v dconf &> /dev/null
then
    echo "dconf-cli n'est pas installé. Installation en cours..."
    sudo apt-get install dconf-cli -y
    if [ $? -ne 0 ]; then
        echo "Erreur : Impossible d'installer dconf-cli. Veuillez réessayer plus tard."
        exit 1
    fi
fi

# Répertoire de sauvegarde
backup_dir="$(pwd)/SAVES"

# S'assurer que le répertoire de sauvegarde existe
mkdir -p "$backup_dir"

while true; do
    clear
    # Demander à l'utilisateur s'il veut sauvegarder ou restaurer
    display_choices "Voulez-vous sauvegarder ou restaurer ?" "Sauvegarder" "Restaurer"
    read action

    # Effectuer l'action
    case "$action" in
        1)
            # Obtenir la date actuelle
            date=$(date +%d-%m-%Y)
            # Chemin du fichier de sauvegarde initial
            backup_file="$backup_dir/backup_$date.dconf"
            # S'assurer que le fichier de sauvegarde a un nom unique
            counter=1
            while [[ -e $backup_file ]]; do
                counter=$((counter+1))
                backup_file="$backup_dir/backup_${date}_$counter.dconf"
            done
            # Sauvegarder les configurations
            echo "Sauvegarde en cours..."
            dconf dump / > "$backup_file"
            if [ $? -eq 0 ]; then
                echo "Sauvegarde terminée : $backup_file"
            else
                echo "Erreur : la sauvegarde a échoué."
                exit 1
            fi  

            ;;
        2)
            # Obtenir la liste des fichiers de sauvegarde
            backups=($(ls "$backup_dir" | grep -E 'backup_[0-9]{2}-[0-9]{2}-[0-9]{4}(_[0-9]+)?.dconf'))
            # Vérifier s'il y a des fichiers de sauvegarde
            if [ ${#backups[@]} -eq 0 ]; then
                echo "Aucun fichier de sauvegarde trouvé."
                exit 1
            fi
            clear
            # Afficher les fichiers de sauvegarde
            echo "Sélectionnez un fichier de sauvegarde :"
            select backup in "${backups[@]}"
            do
                if [ -z "$backup" ]; then
                    echo "Sélection invalide. Veuillez réessayer."
                    continue
                fi
                # Restaurer la configuration
                echo "Restauration depuis $backup..."
                dconf load / < "$backup_dir/$backup"
                if [ $? -eq 0 ]; then
                    echo "Restauration terminée."
                else
                    echo "Erreur : la restauration a échoué."
                fi
                break
            done
            ;;
        *)
            echo "Action invalide. Veuillez réessayer."
            continue
            ;;
    esac


    clear
    # Demander à l'utilisateur s'il veut quitter ou effectuer une autre action
    display_choices "Voulez-vous effectuer une autre action ?" "Oui" "Non"
    read another_action
    if [[ $another_action -eq 2 ]]; then
        break
    elif [[ $another_action -ne 1 ]]; then
        echo "Choix invalide. Veuillez réessayer."
    fi
done

echo "Fin du script. Au revoir !"
