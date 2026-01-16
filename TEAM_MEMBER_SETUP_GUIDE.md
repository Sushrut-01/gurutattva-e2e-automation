# 🚀 Gurutattva E2E Testing - Complete Setup Guide for Team Members

**Last Updated:** January 16, 2026
**Setup Type:** Desktop/Laptop Android Testing with Appium
**Repository:** https://github.com/Sushrut-01/gurutattva-e2e-automation

---

## 📋 Table of Contents

1. [Prerequisites Installation](#prerequisites-installation)
2. [Repository Setup](#repository-setup)
3. [Device Configuration](#device-configuration)
4. [Running Tests](#running-tests)
5. [Current Device Details](#current-device-details)
6. [Test Credentials](#test-credentials)
7. [Troubleshooting](#troubleshooting)

---

## 1️⃣ Prerequisites Installation

### Step 1: Install Python 3.12+

```bash
# Download Python from: https://www.python.org/downloads/
# During installation, CHECK ✅ "Add Python to PATH"

# Verify installation:
python --version     # Should show Python 3.12.x or higher
pip --version        # Should show pip 24.x or higher
```

### Step 2: Install Node.js v20.x LTS ⚠️ CRITICAL

**⚠️ IMPORTANT:** Use Node.js v20.x LTS, NOT v22.x or v23.x (Appium compatibility issue)

```bash
# Download Node.js v20 LTS from:
https://nodejs.org/en/download/prebuilt-installer

# During installation:
- Choose "LTS (Long Term Support)"
- Install all components

# Verify installation:
node -v      # Should show v20.x.x
npm -v       # Should show 10.x.x or higher
```

### Step 3: Install Java JDK 11+

```bash
# Download Java JDK from:
https://www.oracle.com/java/technologies/downloads/

# OR use OpenJDK:
https://adoptium.net/

# Verify installation:
java -version    # Should show version 11 or higher
```

### Step 4: Install Android SDK

**Option A: Install Android Studio (Recommended)**
```bash
# Download from: https://developer.android.com/studio
# Install Android Studio with default settings
# This includes: Android SDK, Platform Tools (ADB), etc.
```

**Option B: Install SDK Command Line Tools Only**
```bash
# Download from: https://developer.android.com/studio#command-tools
# Extract to: C:\Android\sdk
# Add to PATH: C:\Android\sdk\platform-tools
```

### Step 5: Set Environment Variables

**Windows:**
```powershell
# Add these to System Environment Variables:

ANDROID_HOME = C:\Users\YourName\AppData\Local\Android\Sdk
JAVA_HOME = C:\Program Files\Java\jdk-11.0.x

# Add to PATH:
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\tools
%JAVA_HOME%\bin
```

**Verify:**
```bash
adb version      # Should show Android Debug Bridge version
```

### Step 6: Install Appium

```bash
# Install Appium globally
npm install -g appium

# Install UIAutomator2 driver (for Android)
npm install -g appium-uiautomator2-driver

# Verify installation
appium -v                  # Should show 3.x.x
appium driver list         # Should show uiautomator2 installed
```

### Step 7: Install Appium Inspector (Optional but Recommended)

```bash
# Download Appium Inspector from:
https://github.com/appium/appium-inspector/releases

# Install the .exe for Windows
# This helps you inspect mobile app elements
```

---

## 2️⃣ Repository Setup

### Step 1: Clone Repository

```bash
# Clone from GitHub
cd D:\  # or your preferred directory
git clone https://github.com/Sushrut-01/gurutattva-e2e-automation.git
cd gurutattva-e2e-automation

# Switch to master branch (has all latest fixes)
git checkout master
git pull origin master
```

### Step 2: Install Python Dependencies

```bash
# Navigate to project directory
cd D:\gurutattva-e2e-automation

# Install Robot Framework and libraries
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-appiumlibrary
pip install selenium
pip install Appium-Python-Client

# Verify installation
robot --version     # Should show Robot Framework 7.x
```

---

## 3️⃣ Device Configuration

### Current Device Setup (Laptop Configuration)

**Device Details:**
- **Device Name:** RZCT40WL69K (Motorola/Samsung/OnePlus - Android Phone)
- **Connection:** USB Cable
- **Appium Server:** localhost:4723
- **Auto-detection:** Enabled (DEVICE_NAME = ${EMPTY})

### Option 1: Use Same Device (USB Connection)

**Requirements:**
1. Android phone with USB cable
2. USB debugging enabled on phone
3. Phone driver installed on desktop

**Setup Steps:**

```bash
# 1. Enable USB Debugging on your Android phone:
Settings → About Phone → Tap "Build Number" 7 times
Settings → Developer Options → Enable "USB Debugging"

# 2. Connect phone via USB cable to Desktop

# 3. Allow USB debugging when prompt appears on phone

# 4. Verify device is connected
adb devices

# Expected output:
# List of devices attached
# RZCT40WL69K    device    ← or your device ID
```

### Option 2: Use Android Emulator (Alternative)

**Setup Android Emulator:**

```bash
# 1. Open Android Studio
# 2. Tools → AVD Manager → Create Virtual Device
# 3. Select device (e.g., Pixel 4)
# 4. Download system image (API 30 or higher)
# 5. Create AVD with default settings

# Start emulator
emulator -avd Pixel_4_API_30

# Verify emulator is running
adb devices
# Expected output:
# emulator-5554    device
```

**Update Configuration for Emulator:**

Edit: `resources/variables.robot`
```robot
${DEVICE_NAME}       emulator-5554    # Change from ${EMPTY}
```

### Install Gurutattva App on Device

```bash
# Download latest APK from team
# Location: D:\Downloads\Dhyan_16_12_2025.apk (or latest version)

# Install APK on device/emulator
adb install -r D:\Downloads\Dhyan_16_12_2025.apk

# Verify app is installed
adb shell pm list packages | findstr gurutattva
# Expected output:
# package:com.org.gurutattva.app
```

---

## 4️⃣ Running Tests

### Start Appium Server

**Terminal 1 (Keep this running):**
```bash
# Start Appium server with logging
appium server --address 0.0.0.0 --port 4723 --log-level info

# Expected output:
# [Appium] Welcome to Appium v3.x.x
# [Appium] Appium REST http interface listener started on 0.0.0.0:4723
```

### Run Tests

**Terminal 2 (Run tests from here):**

```bash
# Navigate to project
cd D:\gurutattva-e2e-automation

# Run all E2E Dhyankendra tests
python -m robot tests/E2EDhyankendra.robot

# Run specific test by name
python -m robot --test "Login from Mobile as Sadhak*" tests/E2EDhyankendra.robot

# Run E2E Registration tests
python -m robot tests/E2ERegistration.robot

# Run specific test case (e.g., TC66)
python -m robot --test "*TC66*" tests/E2EDhyankendra.robot

# Run tests with tags
python -m robot --include TC66 tests/E2EDhyankendra.robot

# Run with verbose logging (for debugging)
python -m robot --loglevel DEBUG tests/E2EDhyankendra.robot
```

### View Test Results

```bash
# After test execution, open reports:
D:\gurutattva-e2e-automation\results\report.html   # Test summary
D:\gurutattva-e2e-automation\results\log.html      # Detailed logs
D:\gurutattva-e2e-automation\results\output.xml    # XML output
```

---

## 5️⃣ Current Device Details

### Configured in `resources/variables.robot`

```robot
# Appium Server
${REMOTE_URL}        http://localhost:4723

# Device Configuration
${PLATFORM_NAME}     Android
${DEVICE_NAME}       RZCT40WL69K           # Your laptop's device
                     # OR ${EMPTY} for auto-detection
${APP_PACKAGE}       com.org.gurutattva.app
${APP_ACTIVITY}      com.example.gurutattva_flutter_app.MainActivity
${AUTOMATION_NAME}   UiAutomator2
```

### For Your Desktop

**If using same device (phone connected via USB):**
- No changes needed! Auto-detection will work.

**If using different device:**

1. Connect your device via USB
2. Run `adb devices` to get device ID
3. Edit `resources/variables.robot`:
   ```robot
   ${DEVICE_NAME}       YOUR_DEVICE_ID_HERE
   ```

---

## 6️⃣ Test Credentials

### Mobile App Login (OTP-based)

```robot
# Dhyankendra Sadhak Login
Phone: 9835625646
OTP: 999999 (auto-entered)

# Registration Tests
Primary Phone: 9999999999
OTP: 999999 (auto-entered)

Tertiary Phone: 9999999911
OTP: 999999 (auto-entered)
```

### Web CMS Login

```robot
# Super Admin
Email: sushrut.nistane@rysun.com
Password: Sharu@051220

# Sanchalak (for Dhyankendra tests)
Email: patilvaishub@gmail.com
Password: Lavanya@21
```

**Note:** All credentials are in `resources/variables.robot`

---

## 7️⃣ Troubleshooting

### Issue 1: "Node.js ESM Module Error"

**Error:**
```
Error [ERR_REQUIRE_ESM]: require() of ES Module uuid...
```

**Solution:**
```bash
# Uninstall current Node.js
# Install Node.js v20 LTS (NOT v22)
# Download from: https://nodejs.org/

# Reinstall Appium
npm uninstall -g appium
npm install -g appium
npm install -g appium-uiautomator2-driver

# Verify
node -v      # Must be v20.x.x
appium -v    # Should work without errors
```

### Issue 2: "Could not find a connected Android device"

**Error:**
```
WebDriverException: Could not find a connected Android device in 20000ms
```

**Solution:**
```bash
# 1. Verify device is connected
adb devices

# 2. If device shows as "unauthorized":
- Check your phone for USB debugging permission prompt
- Tap "Allow" on phone
- Run adb devices again

# 3. If no devices shown:
# Restart ADB
adb kill-server
adb start-server
adb devices

# 4. Check USB cable is data cable (not charge-only cable)

# 5. Try different USB port on computer
```

### Issue 3: "Appium port already in use"

**Error:**
```
listen EADDRINUSE: address already in use 0.0.0.0:4723
```

**Solution:**
```powershell
# Windows: Kill process using port 4723
netstat -ano | findstr 4723
# Note the PID (last column)

taskkill /PID <PID_NUMBER> /F

# Then restart Appium
appium server --address 0.0.0.0 --port 4723
```

### Issue 4: "Element not found" errors

**Common causes:**
1. App version mismatch (UI elements changed)
2. Network/loading delay
3. Device screen size different

**Solution:**
```bash
# 1. Update to latest APK
adb uninstall com.org.gurutattva.app
adb install -r D:\Downloads\Dhyan_LATEST.apk

# 2. Clear app data
adb shell pm clear com.org.gurutattva.app

# 3. Increase wait times in tests (if needed)
# Edit test files to add Sleep commands

# 4. Use Appium Inspector to verify element locators
# Start Appium Inspector → Connect → Inspect elements
```

### Issue 5: "Tests pass setup but fail during execution"

**Debug steps:**
```bash
# 1. Check device logs during test
adb logcat | findstr gurutattva

# 2. Check available device storage
adb shell df -h

# 3. Check device battery level
adb shell dumpsys battery

# 4. Restart device
adb reboot

# 5. Run with debug logging
python -m robot --loglevel DEBUG tests/E2EDhyankendra.robot
```

### Issue 6: "Python/Robot Framework not found"

**Solution:**
```bash
# Verify Python is in PATH
python --version

# If not found, add Python to PATH:
# Windows: System Properties → Environment Variables → PATH
# Add: C:\Users\YourName\AppData\Local\Programs\Python\Python312

# Reinstall Robot Framework
pip install --upgrade robotframework
```

---

## 📊 Available Test Suites

### E2EDhyankendra.robot
- **TC64:** Login from Mobile and register for Dhyankendra
- **TC66:** Sanchalak edits, Super Admin approves → Mobile verification
- **TC67:** Sanchalak edits, Super Admin rejects → Mobile verification
- **TC68:** Change Primary Sanchalak from TC66's Dhyankendra
- **TC69:** Change Primary Sanchalak from TC67's Dhyankendra

### E2ERegistration.robot
- **TC07:** Quick registration verification
- **TC08:** Registration validation
- **TC09:** Access restrictions
- **TC10:** Member upgrade flow
- **TC11:** Edit profile verification
- **TC14:** Community registration

### E2EAudio.robot
- Audio category tests
- Audio management flows

---

## 🔄 Staying in Sync with Team

### Daily Workflow

```bash
# 1. Pull latest changes before starting work
cd D:\gurutattva-e2e-automation
git checkout master
git pull origin master

# 2. Do your testing/development work
# ... run tests, make fixes, etc.

# 3. If you make changes, commit and push
git add .
git commit -m "Your descriptive commit message"
git push origin master

# 4. Pull again before next day's work
git pull origin master
```

### Check for Updates

```bash
# Check if remote has new changes
git fetch origin
git status

# If behind, pull updates
git pull origin master
```

---

## 📁 Important Files Reference

| File/Folder | Purpose |
|-------------|---------|
| `resources/variables.robot` | Device & credentials configuration |
| `resources/keywords.robot` | Reusable mobile automation keywords |
| `tests/E2EDhyankendra.robot` | Dhyankendra E2E test cases |
| `tests/E2ERegistration.robot` | Registration E2E test cases |
| `pages/DhyankendraPage.robot` | Dhyankendra page locators & keywords |
| `pages/E2ERegistrationPage.robot` | Registration page locators |
| `results/` | Test execution reports (generated after run) |
| `send_email.py` | Email report automation |

---

## 🎯 Quick Start Checklist

- [ ] Install Python 3.12+
- [ ] Install Node.js v20.x LTS
- [ ] Install Java JDK 11+
- [ ] Install Android SDK & set ANDROID_HOME
- [ ] Install Appium + UIAutomator2 driver
- [ ] Clone repository from GitHub
- [ ] Install Python dependencies (robotframework, etc.)
- [ ] Connect Android device via USB
- [ ] Enable USB debugging on device
- [ ] Verify device with `adb devices`
- [ ] Install Gurutattva app on device
- [ ] Start Appium server
- [ ] Run first test
- [ ] Check test results in `results/report.html`

---

## 💡 Pro Tips

1. **Keep Appium Server Running:** Don't restart between test runs for faster execution

2. **Use Auto-detection:** Set `${DEVICE_NAME}` to `${EMPTY}` in variables.robot for flexibility

3. **Disable Animations:** On Android device:
   - Settings → Developer Options
   - Window animation scale → OFF
   - Transition animation scale → OFF
   - Animator duration scale → OFF

4. **Check Logs First:** When tests fail, check:
   - `results/log.html` (Robot Framework logs)
   - Appium server console output
   - Device logs: `adb logcat`

5. **Run Specific Tests:** Use `--test` or `--include` flags to run only what you need

6. **Share Screenshots:** Test failures automatically capture screenshots in `results/Screenshot/`

---

## 🆘 Need Help?

1. **Check this guide first** - Most issues covered in Troubleshooting
2. **Check existing documentation:**
   - `MOBILE_TESTING_SETUP_GUIDE.md`
   - `FIX_NODE_AND_RUN_TESTS.md`
3. **Check device connection:** `adb devices` should always work
4. **Check Appium logs:** Look for error messages in server console
5. **Ask team:** Share error messages and screenshots

---

## 📞 Support Contacts

- **Repository:** https://github.com/Sushrut-01/gurutattva-e2e-automation
- **Issues:** Create GitHub issue with error details
- **Team Lead:** Sushrut (sushrut.nistane@rysun.com)

---

**Last Updated:** January 16, 2026
**Document Version:** 2.0
**Maintained By:** Automation Team

---

## ✅ Ready to Start!

Once you complete the checklist above, you're ready to run tests! Start with:

```bash
# Terminal 1: Start Appium
appium server --address 0.0.0.0 --port 4723

# Terminal 2: Run a simple test
cd D:\gurutattva-e2e-automation
python -m robot --test "Login from Mobile as Sadhak*" tests/E2EDhyankendra.robot
```

Good luck! 🚀
