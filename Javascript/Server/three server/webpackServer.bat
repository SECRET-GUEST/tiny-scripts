@echo off
setlocal enabledelayedexpansion


:askLanguage
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
    SET "text12b=Votre projet est maintenant pret à etre utilise avec Webpack."
    SET "text12c=Pour demarrer votre serveur, vous pouvez utiliser le fichier 'server.bat' cree lors de l'installation."
    SET "text12d=Tous vos fichiers .js et dependances doivent etre places dans le dossier 'src'. Webpack s'occupera automatiquement de la compilation et du bundling lors de l'execution du serveur."
    SET "text12e=Appuyez sur entrer pour continuer"
    SET "text13=Voulez-vous creer un fichier CSS de base (O/N) ?"
    SET "text14=Creation du fichier CSS..."
    SET "text15=/* Ajoutez votre code CSS ici */"
    SET "text16=// Ajoutez votre code Three.js ici"
    SET "text17=echo 1. Demarrer le serveur en mode developpement"
    SET "text18=echo - En mode developpement, Webpack optimise la vitesse de construction et ajoute des outils pour faciliter le debogage. Il ne reduit pas le code, inclut des sources cartographiques pour faciliter le debogage et ne supprime pas certains avertissements et erreurs de developpement."
    SET "text19=echo 2. Demarrer le serveur en mode production"
    SET "text20=echo - En mode production, Webpack optimise la taille finale du bundle et les performances d'execution. Il reduit le code, supprime le code inutilise, effectue des optimisations de performance et desactive certains outils de debogage pour reduire la taille du bundle."
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
    SET "text12a=Your setup is almost done."
    SET "text12b=Your project is now ready to use with Webpack."
    SET "text12c=To start your server, you can use the 'server.bat' file created during setup."
    SET "text12d=All your .js files and dependencies should be placed in the 'src' folder. Webpack will automatically handle the transpiling and bundling when the server is running."
    SET "text12e=Press enter to continue"
    SET "text13=Do you want to create a basic CSS file (Y/N)?"
    SET "text14=Creating the CSS file..."
    SET "text15=/* Add your CSS code here */"
    SET "text16=// Add your Three.js code here"
    SET "text17=echo 1. Start server in development mode "
    SET "text18=echo    - In development mode, Webpack optimizes for build speed and adds tools for easier debugging. It does not minimize the code, includes source maps for easier debugging, and does not remove some development warnings and errors. "
    SET "text19=echo 2. Start server in production mode "
    SET "text20=echo    - In production mode, Webpack optimizes for the final bundle size and runtime performance. It minimizes the code, removes dead code, performs performance optimizations, and disables some debugging tools to reduce the bundle size."
    SET "htmlLang=en"
) ELSE (
  cls
  GOTO askLanguage
)
:setLanguage


SET /P projectName=!text1!
echo !text2!
call npm install --global webpack webpack-cli
cls
echo !text3!
mkdir !projectName!
cd !projectName!

echo Creating package.json
(
echo {
echo   "name": "!projectName!",
echo   "version": "1.0.0",
echo   "description": "",
echo   "main": "index.js",
echo   "scripts": {
echo     "start": "webpack serve --open",
echo     "build": "webpack"
echo   },
echo   "keywords": [],
echo   "author": "",
echo   "license": "ISC",
echo   "dependencies": {
echo     "three": "^0.153.0"
echo   },
echo   "devDependencies": {
echo     "@babel/core": "^7.22.5",
echo     "@babel/preset-env": "^7.22.5",
echo     "babel-loader": "^9.1.2",
echo     "css-loader": "^6.8.1",
echo     "html-webpack-plugin": "^5.5.3",
echo     "mini-css-extract-plugin": "^2.7.6",
echo     "webpack": "^5.87.0",
echo     "webpack-cli": "^5.1.4",
echo     "webpack-dev-server": "^4.15.1"
echo   }
echo }
) > package.json

echo Installing dependencies
call npm install



