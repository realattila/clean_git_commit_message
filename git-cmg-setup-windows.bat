@echo off
:: Display a message to the user
echo ============================================================
echo    Script to setup git-cmg alias by RealAttila
echo ============================================================

:: Step 1: Clean up any existing 'cmg' alias from Git configuration
echo Cleaning up any existing 'cmg' alias...
git config --global --unset alias.cmg
if %errorlevel% equ 0 (
    echo Existing 'cmg' alias removed successfully.
) else (
    echo No 'cmg' alias found to remove.
)

:: Step 2: Check if C:/scripts directory exists, create it if not
echo Checking if C:/scripts directory exists...
if not exist "C:/scripts" (
    echo Directory C:/scripts does not exist. Creating it now...
    mkdir "C:/scripts"
) else (
    echo Directory C:/scripts already exists.
)

:: Step 3: Copy git-cmg.sh to C:/scripts
echo Copying git-cmg.sh to C:/scripts...
copy /y "git-cmg.sh" "C:/scripts\git-cmg.sh"
if %errorlevel% equ 0 (
    echo git-cmg.sh copied successfully.
) else (
    echo Failed to copy git-cmg.sh. Please check the file path.
    exit /b 1
)

:: Step 4: Add git-cmg alias to Git configuration
echo Adding 'git-cmg' alias to Git configuration...
git config --global alias.cmg "!\"C:/Program Files/Git/bin/bash.exe\" 'C:/scripts/git-cmg.sh'"
if %errorlevel% equ 0 (
    echo git-cmg alias added successfully!
) else (
    echo Failed to add git-cmg alias. Please check your Git installation.
    exit /b 1
)

:: Step 5: Verify the alias was added successfully
echo Verifying the 'git-cmg' alias...
git config --global --get alias.cmg
if %errorlevel% equ 0 (
    echo Alias 'git-cmg' is correctly set.
) else (
    echo Failed to retrieve alias. Please troubleshoot.
)

echo ============================================================
echo    Setup complete. Press any key to exit.
echo ============================================================
pause
