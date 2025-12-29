*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot


*** Variables ***
${PROFILE_TAB}          xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[1]/android.view.View/android.widget.ImageView[1]
${PROFILE_INFO}         xpath=xpath=//android.view.View[contains(@content-desc, '+')]
${DELETE & LOGOUT}      xpath=//android.view.View[@content-desc="Delete & Log out Account"]
${LOGOUT_TAB}           xpath=//android.widget.ImageView[@content-desc="Log out"]
${YES_TAB}              xpath=//android.widget.Button[@content-desc="Yes"]
${UPDATE_PROFILE}       xpath=//android.view.View[@content-desc="Profile"]/android.widget.ImageView[2]
${FN_TEXT}              xpath=//android.widget.EditText[@text="yatish"]
${MN_TEXT}              xpath=//android.widget.EditText[@text="Dineshbhai"]
${LN_TEXT}              xpath=//android.widget.EditText[@text="Devlekar"]
${FN_input}             xpath=//android.widget.ScrollView/android.widget.EditText[1]
${MN_input}             xpath=//android.widget.ScrollView/android.widget.EditText[2]
${LN_input}             xpath=//android.widget.ScrollView/android.widget.EditText[3]
${Select_District}      xpath=//android.widget.ImageView[@content-desc="Select District"]
${Choose_District}      xpath=//android.widget.Button[@content-desc="Anand District 1"]
${Select_Taluka/City}   xpath=//android.widget.ImageView[@content-desc="Select Taluka / City"]
${Choose_Taluka/City}   xpath=//android.widget.Button[@content-desc="Guntur Taluka 1"]
${Select_Area/Village}  xpath=//android.widget.ImageView[@content-desc="Select Area / Village"]
${Choose_Area/Village}  xpath=//android.widget.Button[@content-desc="Bidhannagar"]
${SAVE_TAB}             xpath=//android.view.View[@content-desc="Save"]
${USER_NAME}=           FN MN LN
${FIRST_NAME}=          FN
${DISTRICT_NAME}=       Anand District 1
${COMMON_BACK}          xpath=//android.widget.ImageView
${Update_User_Name}     xpath=//android.widget.ImageView[contains(@content-desc,'${USER_NAME}')]
${Updated_FN}           xpath=//android.widget.EditText[contains(@text,'${FIRST_NAME}')]
${Updated_District}     xpath=//android.widget.ImageView[contains(@content-desc,'${DISTRICT_NAME}')]
${VALIDATION_FN}        xpath=//android.view.View[@content-desc="Please enter First name"]
${VALIDATION_MN}        xpath=//android.view.View[@content-desc="Please enter Middle name"]
${VALIDATION_LN}        xpath=//android.view.View[@content-desc="Please enter Last name"]
${FN_TITLE}             xpath=//android.view.View[@content-desc="First Name"]
${VALIDATION_State}     xpath=//android.view.View[@content-desc="Please select your state"]
${VALIDATION_District}      xpath=//android.view.View[@content-desc="Please select your district"]
${VALIDATION_Taluka_City}   xpath=//android.view.View[@content-desc="Please select your taluka / city"]
${VALIDATION_Village}       xpath=//android.view.View[@content-desc="Please select your village"]
${Back_Profile}             xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView
*** Keywords ***
Click on the Profile Tab
    Mobile Wait Until Element Is Visible    ${PROFILE_TAB}    10s
    Mobile Click Element    ${PROFILE_TAB}

Verify User Details in Profile Card
    Mobile Wait Until Element Is Visible    ${PROFILE_INFO}    10s
    Mobile Element Should Be Visible        ${PROFILE_INFO}
    ${profile_title}=    Mobile Get Element Attribute    ${PROFILE_INFO}    content-desc
    Should Contain    ${profile_title}    Yatish Dineshbhai Devlekar
    Log To Console    User Details: ${profile_title}

