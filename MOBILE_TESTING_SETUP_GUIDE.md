# Mobile E2E Testing Setup Guide - Gurutattva

Complete guide for running mobile automation tests on Android devices.

---

## ⚠️ IMPORTANT: Node.js Compatibility Issue

**Current Blocker:** Node.js v22.x has ESM module conflicts with Appium.

**Solution:** Use Node.js v20.x LTS (Recommended) or v18.x LTS

### Fix Node.js Version

1. **Download Node.js v20 LTS:**
   - Go to https://nodejs.org/en/
   - Download Node.js v20.x LTS (NOT v22.x)
   - Install it (this will replace your current Node.js)

2. **Verify Installation:**
   ```bash
   node -v      # Should show v20.x.x
   npm -v       # Should show 10.x.x or higher
   ```

3. **Reinstall Appium with Correct Node.js:**
   ```bash
   npm uninstall -g appium
   npm install -g appium@latest
   npm install -g appium-uiautomator2-driver
   ```

4. **Verify Appium Works:**
   ```bash
   appium -v    # Should show 3.x.x without errors
   appium driver list
   ```

---

## Quick Start - Run Mobile Tests

### Prerequisites

✅ **Before running tests, ensure:**

1. **Node.js v20.x installed**
   ```bash
   node -v     # Must be v20.x.x
   ```

2. **Appium installed and working**
   ```bash
   appium -v   # Should output version without errors
   ```

3. **Android device connected**
   ```bash
   adb devices # Should show your device as "device"
   ```

4. **Gurutattva app installed on device**
   ```bash
   adb shell pm list packages | grep gurutattva
   ```

### Running Tests

```bash
# 1. Start Appium server
appium server --address 0.0.0.0 --port 4723 --log-level info

# 2. In another terminal, navigate to project
cd D:\gurutattva-e2e-automation

# 3. Run mobile test
python -m robot --test "Login from Mobile as Sadhak*" tests/E2EDhyankendra.robot

# Or run all Dhyankendra mobile tests
python -m robot tests/E2EDhyankendra.robot
```

---

## Device Configuration

### Configuration File
Location: `resources/variables.robot`

Current setting:
```robot
${DEVICE_NAME}       ${EMPTY}    # Auto-detect first available device
${REMOTE_URL}        http://localhost:4723
```

### Supported Device Setups

#### Option 1: USB Connected Device (Current)
**Requirements:**
- Android phone with USB cable
- USB debugging enabled (Settings → Developer Options → USB Debugging)
- Appium running locally on port 4723

**Configuration:**
```robot
${DEVICE_NAME}       ${EMPTY}    # Auto-detect OR your device ID
${REMOTE_URL}        http://localhost:4723
```

**Verify device:**
```bash
adb devices
# Output:
# List of devices attached
# RZCY31K3MHL    device
```

#### Option 2: Android Studio Emulator
**Requirements:**
- Android Studio with emulator installed
- Emulator running (e.g., Pixel_4_API_33)
- Appium running locally

**Configuration:**
```robot
${DEVICE_NAME}       emulator-5554
${REMOTE_URL}        http://localhost:4723
```

**Start emulator:**
```bash
emulator -avd Pixel_4_API_33 -gpu on
```

#### Option 3: Physical Device via Network
**Requirements:**
- Device on same WiFi network
- USB debugging enabled
- Network ADB enabled

**Setup:**
```bash
# 1. Connect device via USB first
adb devices

# 2. Enable network ADB on device
adb -s DEVICE_ID tcpip 5555

# 3. Find device's IP address
adb -s DEVICE_ID shell getprop dhcp.wlan0.ipaddress
# Output: 192.168.1.5

# 4. Disconnect USB and connect via network
adb disconnect
adb connect 192.168.1.5:5555
```

**Configuration:**
```robot
${DEVICE_NAME}       192.168.1.5:5555
${REMOTE_URL}        http://localhost:4723
```

---

## Troubleshooting

### Issue 1: "Node.js ESM Module Error"
**Error:** `Error [ERR_REQUIRE_ESM]: require() of ES Module uuid...`

**Solution:**
- Install Node.js v20.x LTS (NOT v22.x)
- See "⚠️ IMPORTANT: Node.js Compatibility Issue" section above

### Issue 2: "Could not find a connected Android device"
**Error:** `WebDriverException: Could not find a connected Android device in 20000ms`

**Solutions:**
1. Verify device is connected:
   ```bash
   adb devices
   ```

2. Verify USB debugging is enabled on device

3. Restart ADB:
   ```bash
   adb kill-server
   adb start-server
   adb devices
   ```

4. Restart Appium server

### Issue 3: "Appium port already in use"
**Error:** `listen EADDRINUSE: address already in use 0.0.0.0:4723`

**Solution:**
```bash
# Kill process using port 4723
# Windows: Find process in Task Manager or use:
netstat -ano | findstr 4723
taskkill /PID <PID> /F

# macOS/Linux:
lsof -i :4723
kill -9 <PID>

# Then restart Appium
appium server --address 0.0.0.0 --port 4723
```

### Issue 4: "App won't install on device"
**Error:** App installation fails

