# 📱 APK BUILD GUIDE - Complete Instructions

Your Tic Tac Toe game is ready to convert to APK! Here's everything you need.

---

## 🎯 Choose Your Path

### **Path A: PWA (Easiest - NO APK NEEDED)** ⭐ RECOMMENDED FOR QUICK START

Users install directly from browser - works like a native app!

**Setup:** 1 minute
```bash
npm start
# Open http://localhost:3000
# Mobile: Menu → "Install app"
```

**Pros:**
- ✅ No build process
- ✅ Automatic updates
- ✅ Works offline
- ✅ 5 minutes to deploy

**Cons:**
- No Play Store listing
- Limited native features

---

### **Path B: Real APK (Build native Android app)**

Create actual .apk file for distribution.

**Setup Time:** 30 minutes (first time)
**All files provided:** ✅ build-apk.bat, capacitor.config.json, etc.

**Pros:**
- ✅ Google Play Store submission
- ✅ Full native control
- ✅ Better monetization
- ✅ Looks like "real" app

**Cons:**
- Longer setup
- Requires Android SDK
- Manual updates needed

---

## 🚀 STEP-BY-STEP: APK BUILDING

### **Prerequisites (First Time Only)**

#### 1️⃣ Install Android Studio (Free)
- Download: https://developer.android.com/studio
- Run installer
- Open it once (it downloads SDK automatically)
- File → Settings → Appearance & Behavior → System Settings → Android SDK
  - Install: SDK Platform 34, Android SDK Tools, Emulator
- Takes 10-15 minutes

#### 2️⃣ Set Environment Variables
Windows keyboard shortcut:
- Press: `Win + X` → "System"
- Click "Advanced system settings"
- Click "Environment Variables"
- New Variable Name: `ANDROID_SDK_ROOT`
- New Variable Value: `C:\Users\YourUsername\AppData\Local\Android\Sdk`
  (Replace YourUsername!)
- OK → OK

#### 3️⃣ Verify Java
```bash
java -version  # Should show version 11 or higher
```
If not installed:
- Download: https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html
- Install
- Add JAVA_HOME environment variable

### **Build APK (Every Time)**

#### Option A: Automatic (Windows GUI) - EASIEST

1. Double-click: `build-apk.bat`
2. Wait 3-5 minutes
3. APK created at: `android\app\build\outputs\apk\debug\app-debug.apk`

#### Option B: Manual Command Line

```bash
# From project folder
npm install @capacitor/core @capacitor/cli @capacitor/android
npx cap init
npx cap add android
npx cap sync
cd android
gradlew assembleDebug
cd ..
```

APK location: `android\app\build\outputs\apk\debug\app-debug.apk`

---

## 📦 Step 1: Add App Icons (REQUIRED)

Before building, you NEED icons!

**Option 1: Online Generator (Fastest)**
1. Go: https://www.favicon-generator.org/
2. Upload any image (512x512+)
3. Download all PNG files
4. Extract to project folder

**Option 2: AI Generate
1. Use: https://www.bing.com/create
2. Prompt: "Tic tac toe game icon blue"
3. Download
4. Use favicon-generator.org to resize

**Option 3: Python Auto-Generate**
```bash
pip install Pillow
python generate-icons.py my-icon.png
```

Result: Must have these files in project folder:
```
icon-72.png
icon-96.png
icon-128.png
icon-144.png
icon-152.png
icon-192.png
icon-384.png
icon-512.png
```

**See:** [ICONS-SETUP.md](ICONS-SETUP.md) for details

---

## 🔨 Step 2: Install Capacitor

```bash
npm install @capacitor/core @capacitor/cli @capacitor/android
```

(Or just run build-apk.bat - it does this automatically)

---

## 🏗️ Step 3: Initialize Capacitor

```bash
npx cap init
# Answer prompts:
# App name: Tic Tac Toe
# App package ID: com.tictactoe.multiplayer
```

Or edit `capacitor.config.json` directly (already created for you).

