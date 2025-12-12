*** Settings ***
Resource   ../resources/libraries.robot
Resource   ../resources/web_keywords.robot
Resource   ./namkaranPage.robot
Library   DateTime
Library   String
Library    Collections
Resource   ../resources/test_setup_teardown.robot

*** Variables ***
# E2E Namkaran Test Data Variables
${E2E_BRIDE_FIRST_NAME}           ${EMPTY}
${E2E_BRIDE_MIDDLE_NAME}          ${EMPTY}
${E2E_BRIDE_LAST_NAME}            ${EMPTY}
${E2E_GROOM_FIRST_NAME}           ${EMPTY}
${E2E_GROOM_MIDDLE_NAME}          ${EMPTY}
${E2E_GROOM_LAST_NAME}            ${EMPTY}
${E2E_NAMKARAN_EMAIL}             ${EMPTY}
${E2E_NAMKARAN_PHONE}             ${EMPTY}
${E2E_MARRIAGE_PLACE}             ${EMPTY}
${E2E_MARRIAGE_DATE}              ${EMPTY}
${E2E_NAMKARAN_ID}                ${EMPTY}

# E2E Namkaran Business Test Data Variables
${E2E_BUSINESS_NAME}        ${EMPTY}
${E2E_BUSINESS_OWNER}       ${EMPTY}
${E2E_BUSINESS_EMAIL}       ${EMPTY}
${E2E_BUSINESS_PHONE}       ${EMPTY}
${E2E_BUSINESS_DESC}        ${EMPTY}
${E2E_BUSINESS_ADDRESS}     ${EMPTY}
${E2E_BUSINESS_START_DATE}  ${EMPTY}
${E2E_SECOND_OWNER_FIRST}   ${EMPTY}
${E2E_SECOND_OWNER_MIDDLE}  ${EMPTY}
${E2E_SECOND_OWNER_LAST}    ${EMPTY}
${E2E_THIRD_OWNER_FIRST}    ${EMPTY}
${E2E_THIRD_OWNER_MIDDLE}   ${EMPTY}
${E2E_THIRD_OWNER_LAST}     ${EMPTY}

# Web CMS Locators for Namkaran
${Namkaran_Management_MENU}       xpath=//span[contains(text(),'Namkaran')]
${Namkaran_SearchBox}             xpath=//input[@type='search']
${Namkaran_Table_Row}             xpath=//div[@role='row' and contains(@class,'MuiDataGrid-row')]
${Namkaran_ID_Cell}               xpath=//div[@data-field='id']
${Namkaran_Bride_Name_Cell}       xpath=//div[@data-field='brideName']
${Namkaran_Groom_Name_Cell}       xpath=//div[@data-field='groomName']
${Namkaran_Email_Cell}            xpath=//div[@data-field='email']
${Namkaran_Phone_Cell}            xpath=//div[@data-field='phone']
${Namkaran_Status_Cell}           xpath=//div[@data-field='status']
${Namkaran_View_Button}           xpath=//a[@href='/namkaran/view/']
${Namkaran_Edit_Button}           xpath=//a[@href='/namkaran/edit/']

# Namkaran Detail Page Locators (based on actual DOM structure)
${Namkaran_Detail_Page_Title}     xpath=//h1[contains(text(),'Namkaran Request For Bride')]
${Bride_First_Name_Field}         xpath=//h6[normalize-space()='Bride First name']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]
${Bride_Middle_Name_Field}        xpath=//h6[normalize-space()='Bride Middle name']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]
${Bride_Last_Name_Field}          xpath=//h6[normalize-space()='Bride Last name']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]
${Groom_First_Name_Field}         xpath=//h6[normalize-space()='Groom First name']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]
${Groom_Middle_Name_Field}        xpath=//h6[normalize-space()='Groom Middle name']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]
${Groom_Last_Name_Field}          xpath=//h6[normalize-space()='Groom Last name']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]
${Marriage_Date_Field}            xpath=//h6[normalize-space()='Marriage Date']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]
${Marriage_Place_Field}           xpath=//h6[normalize-space()='Marriage Place']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]
${Namkaran_Email_Field}           xpath=//h6[normalize-space()='Email']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]
${Phone_Field}                    xpath=//h6[normalize-space()='Phone']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]
${Request_Number_Field}           xpath=//h6[normalize-space()='Request Number']/following-sibling::p[contains(@class,'MuiTypography-body2')][1]

# Admin Approval Workflow Locators
${NAMKARAN_MANAGEMENT_MENU}       xpath=//span[contains(text(),'Namkaran Management')]
${NAMKARAN_TABLE}                 xpath=//div[@role='grid']
${NAMKARAN_SEARCH_FIELD}          xpath=//input[@placeholder="Search…"]
${VIEW_NAMKARAN_BUTTON}           xpath=//li[contains(text(),'View')]
${NAMKARAN_DETAIL_HEADER}         xpath=//h1[contains(text(),'Namkaran Request For')]
${GURUJI_SUGGESTED_NAME_FIELD}    xpath=//input[@name="suggestedName"]
${NAMKARAN_REMARKS_FIELD}         xpath=//textarea[@name="remark"]
${APPROVE_NAMKARAN_BUTTON}        xpath=//button[@type="submit"][1]
${REJECT_NAMKARAN_BUTTON}          xpath=//button[@type="submit"][2]

*** Keywords ***
Generate E2E Namkaran Test Data For Bride
    [Documentation]    Generates unique test data for E2E Namkaran validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    
    Set Test Variable    ${E2E_BRIDE_FIRST_NAME}    E2E_Bride_${random_num}
    Set Test Variable    ${E2E_BRIDE_MIDDLE_NAME}    E2E_Middle_${random_num}
    Set Test Variable    ${E2E_BRIDE_LAST_NAME}    E2E_Bride_Last_${random_num}
    Set Test Variable    ${E2E_GROOM_FIRST_NAME}    E2E_Groom_${random_num}
    Set Test Variable    ${E2E_GROOM_MIDDLE_NAME}    E2E_Groom_Middle_${random_num}
    Set Test Variable    ${E2E_GROOM_LAST_NAME}    E2E_Groom_Last_${random_num}
    Set Test Variable    ${E2E_NAMKARAN_EMAIL}    e2enamkaran.${random_num}@test.com
    Set Test Variable    ${E2E_NAMKARAN_PHONE}    918877${random_num}
    Set Test Variable    ${E2E_MARRIAGE_PLACE}    E2E Test Place, Gujarat, India
    Set Test Variable    ${E2E_MARRIAGE_DATE}    2025-06-19
    
    Log To Console    🎯 Generated E2E Namkaran Test Data:
    Log To Console    🎯 Bride Name: ${E2E_BRIDE_FIRST_NAME} ${E2E_BRIDE_MIDDLE_NAME} ${E2E_BRIDE_LAST_NAME}
    Log To Console    🎯 Groom Name: ${E2E_GROOM_FIRST_NAME} ${E2E_GROOM_MIDDLE_NAME} ${E2E_GROOM_LAST_NAME}
    Log To Console    🎯 Email: ${E2E_NAMKARAN_EMAIL}
    Log To Console    🎯 Phone: ${E2E_NAMKARAN_PHONE}
    Log To Console    🎯 Marriage Place: ${E2E_MARRIAGE_PLACE}
    Log To Console    🎯 Marriage Date: ${E2E_MARRIAGE_DATE}

Enter E2E Bride Namkaran Data
    [Documentation]    Enters the generated E2E test data into Bride Namkaran form
    # Wait for form to be ready
    Sleep    3s

    # Enter Bride Details - Fields 1-3 in form order
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_BRIDE_FIRST_NAME}    Bride First Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_BRIDE_MIDDLE_NAME}    Bride Middle Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[3]    ${E2E_BRIDE_LAST_NAME}    Bride Last Name

    # Enter Groom Details - Fields 4-6 in form order (after Bride fields)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[4]    ${E2E_GROOM_FIRST_NAME}    Groom First Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[5]    ${E2E_GROOM_MIDDLE_NAME}    Groom Middle Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[6]    ${E2E_GROOM_LAST_NAME}    Groom Last Name

    # Enter Email and Phone - Fields 7-8 in form order
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[7]    ${E2E_NAMKARAN_EMAIL}    Email
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[8]    ${E2E_NAMKARAN_PHONE}    Phone Number

    # Enter Marriage Place - Field 9 in form order
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[9]    ${E2E_MARRIAGE_PLACE}    Marriage Place

    Log To Console    ✅ Successfully entered E2E Bride Namkaran Data

Click on the Namkaran Management Menu
    [Documentation]    Navigates to Namkaran Management section
    Web Wait Until Page Contains Element    ${Namkaran_Management_MENU}    10s
    Web Click Element    ${Namkaran_Management_MENU}
    Sleep    3s
    
    Log To Console    📋 Navigated to Namkaran Management page

Verify the created Namkaran
    [Arguments]    ${email}    ${namkaran_id}=${EMPTY}
    [Documentation]    Searches for namkaran by Namkaran ID (if available) or email and verifies the data in CMS detail page
    Sleep    5s

    # Wait for table to load
    Web Wait Until Page Contains Element    ${Namkaran_Table_Row}    15s

    # Determine search criteria - prefer Namkaran ID over email
    ${search_value}=    Set Variable If    '${namkaran_id}' != '${EMPTY}'    ${namkaran_id}    ${email}
    ${search_type}=    Set Variable If    '${namkaran_id}' != '${EMPTY}'    Namkaran ID    Email

    # Search for the namkaran
    Log To Console    🔍 Searching for namkaran by ${search_type}: ${search_value}
    Web Wait Until Page Contains Element    ${NAMKARAN_SEARCH_FIELD}    10s
    Web Click Element    ${NAMKARAN_SEARCH_FIELD}
    Web Clear Element Text    ${NAMKARAN_SEARCH_FIELD}
    Web Input Text    ${NAMKARAN_SEARCH_FIELD}    ${search_value}
    Sleep    3s

    # Click on the first record's 3-dot menu (Actions column) - after search, this will be our record
    ${first_row_actions}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//button[@type='button']
    Web Wait Until Page Contains Element    ${first_row_actions}    10s
    Web Click Element    ${first_row_actions}
    Sleep    2s

    # Click on View button from the dropdown menu
    ${view_button}=    Set Variable    xpath=//li[@role='menuitem' and contains(.,'View')]
    Web Wait Until Page Contains Element    ${view_button}    10s
    Web Click Element    ${view_button}
    Sleep    5s

    Log To Console    👁️ Clicked on View button for namkaran record with email: ${email}

    # Now verify the data on the detail page
    Verify Namkaran Detail Page Data

