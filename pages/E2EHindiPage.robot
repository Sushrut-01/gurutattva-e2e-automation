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
${EDIT_MEMBERSHIP_DESC_HINDI}      xpath=//android.view.View[contains(@content-desc, "अपनी यात्रा को अनलॉक करें")]

# ===== PROFILE PAGE ADDITIONAL LOCATORS =====
# Profile Page Additional Elements
${PERMISSION_HINDI}                 xpath=//android.view.View[@content-desc="अनुमतियाँ"]
${PRIVACY_POLICY_HINDI}             xpath=//android.view.View[contains(@content-desc,"गोपनीयता नीति")]
${TERMS_CONDITION_HINDI}            xpath=//android.view.View[contains(@content-desc,"नियम व शर्तें")]
${FAQ_HINDI}                        xpath=//android.view.View[contains(@content-desc,"प्रश्नोत्तर")]
${APP_VERSION_HINDI}                xpath=//android.view.View[contains(@content-desc,"ऐप संस्करण")]
${DELETE_LOGOUT_HEADING_HINDI}      xpath=//android.view.View[@content-desc="खाता हटाएं और लॉगआउट करें"]
${DELETE_ACCOUNT_HINDI}             xpath=//android.widget.ImageView[@content-desc="खाता हटा दो"]
${LOGOUT_BUTTON_HINDI}              xpath=//android.widget.ImageView[@content-desc="लॉग आउट"]

# Edit Profile Elements
${EDIT_ICON_HINDI}                  xpath=//android.view.View[@content-desc="प्रोफ़ाइल"]/android.widget.ImageView[2]
${EDIT_PROFILE_HEADING_HINDI}       xpath=//android.view.View[@content-desc="प्रोफ़ाइल संपादित करें"]
${FIRST_NAME_HINDI}                 xpath=//android.view.View[@content-desc="पहला नाम"]
${MIDDLE_NAME_HINDI}                xpath=//android.view.View[@content-desc="मध्य नाम"]
${LAST_NAME_HINDI}                  xpath=//android.view.View[@content-desc="मध्य नाम"]
${EMAIL_HINDI}                      xpath=//android.view.View[@content-desc="ईमेल"]
${MOBILE_NUMBER_HINDI}              xpath=//android.view.View[@content-desc="ईमेल"]
${SAVE_BUTTON_HINDI}                xpath=//android.view.View[@content-desc="सहेजें"]

# Edit Profile Additional Elements
${DOB_HINDI}                        xpath=//android.view.View[@content-desc="जन्म तिथि"]
${COUNTRY_HINDI}                    xpath=//android.view.View[@content-desc="देश"]
${STATE_HINDI}                      xpath=//android.view.View[@content-desc="देश"]
${DISTRICT_HINDI}                   xpath=//android.view.View[@content-desc="देश"]
${CITY_HINDI}                       xpath=//android.view.View[@content-desc="देश"]
${VILLAGE_HINDI}                    xpath=//android.view.View[@content-desc="देश"]
${EDIT_PROFILE_BACK_BUTTON}         xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView

# ===== ADDITIONAL HINDI CONTENT LOCATORS =====
# Home Page Additional Elements
${DHYANSTHALI_INSIGHT_HINDI}       xpath=//android.view.View[@content-desc="ध्यानस्थली अंतर्दृष्टि"]
${RECOMMENDED_FOR_YOU_HINDI}        xpath=//android.view.View[@content-desc="आपके लिए अनुशंसित"]

