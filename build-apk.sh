#!/bin/bash
# Build APK for Android using Capacitor

echo "🎮 Building Tic Tac Toe APK..."
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js first."
    exit 1
fi

# Check if Android SDK is installed
if [ -z "$ANDROID_SDK_ROOT" ]; then
    echo "⚠️  ANDROID_SDK_ROOT not set. Please install Android SDK and set the environment variable."
    echo "   Download: https://developer.android.com/studio"
    exit 1
fi

echo "📦 Installing Capacitor..."
npm install @capacitor/core @capacitor/cli @capacitor/android

echo "⚙️  Initializing Capacitor..."
npx cap init

echo "📱 Adding Android platform..."
npx cap add android

echo "🔄 Syncing project..."
npx cap sync

echo "🏗️  Building APK..."
cd android
./gradlew assembleDebug
cd ..

echo ""
echo "✅ APK built successfully!"
echo "📍 Location: android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "To install on device:"
echo "  adb install android/app/build/outputs/apk/debug/app-debug.apk"