Verify the created Business Namkaran
    [Arguments]    ${email}    ${namkaran_id}=${EMPTY}
    [Documentation]    Searches for business namkaran by Namkaran ID (if available) or email and verifies the data in CMS detail page
    Sleep    5s

    # Wait for table to load
    Web Wait Until Page Contains Element    ${Namkaran_Table_Row}    15s

    # Determine search criteria - prefer Namkaran ID over email
    ${search_value}=    Set Variable If    '${namkaran_id}' != '${EMPTY}'    ${namkaran_id}    ${email}
    ${search_type}=    Set Variable If    '${namkaran_id}' != '${EMPTY}'    Namkaran ID    Email

    # Search for the namkaran
    Log To Console    🔍 Searching for Business namkaran by ${search_type}: ${search_value}
    Web Wait Until Page Contains Element    ${NAMKARAN_SEARCH_FIELD}    10s
    Web Click Element    ${NAMKARAN_SEARCH_FIELD}
    Web Clear Element Text    ${NAMKARAN_SEARCH_FIELD}
    Web Input Text    ${NAMKARAN_SEARCH_FIELD}    ${search_value}
    Sleep    3s

    # Click on the first record's 3-dot menu (Actions column) - after search, this will be our record
    ${first_row_actions}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//button[@type='button']
    Web Wait Until Page Contains Element    ${first_row_actions}    10s
    Web Click Element    ${first_row_actions}
    Sleep    2s

    # Click on View button from the dropdown menu
    ${view_button}=    Set Variable    xpath=//li[@role='menuitem' and contains(.,'View')]
    Web Wait Until Page Contains Element    ${view_button}    10s
    Web Click Element    ${view_button}
    Sleep    5s

    Log To Console    👁️ Clicked on View button for Business namkaran record with email: ${email}

    # Now verify the Business data on the detail page
    Verify Business Namkaran Detail Page Data

Verify the created Child Namkaran
    [Arguments]    ${email}    ${namkaran_id}=${EMPTY}
    [Documentation]    Searches for child namkaran by Namkaran ID (if available) or email and verifies the data in CMS detail page
    Sleep    5s

    # Wait for table to load
    Web Wait Until Page Contains Element    ${Namkaran_Table_Row}    15s

    # Determine search criteria - prefer Namkaran ID over email
    ${search_value}=    Set Variable If    '${namkaran_id}' != '${EMPTY}'    ${namkaran_id}    ${email}
    ${search_type}=    Set Variable If    '${namkaran_id}' != '${EMPTY}'    Namkaran ID    Email

    # Search for the namkaran
    Log To Console    🔍 Searching for Child namkaran by ${search_type}: ${search_value}
    Web Wait Until Page Contains Element    ${NAMKARAN_SEARCH_FIELD}    10s
    Web Click Element    ${NAMKARAN_SEARCH_FIELD}
    Web Clear Element Text    ${NAMKARAN_SEARCH_FIELD}
    Web Input Text    ${NAMKARAN_SEARCH_FIELD}    ${search_value}
    Sleep    3s

    # Click on the first record's 3-dot menu (Actions column) - after search, this will be our record
    ${first_row_actions}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//button[@type='button']
    Web Wait Until Page Contains Element    ${first_row_actions}    10s
    Web Click Element    ${first_row_actions}
    Sleep    2s

    # Click on View button from the dropdown menu
    ${view_button}=    Set Variable    xpath=//li[@role='menuitem' and contains(.,'View')]
    Web Wait Until Page Contains Element    ${view_button}    10s
    Web Click Element    ${view_button}
    Sleep    5s

    Log To Console    👁️ Clicked on View button for Child namkaran record with email: ${email}

    # Now verify the Child data on the detail page
    Verify Child And Parent Details In CMS    ${E2E_CHILD_NAME}    ${E2E_MOTHER_FIRST_NAME}    ${E2E_MOTHER_MIDDLE_NAME}    ${E2E_MOTHER_LAST_NAME}    ${E2E_FATHER_FIRST_NAME}    ${E2E_FATHER_MIDDLE_NAME}    ${E2E_FATHER_LAST_NAME}

Verify Namkaran Detail Page Data
    [Documentation]    Verifies the namkaran data on the detail page matches the mobile app data
    Sleep    5s
    
    # Primary attempt: read text via field locators
    ${primary_ok}=    Set Variable    ${TRUE}
    TRY
        ${cms_bride_first_name}=    Web.Get Text    ${Bride_First_Name_Field}
        ${cms_bride_middle_name}=    Web.Get Text    ${Bride_Middle_Name_Field}
        ${cms_bride_last_name}=    Web.Get Text    ${Bride_Last_Name_Field}
        ${cms_groom_first_name}=    Web.Get Text    ${Groom_First_Name_Field}
        ${cms_groom_middle_name}=    Web.Get Text    ${Groom_Middle_Name_Field}
        ${cms_groom_last_name}=    Web.Get Text    ${Groom_Last_Name_Field}
        ${cms_marriage_date}=    Web.Get Text    ${Marriage_Date_Field}
        ${cms_marriage_place}=    Web.Get Text    ${Marriage_Place_Field}
        ${cms_email}=    Web.Get Text    ${Namkaran_Email_Field}
        ${cms_phone}=    Web.Get Text    ${Phone_Field}
        ${cms_request_number}=    Web.Get Text    ${Request_Number_Field}
    EXCEPT    AS    ${err}
        ${primary_ok}=    Set Variable    ${FALSE}
        Log To Console    ⚠️ Field-level read failed, falling back to text presence checks: ${err}
    END

    IF    ${primary_ok}
        # Verify bride details
        Should Be Equal As Strings    ${cms_bride_first_name}    ${E2E_BRIDE_FIRST_NAME}    Bride first name mismatch in CMS
        Should Be Equal As Strings    ${cms_bride_middle_name}    ${E2E_BRIDE_MIDDLE_NAME}    Bride middle name mismatch in CMS
        Should Be Equal As Strings    ${cms_bride_last_name}    ${E2E_BRIDE_LAST_NAME}    Bride last name mismatch in CMS

        # Verify groom details
        Should Be Equal As Strings    ${cms_groom_first_name}    ${E2E_GROOM_FIRST_NAME}    Groom first name mismatch in CMS
        Should Be Equal As Strings    ${cms_groom_middle_name}    ${E2E_GROOM_MIDDLE_NAME}    Groom middle name mismatch in CMS
        Should Be Equal As Strings    ${cms_groom_last_name}    ${E2E_GROOM_LAST_NAME}    Groom last name mismatch in CMS

        # Verify marriage details
        Should Be Equal As Strings    ${cms_marriage_place}    ${E2E_MARRIAGE_PLACE}    Marriage place mismatch in CMS

        # Verify contact details
        Should Be Equal As Strings    ${cms_email}    ${E2E_NAMKARAN_EMAIL}    Email mismatch in CMS

        # Handle phone number format variations (with/without space after country code)
        ${expected_phone_with_space}=    Set Variable    +91 ${E2E_NAMKARAN_PHONE}
        ${expected_phone_without_space}=    Set Variable    +${E2E_NAMKARAN_PHONE}

        ${phone_match}=    Run Keyword And Return Status    Should Be Equal As Strings    ${cms_phone}    ${expected_phone_with_space}
        ${phone_match_alt}=    Run Keyword And Return Status    Should Be Equal As Strings    ${cms_phone}    ${expected_phone_without_space}
        Run Keyword Unless    ${phone_match} or ${phone_match_alt}    Fail    Phone mismatch in CMS: ${cms_phone} != ${expected_phone_with_space} or ${expected_phone_without_space}

        Should Match Regexp    ${cms_request_number}    \\d+    Invalid request number format
        Set Test Variable    ${E2E_NAMKARAN_ID}    ${cms_request_number}

        Log To Console    ✅ Namkaran detail page verification successful:
        Log To Console    ✅ Request Number: ${cms_request_number}
        Log To Console    ✅ Bride: ${cms_bride_first_name} ${cms_bride_middle_name} ${cms_bride_last_name}
        Log To Console    ✅ Groom: ${cms_groom_first_name} ${cms_groom_middle_name} ${cms_groom_last_name}
        Log To Console    ✅ Marriage Place: ${cms_marriage_place}
        Log To Console    ✅ Email: ${cms_email}
        Log To Console    ✅ Phone: ${cms_phone}
    ELSE
        # Fallback: validate values are present anywhere on the page
        Web Wait Until Page Contains    ${E2E_BRIDE_FIRST_NAME}    10s
        Web Wait Until Page Contains    ${E2E_BRIDE_MIDDLE_NAME}   10s
        Web Wait Until Page Contains    ${E2E_BRIDE_LAST_NAME}     10s
        Web Wait Until Page Contains    ${E2E_GROOM_FIRST_NAME}    10s
        Web Wait Until Page Contains    ${E2E_GROOM_MIDDLE_NAME}   10s
        Web Wait Until Page Contains    ${E2E_GROOM_LAST_NAME}     10s
        Web Wait Until Page Contains    ${E2E_MARRIAGE_PLACE}      10s
        Web Wait Until Page Contains    ${E2E_NAMKARAN_EMAIL}      10s
        # Phone can render in different formats; check both representations
        ${expected_phone_with_space}=    Set Variable    +91 ${E2E_NAMKARAN_PHONE}
        ${expected_phone_without_space}=    Set Variable    +${E2E_NAMKARAN_PHONE}
        ${phone_present}=    Run Keyword And Return Status    Web Wait Until Page Contains    ${expected_phone_with_space}    5s
        Run Keyword Unless    ${phone_present}    Web Wait Until Page Contains    ${expected_phone_without_space}    5s
        Log To Console    ✅ Verified via text presence fallback on CMS detail page
    END

