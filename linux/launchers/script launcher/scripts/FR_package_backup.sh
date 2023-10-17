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

# Répertoire pour stocker la liste des paquets
pkg_dir="$(pwd)/PACKAGES"

# S'assurer que le répertoire pour la liste des paquets existe
mkdir -p "$pkg_dir"

while true; do
    clear
    # Demander à l'utilisateur s'il veut créer ou installer
    display_choices "Voulez-vous créer une liste de paquets ou installer des paquets ?" "Créer une liste" "Installer des paquets"
    read action

    # Effectuer l'action
    case "$action" in
        1)
            # Obtenir la date actuelle
            date=$(date +%d-%m-%Y)
            # Chemin du fichier de la liste des paquets initial
            pkg_file="$pkg_dir/paquets_$date.txt"
            # S'assurer que le fichier de la liste des paquets a un nom unique
            counter=1
            while [[ -e $pkg_file ]]; do
                counter=$((counter+1))
                pkg_file="$pkg_dir/paquets_${date}_$counter.txt"
            done
            # Créer une liste des paquets installés
            echo "Création de la liste des paquets en cours..."
            dpkg --get-selections | grep -v deinstall | awk '{print $1}' > "$pkg_file"
            if [ $? -eq 0 ]; then
                echo "Liste des paquets créée : $pkg_file"
            else
                echo "Erreur : la création de la liste des paquets a échoué."
                exit 1
            fi
            ;;

        2)
            # Obtenir la liste des fichiers de liste de paquets
            mapfile -t pkg_files < <(find "$pkg_dir" -name 'paquets_*.txt')
            # Vérifier s'il y a des fichiers de liste de paquets
            if [ ${#pkg_files[@]} -eq 0 ]; then
                echo "Aucun fichier de liste de paquets trouvé."
                exit 1
            fi
            clear
            # Afficher les fichiers de liste de paquets
            echo "Sélectionnez un fichier de liste de paquets :"
            # Créer un tableau pour stocker uniquement les noms des fichiers sans le chemin ou l'extension
            pkg_file_names=()
            for file in "${pkg_files[@]}"; do
                pkg_file_names+=("$(basename "$file" .txt)")
            done
            # Présenter les choix à l'utilisateur
            select choice in "${pkg_file_names[@]}"
            do
                if [[ -z "$choice" ]]; then
                    echo "Sélection invalide. Veuillez réessayer."
                    continue
                fi
                # Trouver l'index du choix de l'utilisateur
                for index in "${!pkg_file_names[@]}"; do
                    if [[ "${pkg_file_names[$index]}" == "$choice" ]]; then
                        pkg_file="${pkg_files[$index]}"
                        break
                    fi
                done
                # Mettre à jour la liste des paquets disponibles
                echo "Mise à jour de la liste des paquets..."
                sudo apt update
                # Installer les paquets à partir de la liste de paquets
                echo "Installation des paquets depuis $choice..."
                while IFS= read -r package
                do
                    sudo apt install -y "$package"
                done < "$pkg_file"
                echo "Installation des paquets terminée."
                break
            done
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
