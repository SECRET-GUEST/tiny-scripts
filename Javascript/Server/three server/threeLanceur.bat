@echo off
SET /P projectName=Entrez le nom de votre projet: 
echo Installation de Node.js et npm...
call npm install --global webpack webpack-cli
cls
echo Creation du projet...
mkdir %projectName%
cd %projectName%
call npm init -y
call npm install --save three
call npm install --save-dev vite webpack webpack-cli
cls
echo Creation du fichier webpack.config.js...
echo const path = require('path');>> webpack.config.js
echo.>> webpack.config.js
echo module.exports = {>> webpack.config.js
echo     entry: './src/index.js',>> webpack.config.js
echo     output: {>> webpack.config.js
echo         filename: 'main.js',>> webpack.config.js
echo         path: path.resolve(__dirname, 'dist'),>> webpack.config.js
echo     },>> webpack.config.js
echo     module: {>> webpack.config.js
echo         rules: [>> webpack.config.js
echo             {>> webpack.config.js
echo                 test: /\.js$/,>> webpack.config.js
echo                 exclude: /(node_modules)/,>> webpack.config.js
echo                 use: {>> webpack.config.js
echo                     loader: 'babel-loader',>> webpack.config.js
echo                     options: {>> webpack.config.js
echo                         presets: ['@babel/preset-env']>> webpack.config.js
echo                     }>> webpack.config.js
echo                 }>> webpack.config.js
echo             }>> webpack.config.js
echo         ],>> webpack.config.js
echo     },>> webpack.config.js
echo };>> webpack.config.js
cls
echo Creation du dossier src et du fichier index.js...
mkdir src
echo // Ajoutez votre code Three.js ici>> src\index.js
cls
echo Compilation du bundle avec Webpack...
call npx webpack
cls
echo Creation du fichier batch pour le serveur...
echo @echo off> server.bat
echo npx vite>> server.bat
cls
SET /P createHtml=Voulez-vous creer un fichier HTML de base (O/N) ?
IF /I "%createHtml%" EQU "O" (
    echo Creation du fichier HTML...
    echo ^<!DOCTYPE html^>> index.html
    echo ^<html^>> index.html
    echo ^<head^>>> index.html
    echo     ^<meta charset="UTF-8"^>>> index.html
    echo     ^<title^>%projectName%^</title^>>> index.html
    echo ^</head^>>> index.html
    echo ^<body^>>> index.html
    echo     ^<script src="dist/main.js"^>^</script^>>> index.html
    echo ^</body^>>> index.html
    echo ^</html^>>> index.html
    cls
)
SET /P openVSCode=Voulez-vous ouvrir Visual Studio Code (O/N) ?
IF /I "%openVSCode%" EQU "O" (
    START code .
    cls
)
SET /P startServer=Voulez-vous demarrer le serveur (O/N) ?
IF /I "%startServer%" EQU "O" (
    call server.bat
)
echo Configuration terminee !
