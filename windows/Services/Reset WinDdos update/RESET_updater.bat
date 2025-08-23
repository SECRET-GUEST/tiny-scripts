@echo off
:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] This script requires administrative privileges. Restarting as admin...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo ==== Resetting Windows Update Components ====
echo.

:: Step 1: Stop relevant services
echo [*] Stopping Windows Update related services...
net stop wuauserv
net stop bits
net stop trustedinstaller

:: Step 2: Disable Cryptographic Services (in case it's stuck)
echo [*] Disabling Cryptographic Services temporarily...
sc config cryptsvc start= disabled
net stop cryptsvc

:: Step 3: Delete SoftwareDistribution folder
echo [*] Deleting SoftwareDistribution folder...
rmdir C:\Windows\SoftwareDistribution /s /q

:: Step 4: Remove read-only, system, hidden attributes from the folder (just in case)
attrib -r -s -h %systemroot%\SoftwareDistribution /s /d

:: Step 5: Take ownership and delete Catroot2
echo [*] Taking ownership and deleting Catroot2 folder...
icacls %systemroot%\System32\catroot2 /grant *S-1-5-32-544:F /T
rmdir %systemroot%\System32\catroot2 /s /q

:: Step 6: Re-enable and start Cryptographic Services
echo [*] Re-enabling and starting Cryptographic Services...
sc config cryptsvc start= auto
net start cryptsvc

echo.
echo ==== Done. You may now restart your PC and check Windows Update again. ====
pause
