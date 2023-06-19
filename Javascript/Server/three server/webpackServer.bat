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
    SET "text12a=Votre configuration est presque terminee."
    SET "text12b=Pour construire votre projet avec webpack, vous pouvez utiliser la commande 'npx webpack'."
    SET "text12c=Cette commande va transpiler et bundler votre code en utilisant les configurations fournies dans le fichier webpack.config.js."
    SET "text12d=Assurez-vous de toujours avoir tous vos fichiers .js et les dependances dans le dossier 'src' (par exemple en regroupant, listant vos fichiers .js dans un fichier index.js) avant de lancer le build."
    SET "text12e=appuyez sur entrer pour continuer"
    SET "text13=Voulez-vous creer un fichier CSS de base (O/N) ?"
    SET "text14=Creation du fichier CSS..."
    SET "text15=/* Ajoutez votre code CSS ici */"
    SET "text16=// Ajoutez votre code Three.js ici"
    SET "htmlLang=fr"
) ELSE IF "%language%"=="2" (
    SET "text1=Enter the name of your project: "
    SET "text2=Installing Node.js and npm..."
    SET "text3=Creating the project..."
    SET "text4=Creating webpack.config.js file..."
    SET "text5=Creating src folder and index.js file..."
    SET "text6=Compiling the bundle with Webpack..."
    SET "text7=Creating the batch file for the server..."
    SET "text8=Do you want to create a basic HTML file (Y/N)?"
    SET "text9=Creating the HTML file..."
    SET "text10=Do you want to open Visual Studio Code (Y/N)?"
    SET "text11=Do you want to start the server (Y/N)?"
    SET "text12a=Your configuration is almost complete."
    SET "text12b=To build your project with webpack, you can use the 'npx webpack' command."
    SET "text12c=This command will transpile and bundle your code using the configurations provided in the webpack.config.js file."
    SET "text12d=Make sure to always have all your .js files and dependencies in the 'src' folder before running the build."
    SET "text12e=To skip this tutorial, press enter."
    SET "text13=Do you want to create a basic CSS file (Y/N)?"
    SET "text14=Creating the CSS file..."
    SET "text15=/* Add your CSS code here */"
    SET "text16=// Add your Three.js code here"
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
echo   entry: './src/index.js',>> webpack.config.js
echo   output: {>> webpack.config.js
echo     filename: 'main.js',>> webpack.config.js
echo     path: path.resolve(__dirname, 'dist'),>> webpack.config.js
echo   },>> webpack.config.js
echo   module: {>> webpack.config.js
echo     rules: [>> webpack.config.js
echo       {>> webpack.config.js
echo         test: /\.js$/,>> webpack.config.js
echo         exclude: /(node_modules)/,>> webpack.config.js
echo         use: {>> webpack.config.js
echo           loader: 'babel-loader',>> webpack.config.js
echo           options: {>> webpack.config.js
echo             presets: ['@babel/preset-env']>> webpack.config.js
echo           }>> webpack.config.js
echo         }>> webpack.config.js
echo       }>> webpack.config.js
echo     ]>> webpack.config.js
echo   },>> webpack.config.js
echo   resolve: {>> webpack.config.js
echo     alias: {>> webpack.config.js
echo       'three': path.resolve(__dirname, 'node_modules/three/build/three.module.js'),>> webpack.config.js
echo       'GLTFLoader': path.resolve(__dirname, 'node_modules/three/examples/jsm/loaders/GLTFLoader.js')>> webpack.config.js
echo     }>> webpack.config.js
echo   }>> webpack.config.js
echo };>> webpack.config.js
cls
echo !text5!
mkdir src
echo !text16! >> src\index.js
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
        echo !text15! >> style\style.css
        cls
    )
)
cls
echo !text12a!
echo !text12b!
echo !text12c!
echo !text12d!
echo !text12e!
pause > nul
SET /P openVSCode=!text10!
IF /I "!openVSCode!" EQU "O" (
    START code .
)
SET /P startServer=!text11!
IF /I "!startServer!" EQU "O" (
    call server.bat
)


