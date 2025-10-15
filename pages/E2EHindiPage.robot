*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/test_setup_teardown.robot

*** Variables ***
# ===== HOME PAGE LOCATORS =====
${PROFILE_ICON}                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[1]/android.view.View/android.widget.ImageView
${NOTIFICATION_ICON}               xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[1]/android.view.View/android.view.View

# ===== PROFILE PAGE LOCATORS =====
${PROFILE_PAGE_TITLE}              xpath=//android.view.View[@content-desc="Profile"]
${LANGUAGE_SETTING}                xpath=//android.view.View[contains(@content-desc, 'Language')]
${LANGUAGE_DESCRIPTION}            xpath=//android.view.View[contains(@text, "Speak the app your way")]
${LANGUAGE_ARROW}                  xpath=//android.view.ImageView[contains(@content-desc, "arrow")]

# ===== LANGUAGE SELECTION MODAL LOCATORS =====
${LANGUAGE_MODAL_TITLE}            xpath=//android.view.View[@content-desc="Language Selection"]
${LANGUAGE_MODAL_TITLE_HINDI}      xpath=//android.view.View[@content-desc="भाषा चयन"]
${LANGUAGE_MODAL_CLOSE}            xpath=//android.widget.Button
${ENGLISH_OPTION}                  xpath=//android.view.View[@content-desc="English"]
${ENGLISH_OPTION_HINDI}            xpath=//android.view.View[@content-desc="अंग्रेज़ी"]
${HINDI_OPTION}                    xpath=//android.view.View[@content-desc="Hindi"]
${HINDI_OPTION_HINDI}              xpath=//android.view.View[@content-desc="हिंदी"]
${SAVE_BUTTON}                     xpath=//android.view.View[@content-desc="Save"]
${SAVE_BUTTON_HINDI}               xpath=//android.view.View[@content-desc="सहेजें"]

# ===== BACK BUTTON LOCATORS =====
${BACK_BUTTON}                     xpath=//android.view.View[@content-desc="प्रोफ़ाइल"]/android.widget.ImageView[1]

