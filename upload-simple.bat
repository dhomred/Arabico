@echo off
echo Uploading Arabico to GitHub repository...
echo.

REM Check if git is available
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo Git is not installed or not in PATH
    echo Please install Git from: https://git-scm.com/downloads
    pause
    exit /b 1
)

REM Create repository using GitHub web interface
echo Please create a new repository on GitHub:
echo 1. Go to: https://github.com/new
echo 2. Repository name: Arabico
echo 3. Description: Comprehensive Arabic Content Repository for CloudStream3
echo 4. Set as Public repository
echo 5. Do NOT initialize with README (we already have one)
echo.
echo After creating the repository, copy the repository URL
echo It should look like: https://github.com/dhomred/Arabico.git
echo.

REM Add remote origin
echo Adding remote origin...
git remote remove origin 2>nul
git remote add origin https://github.com/dhomred/Arabico.git

REM Ensure all files are staged
echo Staging all files...
git add .

REM Commit changes
echo Committing changes...
git commit -m "Initial commit: Arabico Arabic Content Repository" --allow-empty 2>nul

REM Push to GitHub
echo Pushing to GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo SUCCESS! Repository uploaded to: https://github.com/dhomred/Arabico
    echo Users can now add this repository to CloudStream3
) else (
    echo.
    echo Push failed. Common issues:
    echo 1. Repository not created on GitHub
    echo 2. Authentication issues
    echo 3. Repository URL incorrect
    echo.
    echo Manual steps:
    echo 1. Create repository at: https://github.com/new
    echo 2. Use repository name: Arabico
    echo 3. Then run: git push -u origin main
)

echo.
pause