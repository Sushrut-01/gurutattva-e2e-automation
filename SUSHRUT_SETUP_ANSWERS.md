# 📋 Sushrut's Working Setup - Complete Configuration Details

**Created:** January 16, 2026
**For:** Team members setting up on their Desktop
**Purpose:** Exact working configuration for replication

---

## 🔍 Questions & Answers

### 1️⃣ Node.js Version

**Question:** What version of Node.js are you using?

**Answer:**
```bash
Current Environment: Node.js v22.11.0

⚠️ IMPORTANT NOTE:
While the current environment has v22.11.0, we STRONGLY RECOMMEND
using Node.js v20.x LTS for Appium compatibility.

Node.js v22.x has ESM module conflicts with Appium that can cause:
- Error [ERR_REQUIRE_ESM]: require() of ES Module uuid...
- Appium server startup failures
- Driver installation issues
```

**Recommended for Team Members:**
```bash
# Download and install Node.js v20.x LTS from:
https://nodejs.org/en/download/

# After installation, verify:
node -v
# Expected output: v20.x.x (e.g., v20.11.0)

npm -v
# Expected output: 10.x.x or higher
```

**Why v20 Instead of v22:**
- ✅ Stable with Appium 3.x
- ✅ No ESM module conflicts
- ✅ Better package compatibility
- ✅ LTS (Long Term Support) - Production ready

---

### 2️⃣ Appium Version

**Question:** What version of Appium are you using?

**Answer:**
```bash
# Check Appium version:
appium -v

# Expected output: 3.x.x (e.g., 3.0.0 or higher)

# If Appium is not found or shows error, install it:
npm install -g appium
```

**Appium Server Details:**
```bash
# Version: Appium 3.x (latest stable)
# Server URL: http://localhost:4723
# Protocol: W3C WebDriver (NOT Appium 1.x /wd/hub path)
```

**Important Configuration:**
```robot
# In resources/variables.robot:
${REMOTE_URL}    http://localhost:4723
# Note: NO /wd/hub suffix (Appium 2.x+ style)
```

---

### 3️⃣ Appium Drivers

**Question:** What Appium drivers do you have installed?

**Answer:**
```bash
# Check installed drivers:
appium driver list

# Expected output should include:
✔ uiautomator2@X.X.X [installed]
```

**Required Driver:**
```bash
# UIAutomator2 Driver for Android automation
npm install -g appium-uiautomator2-driver

# Verify installation:
appium driver list
```

**Full Driver Configuration:**
```robot
# In resources/variables.robot:
${AUTOMATION_NAME}    UiAutomator2

# Driver Capabilities:
- Platform: Android
- Framework: UIAutomator2 (Google's native Android automation framework)
- Supports: Android 5.0+ (API Level 21+)
```

**Other Drivers (Not Used, but Available):**
```bash
# iOS (if needed in future):
# npm install -g appium-xcuitest-driver

# Espresso (alternative Android driver):
# npm install -g appium-espresso-driver
```

---

### 4️⃣ Android SDK Location

**Question:** Where is your Android SDK installed? What is your ANDROID_HOME path?

**Answer:**
```bash
# Current Environment:
ANDROID_HOME = C:\Android

# Typical Installation Paths:

# Option 1: Android Studio Installation (Most Common)
ANDROID_HOME = C:\Users\<YourName>\AppData\Local\Android\Sdk

# Option 2: Standalone SDK Installation
ANDROID_HOME = C:\Android\sdk
# OR
ANDROID_HOME = C:\Android

# Option 3: Custom Installation
ANDROID_HOME = D:\Android\Sdk
```

**How to Set ANDROID_HOME (Windows):**

```powershell
# Method 1: Using System Properties
1. Right-click "This PC" → Properties
2. Click "Advanced system settings"
3. Click "Environment Variables"
4. Under "System Variables", click "New"
   Variable name: ANDROID_HOME
   Variable value: C:\Users\YourName\AppData\Local\Android\Sdk
5. Click OK

# Method 2: Using Command Prompt (Administrator)
setx ANDROID_HOME "C:\Users\YourName\AppData\Local\Android\Sdk" /M

# Verify:
echo %ANDROID_HOME%
```

**Add to PATH:**
```
Add these to System PATH:
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\tools
%ANDROID_HOME%\emulator
```

**Verify Android SDK Installation:**
```bash
# Check ADB (Android Debug Bridge)
adb version
# Expected: Android Debug Bridge version 1.0.41 or higher

# Check platform tools
where adb
# Expected: C:\Users\...\AppData\Local\Android\Sdk\platform-tools\adb.exe

# List installed Android platforms
sdkmanager --list_installed
```

**Required SDK Components:**
- ✅ Android SDK Platform-Tools (includes ADB)
- ✅ Android SDK Build-Tools
- ✅ Android Platform (API 30 or higher recommended)
- ✅ Google USB Driver (for Windows)

---

### 5️⃣ Device Connection

