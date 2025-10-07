@echo off
rem Gradle startup script for Windows
rem
rem Required ENV vars:
rem   JAVA_HOME - location of a JDK home dir
rem
rem Optional ENV vars:
rem   GRADLE_OPTS - parameters passed to the Java VM when running Gradle
rem     e.g. to debug Gradle itself, use
rem     set GRADLE_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005
rem   GRADLE_USER_HOME - location of Gradle's home directory (defaults to USERPROFILE/.gradle)

if "%JAVA_HOME%" == "" (
    echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
    echo Please set the JAVA_HOME variable in your environment to match the
    echo location of your Java installation.
    exit /b 1
)

setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.\nset APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

set DEFAULT_JVM_OPTS="-Xmx64m" "-Xms64m"

if exist "%APP_HOME%\gradle\wrapper\gradle-wrapper.jar" (
    set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar
) else (
    echo ERROR: gradle-wrapper.jar not found in %APP_HOME%\gradle\wrapper\
    echo Please install Gradle and run 'gradle wrapper' to generate the wrapper files.
    exit /b 1
)

set WRAPPER_LAUNCHER=org.gradle.wrapper.GradleWrapperMain

"%JAVA_HOME%\bin\java" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% "-Dorg.gradle.appname=%APP_BASE_NAME%" -classpath "%CLASSPATH%" %WRAPPER_LAUNCHER% %*

endlocal
exit /b %ERRORLEVEL%