*** Variables ***
${REMOTE_URL}        http://localhost:4723/wd/hub

# ═══════════════════════════════════════════════════════════════════
# E2E REGISTRATION TEST SUITE - MOBILE NUMBER & OTP CONFIGURATION
# ═══════════════════════════════════════════════════════════════════
# IMPORTANT: This suite runs SEQUENTIALLY with phone number progression
#
# Phone Number Strategy:
#   - Primary (TC07, TC08, TC09, TC10): 9999999999
#   - Tertiary (Community Reg, TC14): 9999999911
#   - All test-only numbers (never used in real world)
#
# OTP Strategy:
#   - Single hardcoded OTP: 999999
#   - Used for ALL test mobile registrations
#   - Automatically entered via keypad presses
# ═══════════════════════════════════════════════════════════════════

# Primary Test Phone (Used by TC07, TC08, TC09, TC10)
${PRIMARY_PHONE}                          9999999999
${PRIMARY_PHONE_OTP}                      999999

# Secondary Test Phone (Used by TC10 - Becomes Member upgrade)
# Note: Same as PRIMARY for upgrade scenario
${SECONDARY_PHONE}                        9999999999
${SECONDARY_PHONE_OTP}                    999999

# Tertiary Test Phone (Used by Community Registration, TC14)
${TERTIARY_PHONE}                         9999999911
${TERTIARY_PHONE_OTP}                     999999

# Universal Test OTP (Same for ALL mobile registrations)
${UNIVERSAL_TEST_OTP}                     999999

# Community Registration Test Data
${COMMUNITY_EMAIL}                        qa.community@gurutattva.com

# Quick Registration Test Data
${QUICK_REGISTRATION_EMAIL}               qa.user@gurutattva.com

# ═══════════════════════════════════════════════════════════════════
# WEB/CMS CREDENTIALS
# ═══════════════════════════════════════════════════════════════════
# Super Admin Credentials (Used in TC07 CMS verification & Community Reg CMS)
${SUPER_ADMIN_EMAIL}                      sushrut.nistane@rysun.com
${SUPER_ADMIN_PASSWORD}                   Sharu@051220

# Sanchalak Credentials (Used in Dhyankendra tests only - NOT in E2ERegistration)
${SANCHALAK_EMAIL}                        patilvaishub@gmail.com
${SANCHALAK_PASSWORD}                     Lavanya@21

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
