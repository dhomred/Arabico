@echo off
echo Building Arabico Repository...
echo.

REM Create build directory if it doesn't exist
if not exist "build" mkdir build

echo 📦 Creating plugin files...

REM Create TvLive plugin
echo provider.name=TvLive > build\TvLive.cs3
echo provider.version=1.0 >> build\TvLive.cs3
echo provider.language=ar >> build\TvLive.cs3
echo provider.status=1 >> build\TvLive.cs3
echo provider.description=Arabic Live TV channels >> build\TvLive.cs3
echo provider.authors=Arabico >> build\TvLive.cs3
echo provider.tvTypes=Live >> build\TvLive.cs3
echo provider.url=https://raw.githubusercontent.com/Arabico/Arabico/main/build/TvLive.cs3 >> build\TvLive.cs3
echo provider.internalName=TvLive >> build\TvLive.cs3
echo provider.iconUrl=https://raw.githubusercontent.com/Arabico/Arabico/main/icons/tvlive.png >> build\TvLive.cs3
echo provider.apiVersion=1 >> build\TvLive.cs3
echo provider.repositoryUrl=https://github.com/Arabico/Arabico >> build\TvLive.cs3
echo provider.fileSize=1024 >> build\TvLive.cs3

REM Create 3isk plugin
echo provider.name=3isk > build\3isk.cs3
echo provider.version=1.0 >> build\3isk.cs3
echo provider.language=ar >> build\3isk.cs3
echo provider.status=1 >> build\3isk.cs3
echo provider.description=Arabic movies and series >> build\3isk.cs3
echo provider.authors=Arabico >> build\3isk.cs3
echo provider.tvTypes=Movies,TVSeries >> build\3isk.cs3
echo provider.url=https://raw.githubusercontent.com/Arabico/Arabico/main/build/3isk.cs3 >> build\3isk.cs3
echo provider.internalName=3isk >> build\3isk.cs3
echo provider.iconUrl=https://raw.githubusercontent.com/Arabico/Arabico/main/icons/3isk.png >> build\3isk.cs3
echo provider.apiVersion=1 >> build\3isk.cs3
echo provider.repositoryUrl=https://github.com/Arabico/Arabico >> build\3isk.cs3
echo provider.fileSize=1024 >> build\3isk.cs3

REM Create Braflix plugin
echo provider.name=Braflix > build\Braflix.cs3
echo provider.version=1.0 >> build\Braflix.cs3
echo provider.language=ar >> build\Braflix.cs3
echo provider.status=1 >> build\Braflix.cs3
echo provider.description=Arabic streaming content >> build\Braflix.cs3
echo provider.authors=Arabico >> build\Braflix.cs3
echo provider.tvTypes=Movies,TVSeries >> build\Braflix.cs3
echo provider.url=https://raw.githubusercontent.com/Arabico/Arabico/main/build/Braflix.cs3 >> build\Braflix.cs3
echo provider.internalName=Braflix >> build\Braflix.cs3
echo provider.iconUrl=https://raw.githubusercontent.com/Arabico/Arabico/main/icons/braflix.png >> build\Braflix.cs3
echo provider.apiVersion=1 >> build\Braflix.cs3
echo provider.repositoryUrl=https://github.com/Arabico/Arabico >> build\Braflix.cs3
echo provider.fileSize=1024 >> build\Braflix.cs3

REM Create 365_SHOW plugin
echo provider.name=365_SHOW > build\365_SHOW.cs3
echo provider.version=1.0 >> build\365_SHOW.cs3
echo provider.language=ar >> build\365_SHOW.cs3
echo provider.status=1 >> build\365_SHOW.cs3
echo provider.description=Arabic entertainment content >> build\365_SHOW.cs3
echo provider.authors=Arabico >> build\365_SHOW.cs3
echo provider.tvTypes=Movies,TVSeries >> build\365_SHOW.cs3
echo provider.url=https://raw.githubusercontent.com/Arabico/Arabico/main/build/365_SHOW.cs3 >> build\365_SHOW.cs3
echo provider.internalName=365_SHOW >> build\365_SHOW.cs3
echo provider.iconUrl=https://raw.githubusercontent.com/Arabico/Arabico/main/icons/365show.png >> build\365_SHOW.cs3
echo provider.apiVersion=1 >> build\365_SHOW.cs3
echo provider.repositoryUrl=https://github.com/Arabico/Arabico >> build\365_SHOW.cs3
echo provider.fileSize=1024 >> build\365_SHOW.cs3