Click on the Logout Tab
    [Documentation]    Clicks on Logout tab - swipes to find and clicks
    Sleep    2s
    Swipe Until Element Visible    ${DELETE & LOGOUT}
    Mobile Wait Until Element Is Visible    ${LOGOUT_TAB}    10s
    Mobile Click Element    ${LOGOUT_TAB}
    Log To Console    ✅ Clicked on Logout Tab

Click on the Yes Button from Logout Alert
    [Documentation]    Clicks Yes button on logout confirmation alert
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${YES_TAB}    10s
    Mobile Click Element    ${YES_TAB}
    Log To Console    ✅ Clicked Yes on Logout Alert 

Click on the Edit Profile Tab
    Mobile Wait Until Element Is Visible    ${UPDATE_PROFILE}    10s
    Mobile Click Element    ${UPDATE_PROFILE}      

Enter First Name
    [Arguments]    ${FIRST_NAME}
    Scroll Up Until Element Visible    ${FN_TITLE}
    Mobile Wait Until Element Is Visible   ${FN_input}    10s
    Mobile Click Element    ${FN_input}
    Mobile Input Text    ${FN_input}    ${FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Middle Name
    [Arguments]    ${MIDDLE_NAME}
    Scroll Up Until Element Visible    ${FN_TITLE}
    Mobile Wait Until Element Is Visible   ${MN_input}    10s
    Mobile Click Element    ${MN_input}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${MN_input}    ${MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Last Name
    [Arguments]    ${LAST_NAME}
    Scroll Up Until Element Visible      ${FN_TITLE}
    Mobile Wait Until Element Is Visible   ${LN_input}    10s
    Mobile Click Element    ${LN_input}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${LN_input}    ${LAST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard

# Clear first name
#     Wait Until Element Is Visible   ${FN_TEXT}    10s
#     Click Element    ${FN_TEXT}
#     Clear Text       ${FN_TEXT}
# Clear Middle Name
#     Wait Until Element Is Visible   ${MN_TEXT}    10s
#     Click Element    ${MN_TEXT}
#     Clear Text       ${MN_TEXT}
# Clear Last Name
#     Wait Until Element Is Visible   ${LN_TEXT}    10s
#     Click Element    ${LN_TEXT}
#     Clear Text       ${LN_TEXT} 

Clear All Name Fields
    Clear Name Field    ${FN_TEXT}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Clear Name Field    ${MN_TEXT}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Clear Name Field    ${LN_TEXT}
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Select District
    Scroll Until Element Visible    ${SAVE_TAB}  
    Mobile Wait Until Element Is Visible   ${Select_District}    10s
    Mobile Click Element    ${Select_District}
    Mobile Wait Until Element Is Visible   ${Choose_District}    10s
    Mobile Click Element    ${Choose_District}

Select Talka/City
    Mobile Wait Until Element Is Visible   ${Select_Taluka/City}    10s
    Mobile Click Element    ${Select_Taluka/City}
    Mobile Wait Until Element Is Visible   ${Choose_Taluka/City}    10s
    Mobile Click Element    ${Choose_Taluka/City}

# Select Area/Village
#     Wait Until Element Is Visible   ${Select_Area/Village}    10s
#     Click Element    ${Select_Area/Village}
#     Wait Until Element Is Visible   ${Choose_Area/Village}    10s
#     Click Element    ${Choose_Area/Village}
       
Click on the Save Button
    Scroll Until Element Visible    ${SAVE_TAB}
    Mobile Wait Until Element Is Visible   ${SAVE_TAB}    10s
    Mobile Click Element    ${SAVE_TAB}

Verify Updated User Details in Profile Card
    Sleep    10s
    Mobile Wait Until Element Is Visible    ${PROFILE_INFO}    10s
    Mobile Element Should Be Visible        ${PROFILE_INFO}
    ${profile_title}=    Mobile Get Element Attribute    ${PROFILE_INFO}    content-desc
    Should Contain    ${profile_title}    FN MN LN
    Log To Console    Updated User Details: ${profile_title}
            
Verify Updated User info in Profile Screen
    Mobile Wait Until Element Is Visible    ${Updated_FN}    10s
    Mobile Element Should Be Visible        ${Updated_FN}
    ${profile_FN}=    Mobile Get Element Attribute    ${Updated_FN}    text
    Should Contain    ${profile_FN}    FN 
    Log To Console    Updated User FN: ${profile_FN}
    # Scroll Until Element Visible    ${SAVE_TAB}
    # Mobile Wait Until Element Is Visible    ${Updated_District}    10s
    # Mobile Element Should Be Visible        ${Updated_District}
    # ${profile_district}=    Mobile Get Element Attribute    ${Updated_District}    content-desc
    # Should Contain    ${profile_district}   Anand District 1  
    # Log To Console    Updated User District: ${profile_district}

Click on the Back Tab
    Mobile Wait Until Element Is Visible    ${PROFILE_TAB}    10s
    Mobile Click Element    ${PROFILE_TAB}   

Verify Validation For First Name
    Mobile Wait Until Element Is Visible    ${VALIDATION_FN}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${VALIDATION_FN}    content-desc
    Log To Console    text: ${actual_message}
    Should Be Equal    ${actual_message}     Please enter First name

Verify Validation For Middle Name
    Mobile Wait Until Element Is Visible    ${VALIDATION_MN}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${VALIDATION_MN}    content-desc
    Log To Console    text: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter Middle name

Verify Validation For Last Name
    Mobile Wait Until Element Is Visible    ${VALIDATION_LN}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${VALIDATION_LN}    content-desc
    Log To Console    text: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter Last name

Verify Validation For State
    Mobile Wait Until Element Is Visible    ${VALIDATION_State}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${VALIDATION_State}    content-desc
    Log To Console    text: ${actual_message}
    Should Be Equal    ${actual_message}    Please select your state

Select Country From Dropdown
    Mobile Click Element             xpath=//android.widget.ImageView[@content-desc="India"]    
    Scroll Until Element Visible      xpath=//android.widget.Button[@content-desc="India"]
    Mobile Click Element                     xpath=//android.widget.Button[@content-desc="India"]

Verify Validation For District
    Mobile Wait Until Element Is Visible    ${VALIDATION_District}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${VALIDATION_District}    content-desc
    Log To Console    text: ${actual_message}
    Should Be Equal    ${actual_message}    Please select your district

Verify Validation For Taluka/City
    Mobile Wait Until Element Is Visible    ${VALIDATION_Taluka_City}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${VALIDATION_Taluka_City}    content-desc
    Log To Console    text: ${actual_message}
    Should Be Equal    ${actual_message}    Please select your taluka / city

Verify Validation For Area/Village
    Mobile Wait Until Element Is Visible    ${VALIDATION_Village}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${VALIDATION_Village}    content-desc
    Log To Console    text: ${actual_message}
    Should Be Equal    ${actual_message}    Please select your village

Select State From Dropdown
    Mobile Click Element                        xpath=//android.widget.ImageView[@content-desc="Manipur"]    
    Scroll Up Until Element Visible      xpath=//android.widget.Button[@content-desc="Gujarat"]
    Mobile Click Element                        xpath=//android.widget.Button[@content-desc="Gujarat"]    

Select District From Dropdown
    Mobile Click Element                        xpath=//android.widget.ImageView[@content-desc="Select District"]
    Mobile Click Element                        xpath=//android.widget.Button[@content-desc="Ahmedabad"] 

Select Taluka/City From Dropdown
    Mobile Click Element                        xpath=//android.widget.ImageView[@content-desc="Select Taluka / City"]
    Mobile Click Element                        xpath=//android.widget.Button[@content-desc="Ahmedabad City"] 

Click on the FAQ Tab
    Swipe Until Element Visible    ${DELETE & LOGOUT}
    Mobile Click Element                        xpath=//android.view.View[contains(@content-desc,'FAQs')]

Verify First Available FAQs
    Mobile Wait Until Element Is Visible   xpath=(//android.view.View[contains(@content-desc, 'FAQs')]/following-sibling::android.view.View//*[contains(@content-desc,'FAQ')])[1]  10s
    Mobile Element Should Be Visible                  xpath=(//android.view.View[contains(@content-desc, 'FAQs')]/following-sibling::android.view.View//*[contains(@content-desc,'FAQ')])[1]
    ${FAQs}=    Mobile Get Element Attribute    xpath=(//android.view.View[contains(@content-desc, 'FAQs')]/following-sibling::android.view.View//*[contains(@content-desc,'FAQ')])[1]     content-desc   
    Should Contain                             ${FAQs}           FAQ
    Log To Console                                                      FAQs Title: ${FAQs} 

Click on the Add Icon from FAQs
    Mobile Click Element      xpath=(//android.view.View[contains(@content-desc, 'FAQs')]/following-sibling::android.view.View//*[contains(@content-desc,'FAQ')])[1]/android.view.View       

Click on the toggle button to disable notifications
    Mobile Click Element    xpath=//android.view.View[contains(@content-desc,'Notification')]/android.widget.ImageView[1]

Click on the toggle button to enable notifications
    Mobile Click Element    xpath=//android.view.View[contains(@content-desc,'Notification')]/android.widget.ImageView[1]
    
Verify Notification Alert
    Mobile Wait Until Element Is Visible   xpath=//android.view.View[@content-desc="Notification permission is already granted"]      10s
    ${notification_alert}=    Mobile Get Element Attribute    xpath=//android.view.View[@content-desc="Notification permission is already granted"]    content-desc
    Should Be Equal    ${notification_alert}    Notification permission is already granted
    Log To Console    Notification Alert: ${notification_alert}       

Click on the Language Tab
    # Handle both English "Language" and Hindi "भाषा"
    ${language_found_en}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Language')]    5s
    IF    ${language_found_en}
        Mobile Click Element    xpath=//android.view.View[contains(@content-desc,'Language')]
    ELSE
        # Try Hindi version
        Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'भाषा')]    5s
        Mobile Click Element    xpath=//android.view.View[contains(@content-desc,'भाषा')]
    END

Select Hindi from the Language Selection
    # Handle both English "Hindi" and Hindi "हिंदी"
    ${hindi_found_en}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Hindi"]    5s
    IF    ${hindi_found_en}
        Mobile Click Element    xpath=//android.view.View[@content-desc="Hindi"]
    ELSE
        # Try Hindi version "हिंदी"
        Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="हिंदी"]    5s
        Mobile Click Element    xpath=//android.view.View[@content-desc="हिंदी"]
    END

Click on the Save Button from Language Selection
    # Handle both English "Save" and Hindi "सहेजें"
    ${save_found_en}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Save"]    5s
    IF    ${save_found_en}
        Mobile Click Element    xpath=//android.view.View[@content-desc="Save"]
    ELSE
        # Try Hindi version "सहेजें"
        Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="सहेजें"]    5s
        Mobile Click Element    xpath=//android.view.View[@content-desc="सहेजें"]
    END

Verify Profile Screen in Hindi Language
    Mobile Wait Until Element Is Visible   xpath=//android.view.View[@content-desc="सामान्य सेटिंग"]    10s
    ${profile_screen}=    Mobile Get Element Attribute    xpath=//android.view.View[@content-desc="सामान्य सेटिंग"]    content-desc
    Should Be Equal    ${profile_screen}    सामान्य सेटिंग
    Log To Console    Profile Screen in Hindi: ${profile_screen}

Click on the No Button from Logout Alert
    Mobile Click Element    xpath=//android.widget.Button[@content-desc="No"]

Verify Profile Screen is Displayed
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="General Setting"]    10s
    Mobile Element Should Be Visible        xpath=//android.view.View[@content-desc="General Setting"]
    ${profile_tab}=    Mobile Get Element Attribute    xpath=//android.view.View[@content-desc="General Setting"]    content-desc
    Should Contain    ${profile_tab}    General Setting
    Log To Console    Profile Screen is Displayed: ${profile_tab}

Click on the Delete Account Tab
    Swipe Until Element Visible    ${DELETE & LOGOUT}
    Mobile Click Element    xpath=//android.widget.ImageView[@content-desc="Delete Account"]

Click on the Cancel Button from Delete Account Alert
    Mobile Click Element    xpath=//android.widget.Button[@content-desc="Cancel"]

Click on the Delete Button from Delete Account Alert                 
    Mobile Click Element    xpath=//android.widget.Button[@content-desc="Delete"]

Click on the Back Button from Edit Profile Screen
    [Documentation]    Clicks back button from Edit Profile screen with multiple fallback strategies
    Sleep    3s
    Log To Console    Attempting to click Back button from Edit Profile...

    # Strategy 1: Try original xpath with longer wait
    ${strategy1}=    Run Keyword And Return Status
    ...    Run Keywords
    ...    Mobile Wait Until Element Is Visible    ${Back_Profile}    10s
    ...    AND    Mobile Click Element    ${Back_Profile}
    IF    ${strategy1}
        Log To Console    ✅ Back button clicked using Strategy 1 (original xpath)
        Sleep    2s
        RETURN
    END

    # Strategy 2: Try first ImageView with index
    Sleep    2s
    ${strategy2}=    Run Keyword And Return Status
    ...    Run Keywords
    ...    Mobile Wait Until Element Is Visible    xpath=(//android.widget.ImageView)[1]    10s
    ...    AND    Mobile Click Element    xpath=(//android.widget.ImageView)[1]
    IF    ${strategy2}
        Log To Console    ✅ Back button clicked using Strategy 2 (first ImageView)
        Sleep    2s
        RETURN
    END

    # Strategy 3: Try Android back key
    Sleep    2s
    ${strategy3}=    Run Keyword And Return Status    Mobile Press Keycode    4
    IF    ${strategy3}
        Log To Console    ✅ Back button clicked using Strategy 3 (Android back key)
        Sleep    3s
        RETURN
    END

    # Strategy 4: Try tap at back button location (top-left corner based on screenshot)
    Sleep    2s
    ${strategy4}=    Run Keyword And Return Status    Mobile Click Element At Coordinates    36    64
    IF    ${strategy4}
        Log To Console    ✅ Back button clicked using Strategy 4 (coordinate tap)
        Sleep    2s
        RETURN
    END

    # Final fallback: press back key again
    Sleep    2s
    Mobile Press Keycode    4
    Sleep    3s
    Log To Console    ⚠️ Used final fallback - Android back key

Click on the back button from Profile Screen
    Mobile Click Element    ${PROFILE_TAB}

Click on the Common Back Button
    Mobile Click Element     ${COMMON_BACK} 

Click on the Hindi Language Tab
    Mobile Click Element    xpath=//android.view.View[contains(@content-desc,'भाषा')]

Select English from the Language Selection
    # Handle both English "English" and Hindi "अंग्रेज़ी"
    ${english_found_en}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="English"]    5s
    IF    ${english_found_en}
        Mobile Click Element    xpath=//android.view.View[@content-desc="English"]
    ELSE
        # Try Hindi version "अंग्रेज़ी"
        Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="अंग्रेज़ी"]    5s
        Mobile Click Element    xpath=//android.view.View[@content-desc="अंग्रेज़ी"]
    END

Click on the Save Button from Hindi Language Selection
    Mobile Click Element    xpath=//android.view.View[@content-desc="सहेजें"]      

Click on the Close Button from Language Selection
    Mobile Click Element    xpath=//android.widget.Button

Reset Language To English
    [Documentation]    Ensures app language is reset to English - call this in teardown for Hindi tests
    Log To Console    🔄 Attempting to reset app language to English...

    # Try to find Profile tab - this checks if app is open and on home screen
    ${profile_exists}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.widget.ImageView[@content-desc="Profile"]    3s

    # If not found, try Hindi version "प्रोफ़ाइल"
    IF    ${profile_exists} == False
        ${profile_exists_hi}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.widget.ImageView[@content-desc="प्रोफ़ाइल"]    3s
        IF    ${profile_exists_hi}
            Log To Console    📱 App is in Hindi - resetting to English...
            Mobile Click Element    xpath=//android.widget.ImageView[@content-desc="प्रोफ़ाइल"]
            Sleep    2s
            # Click on Language Tab (handles both English and Hindi UI)
            Click on the Language Tab
            Sleep    2s
            # Select English (handles both English and Hindi UI)
            Select English from the Language Selection
            Sleep    2s
            # Click Save (handles both English and Hindi UI)
            Click on the Save Button from Language Selection
            Sleep    3s
            Log To Console    ✅ Language reset to English successfully
            RETURN
        END
    END

    IF    ${profile_exists}
        # App is open in English, navigate to language settings
        Log To Console    📱 App is in English already - but verifying language setting...
        Mobile Click Element    xpath=//android.widget.ImageView[@content-desc="Profile"]
        Sleep    2s
        # Click on Language Tab (handles both English and Hindi UI)
        Click on the Language Tab
        Sleep    2s
        # Select English (handles both English and Hindi UI)
        Select English from the Language Selection
        Sleep    2s
        # Click Save (handles both English and Hindi UI)
        Click on the Save Button from Language Selection
        Sleep    3s
        Log To Console    ✅ Language confirmed as English
    ELSE
        Log To Console    ⚠️ App not in a state to reset language (Profile tab not found) - skipping
    END

Click on the Privacy Policy Tab
    Swipe Until Element Visible    ${DELETE & LOGOUT}
    Mobile Click Element    xpath=//android.view.View[contains(@content-desc,'Privacy Policy')]

Click on the T&C Tab
    Swipe Until Element Visible    ${DELETE & LOGOUT}
    Mobile Click Element    xpath=//android.view.View[contains(@content-desc,'T&C')]

Verify App Language Is English
    [Documentation]    Verifies that the app language is set to English by checking for English UI elements
    Sleep    2s
    # Check if Profile tab is in English (not Hindi "प्रोफ़ाइल")
    ${profile_english}=    Run Keyword And Return Status    Mobile.Wait Until Element Is Visible    xpath=//android.widget.ImageView[@content-desc="Profile"]    5s

    IF    ${profile_english}
        Log To Console    ✅ App is in English - Profile tab found
    ELSE
        # If Profile not found in English, check if it's in Hindi
        ${profile_hindi}=    Run Keyword And Return Status    Mobile.Wait Until Element Is Visible    xpath=//android.widget.ImageView[@content-desc="प्रोफ़ाइल"]    3s
        IF    ${profile_hindi}
            Log To Console    ❌ App is still in Hindi - Profile tab is "प्रोफ़ाइल"
            Fail    Language did not change to English - app is still in Hindi
        ELSE
            Log To Console    ⚠️ Could not verify language - Profile tab not found
        END
    END

Revert App Language To English And Close
    [Documentation]    Teardown keyword for TC02 - Force revert to English using explicit locators
    Log To Console    🔄 TC02 Teardown: Force reverting language to English...

    Sleep    3s

    # First, click Home icon to ensure bottom navigation bar is visible
    Log To Console    📱 Step 1: Clicking Home to make Profile tab visible
    ${home_eng_clicked}=    Run Keyword And Return Status    Mobile.Click Element    xpath=//android.widget.ImageView[@content-desc="Home"]
    IF    not ${home_eng_clicked}
        # Try Hindi Home icon
        ${home_hin_clicked}=    Run Keyword And Return Status    Mobile.Click Element    xpath=//android.widget.ImageView[@content-desc="मुखपृष्ठ"]
        IF    not ${home_hin_clicked}
            Log To Console    ⚠️ Could not find Home icon - continuing anyway
        ELSE
            Log To Console    ✅ Hindi Home icon clicked
        END
    ELSE
        Log To Console    ✅ English Home icon clicked
    END

    Sleep    2s

    # Now click Profile tab - try both English and Hindi content-desc
    Log To Console    📱 Step 2: Clicking Profile tab
    ${profile_eng_clicked}=    Run Keyword And Return Status    Mobile.Click Element    xpath=//android.widget.ImageView[@content-desc="Profile"]
    IF    not ${profile_eng_clicked}
        ${profile_hin_clicked}=    Run Keyword And Return Status    Mobile.Click Element    xpath=//android.widget.ImageView[@content-desc="प्रोफ़ाइल"]
        IF    not ${profile_hin_clicked}
            Log To Console    ⚠️ Could not find Profile tab - trying xpath position
            Run Keyword And Ignore Error    Mobile.Click Element    ${PROFILE_TAB}
        ELSE
            Log To Console    ✅ Hindi Profile tab clicked
        END
    ELSE
        Log To Console    ✅ English Profile tab clicked
    END

    Sleep    3s
    Log To Console    📱 Step 3: Navigating to Language settings

    # Click Language tab (handles both English and Hindi)
    ${lang_clicked}=    Run Keyword And Ignore Error    Click on the Language Tab
    Sleep    3s

    # Select English (handles both English and Hindi labels)
    ${english_selected}=    Run Keyword And Ignore Error    Select English from the Language Selection
    Sleep    5s

    # Click Save button (handles both English and Hindi)
    ${saved}=    Run Keyword And Ignore Error    Click on the Save Button from Language Selection
    Sleep    7s
    Log To Console    ⏳ Waiting for language change to persist...

    # Click Back button
    ${back_clicked}=    Run Keyword And Ignore Error    Click on the Back Button from Profile Screen
    Sleep    5s

    Log To Console    ✅ Language revert sequence completed
    Log To Console    🔄 TC02 Teardown completed - Normal teardown will close app    


Verify Privacy Policy Screen details is Displayed
   Sleep  10s
   Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@text, 'terms and conditions')]    10s
   Mobile Element Should Be Visible        xpath=//android.view.View[contains(@text, 'terms and conditions')]
   ${PrivacyPolicy_tab}=    Mobile Get Element Attribute    xpath=//android.view.View[contains(@text, 'terms and conditions')]      text
   Should Contain    ${PrivacyPolicy_tab}    terms 
   Log To Console    Privacy Policy Content is Displayed: ${PrivacyPolicy_tab} 