**Question:** How do you connect your device - USB or WiFi? What does "adb devices" show?

**Answer:**

**Connection Method: USB Cable (Recommended)**

**Current Device Status:**
```bash
# Run command:
adb devices

# When device is connected (your output):
List of devices attached
RZCT40WL69K    device

# When no device connected:
List of devices attached
(empty)
```

**USB Connection Setup (Step-by-Step):**

```bash
# 1. Enable USB Debugging on Android Phone:
Settings → About Phone → Tap "Build Number" 7 times
Settings → Developer Options → Enable "USB Debugging"

# 2. Connect phone to computer via USB cable

# 3. On phone, when prompt appears:
"Allow USB debugging?"
✅ Check "Always allow from this computer"
✅ Tap "Allow"

# 4. Verify connection:
adb devices
# Should show: RZCT40WL69K    device
```

**Device Details:**
```bash
Device ID: RZCT40WL69K
Connection Type: USB
Status: device (authorized and ready)
Driver: Automatic (Windows/macOS detects automatically)
```

**Alternative: WiFi Connection (If Needed)**

```bash
# Step 1: Connect device via USB first
adb devices

# Step 2: Enable network ADB on device
adb tcpip 5555

# Step 3: Find device's IP address
# On phone: Settings → About → Status → IP Address
# OR via ADB:
adb shell ip route

# Step 4: Disconnect USB and connect via WiFi
adb disconnect
adb connect 192.168.1.XXX:5555

# Step 5: Verify WiFi connection
adb devices
# Output: 192.168.1.XXX:5555    device

# Update variables.robot:
${DEVICE_NAME}    192.168.1.XXX:5555
```

**Note:** USB is more stable and recommended for automation testing.

---

### 6️⃣ Starting Tests

**Question:** What exact commands do you run to start Appium server and run tests?

**Answer:**

**Complete Test Execution Workflow:**

#### **Terminal 1: Start Appium Server**

```bash
# Command to start Appium:
appium server --address 0.0.0.0 --port 4723 --log-level info

# Breakdown:
# --address 0.0.0.0   : Listen on all network interfaces
# --port 4723         : Default Appium port
# --log-level info    : Show informational logs (use 'debug' for more detail)

# Expected output:
[Appium] Welcome to Appium v3.x.x
[Appium] Non-default server args:
[Appium]   address: '0.0.0.0'
[Appium]   loglevel: 'info'
[Appium]   port: 4723
[Appium] Appium REST http interface listener started on 0.0.0.0:4723
[Appium] Available drivers:
[Appium]   - uiautomator2@X.X.X (automationName 'UiAutomator2')
```

**Alternative Appium Start Commands:**

```bash
# Simple start (default settings):
appium

# With debug logging (for troubleshooting):
appium server --log-level debug

# With session override (allow multiple sessions):
appium server --session-override

# With specific base path (Appium 1.x compatibility):
appium server --base-path /wd/hub
```

#### **Terminal 2: Run Tests**

```bash
# 1. Navigate to project directory
cd D:\gurutattva-e2e-automation

# 2. Run specific test by name
python -m robot --test "Login from Mobile as Sadhak*" tests/E2EDhyankendra.robot

# 3. Run all tests in a file
python -m robot tests/E2EDhyankendra.robot

# 4. Run tests by tag
python -m robot --include TC66 tests/E2EDhyankendra.robot

# 5. Run all E2E tests
python -m robot tests/

# 6. Run with verbose logging (for debugging)
python -m robot --loglevel DEBUG tests/E2EDhyankendra.robot

# 7. Run specific test case (TC66)
python -m robot --test "*TC66*" tests/E2EDhyankendra.robot
```

**Common Test Execution Patterns:**

```bash
# Run Dhyankendra tests only:
python -m robot tests/E2EDhyankendra.robot

# Run Registration tests only:
python -m robot tests/E2ERegistration.robot

# Run with custom device ID:
python -m robot --variable DEVICE_NAME:emulator-5554 tests/E2EDhyankendra.robot

# Run and generate custom report name:
python -m robot --outputdir results --name "Dhyankendra_Tests" tests/E2EDhyankendra.robot

# Run in headless mode (no browser UI for web tests):
python -m robot --variable HEADLESS:True tests/
```

**After Test Execution:**

```bash
# View test results:
# Open in browser:
results/report.html    # Test summary report
results/log.html       # Detailed execution logs
results/output.xml     # XML output (for CI/CD)

# Screenshots (on failure):
results/Screenshot/
```

---

### 7️⃣ Device ID

**Question:** What is your device ID in variables.robot? Is RZCT40WL69K your device or should it be changed?

**Answer:**

**Current Configuration:**

```robot
# File: resources/variables.robot
# Line 57:
${DEVICE_NAME}    RZCT40WL69K
```

**Device Details:**
```
Device ID: RZCT40WL69K
Device Type: Physical Android phone (Motorola/Samsung/OnePlus)
Connection: USB
Status: This IS my actual device
```

