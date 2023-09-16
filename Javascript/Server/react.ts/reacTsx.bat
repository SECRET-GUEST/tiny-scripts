@echo off
color A
:input
SET /P project_name="Please enter the project name: "

IF "%project_name%"=="" (
    echo.
    echo Invalid project name. Only letters and numbers are allowed and it cannot be empty. Please try again.
    echo.
    GOTO input
)

SET "valid_name=1"
FOR /F "delims=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" %%A IN ("%project_name%") DO (
    SET "valid_name=0"
)
IF "%valid_name%"=="0" (
    echo.
    echo Invalid project name. Only letters and numbers are allowed and it cannot be empty. Please try again.
    echo.
    GOTO input
)

call npx create-react-app %project_name% --template typescript < NUL
cls

cd %project_name%

:choice
echo Choose an option:
echo.
color E
echo 1. Basic Architecture (from main branch)
color B
echo 2. Three.js Architecture (from threeJs branch)
color C
echo 3. Exit
color 7
echo.
SET /P user_choice="Enter your choice (1-3): "


IF "%user_choice%"=="1" (
    rmdir /S /Q src
    git clone -b main https://github.com/SECRET-GUEST/reactsx.git src
    rmdir /S /Q src\.git
    echo.
    echo The project %project_name% has been created with the basic architecture successfully.
    echo.
    GOTO display_content

) ELSE IF "%user_choice%"=="2" (
    rmdir /S /Q src
    git clone -b threeJs https://github.com/SECRET-GUEST/reactsx.git src
    rmdir /S /Q src\.git
    echo.
    echo The project %project_name% has been created with the Three.js architecture successfully.
    echo.
    GOTO display_content

) ELSE IF "%user_choice%"=="3" (
    echo.
    echo Exiting without replacing src folder.
    echo.
    GOTO end

) ELSE (
    echo.
    echo Invalid choice. Please try again.
    echo.
    GOTO choice
)

:display_content
cd src
tree /F
timeout /T 5
GOTO end

:end
exit

