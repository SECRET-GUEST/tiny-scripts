@echo off
:: Check if the script has admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [!] This script must be run as administrator.
    echo.
    echo Attempting elevation...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

setlocal ENABLEEXTENSIONS
color 0A
title Riot Vanguard Management

:menu
cls
echo ==============================
echo     RIOT VANGUARD MANAGEMENT
echo ==============================
echo.
echo 1 - Activate Riot Vanguard
echo 2 - Deactivate Riot Vanguard
echo.
set /p choice="Enter your choice (1 or 2): "

if "%choice%"=="1" goto activate
if "%choice%"=="2" goto deactivate

echo.
echo Invalid choice. You must enter 1 or 2 only.
pause
exit /b

:activate
echo.
echo *** ACTIVATING RIOT VANGUARD ***
sc config vgc start= system
sc config vgk start= system
sc start vgk
sc start vgc
echo.
echo Riot Vanguard is now activated.
pause
exit /b

:deactivate
echo.
echo *** DEACTIVATING RIOT VANGUARD ***
sc stop vgc
sc stop vgk
sc config vgc start= disabled
sc config vgk start= disabled
echo.
echo Riot Vanguard is now deactivated.
pause
exit /b