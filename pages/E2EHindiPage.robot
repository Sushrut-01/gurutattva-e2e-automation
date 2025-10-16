*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    NewsPage.robot

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
${EDIT_MEMBERSHIP_DESC_HINDI}      xpath=//android.view.View[contains(@content-desc, "अपनी यात्रा को अनलॉक करें"]

# ===== EXPLORE PAGE HINDI LOCATORS =====
${EXPLORE_MENU}                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
${EXPLORE_TITLE}                   xpath=(//android.view.View[@content-desc="अन्वेषण"])[1]
${EXPLORE_DHYANKENDRA_CARD}        xpath=//android.widget.ImageView[@content-desc="ध्यान केंद्र"]
${EXPLORE_DHYANSTHALI_CARD}        xpath=//android.widget.ImageView[@content-desc="ध्यानस्थली"]
${EXPLORE_PRARTHNA_CARD}           xpath=//android.widget.ImageView[@content-desc="प्रार्थना"]
${EXPLORE_NAAMKARAN_CARD}          xpath=//android.widget.ImageView[@content-desc="नामकरण"]
${EXPLORE_AUDIO_CARD}              xpath=(//android.widget.ImageView[@content-desc="ऑडियो"])[1]
${EXPLORE_DAAN_CARD}               xpath=//android.widget.ImageView[@content-desc="दान"]

# ===== DHYANKENDRA PAGE HINDI LOCATORS =====
${DHYANKENDRA_PAGE_TITLE}          xpath=//android.view.View[@content-desc="ध्यान केंद्र"]
${DHYANKENDRA_MESSAGE}             xpath=//android.view.View[@content-desc="क्या आप ध्यान केंद्र के रूप में पंजीकरण करना चाहते हैं?"]
${DHYANKENDRA_REGISTRATION_BUTTON}    xpath=//android.view.View[@content-desc="अभी पंजीकरण करें"]
${DHYANKENDRA_LIST_BUTTON}         xpath=//android.view.View[contains(@content-desc,"सूची")]
${DHYANKENDRA_MAP_BUTTON}          xpath=//android.view.View[contains(@content-desc, 'नक्शा')]

# ===== DHYANKENDRA REGISTRATION FORM HINDI LOCATORS =====
${FORM_HEADING}                    xpath=//android.view.View[@content-desc="ध्यान केंद्र खोलने के लिए आवेदन करें"]
${CENTER_NAME_LABEL}               xpath=//android.view.View[@content-desc="केंद्र का नाम *"]
${CENTER_NAME_PLACEHOLDER}         xpath=//android.widget.EditText[@hint='केंद्र का नाम दर्ज करें']
${CENTER_TYPE_LABEL}               xpath=//android.view.View[@content-desc="परिसर का प्रकार *"]
${TYPE_DROPDOWN_PLACEHOLDER}       xpath=(//android.view.View[@content-desc="विकल्प चुनें"])[1]
${OWNER_LABEL}                     xpath=//android.view.View[@content-desc="स्वामित्व *"]
${OWNER_DROPDOWN}                  xpath=//android.view.View[@content-desc="स्वामित्व *"]
${SEATING_CAPACITY_LABEL}          xpath=//android.view.View[@content-desc="बैठने की क्षमता *"]
${SEATING_CAPACITY_INPUT}          xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[6]/android.widget.EditText[2]
${BACK_BUTTON_GENERIC}             xpath=//android.widget.ImageView

# ===== PRARTHNA PAGE HINDI LOCATORS =====
${PRARTHNA_PAGE_TITLE}             xpath=//android.view.View[@content-desc="प्रार्थना"]
${PRARTHNA_PAGE_HEADING}           xpath=//android.view.View[@content-desc="प्रार्थनाएं सबमिट की गईं"]
${PRARTHNA_ID_LABEL}               xpath=//android.widget.ImageView[contains(@content-desc,"प्रार्थना आईडी")]
${PRARTHNA_CATEGORY_LABEL}         xpath=//android.widget.ImageView[contains(@content-desc,"वर्ग")]
${PRARTHNA_ADD_BUTTON}             xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2]

# ===== PRARTHNA ADD FORM HINDI LOCATORS =====
${EMERGENCY_CALL_LABEL}            xpath=//android.view.View[@content-desc="आपातकालीन प्रार्थना कॉल: "]
${TOOLTIP_MESSAGE}                 xpath=//android.view.View[contains(@content-desc,"24x7 प्रार्थना केंद्र (प्रार्थना धाम)")]
${TOOLTIP_CLOSE_BUTTON}            xpath=//android.widget.ScrollView/android.view.View[2]/android.widget.ImageView
${PRAYER_FOR_WHOM_TITLE}           xpath=//android.view.View[@content-desc="आप किसके लिए प्रार्थना पंजीकृत करना चाहते हैं?"]
${PRAYER_FOR_WHOM_HEADING}         xpath=//android.view.View[@content-desc="प्रार्थना किसके द्वारा पंजीकृत की जा रही है"]
${PRAYER_NAME_LABEL}               xpath=//android.view.View[@content-desc="नाम *"]
${PRAYER_PLACE_LABEL}              xpath=//android.view.View[@content-desc="स्थान/क्षेत्र *"]
${PRAYER_EMAIL_LABEL}              xpath=//android.view.View[@content-desc="ईमेल पता *"]
${PRAYER_TYPE_LABEL}               xpath=//android.view.View[@content-desc="प्रार्थना श्रेणी *"]
${PRAYER_FOR_WHOM_LABEL}           xpath=//android.view.View[@content-desc="प्रार्थना किसके लिए की जानी चाहिए"]
${PRAYER_FOR_WHOM_NAME_LABEL}      xpath=//android.view.View[@content-desc="नाम *"]
${PRAYER_FOR_WHOM_PLACE_LABEL}     xpath=//android.view.View[@content-desc="स्थान/क्षेत्र *"]
${PRAYER_ADDRESS_LABEL}            xpath=//android.view.View[@content-desc="पता *"]
${PRAYER_DOB_LABEL}                xpath=//android.view.View[@content-desc="पता *"]
${PRAYER_DESCRIPTION_LABEL}        xpath=//android.view.View[@content-desc="पता *"]

# ===== NAMKARAN PAGE HINDI LOCATORS =====
${NAMKARAN_PAGE_TITLE}             xpath=//android.view.View[@content-desc="नामकरण"]
${NAMKARAN_PAGE_HEADING}           xpath=//android.view.View[@content-desc="नामकरण सबमिट किया गया"]
${NAMKARAN_ID_LABEL}               xpath=//android.view.View[contains(@content-desc,"नामकरण आईडी")]
${NAMKARAN_CATEGORY_LABEL}         xpath=//android.view.View[contains(@content-desc,"वर्ग")]
${NAMKARAN_ADD_BUTTON}             xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2]

# ===== NAMKARAN ADD FORM HINDI LOCATORS =====
${NAMKARAN_FORM_TITLE}             xpath=//android.view.View[@content-desc="नामकरण"]
${NAMKARAN_FIRST_CONTENT}          xpath=//android.widget.ScrollView/android.view.View[1]
${NAMKARAN_CONTENT_HEADING}        xpath=//android.view.View[@content-desc="नामकरण हेतु आवेदन करते समय कृपया निम्न बातों का ध्यान रखें:"]
${NAMKARAN_SECOND_CONTENT}         xpath=//android.view.View[@content-desc="वर्तमान में गुरुदेव चार श्रेणियों में नामकरण कर रहे हैं: (1) नवविवाहिता दुल्हन (2) व्यवसाय (3) घर/निवास (4) नवजात शिशु"]
${NAMKARAN_THIRD_CONTENT}          xpath=//android.view.View[@content-desc="नामकरण के लिए आवेदन करते समय प्रत्येक जानकारी को भरना अनिवार्य है, अतः साधकों से अनुरोध है कि सभी विवरण ध्यानपूर्वक और सही-सही भरें।"]
${NAMKARAN_FOURTH_CONTENT}         xpath=//android.view.View[@content-desc="आवेदन के अंत में विकल्प चयन का विकल्प दिया गया है, यदि आप नाम परम पूज्य स्वामी जी से प्राप्त करना चाहते हैं तो विकल्प में "नहीं" चुनें। लेकिन यदि आपके पास चार नामों के विकल्प हैं और आप चाहते हैं कि स्वामी जी उन्हीं में से एक नाम चुनें, तो विकल्प में "हाँ" चुनें और चारों नाम अनिवार्य रूप से भरें।"]
${NAMKARAN_FIFTH_CONTENT}          xpath=//android.view.View[@content-desc="व्यवसाय के नामकरण हेतु आवेदन करते समय कृपया अपने व्यवसाय का विवरण संक्षेप में और स्पष्ट रूप से लिखें तथा व्यवसाय का पूरा पता अवश्य भरें।"]
${NAMKARAN_SUBMIT_BUTTON}          xpath=//android.view.View[@content-desc="अभी आवेदन करें"]
${NAMKARAN_AGREEMENT_MESSAGE}      xpath=//android.view.View[@content-desc="क्या आप सभी शर्तों से सहमत हैं?"]
${NAMKARAN_AGREE_BUTTON}           xpath=//android.view.View[@content-desc="मैं सहमत हूं"]

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
    
    # Scroll to find additional Hindi elements
    Log To Console    🔍 Scrolling to find additional Hindi elements...
    Swipe Until Element Visible    xpath=//android.view.View[@content-desc="ध्यानस्थली अंतर्दृष्टि"]
    Mobile.Wait Until Page Contains Element    xpath=//android.view.View[@content-desc="ध्यानस्थली अंतर्दृष्टि"]    10s
    Log To Console    ✅ Found: ध्यानस्थली अंतर्दृष्टि
    
    Swipe Until Element Visible    xpath=//android.view.View[@content-desc="आपके लिए अनुशंसित"]
    Mobile.Wait Until Page Contains Element    xpath=//android.view.View[@content-desc="आपके लिए अनुशंसित"]    10s
    Log To Console    ✅ Found: आपके लिए अनुशंसित
    
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

Validate Hindi Content On Explore Page
    [Documentation]    Validates Hindi content on Explore page
    Log To Console    🔍 Validating Hindi content on Explore page...
    
    # Click on Explore menu
    Mobile.Wait Until Page Contains Element    ${EXPLORE_MENU}    10s
    Mobile.Click Element    ${EXPLORE_MENU}
    Sleep    3s
    
    # Validate Explore page elements
    @{explore_elements}=    Create List
    ...    ${EXPLORE_TITLE}
    ...    ${EXPLORE_DHYANKENDRA_CARD}
    ...    ${EXPLORE_DHYANSTHALI_CARD}
    ...    ${EXPLORE_PRARTHNA_CARD}
    ...    ${EXPLORE_NAAMKARAN_CARD}
    ...    ${EXPLORE_AUDIO_CARD}
    ...    ${EXPLORE_DAAN_CARD}
    
    FOR    ${element}    IN    @{explore_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found Explore element: ${element}
    END
    
    Log To Console    ✅ All Hindi content validated successfully on Explore page

Validate Hindi Content On Dhyankendra Page
    [Documentation]    Validates Hindi content on Dhyankendra page
    Log To Console    🔍 Validating Hindi content on Dhyankendra page...
    
    # Click on Dhyankendra card
    Mobile.Wait Until Page Contains Element    ${EXPLORE_DHYANKENDRA_CARD}    10s
    Mobile.Click Element    ${EXPLORE_DHYANKENDRA_CARD}
    Sleep    3s
    
    # Validate Dhyankendra page elements
    @{dhyankendra_elements}=    Create List
    ...    ${DHYANKENDRA_PAGE_TITLE}
    ...    ${DHYANKENDRA_MESSAGE}
    ...    ${DHYANKENDRA_REGISTRATION_BUTTON}
    ...    ${DHYANKENDRA_LIST_BUTTON}
    ...    ${DHYANKENDRA_MAP_BUTTON}
    
    FOR    ${element}    IN    @{dhyankendra_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found Dhyankendra element: ${element}
    END
    
    # Click on Registration button and validate form
    Mobile.Click Element    ${DHYANKENDRA_REGISTRATION_BUTTON}
    Sleep    3s
    
    # Validate form elements
    @{form_elements}=    Create List
    ...    ${FORM_HEADING}
    ...    ${CENTER_NAME_LABEL}
    ...    ${CENTER_NAME_PLACEHOLDER}
    ...    ${CENTER_TYPE_LABEL}
    ...    ${TYPE_DROPDOWN_PLACEHOLDER}
    ...    ${OWNER_LABEL}
    ...    ${OWNER_DROPDOWN}
    ...    ${SEATING_CAPACITY_LABEL}
    ...    ${SEATING_CAPACITY_INPUT}
    
    FOR    ${element}    IN    @{form_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found form element: ${element}
    END
    
    # Click back button
    Mobile.Click Element    ${BACK_BUTTON_GENERIC}
    Sleep    2s
    
    Log To Console    ✅ All Hindi content validated successfully on Dhyankendra page

Validate Hindi Content On Prarthna Page
    [Documentation]    Validates Hindi content on Prarthna page
    Log To Console    🔍 Validating Hindi content on Prarthna page...
    
    # Click on Prarthna card
    Mobile.Wait Until Page Contains Element    ${EXPLORE_PRARTHNA_CARD}    10s
    Mobile.Click Element    ${EXPLORE_PRARTHNA_CARD}
    Sleep    3s
    
    # Validate Prarthna page elements
    @{prarthna_elements}=    Create List
    ...    ${PRARTHNA_PAGE_TITLE}
    ...    ${PRARTHNA_PAGE_HEADING}
    ...    ${PRARTHNA_ID_LABEL}
    ...    ${PRARTHNA_CATEGORY_LABEL}
    
    FOR    ${element}    IN    @{prarthna_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found Prarthna element: ${element}
    END
    
    # Click on Add button
    Mobile.Click Element    ${PRARTHNA_ADD_BUTTON}
    Sleep    3s
    
    # Validate Add form elements
    @{add_form_elements}=    Create List
    ...    ${EMERGENCY_CALL_LABEL}
    ...    ${PRAYER_FOR_WHOM_TITLE}
    ...    ${PRAYER_FOR_WHOM_HEADING}
    ...    ${PRAYER_NAME_LABEL}
    ...    ${PRAYER_PLACE_LABEL}
    ...    ${PRAYER_EMAIL_LABEL}
    ...    ${PRAYER_TYPE_LABEL}
    
    FOR    ${element}    IN    @{add_form_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found Add form element: ${element}
    END
    
    # Get and print tooltip message
    ${tooltip_text}=    Mobile Get Element Attribute    ${TOOLTIP_MESSAGE}    content-desc
    Log To Console    📝 Tooltip message: ${tooltip_text}
    
    # Click tooltip close button
    Mobile.Click Element    ${TOOLTIP_CLOSE_BUTTON}
    Sleep    1s
    
    # Scroll and validate additional elements
    ${height}=    Mobile Get Window Height
    ${width}=     Mobile Get Window Width
    ${start_x}=   Evaluate    int(${width} * 0.5)
    ${start_y}=   Evaluate    int(${height} * 0.8)
    ${end_y}=     Evaluate    int(${height} * 0.2)
    Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    1000ms
    Sleep    2s
    
    @{scroll_elements}=    Create List
    ...    ${PRAYER_FOR_WHOM_LABEL}
    ...    ${PRAYER_FOR_WHOM_NAME_LABEL}
    ...    ${PRAYER_FOR_WHOM_PLACE_LABEL}
    ...    ${PRAYER_ADDRESS_LABEL}
    ...    ${PRAYER_DOB_LABEL}
    ...    ${PRAYER_DESCRIPTION_LABEL}
    
    FOR    ${element}    IN    @{scroll_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found scroll element: ${element}
    END
    
    # Click back button twice
    Mobile.Click Element    ${BACK_BUTTON_GENERIC}
    Sleep    2s
    Mobile.Click Element    ${BACK_BUTTON_GENERIC}
    Sleep    2s
    
    Log To Console    ✅ All Hindi content validated successfully on Prarthna page

Validate Hindi Content On Namkaran Page
    [Documentation]    Validates Hindi content on Namkaran page
    Log To Console    🔍 Validating Hindi content on Namkaran page...
    
    # Click on Namkaran card
    Mobile.Wait Until Page Contains Element    ${EXPLORE_NAAMKARAN_CARD}    10s
    Mobile.Click Element    ${EXPLORE_NAAMKARAN_CARD}
    Sleep    3s
    
    # Validate Namkaran page elements
    @{namkaran_elements}=    Create List
    ...    ${NAMKARAN_PAGE_TITLE}
    ...    ${NAMKARAN_PAGE_HEADING}
    ...    ${NAMKARAN_ID_LABEL}
    ...    ${NAMKARAN_CATEGORY_LABEL}
    
    FOR    ${element}    IN    @{namkaran_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found Namkaran element: ${element}
    END
    
    # Click on Add button
    Mobile.Click Element    ${NAMKARAN_ADD_BUTTON}
    Sleep    3s
    
    # Validate form elements
    @{namkaran_form_elements}=    Create List
    ...    ${NAMKARAN_FORM_TITLE}
    ...    ${NAMKARAN_CONTENT_HEADING}
    ...    ${NAMKARAN_SECOND_CONTENT}
    ...    ${NAMKARAN_THIRD_CONTENT}
    ...    ${NAMKARAN_FOURTH_CONTENT}
    ...    ${NAMKARAN_FIFTH_CONTENT}
    
    FOR    ${element}    IN    @{namkaran_form_elements}
        Mobile.Wait Until Page Contains Element    ${element}    10s
        Log To Console    ✅ Found Namkaran form element: ${element}
    END
    
    # Get and print first content text
    ${first_content_text}=    Mobile Get Element Attribute    ${NAMKARAN_FIRST_CONTENT}    content-desc
    Log To Console    📝 First content text: ${first_content_text}
    
    # Scroll until submit button is visible
    Swipe Until Element Visible    ${NAMKARAN_SUBMIT_BUTTON}
    Mobile.Wait Until Page Contains Element    ${NAMKARAN_SUBMIT_BUTTON}    10s
    Log To Console    ✅ Submit button found
    
    # Click submit button
    Mobile.Click Element    ${NAMKARAN_SUBMIT_BUTTON}
    Sleep    2s
    
    # Validate agreement message and click agree
    Mobile.Wait Until Page Contains Element    ${NAMKARAN_AGREEMENT_MESSAGE}    10s
    Log To Console    ✅ Agreement message found
    Mobile.Click Element    ${NAMKARAN_AGREE_BUTTON}
    Sleep    2s
    
    # Click back button 3 times
    FOR    ${i}    IN RANGE    0    3
        Mobile.Click Element    ${BACK_BUTTON_GENERIC}
        Sleep    2s
    END
    
    Log To Console    ✅ All Hindi content validated successfully on Namkaran page

Validate Complete Hindi Content
    [Documentation]    Validates Hindi content across all relevant pages
    Log To Console    🔍 Starting complete Hindi content validation...
    
    # Validate Home page Hindi content
    Validate Hindi Content On Home Page
    
    # Validate Explore page Hindi content
    Validate Hindi Content On Explore Page
    
    # Validate Dhyankendra page Hindi content
    Validate Hindi Content On Dhyankendra Page
    
    # Validate Prarthna page Hindi content
    Validate Hindi Content On Prarthna Page
    
    # Validate Namkaran page Hindi content
    Validate Hindi Content On Namkaran Page
    
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