cls
echo !text4!
echo const path = require('path');>> webpack.config.js
echo const HtmlWebpackPlugin = require('html-webpack-plugin');>> webpack.config.js
echo const MiniCssExtractPlugin = require('mini-css-extract-plugin');>> webpack.config.js
echo.>> webpack.config.js
echo module.exports = {>> webpack.config.js
echo   mode: process.env.NODE_ENV === 'production' ? 'production' : 'development',>> webpack.config.js
echo   entry: {>> webpack.config.js
echo     main: './src/index.js',>> webpack.config.js
echo     style: './src/style.css',>> webpack.config.js
echo   },>> webpack.config.js
echo   output: {>> webpack.config.js
echo     filename: '[name].js',>> webpack.config.js
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
echo       },>> webpack.config.js
echo       {>> webpack.config.js
echo         test: /\.css$/,>> webpack.config.js
echo         use: [MiniCssExtractPlugin.loader, 'css-loader'],>> webpack.config.js
echo       },>> webpack.config.js
echo       {>> webpack.config.js
echo         test: /\.(png^|svg^|jpg^|jpeg^|gif)$/i,>> webpack.config.js
echo         type: 'asset/resource',>> webpack.config.js
echo       },>> webpack.config.js
echo     ]>> webpack.config.js
echo   },>> webpack.config.js
echo   resolve: {>> webpack.config.js
echo     alias: {>> webpack.config.js
echo       'three': path.resolve(__dirname, 'node_modules/three/build/three.module.js'),>> webpack.config.js
echo       'GLTFLoader': path.resolve(__dirname, 'node_modules/three/examples/jsm/loaders/GLTFLoader.js')>> webpack.config.js
echo     }>> webpack.config.js
echo   },>> webpack.config.js
echo   plugins: [>> webpack.config.js
echo     new HtmlWebpackPlugin({>> webpack.config.js
echo       template: path.resolve(__dirname,'index.html'),>> webpack.config.js
echo       filename: 'index.html',>> webpack.config.js
echo       inject: 'body',>> webpack.config.js
echo     }),>> webpack.config.js
echo     new MiniCssExtractPlugin({>> webpack.config.js
echo       filename: 'style.css',>> webpack.config.js
echo     }),>> webpack.config.js
echo   ],>> webpack.config.js
echo   devServer: {>> webpack.config.js
echo     static: {>> webpack.config.js
echo       directory: path.join(__dirname, 'dist'),>> webpack.config.js
echo     },>> webpack.config.js
echo     compress: true,>> webpack.config.js
echo     port: 9000,>> webpack.config.js
echo     open: true,>> webpack.config.js
echo     hot: true>> webpack.config.js
echo   }>> webpack.config.js
echo };>> webpack.config.js
cls
echo !text5!
mkdir src
mkdir src\assets
echo !text16! >> src\index.js
cls
echo !text6!
call npx webpack
cls
echo !text7!
echo @echo off> server.bat
echo start . >> server.bat
echo call code . >> server.bat
echo :menu >> server.bat
echo cls >> server.bat
echo echo. >> server.bat
echo !text17!>> server.bat
echo !text18!>> server.bat
echo echo. >> server.bat
echo !text19!>> server.bat
echo !text20!>> server.bat
echo echo. >> server.bat
echo echo 3. Quit >> server.bat
echo echo. >> server.bat
echo set /p mode="Choose an option [1-3]: " >> server.bat
echo if "%%mode%%"=="1" ( >> server.bat
echo   SET NODE_ENV=development >> server.bat
echo   npm start >> server.bat
echo   goto menu >> server.bat
echo ) >> server.bat
echo if "%%mode%%"=="2" ( >> server.bat
echo   SET NODE_ENV=production >> server.bat
echo   npm run build >> server.bat
echo   goto menu >> server.bat
echo ) >> server.bat
echo if "%%mode%%"=="3" ( >> server.bat
echo   echo Quitting... >> server.bat
echo   timeout /t 2 ^>nul >> server.bat
echo   exit >> server.bat
echo ) >> server.bat
echo echo Invalid option >> server.bat
echo timeout /t 2 ^>nul >> server.bat
echo goto menu >> server.bat
cls
:askHtml
SET /P createHtml=!text8!
IF /I "!createHtml!" EQU "O" (
    echo !text9!
    echo ^<!DOCTYPE html^> > index.html
    echo ^<html lang="!htmlLang!"^> >> index.html
    echo ^<head^> >> index.html
    echo     ^<meta charset="UTF-8"^> >> index.html
    echo     ^<title^>!projectName!^</title^> >> index.html
    echo     ^<meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' https://code.jquery.com; img-src 'self' https://*.svg https://*.png https://*.jpg; child-src 'self' https://www.youtube.com; style-src 'self'"^> >> index.html
    echo     ^<link rel="stylesheet" type="text/css" href="style.css"^> >> index.html
    echo ^</head^> >> index.html
    echo ^<body^> >> index.html
    echo     ^<script src="dist/main.js"^>^</script^> >> index.html
    echo ^</body^> >> index.html
    echo ^</html^> >> index.html
    cls
    :askCss
    SET /P createCss=!text13!
    IF /I "!createCss!" EQU "O" (
        echo !text14!
        echo !text15! > style.css
        cls
    ) ELSE IF /I "!createCss!" EQU "N" (
        cls
    ) ELSE (
      cls
      GOTO askCss
    )
) ELSE IF /I "!createHtml!" EQU "N" (
    cls
) ELSE (
  cls
  GOTO askHtml
)

cls
echo !text12a!
echo !text12b!
echo !text12c!
echo !text12d!
echo !text12e!
pause > nul
:askCode
SET /P openVSCode=!text10!
IF /I "!openVSCode!" EQU "O" (
    START code .
) ELSE IF /I "!openVSCode!" EQU "N" (
    cls
) ELSE (
  cls
  GOTO askCode
)

:askServer
SET /P startServer=!text11!
IF /I "!startServer!" EQU "O" (
    call server.bat
) ELSE IF /I "!startServer!" EQU "N" (
    cls
) ELSE (
  cls
  GOTO askServer
)