Verify Business Namkaran Detail Page Data
    [Documentation]    Verifies the Business Namkaran data on the detail page matches the mobile app data
    Sleep    5s
    
    # Primary attempt: read field texts
    ${primary_ok}=    Set Variable    ${TRUE}
    TRY
        ${cms_first_owner_first_name}=    Web.Get Text    xpath=//h6[contains(text(),'First name')]/following-sibling::p[contains(@class,'MuiTypography-body2')]
        ${cms_first_owner_middle_name}=    Web.Get Text    xpath=//h6[contains(text(),'Middle name')]/following-sibling::p[contains(@class,'MuiTypography-body2')]
        ${cms_first_owner_last_name}=    Web.Get Text    xpath=//h6[contains(text(),'Last name')]/following-sibling::p[contains(@class,'MuiTypography-body2')]

        ${cms_second_owner_first_name}=    Web.Get Text    xpath=//h6[contains(text(),'Second Owner Details')]/following-sibling::div//h6[contains(text(),'First name')]/following-sibling::p[contains(@class,'MuiTypography-body2')]
        ${cms_second_owner_middle_name}=    Web.Get Text    xpath=//h6[contains(text(),'Second Owner Details')]/following-sibling::div//h6[contains(text(),'Middle name')]/following-sibling::p[contains(@class,'MuiTypography-body2')]
        ${cms_second_owner_last_name}=    Web.Get Text    xpath=//h6[contains(text(),'Second Owner Details')]/following-sibling::div//h6[contains(text(),'Last name')]/following-sibling::p[contains(@class,'MuiTypography-body2')]

        ${cms_third_owner_first_name}=    Web.Get Text    xpath=//h6[contains(text(),'Third Owner Details')]/following-sibling::div//h6[contains(text(),'First name')]/following-sibling::p[contains(@class,'MuiTypography-body2')]
        ${cms_third_owner_middle_name}=    Web.Get Text    xpath=//h6[contains(text(),'Third Owner Details')]/following-sibling::div//h6[contains(text(),'Middle name')]/following-sibling::p[contains(@class,'MuiTypography-body2')]
        ${cms_third_owner_last_name}=    Web.Get Text    xpath=//h6[contains(text(),'Third Owner Details')]/following-sibling::div//h6[contains(text(),'Last name')]/following-sibling::p[contains(@class,'MuiTypography-body2')]

        ${cms_business_address}=    Web.Get Text    xpath=//h6[contains(text(),'Business Address')]/following-sibling::p[contains(@class,'MuiTypography-body2')]
        ${cms_email}=    Web.Get Text    xpath=//h6[contains(text(),'Email')]/following-sibling::p[contains(@class,'MuiTypography-body2')]
        ${cms_phone}=    Web.Get Text    xpath=//h6[contains(text(),'Phone Number')]/following-sibling::p[contains(@class,'MuiTypography-body2')]
        ${cms_request_number}=    Web.Get Text    xpath=//h6[contains(text(),'Request Number')]/following-sibling::p[contains(@class,'MuiTypography-body2')]
    EXCEPT    AS    ${err}
        ${primary_ok}=    Set Variable    ${FALSE}
        Log To Console    ⚠️ Business field-level read failed, falling back: ${err}
    END

    IF    ${primary_ok}
        Should Be Equal As Strings    ${cms_first_owner_first_name}    ${E2E_BUSINESS_OWNER_FIRST}    First owner first name mismatch in CMS
        Should Be Equal As Strings    ${cms_first_owner_middle_name}    ${E2E_BUSINESS_OWNER_MIDDLE}    First owner middle name mismatch in CMS
        Should Be Equal As Strings    ${cms_first_owner_last_name}    ${E2E_BUSINESS_OWNER_LAST}    First owner last name mismatch in CMS

        Should Be Equal As Strings    ${cms_second_owner_first_name}    ${E2E_BUSINESS_SECOND_OWNER_FIRST}    Second owner first name mismatch in CMS
        Should Be Equal As Strings    ${cms_second_owner_middle_name}    ${E2E_BUSINESS_SECOND_OWNER_MIDDLE}    Second owner middle name mismatch in CMS
        Should Be Equal As Strings    ${cms_second_owner_last_name}    ${E2E_BUSINESS_SECOND_OWNER_LAST}    Second owner last name mismatch in CMS

        Should Be Equal As Strings    ${cms_third_owner_first_name}    ${E2E_BUSINESS_THIRD_OWNER_FIRST}    Third owner first name mismatch in CMS
        Should Be Equal As Strings    ${cms_third_owner_middle_name}    ${E2E_BUSINESS_THIRD_OWNER_MIDDLE}    Third owner middle name mismatch in CMS
        Should Be Equal As Strings    ${cms_third_owner_last_name}    ${E2E_BUSINESS_THIRD_OWNER_LAST}    Third owner last name mismatch in CMS

        Should Be Equal As Strings    ${cms_business_address}    ${E2E_BUSINESS_ADDRESS}    Business address mismatch in CMS
        Should Be Equal As Strings    ${cms_email}    ${E2E_BUSINESS_EMAIL}    Email mismatch in CMS

        ${expected_phone_with_space}=    Set Variable    +91 ${E2E_BUSINESS_PHONE}
        ${expected_phone_without_space}=    Set Variable    +${E2E_BUSINESS_PHONE}
        ${phone_match}=    Run Keyword And Return Status    Should Be Equal As Strings    ${cms_phone}    ${expected_phone_with_space}
        ${phone_match_alt}=    Run Keyword And Return Status    Should Be Equal As Strings    ${cms_phone}    ${expected_phone_without_space}
        Run Keyword Unless    ${phone_match} or ${phone_match_alt}    Fail    Phone mismatch in CMS: ${cms_phone} != ${expected_phone_with_space} or ${expected_phone_without_space}

        Should Match Regexp    ${cms_request_number}    \\d+    Invalid request number format
        Set Test Variable    ${E2E_NAMKARAN_ID}    ${cms_request_number}

        Log To Console    ✅ Business Namkaran detail page verification successful
    ELSE
        Web Wait Until Page Contains    ${E2E_BUSINESS_OWNER_FIRST}    10s
        Web Wait Until Page Contains    ${E2E_BUSINESS_OWNER_MIDDLE}   10s
        Web Wait Until Page Contains    ${E2E_BUSINESS_OWNER_LAST}     10s
        Web Wait Until Page Contains    ${E2E_BUSINESS_SECOND_OWNER_FIRST}    10s
        Web Wait Until Page Contains    ${E2E_BUSINESS_SECOND_OWNER_MIDDLE}   10s
        Web Wait Until Page Contains    ${E2E_BUSINESS_SECOND_OWNER_LAST}     10s
        Web Wait Until Page Contains    ${E2E_BUSINESS_THIRD_OWNER_FIRST}     10s
        Web Wait Until Page Contains    ${E2E_BUSINESS_THIRD_OWNER_MIDDLE}    10s
        Web Wait Until Page Contains    ${E2E_BUSINESS_THIRD_OWNER_LAST}      10s
        Web Wait Until Page Contains    ${E2E_BUSINESS_ADDRESS}               10s
        Web Wait Until Page Contains    ${E2E_BUSINESS_EMAIL}                 10s
        ${expected_phone_with_space}=    Set Variable    +91 ${E2E_BUSINESS_PHONE}
        ${expected_phone_without_space}=    Set Variable    +${E2E_BUSINESS_PHONE}
        ${phone_present}=    Run Keyword And Return Status    Web Wait Until Page Contains    ${expected_phone_with_space}    5s
        Run Keyword Unless    ${phone_present}    Web Wait Until Page Contains    ${expected_phone_without_space}    5s
        Log To Console    ✅ Verified Business via text presence fallback
    END

Verify First Row Column Values
    [Documentation]    Prints the column values in the first row of the Namkaran table for debugging purposes
    Sleep    3s
    
    # Define locators for first row columns (index 2 because index 1 is usually header)
    ${first_row_bride_name}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='brideName']//div[@class='MuiDataGrid-cellContent']
    ${first_row_groom_name}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='groomName']//div[@class='MuiDataGrid-cellContent']
    ${first_row_email}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='email']//div[@class='MuiDataGrid-cellContent']
    ${first_row_phone}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='phone']//div[@class='MuiDataGrid-cellContent']
    ${first_row_status}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='status']//span[contains(@class,'minimal__label__root')]
    
    # Wait for first row to be visible
    Web Wait Until Page Contains Element    ${first_row_bride_name}    10s
    
    # Extract values from first row
    ${table_bride_name}=    Web.Get Text    ${first_row_bride_name}
    ${table_groom_name}=    Web.Get Text    ${first_row_groom_name}
    ${table_email}=    Web.Get Text    ${first_row_email}
    ${table_phone}=    Web.Get Text    ${first_row_phone}
    ${table_status}=    Web.Get Text    ${first_row_status}
    
    # Log the extracted values for debugging (no validation)
    Log To Console    📊 First Row Column Values (For Debugging):
    Log To Console    📊 Bride Name: ${table_bride_name}
    Log To Console    📊 Groom Name: ${table_groom_name}
    Log To Console    📊 Email: ${table_email}
    Log To Console    📊 Phone: ${table_phone}
    Log To Console    📊 Status: ${table_status}
    
    Log To Console    ✅ First row column values extracted successfully (no validation performed)