# Namkaran Form Additional Elements
${NAMKARAN_CATEGORIES_LABEL}       xpath=//android.view.View[@content-desc="नामकरण श्रेणियां *"]
${DULHAN_NAMING_BUTTON}            xpath=//android.widget.Button[@content-desc="दुल्हन का नामकरण"]
${DULHAN_NAME_DESCRIPTION}         xpath=//android.view.View[@content-desc="दुल्हन का नाम विवरण"]
${FIRST_NAME_LABEL_1}              xpath=(//android.view.View[@content-desc="पहला नाम *"])[1]
${MIDDLE_NAME_LABEL_1}             xpath=(//android.view.View[@content-desc="मध्य नाम *"])[1]
${LAST_NAME_LABEL_1}               xpath=(//android.view.View[@content-desc="अंतिम नाम *"])[1]
${DULHE_NAME_DESCRIPTION}          xpath=//android.view.View[@content-desc="दूल्हे का नाम विवरण"]
${FIRST_NAME_LABEL_2}              xpath=(//android.view.View[@content-desc="पहला नाम *"])[2]
${MARRIAGE_PLACE_LABEL}            xpath=//android.view.View[@content-desc="विवाह स्थान *"]
${EMAIL_LABEL}                     xpath=//android.view.View[@content-desc="ईमेल *"]
${PHONE_NUMBER_LABEL}              xpath=//android.view.View[@content-desc="फ़ोन नंबर *"]
${MARRIAGE_DATE_LABEL}             xpath=//android.view.View[@content-desc="विवाह तिथि *"]
${MARRIAGE_DATE_PICKER}            xpath=//android.widget.ImageView[@content-desc="विवाह तिथि चुनें"]
${MARRIAGE_PLACE_PICKER}           xpath=//android.widget.ImageView[@content-desc="विवाह स्थान चुनें"]
${NAME_OPTION_QUESTION}            xpath=//android.view.View[@content-desc="क्या आप दुल्हन के लिए नाम विकल्प प्रदान करना चाहते हैं?"]
${NO_OPTION}                       xpath=//android.view.View[@content-desc="नहीं"]
${SUBMIT_BUTTON}                   xpath=//android.view.View[@content-desc="सबमिट करें"]
${MARRIAGE_PLACE_INPUT}            xpath=//android.widget.EditText[contains(@hint,"विवाह स्थल दर्ज करें")]

# Audio Page Elements
${MUSIC_TAB_HINDI}                 xpath=//android.widget.ImageView[@content-desc="संगीत"]
${PODCAST_TAB_HINDI}               xpath=//android.widget.ImageView[@content-desc="पॉडकास्ट"]
${RADIO_TAB_HINDI}                 xpath=//android.widget.ImageView[@content-desc="रेडियो"]
${RECENT_MUSIC_HEADING}            xpath=//android.widget.ImageView[contains(@content-desc,"हाल ही में जोड़ा गया")]
${SEE_MORE_BUTTON}                 xpath=//android.view.View[contains(@content-desc,"सभी देखें")]
${WRITER_HEADING}                  xpath=//android.widget.ImageView[contains(@content-desc,"लेखक")]
${RADIO_HEADING}                   xpath=//android.widget.ImageView[contains(@content-desc,"रेडियो")]
${RECENTLY_ADDED_HEADING}          xpath=//android.view.View[@content-desc="हाल ही में जोड़ा गया"]

# News Page Elements
${NEWS_PAGE_BUTTON}                xpath=//android.widget.ImageView[@content-desc="समाचार"]
${NEWS_PAGE_TITLE}                 xpath=//android.view.View[@content-desc="समाचार"]
${GLOBAL_NEWS_TAB}                 xpath=//android.view.View[@content-desc="वैश्विक समाचार"]
${LOCAL_NEWS_TAB}                  xpath=//android.view.View[@content-desc="स्थानीय समाचार"]
${CATEGORY_BUTTON}                 xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2]
${CATEGORY_PAGE_HEADING}           xpath=//android.view.View[@content-desc="श्रेणियाँ"]

# Events Page Elements
${EVENTS_PAGE_BUTTON}              xpath=//android.widget.ImageView[@content-desc="घटनाएं"]
${EVENTS_PAGE_TITLE}               xpath=//android.view.View[@content-desc="घटनाएं"]
${GLOBAL_EVENTS_TAB}               xpath=//android.view.View[@content-desc="वैश्विक घटनाएं"]
${LOCAL_EVENTS_TAB}                xpath=//android.view.View[@content-desc="स्थानीय घटनाएं"]
${LOCAL_EVENTS_PAGE}               xpath=//android.view.View[@content-desc="स्थानीय घटनाएं"]
${FILTER_ICON}                     xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2]
${FILTER_HEADING}                  xpath=//android.view.View[@content-desc="फ़िल्टर"]
${COUNTRY_FIELD_HEADING}           xpath=//android.view.View[@content-desc="देश"]
${COUNTRY_DROPDOWN}                xpath=//android.view.View[@content-desc="देश चुनें"]
${STATE_FIELD_HEADING}             xpath=//android.view.View[@content-desc="राज्य"]
${STATE_DROPDOWN}                  xpath=//android.view.View[@content-desc="राज्य चुनें"]
${DISTRICT_HEADING}                xpath=//android.view.View[@content-desc="जिला"]
${DISTRICT_DROPDOWN}               xpath=//android.view.View[@content-desc="अपना जिला चुनें"]
${APPLY_BUTTON}                    xpath=//android.view.View[@content-desc="लागू करें"]
${CLEAR_BUTTON}                    xpath=//android.view.View[@content-desc="सभी साफ़ करें"]
${FILTER_CLOSE_BUTTON}             xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]
${EVENTS_CATEGORY_BUTTON}          xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[3]
${EVENTS_CATEGORY_HEADING}         xpath=//android.view.View[@content-desc="श्रेणियाँ"]

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
${NAMKARAN_FOURTH_CONTENT}         xpath=//android.view.View[contains(@content-desc,"आवेदन के अंत में ")]
${NAMKARAN_FIFTH_CONTENT}          xpath=//android.view.View[@content-desc="व्यवसाय के नामकरण हेतु आवेदन करते समय कृपया अपने व्यवसाय का विवरण संक्षेप में और स्पष्ट रूप से लिखें तथा व्यवसाय का पूरा पता अवश्य भरें।"]
${NAMKARAN_SUBMIT_BUTTON}          xpath=//android.view.View[@content-desc="अभी आवेदन करें"]
${NAMKARAN_AGREEMENT_MESSAGE}      xpath=//android.view.View[@content-desc="क्या आप सभी शर्तों से सहमत हैं?"]
${NAMKARAN_AGREE_BUTTON}           xpath=//android.view.View[@content-desc="मैं सहमत हूं"]

*** Keywords ***

# ===== HELPER KEYWORDS =====

Get Element Text Content
    [Documentation]    Gets the text content of an element, with graceful error handling
    [Arguments]    ${locator}    ${element_name}
    ${text_content}=    Set Variable    ${EMPTY}
    
    TRY
        ${text_content}=    Mobile Get Element Attribute    ${locator}    content-desc
        IF    "${text_content}" == "None" or "${text_content}" == ""
            ${text_content}=    Mobile Get Element Attribute    ${locator}    text
        END
        IF    "${text_content}" == "None" or "${text_content}" == ""
            ${text_content}=    Mobile Get Element Attribute    ${locator}    hint
        END
        IF    "${text_content}" == "None" or "${text_content}" == ""
            ${text_content}=    Mobile Get Element Attribute    ${locator}    resource-id
        END
        IF    "${text_content}" == "None" or "${text_content}" == ""
            ${text_content}=    Mobile Get Element Attribute    ${locator}    class
        END
        IF    "${text_content}" == "None" or "${text_content}" == ""
            ${text_content}=    Set Variable    [Element found but no text content available]
        END
    EXCEPT    AS    ${error}
        ${text_content}=    Set Variable    [Unable to get text content: ${error}]
    END
    
    Log To Console    ✅ Found ${element_name}: "${text_content}"
    [Return]    ${text_content}

Validate Element With Text Content
    [Documentation]    Validates element exists and logs its text content
    [Arguments]    ${locator}    ${element_name}
    Mobile.Wait Until Page Contains Element    ${locator}    10s
    Get Element Text Content    ${locator}    ${element_name}

# ===== MAIN TEST KEYWORDS =====

Change Language To Hindi
    [Documentation]    Checks current language and changes to Hindi if needed
    Log To Console    🔄 Checking current language...

    # Step 1: Handle app update dialog if present (check both English and Hindi)
    # First check if Hindi cancel button exists
    ${update_dialog_hindi}=    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    xpath=//android.view.View[@content-desc='रद्द करना']    5s

    IF    ${update_dialog_hindi}
        Log To Console    🔄 Closing app update dialog (Hindi)...
        Mobile.Click Element    xpath=//android.view.View[@content-desc='रद्द करना']
        Sleep    2s
    ELSE
        # Check for English cancel button
        ${update_dialog_english}=    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    xpath=//android.widget.Button[@content-desc='Cancel']    5s
        IF    ${update_dialog_english}
            Log To Console    🔄 Closing app update dialog (English)...
            Mobile.Click Element    xpath=//android.widget.Button[@content-desc='Cancel']
            Sleep    2s
        ELSE
            Log To Console    ℹ️ No update dialog found, proceeding...
        END
    END

    # Step 2: Check if app is already in Hindi by looking for Hindi navigation elements
    ${already_hindi}=    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${HOME_NAV_HINDI}    3s
    IF    ${already_hindi}
        Log To Console    ℹ️ App is already in Hindi - skipping language change
        RETURN
    END

    Log To Console    🔄 App is in English - changing to Hindi...

    # Step 3: Click on Profile icon
    Mobile.Wait Until Page Contains Element    ${PROFILE_ICON}    10s
    Mobile.Click Element    ${PROFILE_ICON}
    Sleep    3s

    # Verify we're on Profile page
    Mobile.Wait Until Page Contains Element    ${PROFILE_PAGE_TITLE}    10s

    # Step 4: Click on Language setting
    Mobile.Wait Until Page Contains Element    ${LANGUAGE_SETTING}    10s
    Mobile.Click Element    ${LANGUAGE_SETTING}
    Sleep    2s

    # Step 5: Select Hindi option
    Log To Console    🔍 Selecting Hindi language
    Mobile.Wait Until Page Contains Element    ${LANGUAGE_MODAL_TITLE}    10s
    Mobile.Wait Until Page Contains Element    ${HINDI_OPTION}    10s
    Mobile.Click Element    ${HINDI_OPTION}
    Sleep    1s

    # Step 6: Click Save button
    Log To Console    🔍 Clicking Save button
    Mobile.Wait Until Page Contains Element    ${SAVE_BUTTON}    10s
    Mobile.Click Element    ${SAVE_BUTTON}
    Sleep    3s

    Log To Console    ✅ Language successfully changed to Hindi

Revert Language To English
    [Documentation]    Reverts the app language from Hindi back to English
    Log To Console    🔄 Starting language reversion to English...
    Sleep    5s
    # Try to click Home -> Profile. If Home icon is not present, skip these clicks and
    # proceed directly to clicking the Language setting (step 1 in Hindi flow).
    ${home_present}=    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    xpath=//android.widget.ImageView[@content-desc="मुखपृष्ठ"]    3s
    IF    ${home_present}
        Mobile.Click Element   xpath=//android.widget.ImageView[@content-desc="मुखपृष्ठ"]
        Sleep    3s
        Mobile.Click Element   ${PROFILE_ICON}
    ELSE
        Log To Console    ⚠️ Home icon not found — skipping Home/Profile click and proceeding to Language setting
    END
    
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
    Validate Element With Text Content    ${EXPLORE_SECTION_TITLE}    "Explore Section Title"
    Validate Element With Text Content    ${DHYANKENDRA_HINDI}    "Dhyankendra Card"
    Validate Element With Text Content    ${DHYANSTHALI_HINDI}    "Dhyansthali Card"
    Validate Element With Text Content    ${PRAYER_HINDI}    "Prayer Card"
    Validate Element With Text Content    ${NAMKARAN_HINDI}    "Namkaran Card"
    Validate Element With Text Content    ${AUDIO_OF_DAY_HINDI}    "Audio of the Day"
    Validate Element With Text Content    ${VIEW_ALL_HINDI}    "View All Button"
    
    # Validate bottom navigation Hindi content
    Validate Element With Text Content    ${HOME_NAV_HINDI}    "Home Navigation"
    Validate Element With Text Content    ${NEWS_NAV_HINDI}    "News Navigation"
    Validate Element With Text Content    ${EXPLORE_NAV_HINDI}    "Explore Navigation"
    Validate Element With Text Content    ${EVENTS_NAV_HINDI}    "Events Navigation"
    Validate Element With Text Content    ${AUDIO_NAV_HINDI}    "Audio Navigation"
    
    # Scroll to find additional Hindi elements
    Log To Console    🔍 Scrolling to find additional Hindi elements...
    Swipe Until Element Visible    ${DHYANSTHALI_INSIGHT_HINDI}
    Validate Element With Text Content    ${DHYANSTHALI_INSIGHT_HINDI}    "Dhyansthali Insight"
    
    Swipe Until Element Visible    ${RECOMMENDED_FOR_YOU_HINDI}
    Validate Element With Text Content    ${RECOMMENDED_FOR_YOU_HINDI}    "Recommended For You"
    
    Log To Console    ✅ All Hindi content validated successfully on Home page

Validate Hindi Content On Profile Page
    [Documentation]    Validates that profile page content is displayed in Hindi
    Log To Console    🔍 Validating Hindi content on Profile page...
    
    # Navigate to profile page
    Mobile.Wait Until Page Contains Element    ${PROFILE_ICON}    10s
    Mobile.Click Element    ${PROFILE_ICON}
    Sleep    3s
    
    # Validate Hindi content elements
    Validate Element With Text Content    ${PROFILE_TITLE_HINDI}    "Profile Title"
    Validate Element With Text Content    ${GENERAL_SETTINGS_HINDI}    "General Settings"
    Validate Element With Text Content    ${LANGUAGE_HINDI}    "Language Setting"
    Validate Element With Text Content    ${LANGUAGE_DESC_HINDI}    "Language Description"
    Validate Element With Text Content    ${THEME_HINDI}    "Theme Setting"
    Validate Element With Text Content    ${THEME_DESC_HINDI}    "Theme Description"
    Validate Element With Text Content    ${EDIT_MEMBERSHIP_HINDI}    "Edit Membership"
    Validate Element With Text Content    ${EDIT_MEMBERSHIP_DESC_HINDI}    "Edit Membership Description"
    
    # Scroll the page after validation of "Edit Membership Desc Hindi"
    Log To Console    🔍 Scrolling to find additional profile elements...
    Swipe Until Element Visible    ${DELETE_ACCOUNT_HINDI}
    
    # Validate additional profile elements
    Validate Element With Text Content    ${PERMISSION_HINDI}    "Permission"
    Validate Element With Text Content    ${PRIVACY_POLICY_HINDI}    "Privacy Policy"
    Validate Element With Text Content    ${TERMS_CONDITION_HINDI}    "Terms & Condition"
    Validate Element With Text Content    ${FAQ_HINDI}    "FAQ"
    Validate Element With Text Content    ${APP_VERSION_HINDI}    "App Version"
    Validate Element With Text Content    ${DELETE_LOGOUT_HEADING_HINDI}    "Delete And Logout Heading"
    Validate Element With Text Content    ${DELETE_ACCOUNT_HINDI}    "Delete Account"
    Validate Element With Text Content    ${LOGOUT_BUTTON_HINDI}    "Logout Button"
    
    # Click on the Edit Icon
    Log To Console    🔍 Clicking on Edit Icon...
    Mobile.Wait Until Page Contains Element    ${EDIT_ICON_HINDI}    10s
    Mobile.Click Element    ${EDIT_ICON_HINDI}
    Sleep    3s
    
    # Validate Edit Profile elements
    Validate Element With Text Content    ${EDIT_PROFILE_HEADING_HINDI}    "Edit Profile Heading"
    Validate Element With Text Content    ${FIRST_NAME_HINDI}    "First Name"
    Validate Element With Text Content    ${MIDDLE_NAME_HINDI}    "Middle Name"
    Validate Element With Text Content    ${LAST_NAME_HINDI}    "Last Name"
    Validate Element With Text Content    ${EMAIL_HINDI}    "Email"
    Validate Element With Text Content    ${MOBILE_NUMBER_HINDI}    "Mobile Number"
    
    # Scroll up to Save button
    Log To Console    🔍 Scrolling to find Save button...
    Swipe Until Element Visible    ${SAVE_BUTTON_HINDI}
    
    # Validate additional edit profile elements
    Validate Element With Text Content    ${DOB_HINDI}    "DOB"
    Validate Element With Text Content    ${COUNTRY_HINDI}    "Country"
    Validate Element With Text Content    ${STATE_HINDI}    "State"
    Validate Element With Text Content    ${DISTRICT_HINDI}    "District"
    Validate Element With Text Content    ${CITY_HINDI}    "City"
    Validate Element With Text Content    ${VILLAGE_HINDI}    "Village"
    
    # Click on the Back button
    Log To Console    🔍 Clicking on Back button...
    Mobile.Wait Until Page Contains Element    ${EDIT_PROFILE_BACK_BUTTON}    10s
    Mobile.Click Element    ${EDIT_PROFILE_BACK_BUTTON}
    Sleep    2s
    
    Log To Console    ✅ All Hindi content validated successfully on Profile page

Validate Hindi Content On Explore Page
    [Documentation]    Validates Hindi content on Explore page
    Log To Console    🔍 Validating Hindi content on Explore page...
    
    # Click on Explore menu
    Mobile.Wait Until Page Contains Element    ${EXPLORE_MENU}    10s
    Mobile.Click Element    ${EXPLORE_MENU}
    Sleep    3s
    
    # Validate Explore page elements
    Validate Element With Text Content    ${EXPLORE_TITLE}    "Explore Page Title"
    Validate Element With Text Content    ${EXPLORE_DHYANKENDRA_CARD}    "Dhyankendra Card"
    Validate Element With Text Content    ${EXPLORE_DHYANSTHALI_CARD}    "Dhyansthali Card"
    Validate Element With Text Content    ${EXPLORE_PRARTHNA_CARD}    "Prarthna Card"
    Validate Element With Text Content    ${EXPLORE_NAAMKARAN_CARD}    "Naamkaran Card"
    Validate Element With Text Content    ${EXPLORE_AUDIO_CARD}    "Audio Card"
    Validate Element With Text Content    ${EXPLORE_DAAN_CARD}    "Daan Card"
    
    Log To Console    ✅ All Hindi content validated successfully on Explore page

Validate Hindi Content On Dhyankendra Page
    [Documentation]    Validates Hindi content on Dhyankendra page
    Log To Console    🔍 Validating Hindi content on Dhyankendra page...

    # Click on Dhyankendra card
    Mobile.Wait Until Page Contains Element    ${EXPLORE_DHYANKENDRA_CARD}    10s
    Mobile.Click Element    ${EXPLORE_DHYANKENDRA_CARD}
    Sleep    3s

    # Check if membership dialog appears and close it
    ${membership_dialog}=    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    xpath=//android.view.View[@content-desc='रद्द करना']    5s
    IF    ${membership_dialog}
        Log To Console    ⚠️ Membership dialog detected - closing it and skipping Dhyankendra validation
        Mobile.Click Element    xpath=//android.view.View[@content-desc='रद्द करना']
        Sleep    2s
        # Go back to Explore page
        Mobile.Click Element    ${BACK_BUTTON_GENERIC}
        Sleep    2s
        Log To Console    ✅ Dhyankendra page skipped due to membership requirement
        RETURN
    END

    # Validate Dhyankendra page elements
    Validate Element With Text Content    ${DHYANKENDRA_PAGE_TITLE}    "Dhyankendra Page Title"
    Validate Element With Text Content    ${DHYANKENDRA_MESSAGE}    "Dhyankendra Message"
    Validate Element With Text Content    ${DHYANKENDRA_REGISTRATION_BUTTON}    "Registration Button"
    Validate Element With Text Content    ${DHYANKENDRA_LIST_BUTTON}    "List Button"
    Validate Element With Text Content    ${DHYANKENDRA_MAP_BUTTON}    "Map Button"
    
    # Click on Registration button and validate form
    Mobile.Click Element    ${DHYANKENDRA_REGISTRATION_BUTTON}
    Sleep    3s
    
    # Validate form elements
    Validate Element With Text Content    ${FORM_HEADING}    "Form Heading"
    Validate Element With Text Content    ${CENTER_NAME_LABEL}    "Center Name Label"
    Validate Element With Text Content    ${CENTER_NAME_PLACEHOLDER}    "Center Name Placeholder"
    Validate Element With Text Content    ${CENTER_TYPE_LABEL}    "Center Type Label"
    Validate Element With Text Content    ${TYPE_DROPDOWN_PLACEHOLDER}    "Type Dropdown Placeholder"
    Validate Element With Text Content    ${OWNER_LABEL}    "Owner Label"
    Validate Element With Text Content    ${OWNER_DROPDOWN}    "Owner Dropdown"
    Validate Element With Text Content    ${SEATING_CAPACITY_LABEL}    "Seating Capacity Label"
    Validate Element With Text Content    ${SEATING_CAPACITY_INPUT}    "Seating Capacity Input"
    
    # Click back button
    Mobile.Click Element    ${BACK_BUTTON_GENERIC}
    Sleep    2s
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

    # Validate Prarthna page title
    Validate Element With Text Content    ${PRARTHNA_PAGE_TITLE}    "Prarthna Page Title"

    # Check if page has empty state (no prayers submitted yet)
    ${empty_state}=    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    xpath=//android.view.View[@content-desc="आप अपनी प्रार्थना यहाँ पंजीकृत कर सकते हैं।"]    3s

    IF    ${empty_state}
        Log To Console    ℹ️ Prarthna page is empty - validating empty state message
        Validate Element With Text Content    xpath=//android.view.View[@content-desc="आप अपनी प्रार्थना यहाँ पंजीकृत कर सकते हैं।"]    "Empty State Message"
    ELSE
        # Page has prayers - validate prayer list elements
        Log To Console    ℹ️ Prarthna page has content - validating prayer list
        Validate Element With Text Content    ${PRARTHNA_PAGE_HEADING}    "Prarthna Page Heading"
        Validate Element With Text Content    ${PRARTHNA_ID_LABEL}    "Prayer ID Label"
        Validate Element With Text Content    ${PRARTHNA_CATEGORY_LABEL}    "Category Label"
    END

    # Click on Add button
    Mobile.Click Element    ${PRARTHNA_ADD_BUTTON}
    Sleep    3s
    
    # Validate Add form elements
    Validate Element With Text Content    ${EMERGENCY_CALL_LABEL}    "Emergency Call Label"
    Validate Element With Text Content    ${PRAYER_FOR_WHOM_TITLE}    "Prayer For Whom Title"
    Validate Element With Text Content    ${PRAYER_FOR_WHOM_HEADING}    "Prayer For Whom Heading"
    Validate Element With Text Content    ${PRAYER_NAME_LABEL}    "Prayer Name Label"
    Validate Element With Text Content    ${PRAYER_PLACE_LABEL}    "Prayer Place Label"
    Validate Element With Text Content    ${PRAYER_EMAIL_LABEL}    "Prayer Email Label"
    Validate Element With Text Content    ${PRAYER_TYPE_LABEL}    "Prayer Type Label"
    
    # Get and print tooltip message
    ${tooltip_text}=    Get Element Text Content    ${TOOLTIP_MESSAGE}    "Tooltip Message"
    
    # Click on the Select Category Fields just to Close the Tooltip
    Mobile.Click Element    xpath=//android.view.View[@content-desc="श्रेणी चुनें"]
    Sleep    2s

    Swipe Until Element Visible    ${PRAYER_DOB_LABEL}
    
    # Validate scrolled elements
    Validate Element With Text Content    ${PRAYER_FOR_WHOM_LABEL}    "Prayer For Whom Label"
    Validate Element With Text Content    ${PRAYER_FOR_WHOM_NAME_LABEL}    "Prayer For Whom Name Label"
    Validate Element With Text Content    ${PRAYER_FOR_WHOM_PLACE_LABEL}    "Prayer For Whom Place Label"
    Validate Element With Text Content    ${PRAYER_ADDRESS_LABEL}    "Prayer Address Label"
    Validate Element With Text Content    ${PRAYER_DOB_LABEL}    "Prayer DOB Label"
    Validate Element With Text Content    ${PRAYER_DESCRIPTION_LABEL}    "Prayer Description Label"
    
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
    Validate Element With Text Content    ${NAMKARAN_PAGE_TITLE}    "Namkaran Page Title"
    Validate Element With Text Content    ${NAMKARAN_PAGE_HEADING}    "Namkaran Page Heading"
    Validate Element With Text Content    ${NAMKARAN_ID_LABEL}    "Namkaran ID Label"
    Validate Element With Text Content    ${NAMKARAN_CATEGORY_LABEL}    "Category Label"
    
    # Click on Add button
    Mobile.Click Element    ${NAMKARAN_ADD_BUTTON}
    Sleep    3s
    
    # Validate form elements
    Validate Element With Text Content    ${NAMKARAN_FORM_TITLE}    "Namkaran Form Title"
    Validate Element With Text Content    ${NAMKARAN_CONTENT_HEADING}    "Content Heading"
    Validate Element With Text Content    ${NAMKARAN_SECOND_CONTENT}    "Second Content"
    Validate Element With Text Content    ${NAMKARAN_THIRD_CONTENT}    "Third Content"
    Validate Element With Text Content    ${NAMKARAN_FOURTH_CONTENT}    "Fourth Content"
    Validate Element With Text Content    ${NAMKARAN_FIFTH_CONTENT}    "Fifth Content"
    
    # Get and print content text
    ${first_content_text}=    Get Element Text Content    ${NAMKARAN_FIRST_CONTENT}    "First Content Text"
    ${second_content_text}=    Get Element Text Content    ${NAMKARAN_SECOND_CONTENT}    "Second Content Text"
    ${third_content_text}=    Get Element Text Content    ${NAMKARAN_THIRD_CONTENT}    "Third Content Text"
    ${fourth_content_text}=    Get Element Text Content    ${NAMKARAN_FOURTH_CONTENT}    "Fourth Content Text"
    ${fifth_content_text}=    Get Element Text Content    ${NAMKARAN_FIFTH_CONTENT}    "Fifth Content Text"
    
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

    # Validate Namkaran Form Data
    Log To Console    🔍 Validating Namkaran form data...
    
    # Validate form elements
    Validate Element With Text Content    xpath=//android.view.View[@content-desc="नामकरण"]    "Namkaran Form Title"
    Validate Element With Text Content    ${NAMKARAN_CATEGORIES_LABEL}    "Namkaran Categories Label"
    Validate Element With Text Content    ${DULHAN_NAMING_BUTTON}    "Dulhan Naming Button"
    Validate Element With Text Content    ${DULHAN_NAME_DESCRIPTION}    "Dulhan Name Description"
    Validate Element With Text Content    ${FIRST_NAME_LABEL_1}    "First Name Label 1"
    Validate Element With Text Content    ${MIDDLE_NAME_LABEL_1}    "Middle Name Label 1"
    Validate Element With Text Content    ${DULHE_NAME_DESCRIPTION}    "Dulhe Name Description"
    Validate Element With Text Content    ${FIRST_NAME_LABEL_2}    "First Name Label 2"
    
    # Scroll until Marriage Place element is found
    Log To Console    🔍 Scrolling to find Marriage Place element...
    Swipe Until Element Visible    ${MARRIAGE_PLACE_LABEL}
    Validate Element With Text Content    ${MARRIAGE_PLACE_LABEL}    "Marriage Place Label"
    
    # Validate additional form elements after scrolling
    Validate Element With Text Content    ${EMAIL_LABEL}    "Email Label"
    Validate Element With Text Content    ${PHONE_NUMBER_LABEL}    "Phone Number Label"
    Validate Element With Text Content    ${MARRIAGE_DATE_LABEL}    "Marriage Date Label"
    Validate Element With Text Content    ${MARRIAGE_DATE_PICKER}    "Marriage Date Picker"
    Validate Element With Text Content    ${MARRIAGE_PLACE_INPUT}    "Marriage Place Input"
    
    # Scroll until Submit Button element is found for the remaining elements
    Log To Console    🔍 Scrolling to find Submit Button element for remaining form elements...
    Swipe Until Element Visible    ${SUBMIT_BUTTON}
    Validate Element With Text Content    ${SUBMIT_BUTTON}    "Submit Button"
    
    # Validate remaining form elements that require additional scrolling
    Validate Element With Text Content    ${NAME_OPTION_QUESTION}    "Name Option Question"
    Validate Element With Text Content    ${NO_OPTION}    "No Option"
    Validate Element With Text Content    ${SUBMIT_BUTTON}    "Submit Button"
    
    Log To Console    ✅ All Namkaran form data validation completed

    # Click back button 3 times
    FOR    ${i}    IN RANGE    0    2
        Mobile.Click Element    ${BACK_BUTTON_GENERIC}
        Sleep    2s
    END
    
    Log To Console    ✅ All Hindi content validated successfully on Namkaran page

Validate Hindi Content On Audio Page
    [Documentation]    Validates Hindi content on Audio page
    Log To Console    🔍 Validating Hindi content on Audio page...
    
    # Click on Audio Card
    Mobile.Wait Until Page Contains Element    ${EXPLORE_AUDIO_CARD}    10s
    Mobile.Click Element    ${EXPLORE_AUDIO_CARD}
    Sleep    3s
    
    # Validate Audio page tabs
    Validate Element With Text Content    ${MUSIC_TAB_HINDI}    "Music Tab"
    Validate Element With Text Content    ${PODCAST_TAB_HINDI}    "Podcast Tab"
    Validate Element With Text Content    ${RADIO_TAB_HINDI}    "Radio Tab"
    
    # Validate Recent Music Heading
    Validate Element With Text Content    ${RECENT_MUSIC_HEADING}    "Recent Music Heading"
    
    # Swipe until See More button is found
    Log To Console    🔍 Scrolling to find See More button...
    Swipe Until Element Visible    ${SEE_MORE_BUTTON}
    Validate Element With Text Content    ${SEE_MORE_BUTTON}    "See More Button"
    
    # Validate scrolled elements
    Validate Element With Text Content    ${WRITER_HEADING}    "Writer Heading"
    Validate Element With Text Content    ${SEE_MORE_BUTTON}    "See More Button"
    Validate Element With Text Content    ${RADIO_HEADING}    "Radio Heading"
    
    #Click on the Explore Menu
    Mobile.Wait Until Page Contains Element    ${EXPLORE_MENU}    10s
    Mobile.Click Element    ${EXPLORE_MENU}
    Sleep    3s
    
    # Click on Audio Card again
    Mobile.Wait Until Page Contains Element    ${EXPLORE_AUDIO_CARD}    10s
    Mobile.Click Element    ${EXPLORE_AUDIO_CARD}
    Sleep    3s
    Log To Console    ✅ Clicked on Audio card again
    
    # Switch to Podcast tab
    Mobile.Wait Until Page Contains Element    ${PODCAST_TAB_HINDI}    10s
    Mobile.Click Element    ${PODCAST_TAB_HINDI}
    Sleep    2s
    Log To Console    ✅ Switched to Podcast tab
    
    # Validate Recently Added heading on Podcast tab
    Validate Element With Text Content    ${RECENTLY_ADDED_HEADING}    "Recently Added Heading"
    
    # Click on Explore button again
    Mobile.Wait Until Page Contains Element    ${EXPLORE_MENU}    10s
    Mobile.Click Element    ${EXPLORE_MENU}
    Sleep    3s

    #Back to Home Page
    Mobile.Wait Until Page Contains Element    ${HOME_NAV_HINDI}    5s
    Mobile.Click Element    ${HOME_NAV_HINDI}
    Sleep    3s
    Log To Console    ✅ Clicked on Home page button

    Log To Console    ✅ All Hindi content validated successfully on Audio page

Validate Hindi Content On News Page
    [Documentation]    Validates Hindi content on News page
    Log To Console    🔍 Validating Hindi content on News page...
    
    # Click on News Page button
    Mobile.Wait Until Page Contains Element    ${NEWS_PAGE_BUTTON}    10s
    Mobile.Click Element    ${NEWS_PAGE_BUTTON}
    Sleep    3s
    Log To Console    ✅ Clicked on News page button
    
    # Validate News page elements
    Validate Element With Text Content    ${NEWS_PAGE_TITLE}    "News Page Title"
    Validate Element With Text Content    ${GLOBAL_NEWS_TAB}    "Global News Tab"
    Validate Element With Text Content    ${LOCAL_NEWS_TAB}    "Local News Tab"
    
    # Click on Category Button
    Mobile.Wait Until Page Contains Element    ${CATEGORY_BUTTON}    10s
    Mobile.Click Element    ${CATEGORY_BUTTON}
    Sleep    3s
    Log To Console    ✅ Clicked on Category button
    
    # Validate Category Page Heading
    Validate Element With Text Content    ${CATEGORY_PAGE_HEADING}    "Category Page Heading"
    
    Log To Console    ✅ All Hindi content validated successfully on News page

Validate Hindi Content On Events Page
    [Documentation]    Validates Hindi content on Events page
    Log To Console    🔍 Validating Hindi content on Events page...
    
    # Click on Events Page Button
    Mobile.Wait Until Page Contains Element    ${EVENTS_PAGE_BUTTON}    10s
    Mobile.Click Element    ${EVENTS_PAGE_BUTTON}
    Sleep    3s
    Log To Console    ✅ Clicked on Events page button
    
    # Validate Events page elements
    Validate Element With Text Content    ${EVENTS_PAGE_TITLE}    "Events Page Title"
    Validate Element With Text Content    ${GLOBAL_EVENTS_TAB}    "Global Events Tab"
    Validate Element With Text Content    ${LOCAL_EVENTS_TAB}    "Local Events Tab"
    
    # Click on Local Event Page
    Mobile.Wait Until Page Contains Element    ${LOCAL_EVENTS_PAGE}    10s
    Mobile.Click Element    ${LOCAL_EVENTS_PAGE}
    Sleep    5s
    Log To Console    ✅ Clicked on Local Event page
    
    # Click on Filter icon
    Mobile.Wait Until Page Contains Element    ${FILTER_ICON}    10s
    Mobile.Click Element    ${FILTER_ICON}
    Sleep    3s
    Log To Console    ✅ Clicked on Filter icon
    
    # Validate filter fields
    Validate Element With Text Content    ${FILTER_HEADING}    "Filter Heading"
    Validate Element With Text Content    ${COUNTRY_FIELD_HEADING}    "Country Field Heading"
    Validate Element With Text Content    ${COUNTRY_DROPDOWN}    "Country Dropdown"
    Validate Element With Text Content    ${STATE_FIELD_HEADING}    "State Field Heading"
    Validate Element With Text Content    ${STATE_DROPDOWN}    "State Dropdown"
    Validate Element With Text Content    ${DISTRICT_HEADING}    "District Heading"
    Validate Element With Text Content    ${DISTRICT_DROPDOWN}    "District Dropdown"
    Validate Element With Text Content    ${APPLY_BUTTON}    "Apply Button"
    Validate Element With Text Content    ${CLEAR_BUTTON}    "Clear Button"
    
    # Click on close button
    Mobile.Wait Until Page Contains Element    ${FILTER_CLOSE_BUTTON}    10s
    Mobile.Click Element    ${FILTER_CLOSE_BUTTON}
    Sleep    2s
    Log To Console    ✅ Clicked on close button
    
    # Click on Category Button
    Mobile.Wait Until Page Contains Element    ${EVENTS_CATEGORY_BUTTON}    10s
    Mobile.Click Element    ${EVENTS_CATEGORY_BUTTON}
    Sleep    3s
    Log To Console    ✅ Clicked on Category button
    
    # Validate Events Category Page heading
    Validate Element With Text Content    ${EVENTS_CATEGORY_HEADING}    "Events Category Page Heading"
    
    Log To Console    ✅ All Hindi content validated successfully on Events page

    Mobile.Click Element    ${HOME_NAV_HINDI}
    Log To Console    ✅ Back to Home page button

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

    #Validate News Page Hindi Content
    Validate Hindi Content On News Page

    #Validate Events Page Hindi Content
    Validate Hindi Content On Events Page

    #Validate Audio Page Hindi Content
    Validate Hindi Content On Audio Page

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
