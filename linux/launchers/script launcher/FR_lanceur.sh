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

# Répertoire contenant les scripts
script_dir="$(pwd)/scripts"

# S'assurer que le répertoire des scripts existe
if [[ ! -d $script_dir ]]; then
    echo "Le répertoire $script_dir n'existe pas."
    exit 1
fi

while true; do
    clear
    # Obtenir la liste des scripts bash
    mapfile -t scripts < <(find "$script_dir" -maxdepth 1 -type f -name '*.sh')
    # Vérifier s'il y a des scripts bash
    if [ ${#scripts[@]} -eq 0 ]; then
        echo "Aucun script bash trouvé."
        exit 1
    fi
    # Créer un tableau pour stocker uniquement les noms des scripts sans le chemin ou l'extension
    script_names=()
    for script in "${scripts[@]}"; do
        script_names+=("$(basename "$script" .sh)")
    done
    # Afficher les scripts bash
    display_choices "Quel script voulez-vous exécuter ?" "${script_names[@]}"
    read action
    # Vérifier la validité du choix de l'utilisateur
    if [[ $action -gt 0 ]] && [[ $action -le ${#script_names[@]} ]]; then
        # Obtenir le script sélectionné
        selected_script="${scripts[$action-1]}"
        # Exécuter le script sélectionné
        echo "Exécution de ${script_names[$action-1]}..."
        source "$selected_script"
    else
        echo "Sélection invalide. Veuillez réessayer."
        continue
    fi

    clear
    # Demander à l'utilisateur s'il veut quitter ou exécuter un autre script
    display_choices "Voulez-vous exécuter un autre script ?" "Oui" "Non"
    read another_action
    if [[ $another_action -eq 2 ]]; then
        break
    elif [[ $another_action -ne 1 ]]; then
        echo "Choix invalide. Veuillez réessayer."
    fi
done

echo "Fin du script. Au revoir !"
