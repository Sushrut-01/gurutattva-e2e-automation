*** Settings ***
Resource   libraries.robot
Resource   keywords.robot
Resource   ../resources/simple_email_notifications.robot
Library   DateTime
Library   String
Library   Process

*** Variables ***
${SCREENSHOT_DIR}    ${EXECDIR}/results/Screenshot

*** Keywords ***
Test Setup
    [Documentation]    Setup for each test case - ensures clean state
    Log To Console    ===== Starting Test Setup =====
    Web.Register Keyword To Run On Failure    No Operation
    Mobile.Register Keyword To Run On Failure    No Operation
    # Kill any existing app instances
    Run Keyword And Ignore Error    Mobile Close Application
    Sleep    2s
    Log To Console    ===== Test Setup Completed =====

Test Teardown
    [Documentation]    Teardown for each test case - ensures app is closed even on failure
    Log To Console    ===== Starting Test Teardown =====
    # Capture screenshot on failure using explicit library calls to avoid conflicts
    Run Keyword If Test Failed    Take Screenshot On Failure    ${TEST NAME}
    
    # Always try to close the app, even if test failed
    Run Keyword And Ignore Error    Close Gurutattva App
    
    # Additional cleanup to ensure app is completely closed
    Run Keyword And Ignore Error    Mobile Close Application
    Sleep    3s
    
    # Force kill any remaining app processes
    Run Keyword And Ignore Error    Run    adb shell am force-stop ${APP_PACKAGE}
    Sleep    2s
    
    # Clean up downloaded files
    Run Keyword And Ignore Error    Cleanup Downloaded Files
    
    # Trigger delayed email notification for individual test execution
    Log To Console    📧 Triggering delayed email notification...
    Run Keyword And Ignore Error    Start Process    python    send_email.py    shell=True
    Log To Console    📧 Delayed email process started - will send after reports are fully generated
    
    Log To Console    ===== Test Teardown Completed =====

Suite Setup
    [Documentation]    Setup for entire test suite
    Log To Console    ===== Starting Suite Setup =====
    # Kill any existing app instances
    Run Keyword And Ignore Error    Mobile Close Application
    Sleep    3s
    Log To Console    ===== Suite Setup Completed =====

Suite Teardown
    [Documentation]    Teardown for entire test suite
    Log To Console    ===== Starting Suite Teardown =====
    
    # Ensure app is closed
    Run Keyword And Ignore Error    Close Gurutattva App
    Run Keyword And Ignore Error    Mobile Close Application
    Sleep    3s
    
    # Clean up any remaining processes
    Run Keyword And Ignore Error    Run    adb shell am force-stop ${APP_PACKAGE}
    
    # Trigger delayed email notification (waits for reports to be fully generated)
    Log To Console    📧 Triggering delayed email notification...
    
    # Start the delayed email process in the background
    Run Keyword And Ignore Error    Start Process    python    send_email.py    shell=True
    Log To Console    📧 Delayed email process started - will send after reports are fully generated
    
    Log To Console    ===== Suite Teardown Completed =====

Safe Close App
    [Documentation]    Safely close the app with multiple fallback methods
    [Arguments]    ${app_package}=${APP_PACKAGE}
    
    Log To Console    Attempting to close app: ${app_package}
    
    # Method 1: Try the standard close method
    ${status}=    Run Keyword And Return Status    Close Gurutattva App
    Run Keyword Unless    ${status}    Log To Console    Standard close failed, trying alternative methods
    
    # Method 2: Try to close application using Mobile Close Application
    Run Keyword And Ignore Error    Mobile Close Application
    Sleep    2s
    
    # Method 3: Force stop using ADB
    Run Keyword And Ignore Error    Run    adb shell am force-stop ${app_package}
    Sleep    2s
    
    # Method 4: Kill all app processes
    Run Keyword And Ignore Error    Run    adb shell pkill -f ${app_package}
    Sleep    1s
    
    Log To Console    App close attempt completed

Handle Test Failure
    [Documentation]    Handle test failures gracefully
    [Arguments]    ${test_name}
    
    Log To Console    ===== Test Failed: ${test_name} =====
    Log To Console    Attempting to recover and close app...
    
    # Take screenshot on failure
    Take Mobile Screenshot    ${test_name}
    
    # Close app safely
    Safe Close App
    
    Log To Console    ===== Test Failure Handled =====

Take Screenshot On Failure
    [Arguments]    ${test_name}
    TRY
        # Ensure screenshot directory exists
        Create Directory    ${SCREENSHOT_DIR}
        
        # Generate filename with timestamp to avoid conflicts
        ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
        ${safe_test_name}=    Replace String    ${test_name}    ${SPACE}    _
        ${safe_test_name}=    Replace String    ${safe_test_name}    .    _
        ${filename}=    Set Variable    ${SCREENSHOT_DIR}/${safe_test_name}_${timestamp}.png
        
        # Capture screenshot using custom method
        Custom Capture Screenshot    ${filename}
        
        Log To Console    ✅ Screenshot captured: ${filename}
        Log    <a href="${filename}">Screenshot for ${test_name}</a>    HTML
        
    EXCEPT    AS    ${error}
        Log To Console    ⚠️ Screenshot capture failed: ${error}
        # Try alternative screenshot method
        TRY
            ${alt_filename}=    Set Variable    ${SCREENSHOT_DIR}/failed_${test_name}.png
            Mobile.Capture Page Screenshot    ${alt_filename}
            Log To Console    ✅ Alternative screenshot captured: ${alt_filename}
        EXCEPT    AS    ${alt_error}
            Log To Console    ❌ All screenshot methods failed: ${alt_error}
        END
    END