# ===== HINDI CONTENT VALIDATION LOCATORS =====
# Home Page Hindi Content
${HINDI_TITLE}                     xpath=//android.widget.TextView[contains(@text,"हिंदी_Title")]
${HINDI_DESCRIPTION}               xpath=//android.widget.TextView[contains(@text,"हिंदी_Description")]
${EXPLORE_SECTION_TITLE}           xpath=(//android.view.View[@content-desc="अन्वेषण"])[2]
${DHYANKENDRA_HINDI}               xpath=//android.widget.ImageView[@content-desc="ध्यान केंद्र"]
${DHYANSTHALI_HINDI}               xpath=//android.widget.ImageView[@content-desc="ध्यानस्थली"]
${PRAYER_HINDI}                    xpath=//android.widget.ImageView[@content-desc="प्रार्थना"]
${NAMKARAN_HINDI}                  xpath=//android.widget.ImageView[@content-desc="नामकरण"]
${AUDIO_OF_DAY_HINDI}              xpath=//android.view.View[@content-desc="आज का ऑडियो"]
${VIEW_ALL_HINDI}                  xpath=//android.view.View[@content-desc="सभी देखें"]

# Bottom Navigation Hindi Content
${HOME_NAV_HINDI}                  xpath=//android.widget.ImageView[@content-desc="मुखपृष्ठ"]
${NEWS_NAV_HINDI}                  xpath=//android.widget.ImageView[@content-desc="समाचार"]
${EXPLORE_NAV_HINDI}               xpath=(//android.view.View[@content-desc="अन्वेषण"])[2]
${EVENTS_NAV_HINDI}                xpath=//android.widget.ImageView[@content-desc="घटनाएं"]
${AUDIO_NAV_HINDI}                 xpath=//android.widget.ImageView[@content-desc="ऑडियो"]

# Profile Page Hindi Content
${PROFILE_TITLE_HINDI}             xpath=//android.view.View[@content-desc="प्रोफ़ाइल"]
${GENERAL_SETTINGS_HINDI}          xpath=//android.view.View[@content-desc="सामान्य सेटिंग"]
${LANGUAGE_HINDI}                  xpath=//android.view.View[contains(@content-desc, 'भाषा')]
${LANGUAGE_DESC_HINDI}             xpath=//android.view.View[contains(@content-desc,"ऐप को अपने तरीके से बोलें")]
${NOTIFICATION_HINDI}              xpath=//android.view.View[contains(@content-desc,"अधिसूचना")]
${NOTIFICATION_DESC_HINDI}         xpath=//android.view.View[contains(@content-desc, "एक भी पल को न गंवाएँ")]
${THEME_HINDI}                     xpath=//android.view.View[contains(@content-desc,"थीम")]
${THEME_DESC_HINDI}                xpath=//android.view.View[contains(@content-desc, "अपने मूड से मेल खाएँ")]
${EDIT_MEMBERSHIP_HINDI}           xpath=//android.view.View[contains(@content-desc, "सदस्यता संपादित करें")]
${EDIT_MEMBERSHIP_DESC_HINDI}      xpath=//android.view.View[contains(@content-desc, "अपनी यात्रा को अनलॉक करें")]

*** Keywords ***

# ===== MAIN TEST KEYWORDS =====

Change Language To Hindi
    [Documentation]    Changes the app language from English to Hindi
    Log To Console    🔄 Starting language change to Hindi...
    
    # Step 1: Open the app (already done in test setup)
    Log To Console    ✅ Step 1: App is already open
    
    # Step 2: Click on Profile icon
    Log To Console    🔍 Step 2: Clicking on Profile icon
    Mobile.Wait Until Page Contains Element    ${PROFILE_ICON}    10s
    Mobile.Click Element    ${PROFILE_ICON}
    Sleep    3s
    
    # Verify we're on Profile page
    Mobile.Wait Until Page Contains Element    ${PROFILE_PAGE_TITLE}    10s
    Log To Console    ✅ Step 2: Successfully navigated to Profile page
    
    # Step 3: Click on Language setting
    Log To Console    🔍 Step 3: Clicking on Language setting
    Mobile.Wait Until Page Contains Element    ${LANGUAGE_SETTING}    10s
    Mobile.Click Element    ${LANGUAGE_SETTING}
    Sleep    2s
    
    # Step 4: Select Hindi option
    Log To Console    🔍 Step 4: Selecting Hindi language
    Mobile.Wait Until Page Contains Element    ${LANGUAGE_MODAL_TITLE}    10s
    Mobile.Wait Until Page Contains Element    ${HINDI_OPTION}    10s
    Mobile.Click Element    ${HINDI_OPTION}
    Sleep    1s
    
    # Step 5: Click Save button
    Log To Console    🔍 Step 5: Clicking Save button
    Mobile.Wait Until Page Contains Element    ${SAVE_BUTTON}    10s
    Mobile.Click Element    ${SAVE_BUTTON}
    Sleep    3s
    
    Log To Console    ✅ Language successfully changed to Hindi

Revert Language To English
    [Documentation]    Reverts the app language from Hindi back to English
    Log To Console    🔄 Starting language reversion to English...
    
    # Step 1: Click on Language setting (now in Hindi)
    Log To Console    🔍 Step 2: Clicking on Language setting (Hindi)
    Mobile.Wait Until Page Contains Element    ${LANGUAGE_HINDI}    10s
    Mobile.Click Element    ${LANGUAGE_HINDI}
    Sleep    2s
    
    # Step 2: Select English option (using Hindi locators)
    Log To Console    🔍 Step 3: Selecting English language
    Mobile.Wait Until Page Contains Element    ${LANGUAGE_MODAL_TITLE_HINDI}    10s
    Mobile.Wait Until Page Contains Element    ${ENGLISH_OPTION_HINDI}    10s
    Mobile.Click Element    ${ENGLISH_OPTION_HINDI}
    Sleep    1s
    
    # Step 3: Click Save button (using Hindi locator)
    Log To Console    🔍 Step 4: Clicking Save button
    Mobile.Wait Until Page Contains Element    ${SAVE_BUTTON_HINDI}    10s
    Mobile.Click Element    ${SAVE_BUTTON_HINDI}
    Sleep    3s
    
    Log To Console    ✅ Language successfully reverted to English

# ===== VALIDATION KEYWORDS =====

Validate Hindi Content On Home Page
    [Documentation]    Validates that home page content is displayed in Hindi
    Log To Console    🔍 Validating Hindi content on Home page...
    
    # Navigate back to home page
    Mobile.Wait Until Page Contains Element    ${BACK_BUTTON}    10s
    Mobile.Click Element    ${BACK_BUTTON}
    Sleep    3s
    
    # Validate Hindi content elements
    @{hindi_elements}=    Create List
    ...    ${EXPLORE_SECTION_TITLE}
    ...    ${DHYANKENDRA_HINDI}
    ...    ${DHYANSTHALI_HINDI}
    ...    ${PRAYER_HINDI}
    ...    ${NAMKARAN_HINDI}
    ...    ${AUDIO_OF_DAY_HINDI}
    ...    ${VIEW_ALL_HINDI}
    
    FOR    ${element}    IN    @{hindi_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found Hindi element: ${element}
    END
    
    # Validate bottom navigation Hindi content
    @{nav_elements}=    Create List
    ...    ${HOME_NAV_HINDI}
    ...    ${NEWS_NAV_HINDI}
    ...    ${EXPLORE_NAV_HINDI}
    ...    ${EVENTS_NAV_HINDI}
    ...    ${AUDIO_NAV_HINDI}
    
    FOR    ${element}    IN    @{nav_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found Hindi navigation element: ${element}
    END
    
    Log To Console    ✅ All Hindi content validated successfully on Home page

Validate Hindi Content On Profile Page
    [Documentation]    Validates that profile page content is displayed in Hindi
    Log To Console    🔍 Validating Hindi content on Profile page...
    
    # Navigate to profile page
    Mobile.Wait Until Page Contains Element    ${PROFILE_ICON}    10s
    Mobile.Click Element    ${PROFILE_ICON}
    Sleep    3s
    
    # Validate Hindi content elements
    @{hindi_elements}=    Create List
    ...    ${PROFILE_TITLE_HINDI}
    ...    ${GENERAL_SETTINGS_HINDI}
    ...    ${LANGUAGE_HINDI}
    ...    ${LANGUAGE_DESC_HINDI}
    ...    ${THEME_HINDI}
    ...    ${THEME_DESC_HINDI}
    ...    ${EDIT_MEMBERSHIP_HINDI}
    ...    ${EDIT_MEMBERSHIP_DESC_HINDI}
    
    FOR    ${element}    IN    @{hindi_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found Hindi element: ${element}
    END
    
    Log To Console    ✅ All Hindi content validated successfully on Profile page

Validate Complete Hindi Content
    [Documentation]    Validates Hindi content across all relevant pages
    Log To Console    🔍 Starting complete Hindi content validation...
    
    # Validate Home page Hindi content
    Validate Hindi Content On Home Page
    
    # Validate Profile page Hindi content
    Validate Hindi Content On Profile Page
    
    Log To Console    ✅ Complete Hindi content validation successful

# ===== UTILITY KEYWORDS =====

Wait For Language Change
    [Documentation]    Waits for the language change to take effect
    [Arguments]    ${timeout}=10s
    Log To Console    ⏳ Waiting for language change to take effect...
    Sleep    ${timeout}
    Log To Console    ✅ Language change should be effective now

Take Screenshot For Hindi Validation
    [Documentation]    Takes a screenshot for Hindi content validation
    [Arguments]    ${screenshot_name}
    Mobile.Capture Page Screenshot    ${screenshot_name}
    Log To Console    📸 Screenshot taken: ${screenshot_name}