---

## 📱 Step 4: Add Android Platform

```bash
npx cap add android
```

Creates `/android` folder with full Android project.

---

## 🔄 Step 5: Sync Project

```bash
npx cap sync
```

Copies your web files into Android project.

---

## 🏗️ Step 6: Build APK

```bash
cd android
gradlew assembleDebug
cd ..
```

Or on Windows with GUI: Double-click `build-apk.bat`

**Wait 2-5 minutes...**

**Result:**
```
✅ app-debug.apk
📍 android/app/build/outputs/apk/debug/
📊 Size: 20-50 MB
```

---

## 📲 Step 7: Test on Phone

### On Emulator:
```bash
cd android
gradlew assembleDebug
# Open Android Studio
# Run on emulator
```

### On Real Phone:
1. Enable Developer Mode:
   - Settings → About → Build Number (tap 7 times)
   - Settings → Developer Options → USB Debugging ON
   
2. Connect via USB cable

3. Run:
```bash
adb install android\app\build\outputs\apk\debug\app-debug.apk
```

App appears on home screen! 🎉

---

## 🎯 Release Build (For Google Play)

### Signing APK

Generate key:
```bash
keytool -genkey -v -keystore my-release-key.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias
```

Edit `android/app/build.gradle`:
```gradle
signingConfigs {
    release {
        storeFile file('my-release-key.keystore')
        storePassword ...
        keyAlias my-key-alias
        keyPassword ...
    }
}
```

Build signed APK:
```bash
cd android
gradlew bundleRelease
cd ..
```

Upload to Google Play Console!

---

## 🐛 Troubleshooting

### "Command not found: gradlew"
- Ensure you're in `/android` folder
- Windows: `gradlew.bat assembleDebug`

### "ANDROID_SDK_ROOT not set"
- Check environment variables again (Win + X > System)
- Restart terminal after setting

### "No Java"
- Download: https://www.oracle.com/java/technologies/javase-jdk11-download.html
- Set JAVA_HOME environment variable

### "Port 3000 in use"
```bash
PORT=3001 npm start
# Edit server.js: const SERVER_URL = 'http://localhost:3001';
```

### "Build fails"
```bash
cd android
gradlew clean
gradlew assembleDebug
```

### "App crashes on startup"
- Check console: `adb logcat`
- Ensure service-worker.js exists
- Check manifest.json syntax

---

## 📊 What You Get

| File | Location | Size | Use |
|------|----------|------|-----|
| Debug APK | `android/app/build/outputs/apk/debug/app-debug.apk` | 25MB | Testing |
| Release AAB | `android/app/build/outputs/bundle/release/` | 20MB | Play Store |

---

## ✅ Checklist

Before building:
- [ ] Node.js installed
- [ ] Android SDK installed
- [ ] ANDROID_SDK_ROOT set
- [ ] JAVA_HOME set
- [ ] App icons (8 PNG files) in project
- [ ] manifest.json present
- [ ] service-worker.js present
- [ ] capacitor.config.json present

---

## 🎉 Success!

### PWA Path:
```bash
npm start
# Share: http://your-server:3000
# Users: Install from browser
# ✅ Done!
```

### APK Path:
```bash
build-apk.bat
# Get: android/app/build/outputs/apk/debug/app-debug.apk
# Share: Direct APK download
# Install: adb install app-debug.apk
# ✅ Done!
```

---

## 📚 References

- Capacitor Docs: https://capacitorjs.com/docs/
- Android Build: https://developer.android.com/studio
- Google Play: https://play.google.com/console
- PWA: https://developers.google.com/web/progressive-web-apps

---

## 💬 Need Help?

1. Check [BUILD-APK-GUIDE.md](BUILD-APK-GUIDE.md)
2. Check [ICONS-SETUP.md](ICONS-SETUP.md)
3. Check [QUICKSTART.md](QUICKSTART.md)
4. Check error messages in terminal

---

**🚀 You're ready! Choose your path and build!**