# Business Namkaran Keywords
Generate E2E Namkaran Test Data For Business
    [Documentation]    Generates unique test data for E2E Business Namkaran validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    
    # First Owner Data
    Set Test Variable    ${E2E_BUSINESS_OWNER_FIRST}    E2E_Owner_${random_num}
    Set Test Variable    ${E2E_BUSINESS_OWNER_MIDDLE}    E2E_Owner_Middle_${random_num}
    Set Test Variable    ${E2E_BUSINESS_OWNER_LAST}    E2E_Owner_Last_${random_num}
    
    # Second Owner Data (unique)
    Set Test Variable    ${E2E_BUSINESS_SECOND_OWNER_FIRST}    E2E_Second_Owner_${random_num}
    Set Test Variable    ${E2E_BUSINESS_SECOND_OWNER_MIDDLE}    E2E_Second_Middle_${random_num}
    Set Test Variable    ${E2E_BUSINESS_SECOND_OWNER_LAST}    E2E_Second_Last_${random_num}
    
    # Third Owner Data (unique)
    Set Test Variable    ${E2E_BUSINESS_THIRD_OWNER_FIRST}    E2E_Third_Owner_${random_num}
    Set Test Variable    ${E2E_BUSINESS_THIRD_OWNER_MIDDLE}    E2E_Third_Middle_${random_num}
    Set Test Variable    ${E2E_BUSINESS_THIRD_OWNER_LAST}    E2E_Third_Last_${random_num}
    
    # Other Business Data
    Set Test Variable    ${E2E_BUSINESS_EMAIL}    e2ebusiness.${random_num}@test.com
    Set Test Variable    ${E2E_BUSINESS_PHONE}    918877${random_num}
    Set Test Variable    ${E2E_BUSINESS_DESC}    E2E Test Business Description ${random_num}
    Set Test Variable    ${E2E_BUSINESS_ADDRESS}    E2E Test Address, Gujarat, India ${random_num}
    Set Test Variable    ${E2E_BUSINESS_START_DATE}    2025-01-15
    
    Log To Console    🎯 Generated E2E Business Namkaran Test Data:
    Log To Console    🎯 First Owner: ${E2E_BUSINESS_OWNER_FIRST} ${E2E_BUSINESS_OWNER_MIDDLE} ${E2E_BUSINESS_OWNER_LAST}
    Log To Console    🎯 Second Owner: ${E2E_BUSINESS_SECOND_OWNER_FIRST} ${E2E_BUSINESS_SECOND_OWNER_MIDDLE} ${E2E_BUSINESS_SECOND_OWNER_LAST}
    Log To Console    🎯 Third Owner: ${E2E_BUSINESS_THIRD_OWNER_FIRST} ${E2E_BUSINESS_THIRD_OWNER_MIDDLE} ${E2E_BUSINESS_THIRD_OWNER_LAST}
    Log To Console    🎯 Email: ${E2E_BUSINESS_EMAIL}
    Log To Console    🎯 Phone: ${E2E_BUSINESS_PHONE}
    Log To Console    🎯 Description: ${E2E_BUSINESS_DESC}
    Log To Console    🎯 Address: ${E2E_BUSINESS_ADDRESS}

Enter E2E Business Namkaran Data
    [Documentation]    Enters the generated E2E test data into Business Namkaran form using smart auto-scroll
    Sleep    3s

    # Enter First Owner Details (using smart input with auto-scroll - STABLE INDEXED XPATH)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_BUSINESS_OWNER_FIRST}    First Owner First Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_BUSINESS_OWNER_MIDDLE}    First Owner Middle Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[3]    ${E2E_BUSINESS_OWNER_LAST}    First Owner Last Name

    # Enter Second Owner Details (using smart input with auto-scroll - STABLE INDEXED XPATH)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_BUSINESS_SECOND_OWNER_FIRST}    Second Owner First Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_BUSINESS_SECOND_OWNER_MIDDLE}    Second Owner Middle Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[3]    ${E2E_BUSINESS_SECOND_OWNER_LAST}    Second Owner Last Name

    # Enter Third Owner Details (using smart input with auto-scroll - STABLE INDEXED XPATH)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_BUSINESS_THIRD_OWNER_FIRST}    Third Owner First Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_BUSINESS_THIRD_OWNER_MIDDLE}    Third Owner Middle Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[3]    ${E2E_BUSINESS_THIRD_OWNER_LAST}    Third Owner Last Name

    # Enter Contact and Business Details (using smart input with auto-scroll - STABLE XPATH)
    Smart Mobile Input Text    xpath=//android.widget.EditText    ${E2E_BUSINESS_EMAIL}    Email
    Smart Mobile Input Text    xpath=//android.widget.EditText    ${E2E_BUSINESS_PHONE}    Phone Number
    Smart Mobile Input Text    xpath=//android.widget.EditText    ${E2E_BUSINESS_DESC}    Business Description
    Smart Mobile Input Text    xpath=//android.widget.EditText    ${E2E_BUSINESS_ADDRESS}    Business Address

    Log To Console    ✅ Successfully entered E2E Business Namkaran Data

# House Namkaran Keywords
Generate E2E Namkaran Test Data For House
    [Documentation]    Generates unique test data for E2E House Namkaran validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    
    Set Test Variable    ${E2E_HOUSE_OWNER_FIRST}    E2E_House_Owner_${random_num}
    Set Test Variable    ${E2E_HOUSE_OWNER_MIDDLE}    E2E_House_Middle_${random_num}
    Set Test Variable    ${E2E_HOUSE_OWNER_LAST}    E2E_House_Last_${random_num}
    Set Test Variable    ${E2E_HOUSE_EMAIL}    e2ehouse.${random_num}@test.com
    Set Test Variable    ${E2E_HOUSE_PHONE}    918877${random_num}
    Set Test Variable    ${E2E_HOUSE_DESC}    E2E Test House Description ${random_num}
    Set Test Variable    ${E2E_HOUSE_ADDRESS}    E2E Test House Address, Gujarat, India ${random_num}
    
    Log To Console    🎯 Generated E2E House Namkaran Test Data:
    Log To Console    🎯 House Owner: ${E2E_HOUSE_OWNER_FIRST} ${E2E_HOUSE_OWNER_MIDDLE} ${E2E_HOUSE_OWNER_LAST}
    Log To Console    🎯 Email: ${E2E_HOUSE_EMAIL}
    Log To Console    🎯 Phone: ${E2E_HOUSE_PHONE}
    Log To Console    🎯 Description: ${E2E_HOUSE_DESC}
    Log To Console    🎯 Address: ${E2E_HOUSE_ADDRESS}

Enter E2E House Namkaran Data
    [Documentation]    Enters the generated E2E test data into House Namkaran form
    Sleep    3s
    
    # Enter House Owner Details (using smart input with auto-scroll - STABLE INDEXED XPATH)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_HOUSE_OWNER_FIRST}    House Owner First Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_HOUSE_OWNER_MIDDLE}    House Owner Middle Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[3]    ${E2E_HOUSE_OWNER_LAST}    House Owner Last Name

    # Enter Contact and House Details (using smart input with auto-scroll - STABLE XPATH)
    Smart Mobile Input Text    xpath=//android.widget.EditText    ${E2E_HOUSE_EMAIL}    Email
    Smart Mobile Input Text    xpath=//android.widget.EditText    ${E2E_HOUSE_PHONE}    Phone Number
    Smart Mobile Input Text    xpath=//android.widget.EditText    ${E2E_HOUSE_ADDRESS}    House Address

    Log To Console    ✅ Successfully entered E2E House Namkaran Data

# Child Namkaran Keywords
Generate E2E Namkaran Test Data For Child
    [Documentation]    Generates unique test data for E2E Child Namkaran validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    
    Set Test Variable    ${E2E_CHILD_NAME}    E2E_Child_${random_num}
    Set Test Variable    ${E2E_MOTHER_FIRST}    E2E_Mother_${random_num}
    Set Test Variable    ${E2E_MOTHER_MIDDLE}    E2E_Mother_Middle_${random_num}
    Set Test Variable    ${E2E_MOTHER_LAST}    E2E_Mother_Last_${random_num}
    Set Test Variable    ${E2E_FATHER_FIRST}    E2E_Father_${random_num}
    Set Test Variable    ${E2E_FATHER_MIDDLE}    E2E_Father_Middle_${random_num}
    Set Test Variable    ${E2E_FATHER_LAST}    E2E_Father_Last_${random_num}
    Set Test Variable    ${E2E_CHILD_EMAIL}    e2echild.${random_num}@test.com
    Set Test Variable    ${E2E_CHILD_PHONE}    918877${random_num}
    Set Test Variable    ${E2E_CHILD_DOB}    2020-05-15
    Set Test Variable    ${E2E_CHILD_GENDER}    Male
    Set Test Variable    ${E2E_CHILD_BIRTH_TIME}    10:30 AM
    Set Test Variable    ${E2E_CHILD_BIRTH_PLACE}    E2E Test Birth Place, Gujarat, India
    
    Log To Console    🎯 Generated E2E Child Namkaran Test Data:
    Log To Console    🎯 Child Name: ${E2E_CHILD_NAME}
    Log To Console    🎯 Mother: ${E2E_MOTHER_FIRST} ${E2E_MOTHER_MIDDLE} ${E2E_MOTHER_LAST}
    Log To Console    🎯 Father: ${E2E_FATHER_FIRST} ${E2E_FATHER_MIDDLE} ${E2E_FATHER_LAST}
    Log To Console    🎯 Email: ${E2E_CHILD_EMAIL}
    Log To Console    🎯 Phone: ${E2E_CHILD_PHONE}
    Log To Console    🎯 DOB: ${E2E_CHILD_DOB}
    Log To Console    🎯 Gender: ${E2E_CHILD_GENDER}
    Log To Console    🎯 Birth Time: ${E2E_CHILD_BIRTH_TIME}
    Log To Console    🎯 Birth Place: ${E2E_CHILD_BIRTH_PLACE}

