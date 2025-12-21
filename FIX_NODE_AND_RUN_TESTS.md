# Fix Node.js Version and Run Mobile Tests

## Step 1: Downgrade Node.js to v20.x

### Windows:
1. **Uninstall current Node.js:**
   - Go to Control Panel → Programs → Programs and Features
   - Find "Node.js" and click Uninstall
   - Follow the uninstaller prompts

2. **Download Node.js v20 LTS:**
   - Go to https://nodejs.org/en/
   - Click on "20.x LTS" (NOT 22.x)
   - Download the Windows Installer (.msi)
   - Run the installer and follow prompts
   - Use default settings

3. **Verify Installation:**
   ```bash
   # Open PowerShell/Command Prompt and run:
   node -v
   # Should output: v20.x.x (e.g., v20.12.0)

   npm -v
   # Should output: 10.x.x or higher
   ```

---

## Step 2: Install Appium with UIAutomator2 Driver

**After Node.js v20 is installed, run:**

```bash
# Open PowerShell as Administrator and run:

# 1. Clean install Appium
npm uninstall -g appium
npm install -g appium@latest

# 2. Install UIAutomator2 driver
npm install -g appium-uiautomator2-driver

# 3. Verify Appium works (should show version without errors)
appium -v

# 4. List available drivers (should show uiautomator2 as available)
appium driver list
```

---

## Step 3: Verify Android Device Connection

```bash
# Check device is connected
adb devices

# Output should show:
# List of devices attached
# RZCY31K3MHL    device

# If not showing, enable USB debugging on your phone:
# Settings → About Phone → Build Number (tap 7 times)
# Settings → Developer Options → USB Debugging (toggle ON)
```

---

## Step 4: Run Mobile Test

```bash
# Open PowerShell and navigate to project
cd D:\gurutattva-e2e-automation

# Terminal 1: Start Appium server
appium server --address 0.0.0.0 --port 4723 --log-level info

# Terminal 2: Run test (in separate terminal while Appium runs)
python -m robot --test "Login from Mobile as Sadhak*" tests/E2EDhyankendra.robot
```

---

## Expected Output

### When Appium Starts Successfully:
```
[Appium] Welcome to Appium v3.1.1
[Appium] Available drivers:
[Appium]   - uiautomator2@6.1.1 (automationName 'UiAutomator2')
[Appium] Appium REST http interface listener started on http://0.0.0.0:4723
```

### When Test Runs Successfully:
```
E2EDhyankendra
==============================================================================
Login from Mobile as Sadhak and register for Dhyankendra...
===== Opening Gurutattva App =====
... (test steps executing) ...
===== Test Passed =====
E2EDhyankendra | PASS | 1 test passed
```

---

## Troubleshooting During Setup

### Issue: "node: command not found"
- **Solution:** Node.js not installed properly. Download and install Node.js v20 from https://nodejs.org/en/

### Issue: "npm ERR! code EBADENGINE"
- **Solution:** Make sure you installed Node.js v20.x, not v22.x

### Issue: "appium: command not found"
- **Solution:** Appium not installed globally. Run: `npm install -g appium@latest`

### Issue: "adb: command not found"
- **Solution:** Android SDK tools not in PATH. Install Android Studio or add SDK to PATH

### Issue: "RZCY31K3MHL not showing in adb devices"
- **Solution:** USB debugging not enabled on phone. Go to Settings → Developer Options → USB Debugging

---

## Quick Checklist Before Running Tests

- [ ] Node.js v20.x installed (`node -v` shows v20.x.x)
- [ ] Appium installed (`appium -v` works without errors)
- [ ] UIAutomator2 driver available (`appium driver list` shows it)
- [ ] Android device connected (`adb devices` shows your device)
- [ ] USB debugging enabled on phone
- [ ] Gurutattva app installed on phone

---

## Once Tests Pass

After you've successfully run the tests and they pass, you can commit:

```bash
cd D:\gurutattva-e2e-automation

git add -A
git commit -m "Complete mobile testing setup with Node.js v20 fix and comprehensive guides"
git push
```

---

## Need Help?

If tests still fail after following these steps:
1. Check `results/log.html` for detailed test logs
2. Check Appium terminal output for errors
3. Run `adb logcat` to see device logs
4. Verify device is still connected: `adb devices`
