@echo off
setlocal enabledelayedexpansion

echo (1) Francais
echo (2) English
SET /P language=Choisissez votre langue / Choose your language: 

IF "%language%"=="1" (
    SET "text1=Entrez le nom de votre projet: "
    SET "text2=Installation de Node.js et npm..."
    SET "text3=Creation du projet..."
    SET "text4=Creation du fichier webpack.config.js..."
    SET "text5=Creation du dossier src et du fichier index.js..."
    SET "text6=Compilation du bundle avec Webpack..."
    SET "text7=Creation du fichier batch pour le serveur..."
    SET "text8=Voulez-vous creer un fichier HTML de base (O/N) ?"
    SET "text9=Creation du fichier HTML..."
    SET "text10=Voulez-vous ouvrir Visual Studio Code (O/N) ?"
    SET "text11=Voulez-vous demarrer le serveur (O/N) ?"
    SET "text12=Configuration terminee !"
    SET "text13=Voulez-vous creer un fichier CSS de base (O/N) ?"
    SET "text14=Creation du fichier CSS..."
    SET "htmlLang=fr"
) ELSE IF "%language%"=="2" (
    SET "text1=Enter the name of your project: "
    SET "text2=Installing Node.js and npm..."
    SET "text3=Creating the project..."
    SET "text4=Creating webpack.config.js..."
    SET "text5=Creating src folder and index.js file..."
    SET "text6=Compiling the bundle with Webpack..."
    SET "text7=Creating the batch file for the server..."
    SET "text8=Do you want to create a basic HTML file (Y/N) ?"
    SET "text9=Creating the HTML file..."
    SET "text10=Do you want to open Visual Studio Code (Y/N) ?"
    SET "text11=Do you want to start the server (Y/N) ?"
    SET "text12=Setup is complete!"
    SET "text13=Do you want to create a basic CSS file (Y/N) ?"
    SET "text14=Creating the CSS file..."
    SET "htmlLang=en"
)


SET /P projectName=!text1!
echo !text2!
call npm install --global webpack webpack-cli
cls
echo !text3!
mkdir !projectName!
cd !projectName!
call npm init -y
call npm install --save three
call npm install --save-dev vite webpack webpack-cli
cls
echo !text4!
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
echo !text5!
mkdir src
echo // Ajoutez votre code Three.js ici>> src\index.js
cls
echo !text6!
call npx webpack
cls
echo !text7!
echo @echo off> server.bat
echo npx vite --open>> server.bat
cls
SET /P createHtml=!text8!
IF /I "!createHtml!" EQU "O" (
    echo !text9!
    echo ^<!DOCTYPE html^>> index.html
    echo ^<html lang="!htmlLang!"^>>> index.html
    echo ^<head^>>> index.html
    echo     ^<meta charset="UTF-8"^>>> index.html
    echo     ^<title^>!projectName!^</title^>>> index.html
    echo     ^<meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' https://code.jquery.com; img-src 'self' https://*.svg https://*.png https://*.jpg; child-src 'self' https://www.youtube.com; style-src 'self'"^>>> index.html
    echo     ^<link rel="stylesheet" type="text/css" href="style/style.css"^>>> index.html
    echo ^</head^>>> index.html
    echo ^<body^>>> index.html
    echo     ^<script src="dist/main.js"^>^</script^>>> index.html
    echo ^</body^>>> index.html
    echo ^</html^>>> index.html
    cls
    SET /P createCss=!text13!
    IF /I "!createCss!" EQU "O" (
        echo !text14!
        mkdir style
        echo /* Ajoutez votre code CSS ici */>> style\style.css
        cls
    )
)
SET /P openVSCode=!text10!
IF /I "!openVSCode!" EQU "O" (
    START code .
    cls
)
SET /P startServer=!text11!
IF /I "!startServer!" EQU "O" (
    call server.bat
)
echo !text12!