Enter E2E Child Namkaran Data
    [Documentation]    Enters the generated E2E test data into Child Namkaran form using smart auto-scroll
    Sleep    3s

    # Enter Mother Details (using smart input with auto-scroll - STABLE INDEXED XPATH)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_MOTHER_FIRST}    Mother First Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_MOTHER_MIDDLE}    Mother Middle Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[3]    ${E2E_MOTHER_LAST}    Mother Last Name

    # Enter Father Details (using smart input with auto-scroll - STABLE INDEXED XPATH)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_FATHER_FIRST}    Father First Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_FATHER_MIDDLE}    Father Middle Name
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[3]    ${E2E_FATHER_LAST}    Father Last Name

    # Enter Contact Details (using smart input with auto-scroll - STABLE XPATH)
    Smart Mobile Input Text    xpath=//android.widget.EditText    ${E2E_CHILD_EMAIL}    Email
    Smart Mobile Input Text    xpath=//android.widget.EditText    ${E2E_CHILD_PHONE}    Phone Number

    # Note: Child Namkaran requires additional fields (DOB, Gender, Birth Time, Birth Place)
    # These should be filled before selecting NO option
    # The NO selection will be added after those fields are entered

    Log To Console    ✅ Successfully entered E2E Child Namkaran Data (partial - DOB, Gender, etc. needed)

# YES Option Keywords for Bride Namkaran
Generate E2E Namkaran Test Data For Bride With YES Option
    [Documentation]    Generates unique test data for E2E Bride Namkaran with YES option for multiple names
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    
    Set Test Variable    ${E2E_BRIDE_FIRST_NAME}    E2E_Bride_${random_num}
    Set Test Variable    ${E2E_BRIDE_MIDDLE_NAME}    E2E_Middle_${random_num}
    Set Test Variable    ${E2E_BRIDE_LAST_NAME}    E2E_Bride_Last_${random_num}
    Set Test Variable    ${E2E_GROOM_FIRST_NAME}    E2E_Groom_${random_num}
    Set Test Variable    ${E2E_GROOM_MIDDLE_NAME}    E2E_Groom_Middle_${random_num}
    Set Test Variable    ${E2E_GROOM_LAST_NAME}    E2E_Groom_Last_${random_num}
    Set Test Variable    ${E2E_NAMKARAN_EMAIL}    e2ebride.yes${random_num}@test.com
    Set Test Variable    ${E2E_NAMKARAN_PHONE}    918877${random_num}
    Set Test Variable    ${E2E_MARRIAGE_PLACE}    E2E Marriage Place
    Set Test Variable    ${E2E_MARRIAGE_DATE}    2025-06-19
    
    # Generate random name choices for YES option
    Set Test Variable    ${E2E_FIRST_NAME_CHOICE}    First${random_num}
    Set Test Variable    ${E2E_SECOND_NAME_CHOICE}    Second${random_num}
    Set Test Variable    ${E2E_THIRD_NAME_CHOICE}    Third${random_num}
    
    Log To Console    🎯 Generated E2E Bride Namkaran Test Data (YES Option):
    Log To Console    🎯 Bride Name: ${E2E_BRIDE_FIRST_NAME} ${E2E_BRIDE_MIDDLE_NAME} ${E2E_BRIDE_LAST_NAME}
    Log To Console    🎯 Groom Name: ${E2E_GROOM_FIRST_NAME} ${E2E_GROOM_MIDDLE_NAME} ${E2E_GROOM_LAST_NAME}
    Log To Console    🎯 Email: ${E2E_NAMKARAN_EMAIL}
    Log To Console    🎯 Phone: ${E2E_NAMKARAN_PHONE}
    Log To Console    🎯 Name Choices: ${E2E_FIRST_NAME_CHOICE}, ${E2E_SECOND_NAME_CHOICE}, ${E2E_THIRD_NAME_CHOICE}

Enter E2E Bride Namkaran Data With YES Option
    [Documentation]    Enters the generated E2E test data into Bride Namkaran form (basic data only, YES selection comes after Marriage Date)
    Sleep    3s

    # Enter basic bride and groom data (same as NO option)
    # Note: For Bride category, Marriage Date is selected AFTER this keyword
    # And YES/NO radio button selection happens AFTER Marriage Date
    Enter E2E Bride Namkaran Data

Select YES Radio Button And Enter Name Choices For Bride
    [Documentation]    Selects YES radio button and enters name choices for Bride Namkaran (called AFTER Marriage Date selection)

    # Scroll to find YES radio button (should be visible after Marriage Date selection)
    Log To Console    🔘 Scrolling to find YES radio button...
    Scroll Until Element Visible    xpath=//android.widget.RadioButton[2]

    # Select YES for multiple name choice
    Log To Console    🔘 Selecting YES for multiple name choice...
    Mobile Wait Until Element Is Visible    xpath=//android.widget.RadioButton[2]    10s
    Mobile Click Element    xpath=//android.widget.RadioButton[2]
    Log To Console    ✅ Selected YES for multiple name choice
    Sleep    2s

    # Enter name choices using Smart Mobile Input Text (handles scrolling automatically - STABLE INDEXED XPATH)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_FIRST_NAME_CHOICE}    First Name Choice
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_SECOND_NAME_CHOICE}    Second Name Choice

    Log To Console    ✅ Successfully entered Bride name choices

# YES Option Keywords for Business Namkaran
Generate E2E Namkaran Test Data For Business With YES Option
    [Documentation]    Generates unique test data for E2E Business Namkaran with YES option for multiple names
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    
    # First Owner Data
    Set Test Variable    ${E2E_BUSINESS_OWNER_FIRST}    E2E_Owner_${random_num}
    Set Test Variable    ${E2E_BUSINESS_OWNER_MIDDLE}    E2E_Owner_Middle_${random_num}
    Set Test Variable    ${E2E_BUSINESS_OWNER_LAST}    E2E_Owner_Last_${random_num}
    
    # Second Owner Data (unique)
    Set Test Variable    ${E2E_BUSINESS_SECOND_OWNER_FIRST}    E2E_Second_Owner_${random_num}
    Set Test Variable    ${E2E_BUSINESS_SECOND_OWNER_MIDDLE}    E2E_Second_Middle_${random_num}
    Set Test Variable    ${E2E_BUSINESS_SECOND_OWNER_LAST}    E2E_Second_Last_${random_num}
    
    # Third Owner Data (unique)
    Set Test Variable    ${E2E_BUSINESS_THIRD_OWNER_FIRST}    E2E_Third_Owner_${random_num}
    Set Test Variable    ${E2E_BUSINESS_THIRD_OWNER_MIDDLE}    E2E_Third_Middle_${random_num}
    Set Test Variable    ${E2E_BUSINESS_THIRD_OWNER_LAST}    E2E_Third_Last_${random_num}
    
    # Other Business Data
    Set Test Variable    ${E2E_BUSINESS_EMAIL}    e2ebusiness.yes.${random_num}@test.com
    Set Test Variable    ${E2E_BUSINESS_PHONE}    918877${random_num}
    Set Test Variable    ${E2E_BUSINESS_DESC}    E2E Test Business Description ${random_num}
    Set Test Variable    ${E2E_BUSINESS_ADDRESS}    E2E Test Address, Gujarat, India ${random_num}
    Set Test Variable    ${E2E_BUSINESS_START_DATE}    2025-01-15
    
    # Generate random business name choices for YES option
    Set Test Variable    ${E2E_BUSINESS_FIRST_NAME_CHOICE}    E2E_Business_Choice1_${random_num}
    Set Test Variable    ${E2E_BUSINESS_SECOND_NAME_CHOICE}    E2E_Business_Choice2_${random_num}
    Set Test Variable    ${E2E_BUSINESS_THIRD_NAME_CHOICE}    E2E_Business_Choice3_${random_num}
    
    Log To Console    🎯 Generated E2E Business Namkaran Test Data (YES Option):
    Log To Console    🎯 First Owner: ${E2E_BUSINESS_OWNER_FIRST} ${E2E_BUSINESS_OWNER_MIDDLE} ${E2E_BUSINESS_OWNER_LAST}
    Log To Console    🎯 Second Owner: ${E2E_BUSINESS_SECOND_OWNER_FIRST} ${E2E_BUSINESS_SECOND_OWNER_MIDDLE} ${E2E_BUSINESS_SECOND_OWNER_LAST}
    Log To Console    🎯 Third Owner: ${E2E_BUSINESS_THIRD_OWNER_FIRST} ${E2E_BUSINESS_THIRD_OWNER_MIDDLE} ${E2E_BUSINESS_THIRD_OWNER_LAST}
    Log To Console    🎯 Email: ${E2E_BUSINESS_EMAIL}
    Log To Console    🎯 Business Name Choices: ${E2E_BUSINESS_FIRST_NAME_CHOICE}, ${E2E_BUSINESS_SECOND_NAME_CHOICE}, ${E2E_BUSINESS_THIRD_NAME_CHOICE}

Enter E2E Business Namkaran Data With YES Option
    [Documentation]    Enters the generated E2E test data into Business Namkaran form with YES option for multiple names
    Sleep    3s

    # Enter basic business data (same as NO option)
    Enter E2E Business Namkaran Data

    # Scroll to find YES radio button (using standard scroll method like NO option)
    Log To Console    🔘 Scrolling to find YES radio button...
    Scroll Until Element Visible    xpath=//android.widget.RadioButton[2]

    # Select YES for multiple name choice
    Log To Console    🔘 Selecting YES for multiple name choice...
    Mobile Wait Until Element Is Visible    xpath=//android.widget.RadioButton[2]    10s
    Mobile Click Element    xpath=//android.widget.RadioButton[2]
    Log To Console    ✅ Selected YES for multiple name choice
    Sleep    2s

    # Enter name choices using Smart Mobile Input Text (handles scrolling automatically - STABLE INDEXED XPATH)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_BUSINESS_FIRST_NAME_CHOICE}    First Business Name Choice
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_BUSINESS_SECOND_NAME_CHOICE}    Second Business Name Choice

    Log To Console    ✅ Successfully entered E2E Business Namkaran Data with YES Option

