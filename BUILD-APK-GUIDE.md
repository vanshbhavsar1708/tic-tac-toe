# 📱 Build APK - Complete Guide

## 🚀 Quick Start (2 Methods)

### **Method 1: Capacitor (Recommended - Real APK)**

#### Prerequisites:
- Node.js installed
- Android Studio (free) or Android SDK command-line tools
- Java Development Kit (JDK) 11+

#### Steps:

**1. Install Android SDK (One time):**
- Download: https://developer.android.com/studio
- Install Android Studio
- Open it, go to SDK Manager
- Install: Android SDK Platform 34, Android SDK Tools, Emulator

**2. Set Java & Android Paths:**

Windows:
```bash
set JAVA_HOME=C:\Program Files\Java\jdk-11
set ANDROID_SDK_ROOT=C:\Users\YourUsername\AppData\Local\Android\Sdk
set PATH=%PATH%;%ANDROID_SDK_ROOT%\tools
```

Or add to Environment Variables permanently (easier).

**3. Build APK:**

Option A (Windows GUI):
```
Double-click: build-apk.bat
```

Option B (Command Line):
```bash
npm install @capacitor/core @capacitor/cli @capacitor/android
npx cap init
npx cap add android
npx cap sync
cd android
./gradlew assembleDebug
cd ..
```

**4. Install on Phone:**
```bash
adb install android\app\build\outputs\apk\debug\app-debug.apk
```

Result: `app-debug.apk` in `android/app/build/outputs/apk/debug/`

---

### **Method 2: PWA (Easiest - No APK Needed!)**

PWA is already set up! Users can install directly:

**Android:**
1. Open in Chrome/Firefox
2. Menu (⋮) → "Install app"
3. Done!

**iPhone:**
1. Open in Safari
2. Share → "Add to Home Screen"
3. Done!

No APK needed - works like a native app!

---

## 📊 Comparison

| Feature | PWA | Capacitor APK |
|---------|-----|--------------|
| **Installation** | Direct from browser | .apk file download |
| **Size** | ~2MB | ~30-50MB |
| **Update** | Automatic | Manual updates |
| **Offline** | Yes (cached) | Yes |
| **Play Store** | No | Yes (with signing) |
| **App Permissions** | Limited | Full access |
| **Setup Time** | 5 min | 30 min (first time) |

---

## 🎯 Recommended Approach

**For Quick Launch:** Use PWA ✅
- Just deploy to web
- Users install from browser
- No build process needed

**For Play Store:** Use Capacitor APK
- Better monetization
- More control
- Can add native features

---

## 🔧 Troubleshooting

### "gradlew not found"
```bash
cd android
./gradlew --version  # Mac/Linux
gradlew.bat --version  # Windows
```

### "ANDROID_SDK_ROOT not set"
- Set environment variable to: `C:\Users\YourName\AppData\Local\Android\Sdk`

### "Java not found"
- Download JDK 11: https://openjdk.java.net/
- Set JAVA_HOME environment variable

### Port 3000 conflict
```bash
PORT=3001 npm start
# Update script.js: const SERVER_URL = 'http://localhost:3001';
```

---

## 📦 APK Release Build (Advanced)

For signing and Google Play:

```bash
cd android
./gradlew bundleRelease  # Creates .aab for Play Store
cd ..
```

Then upload to Google Play Console.

---

## ✅ Verification

After building:
```bash
# List generated APK
dir android\app\build\outputs\apk\debug\

# Check file size (should be 20-50MB)
# Should work on Android 5.0+
```

---

## 📱 Testing on Device

Connect Android phone via USB:

```bash
# Enable USB Debugging on phone
# Run:
adb devices  # List connected devices
adb install android\app\build\outputs\apk\debug\app-debug.apk
```

---

## 🎉 That's It!

**PWA:** Deploy to web → Users install from browser
**APK:** Run build-apk.bat → Share .apk file

Choose based on your needs! 🚀