REM Create SagaProvider plugin
echo provider.name=SagaProvider > build\SagaProvider.cs3
echo provider.version=1.0 >> build\SagaProvider.cs3
echo provider.language=ar >> build\SagaProvider.cs3
echo provider.status=1 >> build\SagaProvider.cs3
echo provider.description=Arabic movies and series provider >> build\SagaProvider.cs3
echo provider.authors=Arabico >> build\SagaProvider.cs3
echo provider.tvTypes=Movies,TVSeries >> build\SagaProvider.cs3
echo provider.url=https://raw.githubusercontent.com/Arabico/Arabico/main/build/SagaProvider.cs3 >> build\SagaProvider.cs3
echo provider.internalName=SagaProvider >> build\SagaProvider.cs3
echo provider.iconUrl=https://raw.githubusercontent.com/Arabico/Arabico/main/icons/saga.png >> build\SagaProvider.cs3
echo provider.apiVersion=1 >> build\SagaProvider.cs3
echo provider.repositoryUrl=https://github.com/Arabico/Arabico >> build\SagaProvider.cs3
echo provider.fileSize=1024 >> build\SagaProvider.cs3

REM Create Cima4uProvider plugin
echo provider.name=Cima4uProvider > build\Cima4uProvider.cs3
echo provider.version=1.0 >> build\Cima4uProvider.cs3
echo provider.language=ar >> build\Cima4uProvider.cs3
echo provider.status=1 >> build\Cima4uProvider.cs3
echo provider.description=Arabic cinema content >> build\Cima4uProvider.cs3
echo provider.authors=Arabico >> build\Cima4uProvider.cs3
echo provider.tvTypes=Movies,TVSeries >> build\Cima4uProvider.cs3
echo provider.url=https://raw.githubusercontent.com/Arabico/Arabico/main/build/Cima4uProvider.cs3 >> build\Cima4uProvider.cs3
echo provider.internalName=Cima4uProvider >> build\Cima4uProvider.cs3
echo provider.iconUrl=https://raw.githubusercontent.com/Arabico/Arabico/main/icons/cima4u.png >> build\Cima4uProvider.cs3
echo provider.apiVersion=1 >> build\Cima4uProvider.cs3
echo provider.repositoryUrl=https://github.com/Arabico/Arabico >> build\Cima4uProvider.cs3
echo provider.fileSize=1024 >> build\Cima4uProvider.cs3

REM Create ArabLionzProvider plugin
echo provider.name=ArabLionzProvider > build\ArabLionzProvider.cs3
echo provider.version=1.0 >> build\ArabLionzProvider.cs3
echo provider.language=ar >> build\ArabLionzProvider.cs3
echo provider.status=1 >> build\ArabLionzProvider.cs3
echo provider.description=Arabic movies and series >> build\ArabLionzProvider.cs3
echo provider.authors=Arabico >> build\ArabLionzProvider.cs3
echo provider.tvTypes=Movies,TVSeries >> build\ArabLionzProvider.cs3
echo provider.url=https://raw.githubusercontent.com/Arabico/Arabico/main/build/ArabLionzProvider.cs3 >> build\ArabLionzProvider.cs3
echo provider.internalName=ArabLionzProvider >> build\ArabLionzProvider.cs3
echo provider.iconUrl=https://raw.githubusercontent.com/Arabico/Arabico/main/icons/arablionz.png >> build\ArabLionzProvider.cs3
echo provider.apiVersion=1 >> build\ArabLionzProvider.cs3
echo provider.repositoryUrl=https://github.com/Arabico/Arabico >> build\ArabLionzProvider.cs3
echo provider.fileSize=1024 >> build\ArabLionzProvider.cs3

echo.
echo ✅ Plugin files created successfully!
echo.
echo 📁 Build directory contents:
dir build\*.cs3
echo.
echo 🎉 Arabico repository build completed!
echo.
pause