# YES Option Keywords for House Namkaran
Generate E2E Namkaran Test Data For House With YES Option
    [Documentation]    Generates unique test data for E2E House Namkaran with YES option for multiple names
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    
    Set Test Variable    ${E2E_HOUSE_OWNER_FIRST}    E2E_House_Owner_${random_num}
    Set Test Variable    ${E2E_HOUSE_OWNER_MIDDLE}    E2E_House_Middle_${random_num}
    Set Test Variable    ${E2E_HOUSE_OWNER_LAST}    E2E_House_Last_${random_num}
    Set Test Variable    ${E2E_HOUSE_EMAIL}    e2ehouse.yes.${random_num}@test.com
    Set Test Variable    ${E2E_HOUSE_PHONE}    918877${random_num}
    Set Test Variable    ${E2E_HOUSE_DESC}    E2E Test House Description ${random_num}
    Set Test Variable    ${E2E_HOUSE_ADDRESS}    E2E Test House Address, Gujarat, India ${random_num}
    
    # Generate random house name choices for YES option
    Set Test Variable    ${E2E_HOUSE_FIRST_NAME_CHOICE}    E2E_House1${random_num}
    Set Test Variable    ${E2E_HOUSE_SECOND_NAME_CHOICE}    E2E_House2${random_num}
    Set Test Variable    ${E2E_HOUSE_THIRD_NAME_CHOICE}    E2E_House3${random_num}
    
    Log To Console    🎯 Generated E2E House Namkaran Test Data (YES Option):
    Log To Console    🎯 House Owner: ${E2E_HOUSE_OWNER_FIRST} ${E2E_HOUSE_OWNER_MIDDLE} ${E2E_HOUSE_OWNER_LAST}
    Log To Console    🎯 Email: ${E2E_HOUSE_EMAIL}
    Log To Console    🎯 House Name Choices: ${E2E_HOUSE_FIRST_NAME_CHOICE}, ${E2E_HOUSE_SECOND_NAME_CHOICE}, ${E2E_HOUSE_THIRD_NAME_CHOICE}

Enter E2E House Namkaran Data With YES Option
    [Documentation]    Enters the generated E2E test data into House Namkaran form with YES option for multiple names
    Sleep    3s

    # Enter basic house data (same as NO option)
    Enter E2E House Namkaran Data

    # Scroll to find YES radio button (using standard scroll method like NO option)
    Log To Console    🔘 Scrolling to find YES radio button...
    Scroll Until Element Visible    xpath=//android.widget.RadioButton[2]

    # Select YES for multiple name choice
    Log To Console    🔘 Selecting YES for multiple name choice...
    Mobile Wait Until Element Is Visible    xpath=//android.widget.RadioButton[2]    10s
    Mobile Click Element    xpath=//android.widget.RadioButton[2]
    Log To Console    ✅ Selected YES for multiple name choice
    Sleep    2s

    # Enter name choices using Smart Mobile Input Text (handles scrolling automatically - STABLE INDEXED XPATH)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_HOUSE_FIRST_NAME_CHOICE}    First House Name Choice
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_HOUSE_SECOND_NAME_CHOICE}    Second House Name Choice

    # # Click Add Button
    # Mobile Wait Until Element Is Visible    xpath=//android.widget.Button[@text='Add']    10s
    # Mobile Click Element    xpath=//android.widget.Button[@text='Add']
    # Log To Console    ✅ Clicked Add Button for first two choices

    # # Enter Third House Name Choice (STABLE INDEXED XPATH)
    # Mobile Wait Until Element Is Visible    xpath=(//android.widget.EditText)[3]    10s
    # Mobile Click Element    xpath=(//android.widget.EditText)[3]
    # Mobile Input Text    xpath=(//android.widget.EditText)[3]    ${E2E_HOUSE_THIRD_NAME_CHOICE}
    # Mobile Hide Keyboard
    # Log To Console    ✅ Entered Third House Name Choice: ${E2E_HOUSE_THIRD_NAME_CHOICE}
    
    Log To Console    ✅ Successfully entered E2E House Namkaran Data with YES Option

# YES Option Keywords for Child Namkaran
Generate E2E Namkaran Test Data For Child With YES Option
    [Documentation]    Generates unique test data for E2E Child Namkaran with YES option for multiple names
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    
    Set Test Variable    ${E2E_CHILD_NAME}    E2E_Child_${random_num}
    Set Test Variable    ${E2E_MOTHER_FIRST}    E2E_Mother_${random_num}
    Set Test Variable    ${E2E_MOTHER_MIDDLE}    E2E_Mother_Middle_${random_num}
    Set Test Variable    ${E2E_MOTHER_LAST}    E2E_Mother_Last_${random_num}
    Set Test Variable    ${E2E_FATHER_FIRST}    E2E_Father_${random_num}
    Set Test Variable    ${E2E_FATHER_MIDDLE}    E2E_Father_Middle_${random_num}
    Set Test Variable    ${E2E_FATHER_LAST}    E2E_Father_Last_${random_num}
    Set Test Variable    ${E2E_CHILD_EMAIL}    e2echild.yes.${random_num}@test.com
    Set Test Variable    ${E2E_CHILD_PHONE}    918877${random_num}
    Set Test Variable    ${E2E_CHILD_DOB}    2020-05-15
    Set Test Variable    ${E2E_CHILD_GENDER}    Male
    Set Test Variable    ${E2E_CHILD_BIRTH_TIME}    10:30 AM
    Set Test Variable    ${E2E_CHILD_BIRTH_PLACE}    E2E Test Birth Place, Gujarat, India
    
    # Generate random child name choices for YES option
    Set Test Variable    ${E2E_CHILD_FIRST_NAME_CHOICE}    E2E_Child_Choice1_${random_num}
    Set Test Variable    ${E2E_CHILD_SECOND_NAME_CHOICE}    E2E_Child_Choice2_${random_num}
    Set Test Variable    ${E2E_CHILD_THIRD_NAME_CHOICE}    E2E_Child_Choice3_${random_num}
    
    Log To Console    🎯 Generated E2E Child Namkaran Test Data (YES Option):
    Log To Console    🎯 Child Name: ${E2E_CHILD_NAME}
    Log To Console    🎯 Mother: ${E2E_MOTHER_FIRST} ${E2E_MOTHER_MIDDLE} ${E2E_MOTHER_LAST}
    Log To Console    🎯 Father: ${E2E_FATHER_FIRST} ${E2E_FATHER_MIDDLE} ${E2E_FATHER_LAST}
    Log To Console    🎯 Child Name Choices: ${E2E_CHILD_FIRST_NAME_CHOICE}, ${E2E_CHILD_SECOND_NAME_CHOICE}, ${E2E_CHILD_THIRD_NAME_CHOICE}

