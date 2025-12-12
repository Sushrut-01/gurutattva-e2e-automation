*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot
Resource    ../pages/registerPage.robot

*** Variables ***
${ALLOW_NOTIFICATION}             id=com.android.permissioncontroller:id/permission_allow_button
${ENGLISH_RADIO}                  xpath=//android.view.View[@content-desc='English']
${HINDI_RADIO}                    xpath=//android.view.View[@content-desc='Hindi']
${SAVE_SETTINGS}                  xpath=//android.view.View[@content-desc="Save Settings"]
${LOGIN_EMAIL}                    xpath=//android.widget.EditText
${SUBMIT_LOGIN}                   xpath=(//android.view.View[@content-desc="Login"])[2]
${BLANK_VALIDATION}               xpath=//android.view.View[@content-desc="Please enter Mobile number/Email address"]
${EMPTY}
${NEXT_BUTTON}                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView
${REGISTER_LINK}                  xpath=//android.view.View[contains(@content-desc, "Register")]
${VALIDATION_LOCATOR}             xpath=//android.view.View[@content-desc="Please enter valid Mobile number/Email address"]    
${UNEXIST_VALIDATION_LOCATOR}     xpath=//android.view.View[@content-desc="User not found. Please register before login."]
${QUICK_REGISTRATION}             xpath=//android.view.View[@content-desc="Quick Registration"]
${Tooltip}                        xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[5]/android.widget.ImageView
${Tooltip_Info}                   xpath=//android.view.View[@content-desc="For users outside India, please use an Email to login."]
${Verify_OTP_SCREEN}              xpath=//android.view.View[@content-desc="Verify OTP"]
${EmailRadioBtn}                  xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.RadioButton[2]
# OTP related variables - Updated based on actual app structure
${OTP_INPUT_FIELD}                xpath=//android.view.View[contains(@content-desc, "-") and @clickable="true"]
${VERIFY_BUTTON}                  xpath=//android.view.View[@content-desc="Verify"]
${HOME_SCREEN_VERIFICATION}       xpath=//android.widget.ImageView[@content-desc="Home"]
${UPDATE_POPUP}                   xpath=//android.widget.Button[@content-desc="Cancel"]
${GUEST_USER_BUTTON}              xpath=//android.view.View[@content-desc="Guest User"]
${ACCESS_DENIED_CANCEL}           xpath=//android.view.View[@content-desc="Cancel"]


*** Keywords ***

Handle First Time Setup
    # Check if already logged in (home screen visible)
    ${already_logged_in}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${HOME_SCREEN_VERIFICATION}    3s

    IF    ${already_logged_in}
        Log To Console    ✅ Already logged in - skipping first time setup
        RETURN
    END

    # If not logged in, handle first time setup screens
    Run Keyword And Ignore Error    Click Cancel If Update Popup Visible
    Run Keyword And Ignore Error    Allow Notification
    Run Keyword And Ignore Error    Select English Language
    Run Keyword And Ignore Error    Save Settings
    Run Keyword And Ignore Error    Skip introductory guide on initial application launch
Click Cancel If Update Popup Visible
    ${isVisible}=    Run Keyword And Return Status    Mobile Element Should Be Visible    ${UPDATE_POPUP}
    Run Keyword If    ${isVisible}    Mobile Click Element    ${UPDATE_POPUP}
    Run Keyword If    ${isVisible}    Log To Console    Update popup closed successfully!
    Run Keyword If    ${isVisible}    Sleep    2s
    Run Keyword If    ${isVisible}    Mobile Activate Application    com.rysunhome.gurutattvamobile
    Run Keyword If    ${isVisible}    Sleep    2s
    Run Keyword If    ${isVisible}    Log To Console    App brought to foreground after update popup

Allow Notification
    ${isVisible}=    Run Keyword And Return Status    Mobile Element Should Be Visible    ${ALLOW_NOTIFICATION}
    Run Keyword If    ${isVisible}    Mobile Click Element    ${ALLOW_NOTIFICATION}
    Run Keyword If    ${isVisible}    Log To Console    The Notification is allowed

Select English Language
    ${isVisible}=    Run Keyword And Return Status    Mobile Element Should Be Visible    ${ENGLISH_RADIO}
    Run Keyword If    ${isVisible}    Mobile Click Element    ${ENGLISH_RADIO}
    Run Keyword If    ${isVisible}    Log To Console    English radio button selected successfully!

Select Hindi Language
    ${isVisible}=    Run Keyword And Return Status    Mobile Element Should Be Visible    ${HINDI_RADIO}
    Run Keyword If    ${isVisible}    Mobile Click Element    ${HINDI_RADIO}
    Run Keyword If    ${isVisible}    Log To Console    Hindi radio button selected successfully!

Save Settings
    ${isVisible}=    Run Keyword And Return Status    Mobile Element Should Be Visible    ${SAVE_SETTINGS}
    Run Keyword If    ${isVisible}    Mobile Click Element    ${SAVE_SETTINGS}
    Run Keyword If    ${isVisible}    Log To Console    Settings saved successfully!
    IF    not ${isVisible}
        Fail    Save Settings button was not visible and could not be clicked!
    END

Click Guest User If Login Screen Visible
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${GUEST_USER_BUTTON}    3s
    Run Keyword If    ${isVisible}    Mobile Click Element    ${GUEST_USER_BUTTON}
    Run Keyword If    ${isVisible}    Log To Console    Clicked Guest User to continue without login
    Run Keyword If    ${isVisible}    Sleep    2s

Dismiss Access Denied Popup If Visible
    [Documentation]    Clicks Cancel on "You do not have access" popup if it appears
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${ACCESS_DENIED_CANCEL}    2s
    Run Keyword If    ${isVisible}    Mobile Click Element    ${ACCESS_DENIED_CANCEL}
    Run Keyword If    ${isVisible}    Log To Console    ⚠️ Access denied popup dismissed - feature requires login
    Run Keyword If    ${isVisible}    Sleep    1s

Click on the input field
    Mobile Wait Until Element Is Visible    ${LOGIN_EMAIL}    5s
    Mobile Click Element    ${LOGIN_EMAIL}
    Mobile Hide Keyboard

Click on the Login Button
    Mobile Wait Until Element Is Visible    ${SUBMIT_LOGIN}    5s
    Sleep    1s
    Mobile Click Element    ${SUBMIT_LOGIN}
    Log              Login button clicked!

Enter the validate and exist mobile number
    Mobile Wait Until Element Is Visible    ${LOGIN_EMAIL}    5s
    Mobile Click Element    ${LOGIN_EMAIL}
    Sleep    1s
    Mobile Input Text       ${LOGIN_EMAIL}      9999999999   

Enter the Mobile Number of Quick Registration
    Mobile Input Text       ${LOGIN_EMAIL}      8888888888
Enter the validate and exist email address
    Sleep    2s
    Mobile Click Element    ${EmailRadioBtn}
    Mobile Click Element    ${LOGIN_EMAIL}
    Sleep    2s
    Mobile Input Text       ${LOGIN_EMAIL}      yatishd.actowiz@gmail.com

Enter the invalid mobile credentials
    Mobile Input Text       ${LOGIN_EMAIL}      9666

Enter the invalid email credentials
    Sleep    5s
    Mobile Click Element    ${EmailRadioBtn}
    Mobile Click Element    ${LOGIN_EMAIL}
    Sleep    5s
    Mobile Input Text       ${LOGIN_EMAIL}      test@gmail    

Verify Validation Message For Invalid User    
    Mobile Wait Until Element Is Visible                             ${VALIDATION_LOCATOR}    5s
    ${message_mobile}=               Mobile Get Element Attribute    ${VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings      ${message_mobile}                                  Please enter valid Mobile number/Email address
    Log To Console                                            ${message_mobile}

Enter the Unexist email credentials
    Sleep    5s
    Mobile Click Element    ${EmailRadioBtn}
    Mobile Click Element    ${LOGIN_EMAIL}
    Sleep    5s
    Mobile Input Text       ${LOGIN_EMAIL}      yatishdevlekar@gmail.com    

Enter the Unexist mobile credentials
    Mobile Input Text       ${LOGIN_EMAIL}      1234567892

Verify Validation Message For unexist User    
    # Mobile Wait Until Element Is Visible   ${UNEXIST_VALIDATION_LOCATOR}    10s
    # ${message_unexist}=               Mobile Get Element Attribute    ${UNEXIST_VALIDATION_LOCATOR}    content-desc
    # Should Be Equal As Strings      ${message_unexist}    User not found. Please register before login.
    # Log To Console                             ${message_unexist}
    ${src}=    Mobile.Get Source
    Should Contain    ${src}    User not found. Please register before login.
    Log To Console    User not found. Please register before login.

Enter the Login As blank fields
    Mobile Input Text       ${LOGIN_EMAIL}      ${EMPTY}

Verify Validation Message For blank fields     
    Mobile Wait Until Element Is Visible   ${BLANK_VALIDATION}    5s
    ${message_blank}=               Mobile Get Element Attribute    ${BLANK_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message_blank}    Please enter Mobile number/Email address
    Log To Console                             ${message_blank}

Click on the Register Link
    [Documentation]    Clicks on Register link with fallback to manual interaction if element not found
    Sleep    5s
    
    # Try to find and click the Register link automatically
    ${register_found}=    Run Keyword And Return Status    
    ...    Mobile Wait Until Element Is Visible    ${REGISTER_LINK}    10s
    
    IF    ${register_found}
        Mobile Click Element    ${REGISTER_LINK}
        Log To Console    ✅ Automatically clicked on Register Link.
    ELSE
        # Fallback: Ask user to manually click Register button
        Log To Console    ⚠️  Register link not found automatically.
        Log To Console    🔧 Please manually click on the Register button in the mobile app.
        Log To Console    📱 Waiting for manual interaction...
        
        # Wait for user to manually click and verify registration screen appears
        ${manual_click_success}=    Run Keyword And Return Status    
        ...    Wait For Manual Register Click
        
        IF    ${manual_click_success}
            Log To Console    ✅ Manual Register click successful - Registration screen detected.
        ELSE
            Fail    ❌ Manual Register click failed - Registration screen not detected after 60 seconds.
        END
    END

Wait For Manual Register Click
    [Documentation]    Waits for user to manually click Register and verifies registration screen appears
    [Arguments]    ${timeout}=60s
    
    # Wait for registration screen to appear (indicating successful manual click)
    ${registration_screen_found}=    Run Keyword And Return Status    
    ...    Mobile Wait Until Element Is Visible    ${QUICK_REGISTRATION}    ${timeout}
    
    IF    ${registration_screen_found}
        Log To Console    ✅ Registration screen detected - Manual click successful.
        RETURN    ${TRUE}
    ELSE
        Log To Console    ❌ Registration screen not detected within ${timeout}.
        RETURN    ${FALSE}
    END

Click on Register Text Only
    [Documentation]    Clicks specifically on the "Register" part of the text using coordinates
    # Sleep    5s
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Register')]   10s
    Mobile Click Element    xpath=//android.view.View[contains(@content-desc,'Register')]
    Log To Console    Clicked on Register Text Only

Verify Registration Screen Is Displayed
    Mobile Wait Until Element Is Visible    ${QUICK_REGISTRATION}    10s
    ${is_selected}=    Mobile Get Element Attribute    ${QUICK_REGISTRATION}    selected
    Should Be Equal As Strings    ${is_selected}    false    Quick Registration is NOT selected by default.
    Log To Console    ${is_selected}

Click on the Tooltip Icon
    Mobile Wait Until Element Is Visible    ${Tooltip}    10s
    Mobile Click Element    ${Tooltip}
    Log To Console    Clicked on Tooltip Icon.

Verify Tooltip Information Is Displayed
    Mobile Wait Until Element Is Visible    ${Tooltip_Info}    10s
    ${tooltip_text}=    Mobile Get Element Attribute    ${Tooltip_Info}    content-desc
    Should Be Equal As Strings    ${tooltip_text}    For users outside India, please use an Email to login.
    Log To Console    Tooltip information verified: ${tooltip_text}

Verify Validation Messages for Language
    Mobile Wait Until Element Is Visible    xpath=//android.widget.ImageView[contains(@content-desc,'Your preferred language')]    10s
    ${message}=    Mobile Get Element Attribute    xpath=//android.widget.ImageView[contains(@content-desc,'Your preferred language')]    content-desc
    Should Contain    ${message}    Your preferred language has been successfully set to  English.
    Log To Console    Language Title: ${message}

Verify Mission screen
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Mission')]    10s
    ${message}=    Mobile Get Element Attribute    xpath=//android.view.View[contains(@content-desc,'Mission')]    content-desc
    Should Contain    ${message}    Mission
    Log To Console    Mission Title: ${message}

Click on the next button
    Mobile Wait Until Element Is Visible    ${NEXT_BUTTON}
    Mobile Click Element    ${NEXT_BUTTON}      

Verify Vision screen
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Vision')]    10s
    ${message}=    Mobile Get Element Attribute    xpath=//android.view.View[contains(@content-desc,'Vision')]    content-desc
    Should Contain    ${message}    Vision
    Log To Console    Vision Title: ${message}

Verify Values screen
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Values')]    10s
    ${message}=    Mobile Get Element Attribute    xpath=//android.view.View[contains(@content-desc,'Values')]    content-desc
    Should Contain    ${message}    Values
    Log To Console    Values Title: ${message}

Verify OTP Screen is Displayed
    Sleep    5s
    Mobile Wait Until Element Is Visible    ${Verify_OTP_SCREEN}    10s
    ${otp_message}=    Mobile Get Element Attribute    ${Verify_OTP_SCREEN}    content-desc
    Should Contain    ${otp_message}    Verify OTP
    Log To Console    OTP Screen is Displayed: ${otp_message}

Enter the valid OTP
    [Documentation]    Waits for user to enter OTP manually and then proceeds
    Mobile Wait Until Element Is Visible    ${OTP_INPUT_FIELD}    10s
    Mobile Click Element    ${OTP_INPUT_FIELD}
    Sleep    2s
    
    # Wait for user to manually enter OTP
    Log To Console    ===== OTP INPUT REQUIRED =====
    Log To Console    Please check your mobile device for OTP and enter it manually in the app
    Log To Console    Waiting for OTP input...
    
    # Wait for user to enter OTP (adjust timeout as needed)
    Sleep    30s
    
    Log To Console    ===== OTP INPUT COMPLETED =====
    Log To Console    Proceeding with verification...

Click on the Verify Button
    [Documentation]    Clicks on the verify button to submit OTP
    Mobile Wait Until Element Is Visible    ${VERIFY_BUTTON}    10s
    Mobile Click Element    ${VERIFY_BUTTON}
    Log To Console    Clicked on Verify Button

Verify Home Screen is Displayed
    [Documentation]    Verifies that the home screen is displayed after successful login
    Mobile Wait Until Element Is Visible    ${HOME_SCREEN_VERIFICATION}    10s
    ${home_screen}=    Mobile Get Element Attribute    ${HOME_SCREEN_VERIFICATION}    content-desc
    Should Contain    ${home_screen}    Home
    Log To Console    Home Screen is Displayed: ${home_screen}

Wait For User OTP Input
    [Documentation]    Waits for user to manually enter OTP with customizable timeout
    [Arguments]    ${timeout}=30s
    Log To Console    ===== MANUAL OTP INPUT REQUIRED =====
    Log To Console    Please check your mobile device for OTP and enter it manually in the app
    Log To Console    Waiting for ${timeout} for OTP input...
    Sleep    ${timeout}
    Log To Console    ===== OTP INPUT COMPLETED =====

Enter OTP With User Input
    [Documentation]    Clicks OTP field and waits for user to enter OTP manually
    [Arguments]    ${timeout}=30s
    Mobile Wait Until Element Is Visible    ${OTP_INPUT_FIELD}    10s
    Mobile Click Element    ${OTP_INPUT_FIELD}
    Sleep    2s
    Log To Console    OTP input field clicked. Please enter OTP manually.
    Wait For User OTP Input    ${timeout}

Verify OTP Entered Successfully
    [Documentation]    Verifies that OTP has been entered (checks if dashes are replaced with numbers)
    Sleep    3s
    ${current_content}=    Mobile Get Element Attribute    ${OTP_INPUT_FIELD}    content-desc
    Log To Console    Current OTP field content: ${current_content}
    
    # Check if the content still contains only dashes (OTP not entered)
    ${contains_only_dashes}=    Run Keyword And Return Status    Should Contain    ${current_content}    - - - - - -
    
    IF    ${contains_only_dashes}
        Log To Console    WARNING: OTP field still shows dashes. OTP may not have been entered.
        Fail    OTP was not entered. Please check if OTP was received and entered correctly.
    ELSE
        Log To Console    OTP appears to have been entered successfully.
    END

Enter Email OTP Manually
    [Documentation]    Specifically for email login - waits for user to enter OTP received via email
    # Mobile Wait Until Element Is Visible    ${OTP_INPUT_FIELD}    10s
    # Mobile Click Element    ${OTP_INPUT_FIELD}
    Sleep    2s
    
    # Wait for user to manually enter email OTP
    # Log To Console    ===== EMAIL OTP INPUT REQUIRED =====
    # Log To Console    Please check your email for OTP and enter it manually in the app
    # Log To Console    Email: yatish.devlekar@rysun.com
    # Log To Console    Waiting for email OTP input...
    
    # Wait for user to enter OTP (adjust timeout as needed)
    Sleep    45s
    
    # Log To Console    ===== EMAIL OTP INPUT COMPLETED =====
    Log To Console    Proceeding with email OTP verification...

Enter Mobile OTP Manually
    [Documentation]    Specifically for mobile login - waits for user to enter OTP received via SMS
    # Mobile Wait Until Element Is Visible    ${OTP_INPUT_FIELD}    10s
    # Mobile Click Element    ${OTP_INPUT_FIELD}
    Enter Community Mobile By Keypad    888888

    # Sleep    2s
    
    # # Wait for user to manually enter mobile OTP
    # Log To Console    ===== MOBILE OTP INPUT REQUIRED =====
    # Log To Console    Please check your mobile device for SMS OTP and enter it manually in the app
    # Log To Console    Mobile: 7808689033
    # Log To Console    Waiting for mobile OTP input...
    
    # # Wait for user to enter OTP (adjust timeout as needed)
    # Sleep    30s
    
    # Log To Console    ===== MOBILE OTP INPUT COMPLETED =====
    # Log To Console    Proceeding with mobile OTP verification...

Logout And Cleanup
    [Documentation]    Logout user and cleanup
    Run Keyword And Ignore Error    Mobile Click Element    xpath=//android.view.View[@content-desc="Logout"]
    Run Keyword And Ignore Error    Mobile Click Element    xpath=//android.widget.Button[@content-desc="Yes"]
    Log To Console    User logged out and cleanup completed

Clear App Data Before Onboarding
    [Documentation]    Clears app data to ensure fresh onboarding experience
    Log To Console    ===== CLEARING APP DATA FOR ONBOARDING =====
    
    # Close app if running
    Run Keyword And Ignore Error    Close Gurutattva App
    Sleep    3s
    
    # Clear app data using ADB
    Log To Console    Clearing app data using ADB...
    Run Keyword And Ignore Error    Run    adb shell pm clear ${APP_PACKAGE}
    Sleep    5s
    
    # Force stop app to ensure clean state
    Run Keyword And Ignore Error    Run    adb shell am force-stop ${APP_PACKAGE}
    Sleep    3s
    
    # Clear app cache
    Run Keyword And Ignore Error    Run    adb shell pm clear-cache ${APP_PACKAGE}
    Sleep    2s
    
    Log To Console    ===== APP DATA CLEARED SUCCESSFULLY =====

Open App With Clean Data
    [Documentation]    Opens app after clearing data for fresh onboarding
    Clear App Data Before Onboarding
    Open Gurutattva App
    Sleep    5s
    Log To Console    App opened with clean data for onboarding
    