**Solutions:**
```bash
# Verify APK path
ls -la D:/Downloads/Dhyan_16_12_2025.apk

# Manually install APK
adb install -r D:/Downloads/Dhyan_16_12_2025.apk

# Verify app is installed
adb shell pm list packages | grep gurutattva
# Output: package:com.org.gurutattva.app
```

### Issue 5: "Test passes setup but fails during execution"
**Possible causes:**
- App crashed (check app logs)
- Element not found (locators changed)
- Network issue
- Device out of memory

**Debug steps:**
```bash
# Check app logs
adb logcat | grep gurutattva

# Clear app data and reinstall
adb uninstall com.org.gurutattva.app
adb install -r D:/Downloads/Dhyan_16_12_2025.apk

# Restart device
adb reboot
```

---

## Mobile Test Cases

### Available E2E Test Suites

**E2EDhyankendra.robot** - Dhyankendra feature tests
- Test 1: Login from Mobile as Sadhak and register for Dhyankendra
- Test 2: Sanchalak edits - Rejection flow
- Test 3: Sanchalak edits - Approval flow

**E2ERegistration.robot** - User registration tests
- TC07: Quick registration verification
- TC08: Registration validation
- TC09: Access restrictions
- TC10: Member upgrade
- And more...

### Running Specific Tests

```bash
# Run single test by name
python -m robot --test "Login from Mobile as Sadhak*" tests/E2EDhyankendra.robot

# Run tests by tag
python -m robot --include mobile tests/

# Run with verbose output
python -m robot -v LOGLEVEL:DEBUG tests/E2EDhyankendra.robot

# Run with custom device ID
python -m robot --variable DEVICE_NAME:192.168.1.5:5555 tests/E2EDhyankendra.robot
```

---

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│ Robot Framework Tests (Python)                          │
│ - E2EDhyankendra.robot                                  │
│ - E2ERegistration.robot                                 │
└──────────────┬──────────────────────────────────────────┘
               │
               ↓
┌─────────────────────────────────────────────────────────┐
│ AppiumLibrary (Robot Framework Mobile Driver)           │
└──────────────┬──────────────────────────────────────────┘
               │
               ↓
┌─────────────────────────────────────────────────────────┐
│ Appium Server (localhost:4723)                          │
│ - UIAutomator2 Driver v6.1.1                            │
└──────────────┬──────────────────────────────────────────┘
               │
               ↓
┌─────────────────────────────────────────────────────────┐
│ ADB (Android Debug Bridge)                              │
│ - Communicates with Android device                      │
└──────────────┬──────────────────────────────────────────┘
               │
               ↓
┌─────────────────────────────────────────────────────────┐
│ Android Device / Emulator                               │
│ - Gurutattva App (com.org.gurutattva.app)              │
└─────────────────────────────────────────────────────────┘
```

---

## Files Reference

| File | Purpose |
|------|---------|
| `resources/variables.robot` | Device and Appium configuration |
| `resources/keywords.robot` | Mobile automation keywords |
| `resources/test_setup_teardown.robot` | Test lifecycle management |
| `tests/E2EDhyankendra.robot` | Dhyankendra E2E tests |
| `tests/E2ERegistration.robot` | Registration E2E tests |
| `pages/E2ERegistrationPage.robot` | Registration page locators |
| `pages/DhyankendraPage.robot` | Dhyankendra page locators |

---

## Environment Variables

```bash
# Appium Server Configuration
APPIUM_HOST=0.0.0.0
APPIUM_PORT=4723
LOG_LEVEL=info

# Android Configuration
ANDROID_HOME=/path/to/android-sdk
JAVA_HOME=/path/to/java

# Device Capabilities (set in variables.robot)
PLATFORM_NAME=Android
DEVICE_NAME=<device-id-or-empty>
APP_PACKAGE=com.org.gurutattva.app
APP_ACTIVITY=com.example.gurutattva_flutter_app.MainActivity
AUTOMATION_NAME=UiAutomator2
```

---

## Performance Tips

1. **Faster Test Execution:**
   - Use `${EMPTY}` for DEVICE_NAME to auto-detect (faster)
   - Run tests in parallel (if device supports it)
   - Use headless mode where applicable

2. **Stable Automation:**
   - Keep device connected via USB (more stable than network)
   - Ensure sufficient device storage (>100MB free)
   - Disable animations on device (Developer Options)

3. **Better Debugging:**
   - Enable verbose logging: `--loglevel DEBUG`
   - Keep screenshots of failures
   - Monitor device logs: `adb logcat`

---

## Support & Issues

If you encounter issues:

1. **Check Node.js version first** - This is the #1 cause of failures
2. **Verify device connection** - Run `adb devices`
3. **Check Appium logs** - Start Appium with `--log-level debug`
4. **Review test logs** - Check `results/log.html`
5. **Check device logs** - Run `adb logcat`

---

## Next Steps

1. ✅ **Install Node.js v20.x LTS**
2. ✅ **Install Appium with UIAutomator2 driver**
3. ✅ **Connect your Android device via USB**
4. ✅ **Run first mobile test**
5. ✅ **Check test results in `results/report.html`**

---

## Additional Resources

- [Appium Documentation](https://appium.io/docs/en/latest/)
- [Robot Framework Documentation](https://robotframework.org/)
- [Android Debug Bridge (ADB)](https://developer.android.com/tools/adb)
- [UIAutomator2 Driver](https://github.com/appium/appium-uiautomator2-driver)
