batch
@echo off

set PROJECT_DIR=%~dp0
set APP_BUILD_FILE=%PROJECT_DIR%\app\build.gradle

echo Attempting to fix Kotlin plugin error in app/build.gradle...

:: Check if app/build.gradle exists
if not exist "%APP_BUILD_FILE%" (
    echo app/build.gradle not found in project directory. Exiting.
    exit /b 1
)

:: Add Kotlin plugin declaration if missing
echo plugins { >> "%APP_BUILD_FILE%"
echo     id 'org.jetbrains.kotlin.android' >> "%APP_BUILD_FILE%"
echo } >> "%APP_BUILD_FILE%"

echo Process completed. Please rebuild your project.