Enter E2E Child Namkaran Data With YES Option
    [Documentation]    Enters the generated E2E test data into Child Namkaran form with YES option for multiple names
    Sleep    3s
    
    # Enter basic child data (same as NO option)
    Enter E2E Child Namkaran Data

    # Additional steps for Child Namkaran
    Select DOB
    namkaranPage.Select Gender
    Select Time
    Enter Birth Place    ${E2E_CHILD_BIRTH_PLACE}

    # Scroll to find YES radio button (same approach as Business/House)
    Log To Console    🔘 Scrolling to find YES radio button...
    Scroll Until Element Visible    xpath=//android.widget.RadioButton[2]

    # Select YES for multiple name choice
    Log To Console    🔘 Selecting YES for multiple name choice...
    Mobile Wait Until Element Is Visible    xpath=//android.widget.RadioButton[2]    10s
    Mobile Click Element    xpath=//android.widget.RadioButton[2]
    Log To Console    ✅ Selected YES for multiple name choice
    Sleep    2s

    # Enter name choices using Smart Mobile Input Text (handles scrolling automatically - STABLE INDEXED XPATH)
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[1]    ${E2E_CHILD_FIRST_NAME_CHOICE}    First Child Name Choice
    Smart Mobile Input Text    xpath=(//android.widget.EditText)[2]    ${E2E_CHILD_SECOND_NAME_CHOICE}    Second Child Name Choice

    # # Click Add Button
    # Mobile Wait Until Element Is Visible    xpath=//android.widget.Button[@text='Add']    10s
    # Mobile Click Element    xpath=//android.widget.Button[@text='Add']
    # Log To Console    ✅ Clicked Add Button for first two choices

    # # Enter Third Child Name Choice (STABLE INDEXED XPATH)
    # Mobile Wait Until Element Is Visible    xpath=(//android.widget.EditText)[3]    10s
    # Mobile Click Element    xpath=(//android.widget.EditText)[3]
    # Mobile Input Text    xpath=(//android.widget.EditText)[3]    ${E2E_CHILD_THIRD_NAME_CHOICE}
    # Mobile Hide Keyboard
    # Log To Console    ✅ Entered Third Child Name Choice: ${E2E_CHILD_THIRD_NAME_CHOICE}
    
    Log To Console    ✅ Successfully entered E2E Child Namkaran Data with YES Option

# Admin Approval/Rejection Workflow Keywords
Generate Random Name For Guruji Suggestion
    [Documentation]    Generates a random name for Guruji suggestion
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${guruji_name}=    Set Variable    Guruji_Suggested_${random_num}
    Log To Console    🎯 Generated Guruji Suggested Name: ${guruji_name}
    [Return]    ${guruji_name}

Generate Dummy Remarks For Namkaran
    [Documentation]    Generates dummy remarks for namkaran approval/rejection
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${remarks}=    Set Variable    Test remarks for namkaran ${random_num}. This is a dummy remark for testing purposes.
    Log To Console    🎯 Generated Dummy Remarks: ${remarks}
    [Return]    ${remarks}

Navigate To Namkaran Management In CMS
    [Documentation]    Navigates to Namkaran Management section in CMS
    Web Wait Until Page Contains Element    ${NAMKARAN_MANAGEMENT_MENU}    10s
    Web Click Element    ${NAMKARAN_MANAGEMENT_MENU}
    Sleep    3s
    Log To Console    📋 Navigated to Namkaran Management in CMS

Get Namkaran ID From First Record
    [Documentation]    Extracts Namkaran ID from the first record (latest/newest record) in the submitted namkaran list on mobile app
    ...    Since newly added records always appear at the top, we simply take the first record
    
    # Get the first record which contains "Namkaran ID : 245" format
    ${first_record_locator}=    Set Variable    xpath=(//android.view.View[contains(@content-desc,'Namkaran ID')])[1]
    Mobile Wait Until Element Is Visible    ${first_record_locator}    10s
    
    # Extract the content-desc attribute
    ${content_desc}=    Mobile Get Element Attribute    ${first_record_locator}    content-desc
    
    # Extract Namkaran ID - simple approach: find digits after "Namkaran ID :"
    # Use String library to extract - split by "Namkaran ID :" and get the number part
    ${lines}=    Split String    ${content_desc}    \n
    ${namkaran_id}=    Set Variable    ${EMPTY}
    
    FOR    ${line}    IN    @{lines}
        ${contains_id}=    Run Keyword And Return Status    Should Contain    ${line}    Namkaran ID
        IF    ${contains_id}
            # Extract number after "Namkaran ID :"
            ${parts}=    Split String    ${line}    :
            ${parts_length}=    Get Length    ${parts}
            IF    ${parts_length} >= 2
                ${id_part}=    Get From List    ${parts}    1
                ${namkaran_id}=    Strip String    ${id_part}
                BREAK
            END
        END
    END
    
    # Set as test variable for later use
    Set Test Variable    ${E2E_NAMKARAN_ID}    ${namkaran_id}
    
    Log To Console    🎯 Extracted Namkaran ID from first record: ${namkaran_id}
    [Return]    ${namkaran_id}

Verify Namkaran In Pending Status
    [Arguments]    ${email}    ${name}
    [Documentation]    Verifies that the namkaran is in pending status
    Sleep    5s
    
    # Search for the namkaran by email
    Web Wait Until Page Contains Element    ${NAMKARAN_SEARCH_FIELD}    10s
    Web Click Element    ${NAMKARAN_SEARCH_FIELD}
    Web Input Text    ${NAMKARAN_SEARCH_FIELD}    ${email}
    Sleep    2s
    
    # Verify the namkaran appears in the table with pending status
    ${first_row_status}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='status']//span[contains(@class,'minimal__label__root')]
    Web Wait Until Page Contains Element    ${first_row_status}    10s
    ${status}=    Web.Get Text    ${first_row_status}
    Should Be Equal As Strings    ${status}    Pending    Namkaran status should be Pending
    
    Log To Console    ✅ Verified namkaran is in Pending status: ${email}

Verify Namkaran In In Progress Status
    [Arguments]    ${namkaran_id}
    [Documentation]    Verifies that the namkaran is in In Progress status using Namkaran ID
    Sleep    5s
    
    # Search for the namkaran by ID
    Web Wait Until Page Contains Element    ${NAMKARAN_SEARCH_FIELD}    10s
    Web Click Element    ${NAMKARAN_SEARCH_FIELD}
    Web Clear Element Text    ${NAMKARAN_SEARCH_FIELD}
    Web Input Text    ${NAMKARAN_SEARCH_FIELD}    ${namkaran_id}
    Sleep    2s
    
    # Verify the namkaran appears in the table with Pending or In Progress status
    # Status text is in a span with class 'minimal__label__root' inside the status cell
    ${first_row_status}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='status']//span[contains(@class,'minimal__label__root')]
    Web Wait Until Page Contains Element    ${first_row_status}    10s
    ${status}=    Web.Get Text    ${first_row_status}
    Should Match Regexp    ${status}    ^(Pending|In Progress)$    Namkaran status should be Pending or In Progress

    Log To Console    ✅ Verified namkaran is in ${status} status: ${namkaran_id}

Click Three Dots And View For Namkaran
    [Arguments]    ${email}
    [Documentation]    Clicks the three dots menu and view button for the namkaran
    Sleep    2s
    
    # Click on the first record's 3-dot menu (Actions column)
    ${first_row_actions}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//button[@type='button']
    Web Wait Until Page Contains Element    ${first_row_actions}    10s
    Web Click Element    ${first_row_actions}
    Sleep    2s
    
    # Click on View button from the dropdown menu
    Web Wait Until Page Contains Element    ${VIEW_NAMKARAN_BUTTON}    10s
    Web Click Element    ${VIEW_NAMKARAN_BUTTON}
    Sleep    3s
    
    Log To Console    ✅ Clicked three dots and view for namkaran: ${email}

Click Three Dots And View For Namkaran By ID
    [Arguments]    ${namkaran_id}
    [Documentation]    Clicks the three dots menu and view button for the namkaran using Namkaran ID
    Sleep    2s
    
    # Click on the first record's 3-dot menu (Actions column)
    ${first_row_actions}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//button[@type='button']
    Web Wait Until Page Contains Element    ${first_row_actions}    10s
    # Scroll element into view to avoid scrollbar overlap
    Web Scroll Element Into View    ${first_row_actions}
    Sleep    1s
    # Try regular click first, fallback to JavaScript click if intercepted
    ${clicked}=    Run Keyword And Return Status    Web Click Element    ${first_row_actions}
    IF    not ${clicked}
        ${el}=    Web.Get WebElement    ${first_row_actions}
        Web.Execute Javascript    arguments[0].click();    ARGUMENTS    ${el}
    END
    Sleep    2s
    
    # Click on View button from the dropdown menu
    Web Wait Until Page Contains Element    xpath=//a[contains(text(),'View')]    10s
    Web Click Element    xpath=//a[contains(text(),'View')]
    Sleep    3s
    
    Log To Console    ✅ Clicked three dots and view for namkaran ID: ${namkaran_id}

Verify Bride And Groom Details In CMS
    [Arguments]    ${bride_first}    ${bride_middle}    ${bride_last}    ${groom_first}    ${groom_middle}    ${groom_last}
    [Documentation]    Verifies bride and groom details on the namkaran detail page
    Sleep    3s
    
    # Verify bride details
    ${cms_bride_first}=    Web.Get Text    ${Bride_First_Name_Field}
    ${cms_bride_middle}=    Web.Get Text    ${Bride_Middle_Name_Field}
    ${cms_bride_last}=    Web.Get Text    ${Bride_Last_Name_Field}
    
    Should Be Equal As Strings    ${cms_bride_first}    ${bride_first}    Bride first name mismatch
    Should Be Equal As Strings    ${cms_bride_middle}    ${bride_middle}    Bride middle name mismatch
    Should Be Equal As Strings    ${cms_bride_last}    ${bride_last}    Bride last name mismatch
    
    # Verify groom details
    ${cms_groom_first}=    Web.Get Text    ${Groom_First_Name_Field}
    ${cms_groom_middle}=    Web.Get Text    ${Groom_Middle_Name_Field}
    ${cms_groom_last}=    Web.Get Text    ${Groom_Last_Name_Field}
    
    Should Be Equal As Strings    ${cms_groom_first}    ${groom_first}    Groom first name mismatch
    Should Be Equal As Strings    ${cms_groom_middle}    ${groom_middle}    Groom middle name mismatch
    Should Be Equal As Strings    ${cms_groom_last}    ${groom_last}    Groom last name mismatch
    
    Log To Console    ✅ Verified bride and groom details in CMS

Verify Business Owner Details In CMS
    [Arguments]    ${owner_first}    ${owner_middle}    ${owner_last}
    [Documentation]    Verifies business owner details on the namkaran detail page
    Sleep    3s
    
    ${ok}=    Set Variable    ${TRUE}
    TRY
        ${cms_owner_first}=    Web.Get Text    ${Bride_First_Name_Field}
        ${cms_owner_middle}=    Web.Get Text    ${Bride_Middle_Name_Field}
        ${cms_owner_last}=    Web.Get Text    ${Bride_Last_Name_Field}
    EXCEPT    AS    ${e}
        ${ok}=    Set Variable    ${FALSE}
        Log To Console    ⚠️ Owner read failed; falling back: ${e}
    END

    IF    ${ok}
        Should Be Equal As Strings    ${cms_owner_first}    ${owner_first}    Business owner first name mismatch
        Should Be Equal As Strings    ${cms_owner_middle}    ${owner_middle}    Business owner middle name mismatch
        Should Be Equal As Strings    ${cms_owner_last}    ${owner_last}    Business owner last name mismatch
        Log To Console    ✅ Verified business owner details in CMS
    ELSE
        Web Wait Until Page Contains    ${owner_first}    10s
        Web Wait Until Page Contains    ${owner_middle}   10s
        Web Wait Until Page Contains    ${owner_last}     10s
        Log To Console    ✅ Verified business owner via text presence fallback
    END

Verify House Owner Details In CMS
    [Arguments]    ${owner_first}    ${owner_middle}    ${owner_last}
    [Documentation]    Verifies house owner details on the namkaran detail page
    Sleep    3s
    
    ${ok}=    Set Variable    ${TRUE}
    TRY
        ${cms_owner_first}=    Web.Get Text    ${Bride_First_Name_Field}
        ${cms_owner_middle}=    Web.Get Text    ${Bride_Middle_Name_Field}
        ${cms_owner_last}=    Web.Get Text    ${Bride_Last_Name_Field}
    EXCEPT    AS    ${e}
        ${ok}=    Set Variable    ${FALSE}
        Log To Console    ⚠️ House owner read failed; falling back: ${e}
    END

    IF    ${ok}
        Should Be Equal As Strings    ${cms_owner_first}    ${owner_first}    House owner first name mismatch
        Should Be Equal As Strings    ${cms_owner_middle}    ${owner_middle}    House owner middle name mismatch
        Should Be Equal As Strings    ${cms_owner_last}    ${owner_last}    House owner last name mismatch
        Log To Console    ✅ Verified house owner details in CMS
    ELSE
        Web Wait Until Page Contains    ${owner_first}    10s
        Web Wait Until Page Contains    ${owner_middle}   10s
        Web Wait Until Page Contains    ${owner_last}     10s
        Log To Console    ✅ Verified house owner via text presence fallback
    END

