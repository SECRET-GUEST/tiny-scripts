[![JavaScript](https://img.shields.io/badge/JavaScript-ES6-yellow.svg)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

```
████████╗██╗  ██╗██████╗ ███████╗███████╗        ██╗███████╗
╚══██╔══╝██║  ██║██╔══██╗██╔════╝██╔════╝        ██║██╔════╝
   ██║   ███████║██████╔╝█████╗  █████╗          ██║███████╗
   ██║   ██╔══██║██╔══██╗██╔══╝  ██╔══╝     ██   ██║╚════██║
   ██║   ██║  ██║██║  ██║███████╗███████╗██╗╚█████╔╝███████║
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝ ╚════╝ ╚══════╝
                                                                               
```

[![Webpack](https://img.shields.io/badge/Webpack-5.0.0-blue.svg)](https://webpack.js.org/)
[![Three.js](https://img.shields.io/badge/Three.js-R128-orange.svg)](https://threejs.org/)
[![Vite](https://img.shields.io/badge/Vite-2.0.0-green.svg)](https://vitejs.dev/)
[![Windows](https://img.shields.io/badge/OS-Windows-informational.svg)](https://www.microsoft.com/windows)
[![Visual Studio Code](https://img.shields.io/badge/IDE-Visual%20Studio%20Code-blueviolet.svg)](https://code.visualstudio.com/)


# Script de lancement du projet Webpack pour Three.js

Ce script crée un environnement de développement pour les projets Three.js. Il utilise Webpack pour la compilation des modules et Vite pour le serveur de développement. L'installation des dépendances nécessaires est réalisée par npm.

## Utilisation

0. Installez JavaScript (Node) sur votre machine : https://nodejs.org/en/download

1. Sauvegardez le script dans un fichier à la racine de votre dossier de projet.

2. Ouvrez un terminal ou une invite de commandes et naviguez vers votre dossier de projet.

3. Exécutez le script en double-cliquant dessus ou en l'exécutant depuis le terminal. Il vous demandera comment nommer votre projet, installera les dépendances nécessaires, créera un fichier batch pour démarrer le serveur, et vous demandera si vous voulez créer un fichier HTML de base.

4. Pour démarrer le serveur de développement, exécutez le fichier `server.bat` créé par le script, ou utilisez la commande suivante dans le terminal:
```bash
npx vite
```

## Explication

- Le script commence par demander le nom de votre projet.

- Il installe ensuite les dépendances nécessaires, notamment Webpack, Three.js et Vite.

- Il crée le fichier `webpack.config.js` qui contient la configuration de base pour Webpack.

- Il crée ensuite le dossier `src` et le fichier `index.js` dans ce dossier, où vous pouvez commencer à écrire votre code Three.js.

- Il compile le bundle avec Webpack.

- Il crée le fichier `server.bat` pour démarrer le serveur de développement avec Vite.

- Il vous demande ensuite si vous voulez créer un fichier HTML de base. Si vous répondez oui, il crée le fichier `index.html` avec un script qui se réfère au bundle créé par Webpack.

- À la fin, il vous demande si vous voulez ouvrir le projet dans Visual Studio Code et si vous voulez démarrer le serveur. Si vous répondez oui à l'une ou l'autre de ces questions, il exécute l'action correspondante.

Notez : Assurez-vous d'installer les dépendances requises et d'ajuster le numéro du port selon vos besoins.