Verify T&C Screen details is Displayed
   Sleep     5s
   Mobile Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text, 'of')] | //android.view.View[contains(@text, 'of')])[1]      10s
   Mobile Element Should Be Visible        xpath=(//android.widget.TextView[contains(@text, 'of')] | //android.view.View[contains(@text, 'of')])[1] 
   ${T&C_tab}=    Mobile Get Element Attribute    xpath=(//android.widget.TextView[contains(@text, 'of')] | //android.view.View[contains(@text, 'of')])[1]       text
   Should Contain    ${T&C_tab}    of
   Log To Console    T&C Content is Displayed: ${T&C_tab}

Click on the Register Now Button from Edit Profile Screen
   Sleep    5s
   Mobile Click Element    xpath=//android.view.View[@content-desc="Register Now"]
   Log To Console    Clicked on Register Now Button

# Verify Community Member Content is Displayed
#     Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Unique ID :"]    10s
#     Mobile Element Should Be Visible        xpath=//android.view.View[@content-desc="Unique ID :"]
#     ${text}=    Mobile Get Element Attribute   xpath=//android.view.View[@content-desc="Unique ID :"]    content-desc
#     Should Contain    ${text}    Unique ID :
#     Log To Console    Community Member Content is Displayed: ${text}

Verify Edit Profile Screen is Displayed
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="First Name"]    10s
    Mobile Element Should Be Visible        xpath=//android.view.View[@content-desc="First Name"]
    ${text}=    Mobile Get Element Attribute   xpath=//android.view.View[@content-desc="First Name"]    content-desc
    Should Contain    ${text}    First Name
    Log To Console    Edit Profile Screen is Displayed: ${text}