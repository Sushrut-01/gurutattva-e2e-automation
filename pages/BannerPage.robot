*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot
Library    DateTime
Resource   ../resources/web_keywords.robot
Resource    ../pages/CRM_AudioPage.robot

*** Variables ***
${BANNER_MENU}                          xpath=//span[contains(text(),'Banners')]
${BANNER_LANGUAGE_DROPDOWN}             xpath=//button[@role='tab' and contains(text(),'English')]
${BANNER_LANGUAGE_HINDI}                xpath=//button[@role='tab' and contains(text(),'Hindi')]
${ADD_BANNER_BUTTON}                    xpath=//a[contains(text(),'Add')]
${BANNER_TYPE_DROPDOWN}                 xpath=//div[@role='combobox' and normalize-space()='Top']
${BANNER_TYPE_TOP}                      xpath=//li[@role='option' and normalize-space()='Top']
${BANNER_TYPE_MIDDLE}                   xpath=//li[@role='option' and normalize-space()='Advertisement']
${BANNER_TITLE_FIELD}                   xpath=//input[@name='multiLanguageContent.0.title']
${BANNER_DESCRIPTION_FIELD}             xpath=//input[@name='multiLanguageContent.0.description']
${BANNER_IMAGE_UPLOAD}                  xpath=//input[@type='file' and @accept='image/jpeg,image/png']
${BANNER_PUBLISH_STATUS_DROPDOWN}       xpath=(//div[@aria-haspopup="listbox"])[2]
${BANNER_PUBLISH_STATUS}                xpath=//li[@role='option' and normalize-space()='Publish']
${BANNER_UNPUBLISH_STATUS}              xpath=//li[@role='option' and normalize-space()='Unpublish']
${BANNER_PUBLISH_DATE_FIELD}            xpath=//input[@name='publishDate' and @placeholder='DD/MM/YYYY']
${BANNER_CHOOSE_DATE_BUTTON}            xpath=//button[@aria-label='Choose date']
${BANNER_PUBLISH_DATE_BUTTON}           xpath=//button[contains(@class,'MuiPickersDay-today')]
${BANNER_SUBMIT_BUTTON}                 xpath=//button[normalize-space()='Submit']
${BANNER_SUCCESS_MESSAGE}               xpath=//li[contains(@class,'minimal__snackbar__success')]//div[contains(@class,'minimal__snackbar__title') and contains(text(),'Banner added successfully.')]
${CREATE_BANNER_TITLE}                  xpath=//p[contains(text(),'${E2E_BANNER_TITLE}')]
${CREATE_HINDI_BANNER_TITLE}            xpath=//p[contains(text(),'${E2E_HINDI_BANNER_TITLE}')]
${HINDI_BANNER_TITLE_FIELD}             xpath=//input[@name='multiLanguageContent.1.title']
${HINDI_BANNER_DESCRIPTION_FIELD}       xpath=//input[@name='multiLanguageContent.1.description']
${HINDI_BANNER_IMAGE_UPLOAD}            xpath=//input[@type='file' and @accept='image/jpeg,image/png']
${BANNER_IMAGE_UPLOAD_ERROR}            xpath=//div[normalize-space()='File cannot exceed the upload size limit 5 MB']



# Test File Paths for Banner Images
${ENGLISH_THUMBNAIL_FILE}         ${EXECDIR}/test_data/English_thumbnail.jpg
${HINDI_THUMBNAIL_FILE}           ${EXECDIR}/test_data/Hindi_thumbnail.jpg
${LARGE_IMAGE_FILE}              ${EXECDIR}/test_data/large_image.jpg

${E2E_BANNER_TITLE}          ${EMPTY}
${E2E_BANNER_DESCRIPTION}    ${EMPTY}
${E2E_HINDI_BANNER_TITLE}          ${EMPTY}
${E2E_HINDI_BANNER_DESCRIPTION}    ${EMPTY}

${E2E_BANNER_RANDOM_NUMBER_SECOND}    ${EMPTY}
${E2E_BANNER_TITLE_SECOND}             ${EMPTY}
${E2E_BANNER_DESCRIPTION_SECOND}       ${EMPTY}
${E2E_BANNER_RANDOM_NUMBER_THIRD}    ${EMPTY}
${E2E_BANNER_TITLE_THIRD}             ${EMPTY}
${E2E_BANNER_DESCRIPTION_THIRD}       ${EMPTY}




# Mobile Banner Locators
${BANNER_TITLE}              xpath=//android.view.View[contains(@content-desc,'E2E')]
${BANNER_DESCRIPTION_TEXT}   xpath=//android.view.View[contains(@content-desc,'E2E_Banner_Description')]
${BANNER_TITLE_SECOND}      xpath=//android.view.View[contains(@content-desc,'${E2E_BANNER_TITLE_THIRD}')]  

*** Keywords ***
Generate E2E Test Data for Banner
    [Documentation]    Generates unique test data for end-to-end validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    Set Test Variable    ${E2E_BANNER_RANDOM_NUMBER}     ${random_num}
    Set Test Variable    ${E2E_BANNER_TITLE}    E2E_Banner_Title_${random_num}
    Set Test Variable    ${E2E_BANNER_DESCRIPTION}       E2E_Banner_Description_${random_num}
    Log To Console    🎯 Generated Test Data for Banner:
    Log To Console    🎯 Banner Title: ${E2E_BANNER_TITLE}
    Log To Console    🎯 Banner Description: ${E2E_BANNER_DESCRIPTION}


Generate E2E Test Data for Second Banner
    [Documentation]    Generates unique test data for end-to-end validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    Set Test Variable    ${E2E_BANNER_RANDOM_NUMBER_SECOND}     ${random_num}
    Set Test Variable    ${E2E_BANNER_TITLE_SECOND}    E2E_Banner_Title_Second_${random_num}
    Set Test Variable    ${E2E_BANNER_DESCRIPTION_SECOND}       E2E_Banner_Description_Second_${random_num}
    Log To Console    🎯 Generated Test Data for Second Banner:
    Log To Console    🎯 Banner Title: ${E2E_BANNER_TITLE_SECOND}
    Log To Console    🎯 Banner Description: ${E2E_BANNER_DESCRIPTION_SECOND}

Generate E2E Test Data for Third Banner
    [Documentation]    Generates unique test data for end-to-end validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    Set Test Variable    ${E2E_BANNER_RANDOM_NUMBER_THIRD}     ${random_num}
    Set Test Variable    ${E2E_BANNER_TITLE_THIRD}    E2E_Banner_Title_Third_${random_num}
    Set Test Variable    ${E2E_BANNER_DESCRIPTION_THIRD}       E2E_Banner_Description_Third_${random_num}
    Log To Console    🎯 Generated Test Data for Third Banner:
    Log To Console    🎯 Banner Title: ${E2E_BANNER_TITLE_THIRD}
    Log To Console    🎯 Banner Description: ${E2E_BANNER_DESCRIPTION_THIRD}         

Generate E2E Test Data for Hindi Banner
    [Documentation]    Generates unique test data for end-to-end validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    Set Test Variable    ${E2E_BANNER_RANDOM_NUMBER}     ${random_num}
    Set Test Variable    ${E2E_HINDI_BANNER_TITLE}    हिंदी_Title_${random_num}
    Set Test Variable    ${E2E_HINDI_BANNER_DESCRIPTION}       हिंदी_Description_${random_num}
    Log To Console    🎯 Generated Test Data for Banner:
    Log To Console    🎯 Hindi Banner Title: ${E2E_HINDI_BANNER_TITLE}
    Log To Console    🎯 Hindi Banner Description: ${E2E_HINDI_BANNER_DESCRIPTION}

Click on the Banner Management Menu
    [Documentation]    Clicks on the Banner Management menu in the web application
    Web Wait Until Page Contains Element    ${BANNER_MENU}    10s
    Web Click Element    ${BANNER_MENU}
    Log To Console       Clicked on the Banner Management Menu

Click on the Hindi Cancel Button from Update pop-up
    [Documentation]    Clicks on the Hindi Cancel button from the Update pop-up
    Mobile Click Element    xpath=//android.widget.Button[@content-desc="रद्द करना"]
    Log To Console       Clicked on the Hindi Cancel Button from the Update pop-up

Click on the Add Banner Button
    [Documentation]    Clicks on the Add Banner button in the web application
    Web Wait Until Page Contains Element    ${ADD_BANNER_BUTTON}    10s
    Web Click Element    ${ADD_BANNER_BUTTON}
    Log To Console       Clicked on the Add Banner Button

Select Language as English
    [Documentation]    Selects English language in the web application
    Web Wait Until Page Contains Element    ${BANNER_LANGUAGE_DROPDOWN}    10s
    Web Click Element    ${BANNER_LANGUAGE_DROPDOWN}
    Log To Console       Selected Language as English

Select Language as Hindi
    [Documentation]    Selects Hindi language in the web application
    Web Wait Until Page Contains Element    ${BANNER_LANGUAGE_HINDI}    10s
    Web Click Element    ${BANNER_LANGUAGE_HINDI}
    Log To Console       Selected Language as Hindi
Select Banner Type as Top
    [Documentation]    Selects Top banner type in the web application
    Web Wait Until Page Contains Element    ${BANNER_TYPE_DROPDOWN}    10s
    Web Click Element    ${BANNER_TYPE_DROPDOWN}
    Web Wait Until Page Contains Element    ${BANNER_TYPE_TOP}    10s
    Web Click Element    ${BANNER_TYPE_TOP}
    Log To Console       Selected Banner Type as Top

Select Banner Type as Middle
    [Documentation]    Selects Middle banner type in the web application
    Web Wait Until Page Contains Element    ${BANNER_TYPE_DROPDOWN}    10s
    Web Click Element    ${BANNER_TYPE_DROPDOWN}
    Web Wait Until Page Contains Element    ${BANNER_TYPE_MIDDLE}    10s
    Web Click Element    ${BANNER_TYPE_MIDDLE}
    Log To Console       Selected Banner Type as Middle

Enter Banner English Title
    [Documentation]    Enters the English title in the banner form
    Web Wait Until Page Contains Element    ${BANNER_TITLE_FIELD}    10s
    Web Click Element    ${BANNER_TITLE_FIELD}
    Web Input Text    ${BANNER_TITLE_FIELD}    ${E2E_BANNER_TITLE}
    Log To Console       Entered Banner English Title

Enter Banner English Description
    [Documentation]    Enters the English description in the banner form
    Web Wait Until Page Contains Element    ${BANNER_DESCRIPTION_FIELD}    10s
    Web Click Element    ${BANNER_DESCRIPTION_FIELD}
    Web Input Text    ${BANNER_DESCRIPTION_FIELD}    ${E2E_BANNER_DESCRIPTION}
    Log To Console       Entered Banner English Description

Enter Second Banner English Title
    [Documentation]    Enters the English title in the banner form
    Web Wait Until Page Contains Element    ${BANNER_TITLE_FIELD}    10s
    Web Click Element    ${BANNER_TITLE_FIELD}
    Web Input Text    ${BANNER_TITLE_FIELD}    ${E2E_BANNER_TITLE_SECOND}
    Log To Console       Entered Banner English Title

Enter Second Banner English Description
    [Documentation]    Enters the English description in the banner form
    Web Wait Until Page Contains Element    ${BANNER_DESCRIPTION_FIELD}    10s
    Web Click Element    ${BANNER_DESCRIPTION_FIELD}
    Web Input Text    ${BANNER_DESCRIPTION_FIELD}    ${E2E_BANNER_DESCRIPTION_SECOND}
    Log To Console       Entered Banner English Description    

Enter Third Banner English Title
    [Documentation]    Enters the English title in the banner form
    Web Wait Until Page Contains Element    ${BANNER_TITLE_FIELD}    10s
    Web Click Element    ${BANNER_TITLE_FIELD}
    Web Input Text    ${BANNER_TITLE_FIELD}    ${E2E_BANNER_TITLE_THIRD}
    Log To Console       Entered Banner English Title

Enter Third Banner English Description
    [Documentation]    Enters the English description in the banner form
    Web Wait Until Page Contains Element    ${BANNER_DESCRIPTION_FIELD}    10s
    Web Click Element    ${BANNER_DESCRIPTION_FIELD}
    Web Input Text    ${BANNER_DESCRIPTION_FIELD}    ${E2E_BANNER_DESCRIPTION_THIRD}
    Log To Console       Entered Banner English Description

Enter Banner Hindi Title
    [Documentation]    Enters the Hindi title in the banner form
    Web Wait Until Page Contains Element    ${HINDI_BANNER_TITLE_FIELD}    10s
    Web Click Element    ${HINDI_BANNER_TITLE_FIELD}
    Web Input Text    ${HINDI_BANNER_TITLE_FIELD}    ${E2E_HINDI_BANNER_TITLE}
    Log To Console       Entered Banner Hindi Title

Enter Banner Hindi Description
    [Documentation]    Enters the Hindi description in the banner form
    Web Wait Until Page Contains Element    ${HINDI_BANNER_DESCRIPTION_FIELD}    10s
    Web Click Element    ${HINDI_BANNER_DESCRIPTION_FIELD}
    Web Input Text    ${HINDI_BANNER_DESCRIPTION_FIELD}    ${E2E_HINDI_BANNER_DESCRIPTION}
    Log To Console       Entered Banner Hindi Description

Upload Banner Image
    [Documentation]    Uploads the banner image in the banner form
    Web Wait Until Page Contains Element    ${BANNER_IMAGE_UPLOAD}    10s
    Web Choose File    ${BANNER_IMAGE_UPLOAD}    ${ENGLISH_THUMBNAIL_FILE}
    Log To Console       Uploaded Banner Image

Upload Hindi Banner Image
    [Documentation]    Uploads the Hindi banner image in the banner form
    Web Wait Until Page Contains Element    ${HINDI_BANNER_IMAGE_UPLOAD}    10s
    Web Choose File    ${HINDI_BANNER_IMAGE_UPLOAD}    ${HINDI_THUMBNAIL_FILE}
    Log To Console       Uploaded Hindi Banner Image

Set Publish Status as Publish
    [Documentation]    Sets the publish status as Publish in the banner form
    Web Wait Until Page Contains Element    ${BANNER_PUBLISH_STATUS_DROPDOWN}    10s
    Web Click Element    ${BANNER_PUBLISH_STATUS_DROPDOWN}
    Web Wait Until Page Contains Element    ${BANNER_PUBLISH_STATUS}    10s
    Web Click Element    ${BANNER_PUBLISH_STATUS}
    Log To Console       Set Publish Status as Publish

Set Banner Publish Date To Today
    [Documentation]    Sets the publish date to today's date in the banner form
    Web Wait Until Page Contains Element    ${BANNER_PUBLISH_DATE_FIELD}    5s
    Web Click Element    ${BANNER_PUBLISH_DATE_FIELD}
    Web Click Element    ${BANNER_CHOOSE_DATE_BUTTON}
    Sleep    1s
    Web Click Element    ${BANNER_PUBLISH_DATE_BUTTON}
    Log To Console    📅 Set Publish Date to Today using calendar picker

Click on Submit Banner Button
    [Documentation]    Clicks on the Submit banner button in the web application
    Web Wait Until Page Contains Element    ${BANNER_SUBMIT_BUTTON}    10s
    Web Click Element    ${BANNER_SUBMIT_BUTTON}
    Log To Console       Clicked on the Submit Banner Button
    
Verify Banner Success Message
    [Documentation]    Verifies the success message after banner submission
    Web Wait Until Page Contains Element    ${BANNER_SUCCESS_MESSAGE}    10s
    Web Element Should Be Visible    ${BANNER_SUCCESS_MESSAGE}
    Log To Console       Banner Success Message Verified
    Sleep   2s

Verify CreateBanner title is displayed on the CMS list    
    [Documentation]    Verifies the CreateBanner title is displayed on the CMS list
    Web Wait Until Page Contains Element    ${CREATE_BANNER_TITLE}    10s
    Web Element Should Be Visible    ${CREATE_BANNER_TITLE}
    Log To Console       CreateBanner title is displayed on the CMS list

Verify CreateHindiBanner title is displayed on the CMS list    
    [Documentation]    Verifies the CreateHindiBanner title is displayed on the CMS list
    Web Wait Until Page Contains Element    ${CREATE_HINDI_BANNER_TITLE}    10s
    Web Element Should Be Visible    ${CREATE_HINDI_BANNER_TITLE}
    Log To Console       CreateBanner title is displayed on the CMS list    

Verify Banner Title and Description in Banner
    [Documentation]    Verifies the banner title and description in the banner
    Sleep    2s
    ${src}=    Mobile.Get Source
    Should Contain    ${src}    ${E2E_BANNER_TITLE}
    Log To Console    Title found in the banner where title is ${E2E_BANNER_TITLE}
    Should Contain    ${src}    ${E2E_BANNER_DESCRIPTION}
    Log To Console    Description found in the banner where description is ${E2E_BANNER_DESCRIPTION}

Verify Multiple Banner Title and Description in Banner
    [Documentation]    Verifies that multiple banners' titles and descriptions are present in the banner carousel on the mobile app
    Sleep    2s
    # Verify first banner
    ${src}=    Mobile.Get Source
    Should Contain    ${src}    ${E2E_BANNER_TITLE}
    Log To Console    ✅ Title 1 found in the banner: ${E2E_BANNER_TITLE}
    Should Contain    ${src}    ${E2E_BANNER_DESCRIPTION}
    Log To Console    ✅ Description 1 found in the banner: ${E2E_BANNER_DESCRIPTION}

    # Swipe to the next banner in carousel
    Swipe Until Banner Visible    ${BANNER_TITLE_SECOND}

    # Verify third banner
    ${src}=    Mobile.Get Source
    Should Contain    ${src}    ${E2E_BANNER_TITLE_THIRD}    
    Log To Console    ✅ Title 3 found in the banner: ${E2E_BANNER_TITLE_THIRD}
    Should Contain    ${src}    ${E2E_BANNER_DESCRIPTION_THIRD}
    Log To Console    ✅ Description 3 found in the banner: ${E2E_BANNER_DESCRIPTION_THIRD}

Verify Hindi Banner Title and Description in Banner
    [Documentation]    Verifies the banner title and description in the banner
    Sleep    2s
    ${src}=    Mobile.Get Source
    Should Contain    ${src}    ${E2E_HINDI_BANNER_TITLE}
    Log To Console    Title found in the banner where title is ${E2E_HINDI_BANNER_TITLE}
    Should Contain    ${src}    ${E2E_HINDI_BANNER_DESCRIPTION}
    Log To Console    Description found in the banner where description is ${E2E_HINDI_BANNER_DESCRIPTION}

Upload Banner large Image
    [Documentation]    Uploads the banner large image in the banner form
    Web Wait Until Page Contains Element    ${BANNER_IMAGE_UPLOAD}    10s
    Web Choose File    ${BANNER_IMAGE_UPLOAD}    ${LARGE_IMAGE_FILE}
    Log To Console       Uploaded Banner large Image

Verify Validation Message for large image upload
    [Documentation]    Verifies the validation message is displayed for large image upload
    Web Wait Until Page Contains Element    ${BANNER_IMAGE_UPLOAD_ERROR}    10s
    Web Element Should Be Visible    ${BANNER_IMAGE_UPLOAD_ERROR}
    ${success}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${BANNER_IMAGE_UPLOAD_ERROR}    10s
    IF    ${success}
        Log To Console    ✅ File size error message displayed correctly: "File cannot exceed the upload size limit 5 MB"
    ELSE
        Log To Console    ⚠️ No specific file upload error message found, but validation may still be working
    END
    
Click on the Cancel Button from the Hindi Update pop-up
    [Documentation]    Clicks on the Cancel button from the Hindi Update pop-up
    Mobile Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="रद्द करना"]    10s
    Mobile Click Element    xpath=//android.widget.Button[@content-desc="रद्द करना"]
    Log To Console       Clicked on the Cancel Button from the Hindi Update pop-up

        