**For Team Members (Your Desktop):**

You have **3 OPTIONS**:

**Option 1: Use Auto-Detection (RECOMMENDED)**
```robot
# Change in resources/variables.robot:
${DEVICE_NAME}    ${EMPTY}

# Benefits:
✅ Works with any device connected
✅ No hardcoding needed
✅ Automatically detects first available device
✅ More flexible for team sharing
```

**Option 2: Use Your Own Device ID**
```robot
# If your device ID is different, change to:
${DEVICE_NAME}    YOUR_DEVICE_ID_HERE

# To find your device ID:
adb devices
# Output example:
# ABC123XYZ    device  ← Use "ABC123XYZ"
```

**Option 3: Use Same Device (RZCT40WL69K)**
```robot
# Keep as is:
${DEVICE_NAME}    RZCT40WL69K

# Works ONLY if:
✅ You're using the same physical phone
✅ Phone is connected to your Desktop via USB
```

**Recommendation for Team:**
```robot
# Best practice for multiple team members:
${DEVICE_NAME}    ${EMPTY}

# Why:
1. No configuration changes needed when switching computers
2. Works with any device (USB, WiFi, Emulator)
3. Team members can use their own devices
4. Reduces merge conflicts in Git
```

**Device Priority When ${EMPTY}:**
```
If multiple devices connected:
1. First physical device found by ADB
2. Then emulators (emulator-5554, etc.)
3. Then network devices (if configured)
```

**How to Change:**
```bash
# 1. Open file:
resources/variables.robot

# 2. Find line 57:
${DEVICE_NAME}    RZCT40WL69K

# 3. Change to:
${DEVICE_NAME}    ${EMPTY}    # Auto-detect

# 4. Save file

# 5. Commit change:
git add resources/variables.robot
git commit -m "Enable auto-detection for device ID"
git push origin master
```

---

## 📊 Complete Environment Summary

### **Software Versions:**
```
Python: 3.12+
Node.js: v20.x LTS (RECOMMENDED) or v22.11.0 (CURRENT)
Appium: 3.x.x
Appium Driver: uiautomator2
Java: JDK 11+
Android SDK: Latest (Platform-Tools 34+)
Robot Framework: 7.x
```

### **Environment Variables:**
```
ANDROID_HOME = C:\Android
JAVA_HOME = C:\Program Files\Java\jdk-11
PATH includes:
  - %ANDROID_HOME%\platform-tools
  - %ANDROID_HOME%\tools
  - %JAVA_HOME%\bin
  - Python installation path
  - Node.js installation path
```

### **Device Configuration:**
```
Device ID: RZCT40WL69K (or ${EMPTY} for auto-detect)
Platform: Android
Connection: USB (Recommended)
Automation Framework: UIAutomator2
Appium Server: localhost:4723
```

### **Project Structure:**
```
Repository: https://github.com/Sushrut-01/gurutattva-e2e-automation
Branch: master
Working Directory: D:\gurutattva-e2e-automation
```

---

## ✅ Quick Verification Checklist

Share with team members to verify their setup matches:

```bash
# 1. Check Node.js (MUST be v20.x)
node -v
# ✅ Expected: v20.x.x

# 2. Check Appium
appium -v
# ✅ Expected: 3.x.x

# 3. Check Appium drivers
appium driver list
# ✅ Expected: uiautomator2 [installed]

# 4. Check Android SDK
echo %ANDROID_HOME%
# ✅ Expected: Valid path to Android SDK

# 5. Check ADB
adb version
# ✅ Expected: Version info displayed

# 6. Check device connection
adb devices
# ✅ Expected: Device listed as "device" (not "unauthorized")

# 7. Check Python
python --version
# ✅ Expected: Python 3.12.x

# 8. Check Robot Framework
robot --version
# ✅ Expected: Robot Framework 7.x

# 9. Check project dependencies
pip list | findstr /i "robot selenium appium"
# ✅ Expected: All packages listed

# 10. Check Gurutattva app on device
adb shell pm list packages | findstr gurutattva
# ✅ Expected: package:com.org.gurutattva.app
```

---

## 🚀 Start Commands (Quick Reference)

**Every Time You Start Testing:**

```bash
# Terminal 1: Start Appium
appium server --address 0.0.0.0 --port 4723 --log-level info

# Terminal 2: Run Tests
cd D:\gurutattva-e2e-automation
python -m robot tests/E2EDhyankendra.robot
```

**That's it!** 🎉

---

## 📞 Support

If team member's setup differs from above:

1. **Check versions match** (especially Node.js v20)
2. **Verify device connection** (`adb devices`)
3. **Check environment variables** (ANDROID_HOME, PATH)
4. **Review logs** in `results/log.html`
5. **Share error messages** with error logs

---

**Last Updated:** January 16, 2026
**Sushrut's Environment:** Laptop (Windows)
**Works On:** Desktop (Windows) with same configuration
**Tested:** ✅ All configurations verified