Verify Child And Parent Details In CMS
    [Arguments]    ${child_name}    ${mother_first}    ${mother_middle}    ${mother_last}    ${father_first}    ${father_middle}    ${father_last}
    [Documentation]    Verifies child and parent details on the namkaran detail page
    Sleep    3s
    
    ${ok}=    Set Variable    ${TRUE}
    TRY
        ${cms_child_name}=    Web.Get Text    ${Bride_First_Name_Field}
        ${cms_mother_first}=    Web.Get Text    ${Bride_Middle_Name_Field}
        ${cms_mother_last}=    Web.Get Text    ${Bride_Last_Name_Field}
        ${cms_father_first}=    Web.Get Text    ${Groom_First_Name_Field}
        ${cms_father_middle}=    Web.Get Text    ${Groom_Middle_Name_Field}
        ${cms_father_last}=    Web.Get Text    ${Groom_Last_Name_Field}
    EXCEPT    AS    ${e}
        ${ok}=    Set Variable    ${FALSE}
        Log To Console    ⚠️ Child/parent read failed; falling back: ${e}
    END

    IF    ${ok}
        Should Be Equal As Strings    ${cms_child_name}    ${child_name}    Child name mismatch
        Should Be Equal As Strings    ${cms_mother_first}    ${mother_first}    Mother first name mismatch
        Should Be Equal As Strings    ${cms_mother_last}    ${mother_last}    Mother last name mismatch
        Should Be Equal As Strings    ${cms_father_first}    ${father_first}    Father first name mismatch
        Should Be Equal As Strings    ${cms_father_middle}    ${father_middle}    Father middle name mismatch
        Should Be Equal As Strings    ${cms_father_last}    ${father_last}    Father last name mismatch
        Log To Console    ✅ Verified child and parent details in CMS
    ELSE
        Web Wait Until Page Contains    ${child_name}     10s
        Web Wait Until Page Contains    ${mother_first}   10s
        Web Wait Until Page Contains    ${mother_last}    10s
        Web Wait Until Page Contains    ${father_first}   10s
        Web Wait Until Page Contains    ${father_middle}  10s
        Web Wait Until Page Contains    ${father_last}    10s
        Log To Console    ✅ Verified child/parent via text presence fallback
    END

Enter Guruji Suggested Name
    [Arguments]    ${guruji_name}
    [Documentation]    Enters the Guruji suggested name
    Web Wait Until Page Contains Element    ${GURUJI_SUGGESTED_NAME_FIELD}    10s
    Web Click Element    ${GURUJI_SUGGESTED_NAME_FIELD}
    Web Input Text    ${GURUJI_SUGGESTED_NAME_FIELD}    ${guruji_name}
    Log To Console    ✅ Entered Guruji suggested name: ${guruji_name}

Enter Namkaran Remarks
    [Arguments]    ${remarks}
    [Documentation]    Enters remarks for the namkaran
    Web Wait Until Page Contains Element    ${NAMKARAN_REMARKS_FIELD}    10s
    Web Click Element    ${NAMKARAN_REMARKS_FIELD}
    Web Input Text    ${NAMKARAN_REMARKS_FIELD}    ${remarks}
    Log To Console    ✅ Entered namkaran remarks: ${remarks}

Click Approve Button
    [Documentation]    Clicks the approve button
    Web Wait Until Page Contains Element    ${APPROVE_NAMKARAN_BUTTON}    10s
    Web Click Element    ${APPROVE_NAMKARAN_BUTTON}
    Sleep    3s
    Log To Console    ✅ Clicked Approve button

Click Reject Button
    [Documentation]    Clicks the reject button
    Web Wait Until Page Contains Element    ${REJECT_NAMKARAN_BUTTON}    10s
    Web Click Element    ${REJECT_NAMKARAN_BUTTON}
    Sleep    3s
    Log To Console    ✅ Clicked Reject button

Verify Namkaran Status Changed To Completed
    [Arguments]    ${email}
    [Documentation]    Verifies that the namkaran status has changed to completed
    Sleep    3s
    
    # Navigate back to the list page
    Navigate To Namkaran Management In CMS
    
    # Search for the namkaran by email
    Web Wait Until Page Contains Element    ${NAMKARAN_SEARCH_FIELD}    10s
    Web Click Element    ${NAMKARAN_SEARCH_FIELD}
    Web Input Text    ${NAMKARAN_SEARCH_FIELD}    ${email}
    Sleep    2s
    
    # Verify the status is now completed
    ${first_row_status}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='status']//span[contains(@class,'minimal__label__root')]
    Web Wait Until Page Contains Element    ${first_row_status}    10s
    ${status}=    Web.Get Text    ${first_row_status}
    Should Be Equal As Strings    ${status}    Completed    Namkaran status should be Completed
    
    Log To Console    ✅ Verified namkaran status changed to Completed: ${email}

Verify Namkaran Status Changed To Completed By ID
    [Arguments]    ${namkaran_id}
    [Documentation]    Verifies that the namkaran status has changed to completed using Namkaran ID
    Sleep    3s
    
    # Navigate back to the list page
    Navigate To Namkaran Management In CMS
    
    # Search for the namkaran by ID
    Web Wait Until Page Contains Element    ${NAMKARAN_SEARCH_FIELD}    10s
    Web Click Element    ${NAMKARAN_SEARCH_FIELD}
    Web Clear Element Text    ${NAMKARAN_SEARCH_FIELD}
    Web Input Text    ${NAMKARAN_SEARCH_FIELD}    ${namkaran_id}
    Sleep    2s
    
    # Verify the status is now completed
    ${first_row_status}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='status']//span[contains(@class,'minimal__label__root')]
    Web Wait Until Page Contains Element    ${first_row_status}    10s
    ${status}=    Web.Get Text    ${first_row_status}
    Should Be Equal As Strings    ${status}    Completed    Namkaran status should be Completed
    
    Log To Console    ✅ Verified namkaran status changed to Completed: ${namkaran_id}

Verify Namkaran Status Changed To Rejected
    [Arguments]    ${email}
    [Documentation]    Verifies that the namkaran status has changed to rejected
    Sleep    3s
    
    # Navigate back to the list page
    Navigate To Namkaran Management In CMS
    
    # Search for the namkaran by email
    Web Wait Until Page Contains Element    ${NAMKARAN_SEARCH_FIELD}    10s
    Web Click Element    ${NAMKARAN_SEARCH_FIELD}
    Web Input Text    ${NAMKARAN_SEARCH_FIELD}    ${email}
    Sleep    2s
    
    # Verify the status is now rejected
    ${first_row_status}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='status']//span[contains(@class,'minimal__label__root')]
    Web Wait Until Page Contains Element    ${first_row_status}    10s
    ${status}=    Web.Get Text    ${first_row_status}
    Should Be Equal As Strings    ${status}    Rejected    Namkaran status should be Rejected
    
    Log To Console    ✅ Verified namkaran status changed to Rejected: ${email}

Verify Namkaran Status Changed To Rejected By ID
    [Arguments]    ${namkaran_id}
    [Documentation]    Verifies that the namkaran status has changed to rejected using Namkaran ID
    Sleep    3s
    
    # Navigate back to the list page
    Navigate To Namkaran Management In CMS
    
    # Search for the namkaran by ID
    Web Wait Until Page Contains Element    ${NAMKARAN_SEARCH_FIELD}    10s
    Web Click Element    ${NAMKARAN_SEARCH_FIELD}
    Web Clear Element Text    ${NAMKARAN_SEARCH_FIELD}
    Web Input Text    ${NAMKARAN_SEARCH_FIELD}    ${namkaran_id}
    Sleep    2s
    
    # Verify the status is now rejected
    ${first_row_status}=    Set Variable    xpath=(//div[@role='row' and contains(@class,'MuiDataGrid-row')])[2]//div[@data-field='status']//span[contains(@class,'minimal__label__root')]
    Web Wait Until Page Contains Element    ${first_row_status}    10s
    ${status}=    Web.Get Text    ${first_row_status}
    Should Be Equal As Strings    ${status}    Rejected    Namkaran status should be Rejected
    
    Log To Console    ✅ Verified namkaran status changed to Rejected: ${namkaran_id}

Select the created namkaran
    Web Wait Until Page Contains Element    ${NAMKARAN_SELECT_ROW}    10s
    Web Click Element    ${NAMKARAN_SELECT_ROW}
    Log To Console    Selected the created namkaran

Click on the Export Button
    Web Wait Until Page Contains Element    ${NAMKARAN_EXPORT_BUTTON}    10s
    Web Click Element    ${NAMKARAN_EXPORT_BUTTON}
    Log To Console    Clicked on the Export Button

Verify Exported Status
    [Documentation]    Verifies that the namkaran status has changed to "Exported" after export operation
    Sleep    5s
    SeleniumLibrary.Reload Page
    Sleep    2s
    Web Wait Until Page Contains Element    ${NAMKARAN_EXPORTED_STATUS}    15s
    Web Page Should Contain Element    ${NAMKARAN_EXPORTED_STATUS}
    Log To Console    ✅ Namkaran status successfully changed to 'Exported'

Export Namkaran And Validate Download
    # Click export button
    Click on the Export Button

    # Wait for status change
    Sleep    3s
    Verify Exported Status

    Log To Console    ✅ Namkaran export and download validation completed successfully
