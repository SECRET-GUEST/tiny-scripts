@echo off
:: Vérifie si le script a les droits admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [!] Ce script doit etre lance en tant qu'administrateur.
    echo.
    echo Tentative d'elevation...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

setlocal ENABLEEXTENSIONS
color 0A
title Gestion de Riot Vanguard

:menu
cls
echo ==============================
echo     GESTION RIOT VANGUARD
echo ==============================
echo.
echo 1 - Activer Riot Vanguard
echo 2 - Desactiver Riot Vanguard
echo.
set /p choice="Fais ton choix (1 ou 2) : "

if "%choice%"=="1" goto activer
if "%choice%"=="2" goto desactiver

echo.
echo Choix invalide. Tu dois taper 1 ou 2 uniquement.
pause
exit /b

:activer
echo.
echo *** ACTIVATION DE RIOT VANGUARD ***
sc config vgc start= system
sc config vgk start= system
sc start vgk
sc start vgc
echo.
echo Riot Vanguard est maintenant active.
pause
exit /b

:desactiver
echo.
echo *** DESACTIVATION DE RIOT VANGUARD ***
sc stop vgc
sc stop vgk
sc config vgc start= disabled
sc config vgk start= disabled
echo.
echo Riot Vanguard est maintenant desactive.
pause
exit /b
