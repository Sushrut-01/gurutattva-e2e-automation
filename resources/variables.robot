*** Variables ***
# ===== APPIUM SERVER CONFIGURATION =====
# For local testing: http://localhost:4723
# For Kubernetes/Rancher: http://appium-service.gurutattva-appium.svc.cluster.local:4723
# For Docker Compose: http://appium:4723
${REMOTE_URL}        http://localhost:4723

# ===== ANDROID DEVICE CONFIGURATION =====
# Use ONE of the following device names:
# - emulator-5554            : Android Studio Emulator on same machine (DEFAULT - GUI desktop)
# - RZCY31K3MHL              : Physical Android device (physical device testing)
# - <device-ip>:5555         : Physical device via ADB over network
# - ${EMPTY}                 : Auto-detect first available device
${PLATFORM_NAME}     Android
${DEVICE_NAME}       emulator-5554
${APP_PACKAGE}       com.org.gurutattva.app
${APP_ACTIVITY}      com.example.gurutattva_flutter_app.MainActivity
${AUTOMATION_NAME}   UiAutomator2

# Critical Stability Capabilities
${NO_RESET}                         true
${AUTO_RESET_ENABLED}               ${False}
${SKIP_SERVER_INSTALLATION}         ${True}
${AUTO_GRANT_PERMISSIONS}           ${True}
${DONT_STOP_APP_ON_RESET}           ${True}

# Timeout Capabilities (in milliseconds)
${UIAUTOMATOR2_SERVER_LAUNCH_TIMEOUT}    60000
${UIAUTOMATOR2_SERVER_INSTALL_TIMEOUT}   60000
${ADB_EXEC_TIMEOUT}                      40000
${NEW_COMMAND_TIMEOUT}                   600000

# Additional Stability Flags
${APP_WAIT_DURATION}                10000
${APP_WAIT_ACTIVITY}                com.example.gurutattva_flutter_app.MainActivity
${SYSTEM_PORT}                      8202
${CONNECT_HARDWARE_KEYBOARD}        ${True}
${NO_SIGN}                          ${True}

# ===== DEVICE SETUP GUIDE =====
# To switch between different testing setups, update DEVICE_NAME and REMOTE_URL:
#
# SETUP 1: PHYSICAL ANDROID DEVICE (USB Connected)
#   Requirements:
#   - Android phone connected via USB cable
#   - USB debugging enabled on phone (Settings → Developer Options → USB Debugging)
#   - Appium running locally or in Docker
#   Changes:
#     ${DEVICE_NAME} = RZCY31K3MHL        (your device ID - find via: adb devices)
#     ${REMOTE_URL} = http://localhost:4723
#   Start Appium: appium server --address 0.0.0.0 --port 4723 --log-level info
#
# SETUP 2: ANDROID STUDIO EMULATOR (Virtual Device)
#   Requirements:
#   - Android Studio installed with emulator
#   - Emulator running (AVD: Pixel_4_API_33 or similar)
#   - Appium running locally
#   Changes:
#     ${DEVICE_NAME} = emulator-5554       (standard Android emulator ID)
#     ${REMOTE_URL} = http://localhost:4723
#   Start Emulator: emulator -avd Pixel_4_API_33 -gpu on
#   Start Appium:   appium server --address 0.0.0.0 --port 4723 --log-level info
#
# SETUP 3: PHYSICAL DEVICE VIA NETWORK (ADB over TCP)
#   Requirements:
#   - Physical Android device on same network
#   - USB debugging enabled
#   - ADB over network enabled: adb -s <device-id> tcpip 5555
#   - Appium running locally or in Docker
#   Changes:
#     ${DEVICE_NAME} = <device-ip>:5555   (e.g., 192.168.1.100:5555)
#     ${REMOTE_URL} = http://localhost:4723
#   Steps:
#     1. Connect device via USB first: adb devices
#     2. Enable network ADB: adb -s RZCY31K3MHL tcpip 5555
#     3. Disconnect USB cable
#     4. Connect via network: adb connect <device-ip>:5555
#     5. Start Appium and run tests
#
# SETUP 4: KUBERNETES/RANCHER DEPLOYMENT
#   Requirements:
#   - Kubernetes cluster with Appium deployed
#   - Physical device or emulator connected to cluster
#   Changes:
#     ${REMOTE_URL} = http://appium-service.gurutattva-appium.svc.cluster.local:4723
#     ${DEVICE_NAME} = <device-id>
#   Note: Requires port-forwarding or external IP to reach Appium service
#   Port forward: kubectl port-forward -n gurutattva-appium svc/appium-service 4723:4723
