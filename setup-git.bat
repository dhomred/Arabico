@echo off
echo Setting up Arabico Git Repository...
echo.

REM Check if git is available
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo ⚠️ Git is not installed or not in PATH
    echo Please install Git from: https://git-scm.com/downloads
    pause
    exit /b 1
)

REM Initialize git repository if not already done
if not exist ".git" (
    echo 🔄 Initializing Git repository...
    git init
    echo.
)

REM Create .gitignore if it doesn't exist
if not exist ".gitignore" (
    echo 📄 Creating .gitignore file...
    echo build/ > .gitignore
    echo .gradle/ >> .gitignore
    echo .idea/ >> .gitignore
    echo *.iml >> .gitignore
    echo .vscode/ >> .gitignore
    echo local.properties >> .gitignore
    echo *.log >> .gitignore
    echo.
)

REM Add all files to git
echo 📁 Adding files to Git...
git add .

REM Create initial commit if this is the first commit
git log >nul 2>nul
if %errorlevel% neq 0 (
    echo 📝 Creating initial commit...
    git commit -m "🎉 Initial commit: Arabico Arabic Content Repository

- Added comprehensive Arabic content providers
- Movies, TV series, Live TV, Anime, and Sports content
- Full CloudStream3 integration
- Complete documentation and build system
- Ready for community contributions"
    echo.
    echo ✅ Initial commit created successfully!
) else (
    echo ✅ Repository already has commits
)

REM Show repository status
echo 📊 Repository Status:
git status
echo.

REM Show remote repositories
echo 🔗 Remote Repositories:
git remote -v
echo.

echo 🎉 Git repository setup completed!
echo.
echo 📍 Next steps:
echo 1. Create a repository on GitHub/GitLab
echo 2. Add remote: git remote add origin YOUR_REPOSITORY_URL
echo 3. Push to remote: git push -u origin main
echo.
echo 📧 Repository ready for hosting!
pause