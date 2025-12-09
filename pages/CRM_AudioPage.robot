*** Settings ***
Resource   ../resources/libraries.robot
Resource   ../resources/web_keywords.robot

*** Variables ***
# Login Page Elements
${EMAIL_FIELD}                    name=email
${PASSWORD_FIELD}                 name=password
${LOGIN_BUTTON}                   id=:r4:
${DASHBOARD_TEXT}                 Dashboard

# Audio Menu Elements
${AUDIO_MENU}                     xpath=//span[contains(text(),'Audio')]
${MUSIC_SUBMENU}                  xpath=//span[contains(text(),'Music')]

# Add Music Elements
${ADD_MUSIC_BUTTON}               xpath=//a[contains(text(),'Add')]
${CATEGORY_DROPDOWN}              xpath=(//div[@aria-haspopup="listbox"])[1]
${SUB_CATEGORY_DROPDOWN}          xpath=(//div[@aria-haspopup="listbox"])[2]
${ENGLISH_TITLE_FIELD}            xpath=//input[@name="langTrackFields.0.title"]
${ENGLISH_DESCRIPTION_FIELD}      xpath=//input[@name="langTrackFields.0.description"]
${ENGLISH_AUTHOR_DROPDOWN}        xpath=(//div[@aria-haspopup="listbox"])[3]
${ENGLISH_TAGS_FIELD}             xpath=(//input[@placeholder="+ Tags"])[1]
${ENGLISH_THUMBNAIL_UPLOAD}       xpath=(//input[@type='file' and @accept='image/jpeg,image/png'])[1]
${ENGLISH_AUDIO_FILE_UPLOAD}      xpath=(//input[@type='file' and @accept='audio/*'])[1]
${HINDI_TITLE_FIELD}              xpath=//input[@name="langTrackFields.1.title"]
${HINDI_DESCRIPTION_FIELD}        xpath=//input[@name="langTrackFields.1.description"]
${HINDI_AUTHOR_DROPDOWN}          xpath=(//div[@aria-haspopup="listbox"])[4]
${HINDI_TAGS_FIELD}               xpath=(//input[@placeholder="+ Tags"])[2]
${HINDI_THUMBNAIL_UPLOAD}         xpath=(//input[@type='file' and @accept='image/jpeg,image/png'])[2]
${HINDI_AUDIO_FILE_UPLOAD}        xpath=(//input[@type='file' and @accept='audio/*'])[2]
${PUBLISH_STATUS_DROPDOWN}        xpath=(//div[@aria-haspopup="listbox"])[5]
${PUBLISH_DATE_FIELD}             xpath=//input[@id=':r4c:']
${RESET_BUTTON}                   xpath=//button[contains(text(),"Reset")]
${ADD_BUTTON}                     xpath=//button[contains(@class,'MuiButton-contained') and contains(text(),'Add')]
${CANCEL_BUTTON}                  xpath=//a[normalize-space()='Cancel']
${UPLOAD_BUTTON}                  xpath=//button[@type='submit']
${UPLOAD_SUCCESS_MESSAGE}         xpath=//div[contains(@class,'minimal__snackbar__title') and contains(text(),'Track added successfully')]

# Test Data
${TEST_MUSIC_CATEGORY}            Bhajann
${TEST_MUSIC_SUB_CATEGORY}        Guru Ki Rah
${TEST_ENGLISH_TITLE}             Integration Test Music English
${TEST_ENGLISH_DESCRIPTION}       This is a test music created for integration testing in English
${TEST_ENGLISH_AUTHOR}            Guruma
${TEST_ENGLISH_TAGS}              TestMusic1, TestMusic2, TestMusic3
${TEST_HINDI_TITLE}               एकीकरण परीक्षण संगीत हिंदी
${TEST_HINDI_DESCRIPTION}         यह एकीकरण परीक्षण के लिए बनाया गया परीक्षण संगीत है
${TEST_HINDI_AUTHOR}              गुरुमाँ
${TEST_HINDI_TAGS}                परीक्षण, एकीकरण, संगीत
${TEST_PUBLISH_STATUS}            Publish
${TEST_PUBLISH_DATE}              25/12/2024

# Test File Paths
${ENGLISH_THUMBNAIL_FILE}         ${EXECDIR}/test_data/English_thumbnail.jpg
${ENGLISH_AUDIO_FILE}             ${EXECDIR}/test_data/English_sample-12s.mp3
${HINDI_THUMBNAIL_FILE}           ${EXECDIR}/test_data/Hindi_thumbnail.jpg
${HINDI_AUDIO_FILE}               ${EXECDIR}/test_data/Hindi_sample-15s.mp3

# Delete Music Elements
${THREE_DOT_MENU}                 xpath=//button[@aria-label='More']
${DELETE_OPTION}                  xpath=//li[contains(text(),'Delete')]
${DELETE_CONFIRMATION_DIALOG}     xpath=//div[contains(@class,'MuiDialog')]
${DELETE_CONFIRMATION_TITLE}      xpath=//h2[contains(text(),'Delete Confirmation')]
${DELETE_BUTTON}                   xpath=//button[contains(text(),'Delete') and @type='button']
${CANCEL_BUTTON_DELETE}           xpath=//button[contains(text(),'Cancel')]

# Mobile App Elements
${MOBILE_MUSIC_LOCATOR}           xpath=//android.view.View[contains(@content-desc,'${TEST_ENGLISH_TITLE}')]

*** Keywords ***


Login in with Sanchalak credentials
    [Documentation]    Logs in to web application with Sanchalak credentials
    Web Wait Until Page Contains Element    ${EMAIL_FIELD}    10s
    Web Input Text    ${EMAIL_FIELD}    patilvaishub@gmail.com
    Web Input Password    ${PASSWORD_FIELD}    Lavanya@21
    Web Click Button    ${LOGIN_BUTTON}
    Sleep    5s
    Log To Console    ✅ Sanchalak logged in successfully

Login in with Harsh Sanchalak credentials
    [Documentation]    Logs in to web application with Harsh Sanchalak credentials
    Web Wait Until Page Contains Element    ${EMAIL_FIELD}    10s
    Web Input Text    ${EMAIL_FIELD}    harsh.rathod@rysun.com
    Web Input Password    ${PASSWORD_FIELD}    Admin@123
    Web Click Button    ${LOGIN_BUTTON}
    Web Wait Until Page Contains    ${DASHBOARD_TEXT}    10s

Click on the Audio Menu
    [Documentation]    Clicks on the Audio menu in the web application
    Web Wait Until Page Contains Element    ${AUDIO_MENU}    10s
    Web Click Element    ${AUDIO_MENU}

Click on the Music Submenu
    [Documentation]    Clicks on the Music submenu under Audio with fallback locators
    TRY
        Web Wait Until Page Contains Element    ${MUSIC_SUBMENU}    15s
        Web Click Element    ${MUSIC_SUBMENU}
        Log To Console    ✅ Clicked Music submenu using primary locator
    EXCEPT
        Log To Console    ⚠️ Primary Music submenu locator failed, trying alternatives...
        TRY
            # Try alternative xpath with exact match
            Web Wait Until Page Contains Element    xpath=//span[text()='Music']    10s
            Web Click Element    xpath=//span[text()='Music']
            Log To Console    ✅ Clicked Music submenu using exact text match
        EXCEPT
            # Try alternative with link/anchor element
            TRY
                Web Wait Until Page Contains Element    xpath=//a[contains(text(),'Music')]    10s
                Web Click Element    xpath=//a[contains(text(),'Music')]
                Log To Console    ✅ Clicked Music submenu using link locator
            EXCEPT
                # Final fallback - try by role
                Web Wait Until Page Contains Element    xpath=//*[@role='menuitem' and contains(.,'Music')]    10s
                Web Click Element    xpath=//*[@role='menuitem' and contains(.,'Music')]
                Log To Console    ✅ Clicked Music submenu using role-based locator
            END
        END
    END

Click on the Add Music button
    [Documentation]    Clicks on the Add Music button to create new music
    Web Wait Until Page Contains Element    ${ADD_MUSIC_BUTTON}    10s
    Web Click Element    ${ADD_MUSIC_BUTTON}

Fill the form with valid data to add a new music
    [Documentation]    Fills the music form with test data based on the actual form structure
    Sleep    2s
    # Fill General Music Details
    Web Wait Until Page Contains Element    ${CATEGORY_DROPDOWN}    2s
    Web Click Element    ${CATEGORY_DROPDOWN}
    Sleep    2s
    Web Wait Until Page Contains Element    xpath=//li[@data-value="9"]    5s
    Web Click Element    xpath=//li[@data-value="9"]

    Web Click Element    ${SUB_CATEGORY_DROPDOWN}
    Web Wait Until Page Contains Element    xpath=//li[contains(text(),'${TEST_MUSIC_SUB_CATEGORY}')]    5s
    Web Click Element    xpath=//li[contains(text(),'${TEST_MUSIC_SUB_CATEGORY}')]

    # Fill English Track Details
    Web Input Text    ${ENGLISH_TITLE_FIELD}    ${TEST_ENGLISH_TITLE}
    Web Input Text    ${ENGLISH_DESCRIPTION_FIELD}    ${TEST_ENGLISH_DESCRIPTION}
    Web Input Text    ${ENGLISH_TAGS_FIELD}    ${TEST_ENGLISH_TAGS}
    Web Click Element    ${ENGLISH_AUTHOR_DROPDOWN}
    Web Wait Until Page Contains Element    xpath=//li[contains(text(),'${TEST_ENGLISH_AUTHOR}')]    5s
    Web Click Element    xpath=//li[contains(text(),'${TEST_ENGLISH_AUTHOR}')]

    # Upload English files
    Web Choose File    ${ENGLISH_THUMBNAIL_UPLOAD}    ${ENGLISH_THUMBNAIL_FILE}
    Web Choose File    ${ENGLISH_AUDIO_FILE_UPLOAD}   ${ENGLISH_AUDIO_FILE}

    # Fill Hindi Track Details
    Web Input Text    ${HINDI_TITLE_FIELD}    ${TEST_HINDI_TITLE}
    Web Input Text    ${HINDI_DESCRIPTION_FIELD}    ${TEST_HINDI_DESCRIPTION}

    Web Click Element    ${HINDI_AUTHOR_DROPDOWN}
    Web Wait Until Page Contains Element    xpath=//li[contains(text(),'${TEST_HINDI_AUTHOR}')]    5s
    Web Click Element    xpath=//li[contains(text(),'${TEST_HINDI_AUTHOR}')]

    # Web Wait Until Page Contains Element    ${HINDI_TAGS_FIELD}    5s
    # Web Click Element    ${HINDI_TAGS_FIELD}

    # Web Input Text    ${HINDI_TAGS_FIELD}    ${TEST_HINDI_TAGS}

    # Upload Hindi files
    Web Choose File    ${HINDI_THUMBNAIL_UPLOAD}      ${HINDI_THUMBNAIL_FILE}
    Web Choose File    ${HINDI_AUDIO_FILE_UPLOAD}     ${HINDI_AUDIO_FILE}

    # Set Publish Status
    Web Click Element    ${PUBLISH_STATUS_DROPDOWN}
    Web Wait Until Page Contains Element    xpath=//li[contains(text(),'${TEST_PUBLISH_STATUS}')]    5s
    Web Click Element    xpath=//li[contains(text(),'${TEST_PUBLISH_STATUS}')]

    # Set Publish Date
    Web Input Text    ${PUBLISH_DATE_FIELD}    ${TEST_PUBLISH_DATE}

    # Submit the form
    Web Click Button    ${UPLOAD_BUTTON}
    # Web Wait Until Page Contains    ${UPLOAD_SUCCESS_MESSAGE}    10s

Click on the Upload button
    [Documentation]    Clicks on the Upload button to submit the form
    Web Click Button    ${UPLOAD_BUTTON}
    Log To Console    📤 Clicked on Upload button

Wait For Data Sync
    [Documentation]    Waits for data to sync between web and mobile
    [Arguments]    ${timeout}=30s
    Sleep    5s
    Log To Console    Waiting for data sync (${timeout})...
    Sleep    ${timeout}

Login To Mobile App
    [Documentation]    Logs in to mobile app if required
    # Click on the input field
    Enter the validate and exist email address
    Click on the Login Button
    Enter Email OTP Manually
    Click on the Verify Button
    Verify Home Screen is Displayed

Verify Music Appears On Mobile
    [Documentation]    Verifies that music created via web appears on mobile
    [Arguments]    ${music_title}
    Mobile Wait Until Element Is Visible    ${MOBILE_MUSIC_LOCATOR}    15s
    Mobile Page Should Contain Element    ${MOBILE_MUSIC_LOCATOR}
    Log To Console    Music "${music_title}" found on mobile app

Create Test Files If Not Exist
    [Documentation]    Creates test files for upload if they don't exist
    ${test_data_dir}=    Set Variable    ${EXECDIR}/test_data
    Run Keyword And Ignore Error    Create Directory    ${test_data_dir}

    # Create dummy image files (1x1 pixel JPG)
    ${dummy_image}=    Set Variable    /9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCAABAAEDASIAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAv/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAX/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxAAPwA/8A
    Create File    ${ENGLISH_THUMBNAIL_FILE}    ${dummy_image}
    Create File    ${HINDI_THUMBNAIL_FILE}    ${dummy_image}

    # Create dummy audio files (empty MP3 header)
    ${dummy_audio}=    Set Variable    ID3
    Create File    ${ENGLISH_AUDIO_FILE}    ${dummy_audio}
    Create File    ${HINDI_AUDIO_FILE}    ${dummy_audio}

