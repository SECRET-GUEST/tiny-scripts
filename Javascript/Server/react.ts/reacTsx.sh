#!/bin/bash

echo -e "\033[1;32mPlease enter the project name: \c"
read project_name

if [[ ! "$project_name" =~ ^[a-zA-Z0-9]+$ ]]; then
    echo -e "\nInvalid project name. Only letters and numbers are allowed and it cannot be empty. Please try again.\n"
    exit 1
fi

npx create-react-app $project_name --template typescript

cd $project_name

echo "Choose an option:"
echo -e "\033[1;31m1. Basic Architecture (from main branch)"
echo -e "\033[1;34m2. Three.js Architecture (from threeJs branch)"
echo -e "\033[1;33m3. Exit"
echo -e "\033[1;37m"

read -p "Enter your choice (1-3): " user_choice

if [ "$user_choice" == "1" ]; then
    rm -rf src
    git clone -b main https://github.com/SECRET-GUEST/reactsx.git src
    rm -rf src/.git
    echo -e "\nThe project $project_name has been created with the basic architecture successfully.\n"

elif [ "$user_choice" == "2" ]; then
    rm -rf src
    git clone -b threeJs https://github.com/SECRET-GUEST/reactsx.git src
    rm -rf src/.git
    echo -e "\nThe project $project_name has been created with the Three.js architecture successfully.\n"

elif [ "$user_choice" == "3" ]; then
    echo -e "\nExiting without replacing src folder.\n"
    exit 0

else
    echo -e "\nInvalid choice. Please try again.\n"
    exit 1
fi

cd src
ls -R
sleep 5
cd ..
npm start
