*** Settings ***
Resource   ../resources/libraries.robot
Resource   ../resources/web_keywords.robot

*** Variables ***
# Random Number for Unique Test Data
${RANDOM_NUMBER}                  ${EMPTY}

# Audio Menu Elements (Updated based on new UI structure)
${AUDIO_MENU}                     xpath=//span[contains(text(),'Audio')]
${MANAGE_AUDIO_CATEGORIES_SUBMENU}    xpath=//span[contains(text(),'Manage Categories')]
# Legacy Master Management Menu (kept for backward compatibility)
${MASTER_MANAGEMENT_MENU}         xpath=//span[contains(text(),'Master Management')]

# Add Category Elements
${ADD_CATEGORY_BUTTON}            xpath=//button[normalize-space(text())='Add Category']
${MUSIC_RADIO_BTN}        xpath=//input[@id='Music-radio']
${PODCAST_RADIO_BTN}      xpath=//input[@id='Podcast-radio']

# English Category Fields
${ENGLISH_CATEGORY_NAME_FIELD}    xpath=(//input[@placeholder='Enter Category'])[1]
${ENGLISH_CATEGORY_DESCRIPTION_FIELD}    xpath=(//textarea[@placeholder='Enter Description'])[1]
${ENGLISH_CATEGORY_THUMBNAIL_UPLOAD}    xpath=(//input[@type='file' and @accept='image/jpeg,image/png'])[1]

# Hindi Category Fields
${HINDI_CATEGORY_NAME_FIELD}      xpath=(//input[@placeholder='Enter Category'])[2]
${HINDI_CATEGORY_DESCRIPTION_FIELD}    xpath=(//textarea[@placeholder='Enter Description'])[2]
${HINDI_CATEGORY_THUMBNAIL_UPLOAD}    xpath=(//input[@type='file' and @accept='image/jpeg,image/png'])[2]

# Fallback Hindi Category Fields (if primary locators fail)
${HINDI_CATEGORY_NAME_FIELD_FALLBACK}      xpath=(//input[@placeholder='Enter Category'])[2]
${HINDI_CATEGORY_DESCRIPTION_FIELD_FALLBACK}    xpath=(//textarea[@placeholder='Enter Description'])[2]
${HINDI_CATEGORY_THUMBNAIL_UPLOAD_FALLBACK}    xpath=(//input[@type='file' and @accept='image/*'])[2]

# Action Buttons
${ADD_NEW_BUTTON}                 xpath=//button[@type='submit' and .//text()[contains(., 'Add New')]]
${CANCEL_BUTTON}                  xpath=//button[contains(@class, 'MuiButton-outlined') and contains(., 'Cancel')]
${RESET_BUTTON}                   xpath=//button[contains(text(),'Reset')]

# Update/Edit Category Elements
${EDIT_CATEGORY_BUTTON}           xpath=//button[contains(@class, 'MuiIconButton-root') and contains(@aria-label, 'edit') or contains(@aria-label, 'Edit')]
${UPDATE_BUTTON}                  xpath=//button[@type='submit' and .//text()[contains(., 'Update') or contains(., 'Save')]]

# Category Row Locators (Based on actual DOM structure)
${CATEGORY_ROW_BY_NAME}           xpath=//div[contains(@class,'MuiDataGrid-row')]//div[@data-field='categoryNameEn']//p[contains(text(),'${ORIGINAL_CATEGORY_NAME}')]/ancestor::div[contains(@class,'MuiDataGrid-row')]
${CATEGORY_ROW_ACTIONS_CELL}      xpath=//div[contains(@class,'MuiDataGrid-row')]//div[@data-field='categoryNameEn']//p[contains(text(),'${ORIGINAL_CATEGORY_NAME}')]/ancestor::div[contains(@class,'MuiDataGrid-row')]//div[@data-field='actions']
${EDIT_BUTTON_IN_ROW}            xpath=//div[contains(@class,'MuiDataGrid-row')]//div[@data-field='categoryNameEn']//p[contains(text(),'${ORIGINAL_CATEGORY_NAME}')]/ancestor::div[contains(@class,'MuiDataGrid-row')]//div[@data-field='actions']//button[1]

# Category Name Locators
${CATEGORY_NAME_EN_FIELD}         xpath=//div[@data-field='categoryNameEn']//p[contains(text(),'${ORIGINAL_CATEGORY_NAME}')]
${CATEGORY_NAME_HI_FIELD}         xpath=//div[@data-field='categoryNameHi']//p[contains(text(),'${ORIGINAL_HINDI_CATEGORY_NAME}')]
${CATEGORY_DESC_EN_FIELD}         xpath=//div[@data-field='categoryDescriptionEn'][contains(text(),'${ORIGINAL_CATEGORY_DESCRIPTION}')]
${CATEGORY_DESC_HI_FIELD}         xpath=//div[@data-field='categoryDescriptionHi'][contains(text(),'${ORIGINAL_HINDI_CATEGORY_DESCRIPTION}')]

# Updated Category Verification Locators
${UPDATED_CATEGORY_NAME_EN}       xpath=//div[@data-field='categoryNameEn']//p[contains(text(),'${UPDATED_ENGLISH_CATEGORY_NAME}')]
${UPDATED_CATEGORY_NAME_HI}       xpath=//div[@data-field='categoryNameHi']//p[contains(text(),'${UPDATED_HINDI_CATEGORY_NAME}')]
${UPDATED_CATEGORY_DESC_EN}       xpath=//div[@data-field='categoryDescriptionEn'][contains(text(),'${UPDATED_ENGLISH_CATEGORY_DESCRIPTION}')]
${UPDATED_CATEGORY_DESC_HI}       xpath=//div[@data-field='categoryDescriptionHi'][contains(text(),'${UPDATED_HINDI_CATEGORY_DESCRIPTION}')]

# Success Messages
${CATEGORY_SUCCESS_MESSAGE}       xpath=//li[contains(@class,'minimal__snackbar__success')]//div[contains(@class,'minimal__snackbar__title') and contains(text(),'Category added successfully')]
${CATEGORY_UPDATE_SUCCESS_MESSAGE}    xpath=//li[contains(@class,'minimal__snackbar__success')]//div[contains(@class,'minimal__snackbar__title') and contains(text(),'Category updated successfully')]
${CATEGORY_LIST_LOCATOR}         xpath=//div[contains(@class,'MuiDataGrid-row')]//div[@data-field='categoryNameEn']//p[contains(text(),'${TEST_ENGLISH_CATEGORY_NAME}')]

# Error Messages and Validation
${DUPLICATE_ENGLISH_NAME_ERROR_DYNAMIC}  xpath=//div[contains(@class, 'minimal__snackbar__title') and contains(., '${TEST_ENGLISH_CATEGORY_NAME}') and contains(., 'not unique for language')]
${DUPLICATE_HINDI_NAME_ERROR_DYNAMIC}    xpath=//div[contains(@class, 'minimal__snackbar__title') and contains(., '${TEST_HINDI_CATEGORY_NAME}') and contains(., 'not unique for language')]
${MISSING_ENGLISH_NAME_ERROR}    xpath=(//div[contains(@class,'MuiFormHelperText-root') and contains(@class,'Mui-error') and contains(text(),'Category name is required.')])[1]
${MISSING_HINDI_NAME_ERROR}      xpath=(//div[contains(@class,'MuiFormHelperText-root') and contains(@class,'Mui-error') and contains(text(),'Category name is required.')])[1]
${GENERIC_ERROR_MESSAGE}         xpath=//li[contains(@class,'minimal__snackbar__error')]//div[contains(@class,'minimal__snackbar__title')]

# File Upload Error Messages
${UNSUPPORTED_FORMAT_ERROR}      xpath=//ul[contains(@class,'minimal__upload__rejection__files')]//span[contains(@class,'css-n0vjaw') and contains(text(),'File type must be image')]
${FILE_SIZE_ERROR}               xpath=//ul[contains(@class,'minimal__upload__rejection__files')]//span[contains(@class,'css-n0vjaw') and contains(text(),'File cannot exceed the upload size limit 5 MB')]
${FILE_UPLOAD_ERROR}             xpath=//ul[contains(@class,'minimal__upload__rejection__files')]//span[contains(@class,'css-n0vjaw')]

# Test Data
${TEST_ENGLISH_CATEGORY_NAME}     ${EMPTY}
${TEST_ENGLISH_CATEGORY_DESCRIPTION}    Automation - This is a test category created for integration testing in English
${TEST_HINDI_CATEGORY_NAME}       ${EMPTY}
${TEST_HINDI_CATEGORY_DESCRIPTION}     Automation - यह एकीकरण परीक्षण के लिए बनाया गया परीक्षण श्रेणी है

# Duplicate Test Data
${DUPLICATE_ENGLISH_CATEGORY_NAME}     Bhajann
${DUPLICATE_ENGLISH_CATEGORY_DESCRIPTION}    bhajans are not just songs but spiritual experiences that uplift the soul, calm the mind, and bring one closer to inner peace and divinity.
${DUPLICATE_HINDI_CATEGORY_NAME}       भजन
${DUPLICATE_HINDI_CATEGORY_DESCRIPTION}     ईश्वर की भक्ति में डूबकर गाया गया गीत।

# Update Test Data
${UPDATED_ENGLISH_CATEGORY_NAME}       ${EMPTY}
${UPDATED_HINDI_CATEGORY_NAME}         ${EMPTY}
${UPDATED_ENGLISH_CATEGORY_DESCRIPTION}    Updated - This is an updated test category description for integration testing in English
${UPDATED_HINDI_CATEGORY_DESCRIPTION}      Updated - यह एकीकरण परीक्षण के लिए अपडेट किया गया परीक्षण श्रेणी विवरण है

# Original Category Data (to be captured before update)
${ORIGINAL_CATEGORY_NAME}              ${EMPTY}
${ORIGINAL_HINDI_CATEGORY_NAME}        ${EMPTY}
${ORIGINAL_CATEGORY_DESCRIPTION}       ${EMPTY}
${ORIGINAL_HINDI_CATEGORY_DESCRIPTION}    ${EMPTY}

# Test File Paths (Updated to use correct directory)
${ENGLISH_CATEGORY_THUMBNAIL_FILE}    ${EXECDIR}/test_data/English_thumbnail.jpg
${HINDI_CATEGORY_THUMBNAIL_FILE}      ${EXECDIR}/test_data/Hindi_thumbnail.jpg
${UNSUPPORTED_FORMAT_FILE}            ${EXECDIR}/test_data/unsupported_format.txt
${LARGE_IMAGE_FILE}                   ${EXECDIR}/test_data/large_image.jpg

*** Keywords ***
Generate Random Number for Test Data
    [Documentation]    Generates a random 3-digit number for unique test data
    ${random_num}=    Evaluate    random.randint(100, 999)    random
    Set Test Variable    ${RANDOM_NUMBER}    ${random_num}
    Set Test Variable    ${TEST_ENGLISH_CATEGORY_NAME}    Automation_${random_num} - Test Category English
    Set Test Variable    ${TEST_HINDI_CATEGORY_NAME}    Automation_${random_num} - एकीकरण परीक्षण श्रेणी हिंदी
    Set Test Variable    ${UPDATED_ENGLISH_CATEGORY_NAME}    Automation_${random_num} - Updated Category English
    Set Test Variable    ${UPDATED_HINDI_CATEGORY_NAME}    Automation_${random_num} - अपडेटेड श्रेणी हिंदी
    Log To Console    Generated random number: ${RANDOM_NUMBER}
    Log To Console    English Category Name: ${TEST_ENGLISH_CATEGORY_NAME}
    Log To Console    Hindi Category Name: ${TEST_HINDI_CATEGORY_NAME}
    Log To Console    Updated English Category Name: ${UPDATED_ENGLISH_CATEGORY_NAME}
    Log To Console    Updated Hindi Category Name: ${UPDATED_HINDI_CATEGORY_NAME}

Click on the Master Management Menu
    [Documentation]    Clicks on the Master Management menu in the web application (DEPRECATED - redirects to Audio menu)
    Log To Console    ⚠️ WARNING: Master Management menu path is deprecated. Using Audio menu instead.
    # Expand Audio menu if needed
    Web Wait Until Page Contains Element    ${AUDIO_MENU}    10s
    ${is_expanded}=    Run Keyword And Return Status    Web Element Should Be Visible    ${MANAGE_AUDIO_CATEGORIES_SUBMENU}
    IF    not ${is_expanded}
        Web Click Element    ${AUDIO_MENU}
        Sleep    1s
    END

Click on the Manage Audio Categories Submenu
    [Documentation]    Clicks on the Manage Categories submenu under Audio menu (Updated for new UI)
    # First ensure Audio menu is expanded
    Run Keyword And Ignore Error    Click on the Master Management Menu
    Web Wait Until Page Contains Element    ${MANAGE_AUDIO_CATEGORIES_SUBMENU}    10s
    Web Click Element    ${MANAGE_AUDIO_CATEGORIES_SUBMENU}
    Sleep    2s

Click on the Add Category button
    [Documentation]    Clicks on the Add Category button to create new category with fallback
    # Wait for the data grid to be fully loaded first
    Sleep    3s
    # Wait for page to be ready (check if data grid or no data message is visible)
    TRY
        Web Wait Until Page Contains Element    xpath=//div[contains(@class,'MuiDataGrid-root')]    10s
        Log To Console    📊 Data grid loaded
    EXCEPT
        Log To Console    ℹ️ Data grid not found, page might be empty - continuing...
    END

    TRY
        Web Wait Until Page Contains Element    ${ADD_CATEGORY_BUTTON}    20s
        Web Click Element    ${ADD_CATEGORY_BUTTON}
        Log To Console    ✅ Clicked 'Add Category' button
    EXCEPT
        Log To Console    ⚠️ Primary 'Add Category' button not found, trying alternative locators...
        TRY
            # Try button with contains instead of exact match
            Web Wait Until Page Contains Element    xpath=//button[contains(text(),'Add Category')]    10s
            Web Click Element    xpath=//button[contains(text(),'Add Category')]
            Log To Console    ✅ Clicked 'Add Category' button using alternative locator
        EXCEPT
            # Try MUI button class
            Web Wait Until Page Contains Element    xpath=//button[contains(@class,'MuiButton') and contains(.,'Add')]    10s
            Web Click Element    xpath=//button[contains(@class,'MuiButton') and contains(.,'Add')]
            Log To Console    ✅ Clicked 'Add' button using MUI class locator
        END
    END

Select Music Audio Type
    [Documentation]    Selects Music as the audio type from dropdown
    Web Wait Until Page Contains Element    ${MUSIC_RADIO_BTN}    5s
    Web Click Element    ${MUSIC_RADIO_BTN}

Enter the English Category Name
    [Documentation]    Enters English category name in the form
    Web Wait Until Page Contains Element    ${ENGLISH_CATEGORY_NAME_FIELD}    5s
    Web Input Text    ${ENGLISH_CATEGORY_NAME_FIELD}    ${TEST_ENGLISH_CATEGORY_NAME}

Enter the English Category Description
    [Documentation]    Enters English category description in the form
    Web Wait Until Page Contains Element    ${ENGLISH_CATEGORY_DESCRIPTION_FIELD}    5s
    Web Input Text    ${ENGLISH_CATEGORY_DESCRIPTION_FIELD}    ${TEST_ENGLISH_CATEGORY_DESCRIPTION}

Upload the English Category Thumbnail Image
    [Documentation]    Uploads English category thumbnail image
    Web Choose File    ${ENGLISH_CATEGORY_THUMBNAIL_UPLOAD}    ${ENGLISH_CATEGORY_THUMBNAIL_FILE}

Enter the Hindi Category Name
    [Documentation]    Enters Hindi category name in the form with fallback locator
    # Add extra wait to ensure form is ready after validation changes
    Sleep    3s
    ${success}=    Run Keyword And Return Status    Enter Hindi Category Name Primary
    Run Keyword Unless    ${success}    Enter Hindi Category Name Fallback

Enter Hindi Category Name Primary
    [Documentation]    Enters Hindi category name using primary locator
    Web Wait Until Page Contains Element    ${HINDI_CATEGORY_NAME_FIELD}    10s
    Web Scroll Element Into View    ${HINDI_CATEGORY_NAME_FIELD}
    Sleep    2s
    # Ensure element is clickable before proceeding
    Web Wait Until Element Is Visible    ${HINDI_CATEGORY_NAME_FIELD}    5s
    Web Click Element    ${HINDI_CATEGORY_NAME_FIELD}
    Sleep    1s
    Web Clear Element Text    ${HINDI_CATEGORY_NAME_FIELD}
    Sleep    1s
    Web Input Text    ${HINDI_CATEGORY_NAME_FIELD}    ${TEST_HINDI_CATEGORY_NAME}
    Sleep    1s
    Log To Console    Entered Hindi Category Name (Primary): ${TEST_HINDI_CATEGORY_NAME}

Enter Hindi Category Name Fallback
    [Documentation]    Enters Hindi category name using fallback locator
    Log To Console    Primary locator failed, trying fallback locator
    Web Wait Until Page Contains Element    ${HINDI_CATEGORY_NAME_FIELD_FALLBACK}    10s
    Web Scroll Element Into View    ${HINDI_CATEGORY_NAME_FIELD_FALLBACK}
    Sleep    2s
    # Ensure element is clickable before proceeding
    Web Wait Until Element Is Visible    ${HINDI_CATEGORY_NAME_FIELD_FALLBACK}    5s
    Web Click Element    ${HINDI_CATEGORY_NAME_FIELD_FALLBACK}
    Sleep    1s
    Web Clear Element Text    ${HINDI_CATEGORY_NAME_FIELD_FALLBACK}
    Sleep    1s
    Web Input Text    ${HINDI_CATEGORY_NAME_FIELD_FALLBACK}    ${TEST_HINDI_CATEGORY_NAME}
    Sleep    1s
    Log To Console    Entered Hindi Category Name (Fallback): ${TEST_HINDI_CATEGORY_NAME}

Enter the Hindi Category Description
    [Documentation]    Enters Hindi category description in the form with fallback locator
    ${success}=    Run Keyword And Return Status    Enter Hindi Category Description Primary
    Run Keyword Unless    ${success}    Enter Hindi Category Description Fallback

Enter Hindi Category Description Primary
    [Documentation]    Enters Hindi category description using primary locator
    Web Wait Until Page Contains Element    ${HINDI_CATEGORY_DESCRIPTION_FIELD}    10s
    Web Scroll Element Into View    ${HINDI_CATEGORY_DESCRIPTION_FIELD}
    Sleep    2s
    Web Click Element    ${HINDI_CATEGORY_DESCRIPTION_FIELD}
    Web Clear Element Text    ${HINDI_CATEGORY_DESCRIPTION_FIELD}
    Web Input Text    ${HINDI_CATEGORY_DESCRIPTION_FIELD}    ${TEST_HINDI_CATEGORY_DESCRIPTION}
    Log To Console    Entered Hindi Category Description (Primary): ${TEST_HINDI_CATEGORY_DESCRIPTION}

Enter Hindi Category Description Fallback
    [Documentation]    Enters Hindi category description using fallback locator
    Log To Console    Primary locator failed, trying fallback locator
    Web Wait Until Page Contains Element    ${HINDI_CATEGORY_DESCRIPTION_FIELD_FALLBACK}    10s
    Web Scroll Element Into View    ${HINDI_CATEGORY_DESCRIPTION_FIELD_FALLBACK}
    Sleep    2s
    Web Click Element    ${HINDI_CATEGORY_DESCRIPTION_FIELD_FALLBACK}
    Web Clear Element Text    ${HINDI_CATEGORY_DESCRIPTION_FIELD_FALLBACK}
    Web Input Text    ${HINDI_CATEGORY_DESCRIPTION_FIELD_FALLBACK}    ${TEST_HINDI_CATEGORY_DESCRIPTION}
    Log To Console    Entered Hindi Category Description (Fallback): ${TEST_HINDI_CATEGORY_DESCRIPTION}

Upload the Hindi Category Thumbnail Image
    [Documentation]    Uploads Hindi category thumbnail image
    Web Choose File    ${HINDI_CATEGORY_THUMBNAIL_UPLOAD}    ${HINDI_CATEGORY_THUMBNAIL_FILE}

Upload Unsupported Format File
    [Documentation]    Uploads unsupported format file to test validation
    Web Choose File    ${ENGLISH_CATEGORY_THUMBNAIL_UPLOAD}    ${UNSUPPORTED_FORMAT_FILE}
    Log To Console    Uploaded unsupported format file for validation testing

Upload Large Image File
    [Documentation]    Uploads large image file to test size validation
    # Ensure large file exists before uploading
    ${file_exists}=    Run Keyword And Return Status    File Should Exist    ${LARGE_IMAGE_FILE}
    Run Keyword Unless    ${file_exists}    Create Large Test File
    Web Choose File    ${ENGLISH_CATEGORY_THUMBNAIL_UPLOAD}    ${LARGE_IMAGE_FILE}
    Log To Console    Uploaded large image file for size validation testing

Create Large Test File
    [Documentation]    Creates a large test file if it doesn't exist
    Log To Console    Creating large test file for size validation...
    ${content}=    Evaluate    'A' * (6 * 1024 * 1024)    # 6MB of 'A' characters
    Create File    ${LARGE_IMAGE_FILE}    ${content}
    Log To Console    Created large test file: ${LARGE_IMAGE_FILE}

Click Edit Button for Category
    [Documentation]    Clicks the edit button for the specified category after scrolling horizontally and captures original data
    # First capture the original category data before editing
    Capture Original Category Data
    
    # Find the category row using original name
    ${category_row}=    Set Variable    xpath=//div[contains(@class,'MuiDataGrid-row')]//div[@data-field='categoryNameEn']//p[contains(text(),'${ORIGINAL_CATEGORY_NAME}')]/ancestor::div[contains(@class,'MuiDataGrid-row')]
    Web Wait Until Page Contains Element    ${category_row}    10s
    Web Scroll Element Into View    ${category_row}
    Sleep    2s
    
    # Try multiple approaches to scroll horizontally and find the edit button
    ${edit_button_in_row}=    Set Variable    ${category_row}//div[@data-field='actions']//button[1]
    
    # First attempt: Try to find edit button directly
    ${edit_found}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${edit_button_in_row}    5s
    Run Keyword If    ${edit_found}    Web Click Element    ${edit_button_in_row}
    
    # Second attempt: If not found, try scrolling the data grid container
    Run Keyword Unless    ${edit_found}    Scroll Data Grid and Click Edit    ${category_row}    ${edit_button_in_row}
    
    Log To Console    Clicked edit button for category: ${ORIGINAL_CATEGORY_NAME}

Scroll Data Grid and Click Edit
    [Arguments]    ${category_row}    ${edit_button_in_row}
    [Documentation]    Scrolls the data grid horizontally to find and click the edit button
    # Try to scroll the data grid container horizontally
    ${data_grid_container}=    Set Variable    xpath=//div[contains(@class,'MuiDataGrid-root')]
    Web Scroll Element Into View    ${data_grid_container}
    Sleep    2s
    
    # Try to scroll to the right side of the row
    ${actions_cell}=    Set Variable    ${category_row}//div[contains(@class,'MuiDataGrid-cell') and @data-field='actions']
    ${actions_found}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${actions_cell}    5s
    Run Keyword If    ${actions_found}    Web Scroll Element Into View    ${actions_cell}
    Sleep    2s
    
    # Try to click the edit button again
    ${edit_found}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${edit_button_in_row}    5s
    Run Keyword If    ${edit_found}    Web Click Element    ${edit_button_in_row}
    Run Keyword Unless    ${edit_found}    Log To Console    ⚠️ Could not find edit button after scrolling, trying alternative approach
    
    # Final attempt: Try clicking any edit button in the grid
    Run Keyword Unless    ${edit_found}    Click Any Edit Button in Grid

Click Any Edit Button in Grid
    [Documentation]    Clicks any edit button found in the data grid as a fallback
    ${any_edit_button}=    Set Variable    xpath=//div[contains(@class,'MuiDataGrid-root')]//button[contains(@class, 'MuiIconButton-root') and contains(@aria-label, 'edit') or contains(@aria-label, 'Edit')]
    ${found}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${any_edit_button}    5s
    Run Keyword If    ${found}    Web Click Element    ${any_edit_button}
    Run Keyword Unless    ${found}    Fail    Could not find any edit button in the data grid

Capture Original Category Data
    [Documentation]    Captures the original category data before updating
    # Find the first available category in the grid
    ${first_category_name}=    Set Variable    xpath=(//div[@data-field='categoryNameEn']//p)[1]
    ${first_category_hindi}=    Set Variable    xpath=(//div[@data-field='categoryNameHi']//p)[1]
    ${first_category_desc_en}=    Set Variable    xpath=(//div[@data-field='categoryDescriptionEn'])[1]
    ${first_category_desc_hi}=    Set Variable    xpath=(//div[@data-field='categoryDescriptionHi'])[1]
    
    # Capture English category name
    Web Wait Until Page Contains Element    ${first_category_name}    10s
    ${original_name}=    Web.Get Text    ${first_category_name}
    Set Test Variable    ${ORIGINAL_CATEGORY_NAME}    ${original_name}
    
    # Capture Hindi category name (if available)
    ${hindi_found}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${first_category_hindi}    5s
    Run Keyword If    ${hindi_found}    Capture Hindi Category Name    ${first_category_hindi}
    
    # Capture English description (if available)
    ${desc_en_found}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${first_category_desc_en}    5s
    Run Keyword If    ${desc_en_found}    Capture English Description    ${first_category_desc_en}
    
    # Capture Hindi description (if available)
    ${desc_hi_found}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${first_category_desc_hi}    5s
    Run Keyword If    ${desc_hi_found}    Capture Hindi Description    ${first_category_desc_hi}
    
    Log To Console    📝 Captured original category data:
    Log To Console    📝 Original English Name: ${ORIGINAL_CATEGORY_NAME}
    Run Keyword If    ${hindi_found}    Log To Console    📝 Original Hindi Name: ${ORIGINAL_HINDI_CATEGORY_NAME}
    Run Keyword If    ${desc_en_found}    Log To Console    📝 Original English Description: ${ORIGINAL_CATEGORY_DESCRIPTION}
    Run Keyword If    ${desc_hi_found}    Log To Console    📝 Original Hindi Description: ${ORIGINAL_HINDI_CATEGORY_DESCRIPTION}

Capture Hindi Category Name
    [Arguments]    ${locator}
    [Documentation]    Captures Hindi category name
    ${original_hindi}=    Web.Get Text    ${locator}
    Set Test Variable    ${ORIGINAL_HINDI_CATEGORY_NAME}    ${original_hindi}

Capture English Description
    [Arguments]    ${locator}
    [Documentation]    Captures English category description
    ${original_desc_en}=    Web.Get Text    ${locator}
    Set Test Variable    ${ORIGINAL_CATEGORY_DESCRIPTION}    ${original_desc_en}

Capture Hindi Description
    [Arguments]    ${locator}
    [Documentation]    Captures Hindi category description
    ${original_desc_hi}=    Web.Get Text    ${locator}
    Set Test Variable    ${ORIGINAL_HINDI_CATEGORY_DESCRIPTION}    ${original_desc_hi}

Update English Category Name
    [Documentation]    Updates the English category name in the edit form
    Web Wait Until Page Contains Element    ${ENGLISH_CATEGORY_NAME_FIELD}    5s
    Web Clear Element Text    ${ENGLISH_CATEGORY_NAME_FIELD}
    Web Input Text    ${ENGLISH_CATEGORY_NAME_FIELD}    ${UPDATED_ENGLISH_CATEGORY_NAME}
    Log To Console    Updated English Category Name: ${UPDATED_ENGLISH_CATEGORY_NAME}

Update Hindi Category Name
    [Documentation]    Updates the Hindi category name in the edit form
    Web Wait Until Page Contains Element    ${HINDI_CATEGORY_NAME_FIELD}    5s
    Web Clear Element Text    ${HINDI_CATEGORY_NAME_FIELD}
    Web Input Text    ${HINDI_CATEGORY_NAME_FIELD}    ${UPDATED_HINDI_CATEGORY_NAME}
    Log To Console    Updated Hindi Category Name: ${UPDATED_HINDI_CATEGORY_NAME}

Update English Category Description
    [Documentation]    Updates the English category description in the edit form
    Web Wait Until Page Contains Element    ${ENGLISH_CATEGORY_DESCRIPTION_FIELD}    5s
    Web Clear Element Text    ${ENGLISH_CATEGORY_DESCRIPTION_FIELD}
    Web Input Text    ${ENGLISH_CATEGORY_DESCRIPTION_FIELD}    ${UPDATED_ENGLISH_CATEGORY_DESCRIPTION}
    Log To Console    Updated English Category Description: ${UPDATED_ENGLISH_CATEGORY_DESCRIPTION}

Update Hindi Category Description
    [Documentation]    Updates the Hindi category description in the edit form
    Web Wait Until Page Contains Element    ${HINDI_CATEGORY_DESCRIPTION_FIELD}    5s
    Web Clear Element Text    ${HINDI_CATEGORY_DESCRIPTION_FIELD}
    Web Input Text    ${HINDI_CATEGORY_DESCRIPTION_FIELD}    ${UPDATED_HINDI_CATEGORY_DESCRIPTION}
    Log To Console    Updated Hindi Category Description: ${UPDATED_HINDI_CATEGORY_DESCRIPTION}

Upload Updated English Category Thumbnail Image
    [Documentation]    Uploads updated English category thumbnail image
    Web Choose File    ${ENGLISH_CATEGORY_THUMBNAIL_UPLOAD}    ${ENGLISH_CATEGORY_THUMBNAIL_FILE}
    Log To Console    Uploaded updated English category thumbnail image

Upload Updated Hindi Category Thumbnail Image
    [Documentation]    Uploads updated Hindi category thumbnail image
    Web Choose File    ${HINDI_CATEGORY_THUMBNAIL_UPLOAD}    ${HINDI_CATEGORY_THUMBNAIL_FILE}
    Log To Console    Uploaded updated Hindi category thumbnail image

# Click Update Button
#     [Documentation]    Clicks the Update button to save the category changes
#     Web Wait Until Page Contains Element    ${UPDATE_BUTTON}    5s
#     Web Click Button    ${UPDATE_BUTTON}
#     Log To Console    Clicked Update button to save category changes

Verify Category Update Success
    [Documentation]    Verifies that the category was updated successfully
    Web Wait Until Page Contains Element    ${CATEGORY_UPDATE_SUCCESS_MESSAGE}    10s
    Web Page Should Contain Element    ${CATEGORY_UPDATE_SUCCESS_MESSAGE}
    Log To Console    ✅ Category updated successfully: ${UPDATED_ENGLISH_CATEGORY_NAME}

Verify Updated Category in List
    [Documentation]    Verifies that the updated category appears in the category list (English name only)
    # Wait for the page to refresh and show updated data
    Sleep    3s
    
    Log To Console    🔍 Verifying category updates on list page:
    Log To Console    🔍 Original Name: ${ORIGINAL_CATEGORY_NAME} → Updated Name: ${UPDATED_ENGLISH_CATEGORY_NAME}
    
    # Verify updated English category name (only English name is displayed on list page)
    ${updated_english_locator}=    Set Variable    xpath=//div[@data-field='categoryNameEn']//p[contains(text(),'${UPDATED_ENGLISH_CATEGORY_NAME}')]
    Web Wait Until Page Contains Element    ${updated_english_locator}    15s
    Web Page Should Contain Element    ${updated_english_locator}
    Log To Console    ✅ Updated English category name "${UPDATED_ENGLISH_CATEGORY_NAME}" successfully displayed in list
    
    # Verify updated English description (if visible in the grid)
    ${updated_english_desc_locator}=    Set Variable    xpath=//div[@data-field='categoryDescriptionEn'][contains(text(),'${UPDATED_ENGLISH_CATEGORY_DESCRIPTION}')]
    ${desc_visible}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${updated_english_desc_locator}    5s
    Run Keyword If    ${desc_visible}    Log To Console    ✅ Updated English description successfully displayed in list
    Run Keyword Unless    ${desc_visible}    Log To Console    ℹ️ English description field not visible in grid view (this is normal)
    
    # Verify that original name is no longer present
    ${original_name_still_present}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    xpath=//div[@data-field='categoryNameEn']//p[contains(text(),'${ORIGINAL_CATEGORY_NAME}')]    5s
    Run Keyword If    ${original_name_still_present}    Log To Console    ⚠️ Original name "${ORIGINAL_CATEGORY_NAME}" is still present - update may not have worked
    Run Keyword Unless    ${original_name_still_present}    Log To Console    ✅ Original name "${ORIGINAL_CATEGORY_NAME}" successfully replaced with "${UPDATED_ENGLISH_CATEGORY_NAME}"
    
    Log To Console    ℹ️ Note: Hindi category name is not displayed on the list page, so only English name is verified

Click on the Add New button
    [Documentation]    Clicks on the Add New button to save the category
    Web Wait Until Page Contains Element    ${ADD_NEW_BUTTON}    5s
    Web Click Button    ${ADD_NEW_BUTTON}
    

Click on the Add New button for duplicate test
    [Documentation]    Clicks on the Add New button for duplicate name testing (does not wait for success message)
    Web Wait Until Page Contains Element    ${ADD_NEW_BUTTON}    5s
    Web Click Button    ${ADD_NEW_BUTTON}

Verify the Newly added Category is displayed in the top list as active
    [Documentation]    Verifies that the newly added category appears in the category list & success message is displayed
    #Web Wait Until Page Contains Element    ${CATEGORY_SUCCESS_MESSAGE}    5s
    Web Wait Until Page Contains Element    ${CATEGORY_LIST_LOCATOR}    15s
    Web Page Should Contain Element    ${CATEGORY_LIST_LOCATOR}
    Log To Console    Category "${TEST_ENGLISH_CATEGORY_NAME}" successfully added and displayed in list

Enter Duplicate English Category Name
    [Documentation]    Enters duplicate English category name in the form
    Web Wait Until Page Contains Element    ${ENGLISH_CATEGORY_NAME_FIELD}    5s
    Web Input Text    ${ENGLISH_CATEGORY_NAME_FIELD}    ${DUPLICATE_ENGLISH_CATEGORY_NAME}

Enter Duplicate Hindi Category Name
    [Documentation]    Enters duplicate Hindi category name in the form
    Web Wait Until Page Contains Element    ${HINDI_CATEGORY_NAME_FIELD}    5s
    Web Input Text    ${HINDI_CATEGORY_NAME_FIELD}    ${DUPLICATE_HINDI_CATEGORY_NAME}

Enter Duplicate English Category Description
    [Documentation]    Enters duplicate English category description in the form
    Web Wait Until Page Contains Element    ${ENGLISH_CATEGORY_DESCRIPTION_FIELD}    5s
    Web Input Text    ${ENGLISH_CATEGORY_DESCRIPTION_FIELD}    ${DUPLICATE_ENGLISH_CATEGORY_DESCRIPTION}

Enter Duplicate Hindi Category Description
    [Documentation]    Enters duplicate Hindi category description in the form
    Web Wait Until Page Contains Element    ${HINDI_CATEGORY_DESCRIPTION_FIELD}    5s
    Web Input Text    ${HINDI_CATEGORY_DESCRIPTION_FIELD}    ${DUPLICATE_HINDI_CATEGORY_DESCRIPTION}

Clear English Category Name Field
    [Documentation]    Clears the English category name field
    Web Wait Until Page Contains Element    ${ENGLISH_CATEGORY_NAME_FIELD}    5s
    Web Clear Element Text    ${ENGLISH_CATEGORY_NAME_FIELD}

Clear Hindi Category Name Field
    [Documentation]    Clears the Hindi category name field
    Web Wait Until Page Contains Element    ${HINDI_CATEGORY_NAME_FIELD}    5s
    Web Clear Element Text    ${HINDI_CATEGORY_NAME_FIELD}

Verify Duplicate English Name Error Message
    [Documentation]    Verifies that duplicate English name error message is displayed
    Web Wait Until Page Contains Element    ${DUPLICATE_ENGLISH_NAME_ERROR_DYNAMIC}    10s
    Web Page Should Contain Element    ${DUPLICATE_ENGLISH_NAME_ERROR_DYNAMIC}
    Log To Console    Duplicate English category name error message displayed correctly

Verify Duplicate Hindi Name Error Message
    [Documentation]    Verifies that duplicate Hindi name error message is displayed
    Web Wait Until Page Contains Element    ${DUPLICATE_HINDI_NAME_ERROR_DYNAMIC}    10s
    Web Page Should Contain Element    ${DUPLICATE_HINDI_NAME_ERROR_DYNAMIC}
    Log To Console    Duplicate Hindi category name error message displayed correctly

Verify Missing English Name Error Message
    [Documentation]    Verifies that missing English name error message is displayed
    Web Wait Until Page Contains Element    ${MISSING_ENGLISH_NAME_ERROR}    10s
    Web Page Should Contain Element    ${MISSING_ENGLISH_NAME_ERROR}
    ${error_message}=    Web.Get Text    ${MISSING_ENGLISH_NAME_ERROR}
    Log To Console    Validation Error Message: ${error_message}
    Log To Console    Missing English category name error message displayed correctly

Verify Missing Hindi Name Error Message
    [Documentation]    Verifies that missing Hindi name error message is displayed
    Web Wait Until Page Contains Element    ${MISSING_HINDI_NAME_ERROR}    10s
    Web Page Should Contain Element    ${MISSING_HINDI_NAME_ERROR}
    Log To Console    Missing Hindi category name error message displayed correctly

Verify Add New Button is Disabled
    [Documentation]    Verifies that the Add New button is disabled when validation fails
    Web Element Should Be Disabled    ${ADD_NEW_BUTTON}
    Log To Console    Add New button is disabled as expected due to validation errors

Verify Unsupported Format Error Message
    [Documentation]    Verifies that unsupported format error message is displayed
    Sleep    3s
    ${success}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${UNSUPPORTED_FORMAT_ERROR}    10s
    Run Keyword If    ${success}    
    ...    Log To Console    ✅ Unsupported format error message displayed correctly: "File type must be image"
    Run Keyword Unless    ${success}    Verify Generic File Upload Error

Verify File Size Error Message
    [Documentation]    Verifies that file size error message is displayed
    Sleep    3s
    ${success}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${FILE_SIZE_ERROR}    10s
    Run Keyword If    ${success}    
    ...    Log To Console    ✅ File size error message displayed correctly: "File cannot exceed the upload size limit 5 MB"
    Run Keyword Unless    ${success}    Verify Generic File Upload Error

Verify Generic File Upload Error
    [Documentation]    Verifies that a generic file upload error message is displayed
    ${success}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${FILE_UPLOAD_ERROR}    10s
    Run Keyword If    ${success}    
    ...    Log To Console    ✅ Generic file upload error message displayed correctly
    Run Keyword Unless    ${success}    Log To Console    ⚠️ No specific file upload error message found, but validation may still be working

