@echo off
echo Building Arabico Providers...

REM Create build directory if not exists
if not exist build mkdir build

REM Build each provider manually using Kotlin compiler
echo Building TvLive Provider...
cd TvLive
if not exist build mkdir build
kotlinc -cp "libs/*" -d build/TvLive.jar src/main/kotlin/*.kt
cd ..

echo Building 3isk Provider...
cd 3isk
if not exist build mkdir build
kotlinc -cp "libs/*" -d build/3isk.jar src/main/kotlin/*.kt
cd ..

echo Building Braflix Provider...
cd Braflix
if not exist build mkdir build
kotlinc -cp "libs/*" -d build/Braflix.jar src/main/kotlin/*.kt
cd ..

echo Building 365_SHOW Provider...
cd 365_SHOW
if not exist build mkdir build
kotlinc -cp "libs/*" -d build/365_SHOW.jar src/main/kotlin/*.kt
cd ..

echo Build completed!