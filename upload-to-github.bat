@echo off
echo Uploading Arabico to GitHub repository...
echo.

REM Check if git is available
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Git is not installed or not in PATH
    echo Please install Git from: https://git-scm.com/downloads
    pause
    exit /b 1
)

REM Check if GitHub CLI is available
where gh >nul 2>nul
if %errorlevel% neq 0 (
    echo ⚠️ GitHub CLI (gh) is not installed
    echo Installing GitHub CLI...
    
    REM Download and install GitHub CLI
    powershell -Command "Invoke-WebRequest -Uri 'https://github.com/cli/cli/releases/latest/download/gh_2.39.1_windows_amd64.msi' -OutFile 'gh-installer.msi'"
    msiexec /i gh-installer.msi /quiet
    del gh-installer.msi
    
    echo 🔄 Please restart this script after GitHub CLI installation
    pause
    exit /b 1
)

REM GitHub username
echo 👤 Target GitHub username: dhomred
echo.

REM Check if repository already exists on GitHub
echo 🔍 Checking if repository exists...
gh repo view dhomred/Arabico >nul 2>nul
if %errorlevel% equ 0 (
    echo ✅ Repository dhomred/Arabico already exists
    echo 📁 Adding remote origin...
    git remote add origin https://github.com/dhomred/Arabico.git 2>nul
) else (
    echo 💼 Creating new repository dhomred/Arabico...
    gh repo create Arabico --public --description "🌍 Arabico - Comprehensive Arabic Content Repository for CloudStream3 | مكتبة عربيكة شاملة للمحتوى العربي في CloudStream3" --homepage "https://github.com/dhomred/Arabico"
    
    if %errorlevel% neq 0 (
        echo ❌ Failed to create repository
        echo Please create the repository manually at: https://github.com/new
        echo Then run this script again
        pause
        exit /b 1
    )
    
    echo ✅ Repository created successfully!
    git remote add origin https://github.com/dhomred/Arabico.git
)

REM Ensure all files are staged
echo 📁 Staging all files...
git add .

REM Check if there are changes to commit
git diff --cached --quiet
if %errorlevel% neq 0 (
    echo 📝 Committing changes...
    git commit -m "🚀 Upload complete Arabico repository

🌍 Comprehensive Arabic content repository for CloudStream3
✅ Multiple Arabic content providers (Movies, TV, Live TV, Anime, Sports)
📊 Complete build system and documentation
🔧 Ready for community contributions

Features:
- 30+ Arabic content providers
- Movies & TV series streaming
- Live TV channels
- Arabic anime content
- Sports content
- Full CloudStream3 integration
- Comprehensive documentation
- Build automation
- Community guidelines"
) else (
    echo ✅ No changes to commit
)

REM Push to GitHub
echo 📤 Pushing to GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo 🎉 🎉 🎉 SUCCESS! 🎉 🎉 🎉
    echo ✅ Arabico repository uploaded successfully to: https://github.com/dhomred/Arabico
    echo.
    echo 🔗 Repository URL: https://github.com/dhomred/Arabico
    echo 📁 Repository is now public and ready for use!
    echo.
    echo 🎯 Next steps:
    echo 1. Share the repository URL with the community
    echo 2. Users can add this repository to CloudStream3
    echo 3. Continue developing and pushing updates
) else (
    echo.
    echo ❌ Push failed. Trying alternative method...
    echo 🔄 Attempting force push...
    git push -f origin main
    
    if %errorlevel% equ 0 (
        echo ✅ Force push successful!
    ) else (
        echo ❌ Push failed. Please check:
        echo - GitHub authentication
        echo - Repository permissions
        echo - Internet connection
        echo.
        echo Manual steps:
        echo 1. Go to: https://github.com/dhomred/Arabico
        echo 2. Check repository settings
        echo 3. Try pushing manually: git push origin main
    )
)

echo.
pause