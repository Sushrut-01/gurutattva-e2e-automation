*** Variables ***
${REMOTE_URL}        http://localhost:4723/wd/hub

# Android Device Configuration
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
