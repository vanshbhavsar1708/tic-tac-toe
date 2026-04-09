@echo off
REM Build APK for Android using Capacitor (Windows)

echo.
echo 🎮 Building Tic Tac Toe APK...
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js not found. Please install Node.js first.
    echo Download: https://nodejs.org/
    pause
    exit /b 1
)

REM Check if Android SDK is installed
if "%ANDROID_SDK_ROOT%"=="" (
    echo ⚠️  ANDROID_SDK_ROOT not set. Please install Android SDK first.
    echo Download: https://developer.android.com/studio
    pause
    exit /b 1
)

echo 📦 Installing Capacitor...
call npm install @capacitor/core @capacitor/cli @capacitor/android

echo.
echo ⚙️  Initializing Capacitor...
call npx cap init

echo.
echo 📱 Adding Android platform...
call npx cap add android

echo.
echo 🔄 Syncing project...
call npx cap sync

echo.
echo 🏗️  Building APK (This may take 2-3 minutes)...
cd android
call gradlew assembleDebug
cd ..

echo.
echo ✅ APK built successfully!
echo 📍 Location: android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo Next steps:
echo   1. Connect Android device via USB
echo   2. Enable USB Debugging on device
echo   3. Run: adb install android\app\build\outputs\apk\debug\app-debug.apk
echo.
pause
