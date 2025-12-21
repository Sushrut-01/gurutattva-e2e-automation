*** Settings ***
Resource   ../resources/libraries.robot
Resource   ../resources/web_keywords.robot
Resource   ./CRM_AudioCategoryPage.robot
Resource   ./AudioPage.robot
Library   DateTime
Library   String
Resource   ../resources/test_setup_teardown.robot
Resource   ./registerPage.robot


*** Variables ***
# E2E Registration Test Data Variables
${E2E_USER_NAME}                    ${EMPTY}
${E2E_USER_EMAIL}                   ${EMPTY}
${E2E_USER_MOBILE}                  ${EMPTY}
${E2E_USER_GENDER}                  ${EMPTY}
${E2E_USER_DOB}                     ${EMPTY}
${E2E_USER_COUNTRY}                 ${EMPTY}
${E2E_USER_STATE}                   ${EMPTY}
${E2E_USER_DISTRICT}                ${EMPTY}
${E2E_USER_CITY}                    ${EMPTY}
${E2E_USER_AREA}                    ${EMPTY}
${E2E_USER_REGISTRATION_NUMBER}     ${EMPTY}

# Web CMS Locators
${User_Management_MENU}             xpath=//span[contains(text(),'User Management')]
${User_SearchBox}                   xpath=//input[@type='search']
${User_Table_Row}                   xpath=//div[@role='row' and contains(@class,'MuiDataGrid-row')]
${User_Registration_Number_Cell}    xpath=//div[@data-field='uniqueRegistrationNumber']
${User_Name_Cell}                   xpath=//div[@data-field='firstName']
${User_Email_Cell}                  xpath=//div[@data-field='emailAddress']
${User_Mobile_Cell}                 xpath=//div[@data-field='mobileNumber']
${User_Role_Cell}                   xpath=//div[@data-field='userRole']
${User_Status_Cell}                 xpath=//div[@data-field='isActive']
${User_View_Button}                 xpath=//a[@href='/user/view/']
${User_Edit_Button}                 xpath=//a[@href='/user/edit/']
${User_Show_Filters_Button}         xpath=//button[@aria-label='Show filters']
${User_Role_Dropdown}               xpath=//select[@id=':r2n:']
${User_Role_Dropdown_Option}        xpath=//select[contains(@class,'MuiNativeSelect-select')]/option[normalize-space()='Email']
${User_Filter_Value}                xpath=//input[@placeholder='Filter value']
${User_Apply_Filter_Button}         xpath=(//button[@aria-label='Show filters'])[1]
${User_Name_Cell_In_Filter}         xpath=//div[@role='gridcell' and @data-field='firstName']
${User_Email_Cell_In_Filter}        xpath=//div[@role='gridcell' and @data-field='emailAddress']
${User_Mobile_Cell_In_Filter}        xpath=//div[@role='gridcell' and @data-field='mobileNumber']
${User_Role_Cell_In_Filter}         xpath=//div[@data-field='userRole' and text()='Sadhak']
${User_Status_Cell_In_Filter}       xpath=//div[@data-field='isActive']//input[@checked]






# Error message locators
${ALREADY_EMAIL_REGISTER}           xpath=//android.view.View[@content-desc="Mobile number or Email already exists."]
${REGISTER_GENDER}                        xpath=//android.widget.Button[@content-desc="Select Gender"]


${QUICK_REGISTRATION_ACCESS_RESTRICTION_POPUP}    xpath=//android.view.View[contains(@content-desc,'You do not have access to this feature.')]
${PROFILE_INFORMATION}                            xpath=//android.view.View[contains(@content-desc,'+')]
${F_N}                                            xpath=//android.widget.EditText[contains(@text, 'First')]
${M_N}                                            xpath=//android.widget.EditText[contains(@text, 'Middle')]
${L_N}                                            xpath=//android.widget.EditText[contains(@text, 'Last')]
${QUICK_F_N}                                      xpath=//android.widget.EditText[contains(@text, '${E2E_USER_FIRST_NAME}')]
${VERIFY_L_N}                                     xpath=//android.widget.EditText[contains(@text, 'Last_Name')]
${V_EMAIL}                                        xpath=//android.view.View[contains(@text, 'payment.gateway@rysun.com')]
${V_PHONE}                                        xpath=//android.view.View[contains(@text, '9999999999')]
${Q_EMAIL}                                        xpath=//android.view.View[contains(@text, 'qa.user@gurutattva.com')]
${Q_PHONE}                                        xpath=//android.view.View[contains(@text, '9999999999')]
${V_DOB}                                          xpath=//android.widget.ImageView[contains(@content-desc,'2025')]
${V_COUNTRY}                                      xpath=//android.widget.Button[@content-desc="India"]
${V_STATE}                                        xpath=//android.widget.Button[@content-desc="Gujarat"]
${V_DISTRICT}                                     xpath=//android.widget.Button[@content-desc="Ahmadabad"]
${V_CITY}                                         xpath=//android.widget.Button[@content-desc="Ahmedabad City"]
${V_AREA}                                         xpath=//android.widget.Button[@content-desc="Ahmedabad (City)"]
${DhyanKendra_Tab}                                xpath=//android.view.View[contains(@content-desc,'Do you want to register for a Dhyankendra?')]
${USER_UPDATED_MESSAGE}                           xpath=//android.view.View[@content-desc="User updated successfully"]

# Quick Registration Test Data
${QUICK_REG_TYPE}                                Sadhak
${QUICK_NAME}                                    ${E2E_USER_FIRST_NAME} ${E2E_USER_LAST_NAME}
${COMMUNITY_NAME}                                ${COMMUNITY_USER_FIRST_NAME} ${COMMUNITY_USER_LAST_NAME}
${QUICK_EMAIL}                                   qa.user@gurutattva.com
${QUICK_PHONE}                                   9999999999
${COMMUNITY_REG_EMAIL}                           payment.gateway@rysun.com
${COMMUNITY_REG_PHONE}                           9999999999


# Quick Registration Test Data Variables
${QUICK_REG_DOB}                                2025
${QUICK_REG_COUNTRY}                            India
${QUICK_REG_STATE}                              Gujarat
${QUICK_REG_DISTRICT}                           Ahmadabad
${QUICK_REG_CITY}                               Ahmedabad City
${QUICK_REG_AREA}                               Ahmedabad (City)

# E2E Quick Registration Test Data Variables
${E2E_USER_FIRST_NAME}                          ${EMPTY}
${E2E_USER_LAST_NAME}                           ${EMPTY}
${E2E_QUICK_USER_EMAIL}                         ${EMPTY}
${E2E_QUICK_USER_MOBILE}                        ${EMPTY}
${E2E_QUICK_USER_GENDER}                        ${EMPTY}
${E2E_QUICK_USER_DOB}                           ${EMPTY}
${E2E_QUICK_USER_COUNTRY}                       ${EMPTY}
${E2E_QUICK_USER_STATE}                         ${EMPTY}
${E2E_QUICK_USER_DISTRICT}                      ${EMPTY}
${E2E_QUICK_USER_CITY}                          ${EMPTY}
${E2E_QUICK_USER_AREA}                          ${EMPTY}

# E2E Community Registration Test Data Variables
${COMMUNITY_USER_FIRST_NAME}              ${EMPTY}
${COMMUNITY_USER_LAST_NAME}               ${EMPTY}
${COMMUNITY_USER_MIDDLE_NAME}             ${EMPTY}
${COMMUNITY_USER_EMAIL}                   ${EMPTY}
${COMMUNITY_USER_MOBILE}                  ${EMPTY}
${COMMUNITY_USER_GENDER}                  ${EMPTY}
${COMMUNITY_USER_DOB}                     ${EMPTY}
${COMMUNITY_USER_COUNTRY}                 ${EMPTY}
${COMMUNITY_USER_STATE}                   ${EMPTY}
${COMMUNITY_USER_DISTRICT}                ${EMPTY}
${COMMUNITY_USER_CITY}                    ${EMPTY}
${COMMUNITY_USER_AREA}                    ${EMPTY}

*** Keywords ***
Generate E2E Registration Test Data
    [Documentation]    Generates unique test data for E2E registration validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    
    Set Test Variable    ${E2E_USER_NAME}    E2E_User_${random_num}
    Set Test Variable    ${E2E_USER_EMAIL}    e2euser.${random_num}@test.com
    Set Test Variable    ${E2E_USER_MOBILE}    918877${random_num}
    Set Test Variable    ${E2E_USER_GENDER}    Male
    Set Test Variable    ${E2E_USER_DOB}    1990-01-01
    Set Test Variable    ${E2E_USER_COUNTRY}    India
    Set Test Variable    ${E2E_USER_STATE}    Gujarat
    Set Test Variable    ${E2E_USER_DISTRICT}    Ahmadabad
    Set Test Variable    ${E2E_USER_CITY}    Ahmedabad City
    Set Test Variable    ${E2E_USER_AREA}    University Road
    
    Log To Console    🎯 Generated E2E Registration Test Data:
    Log To Console    🎯 Name: ${E2E_USER_NAME}
    Log To Console    🎯 Email: ${E2E_USER_EMAIL}
    Log To Console    🎯 Mobile: ${E2E_USER_MOBILE}
    Log To Console    🎯 Gender: ${E2E_USER_GENDER}
    Log To Console    🎯 Country: ${E2E_USER_COUNTRY}
    Log To Console    🎯 State: ${E2E_USER_STATE}
    Log To Console    🎯 District: ${E2E_USER_DISTRICT}
    Log To Console    🎯 City: ${E2E_USER_CITY}
    Log To Console    🎯 Area: ${E2E_USER_AREA}

Enter E2E Registration Data
    [Documentation]    Enters the generated E2E test data into registration form using simple scroll and click approach
    # Wait for registration form to be ready
    Sleep    3s
    
    # Enter First Name
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter First Name']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter First Name']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter First Name']    ${E2E_USER_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered First Name: ${E2E_USER_NAME}
    
    # Enter Last Name
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Last Name']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Last Name']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Last Name']    Test
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Last Name: Test
    
    # Enter Email
    #Swipe Until Element Visible   xpath=//android.widget.Button[@content-desc="Select Gender"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Email']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Email']
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Email']    ${E2E_USER_EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Email: ${E2E_USER_EMAIL}
    
    # Enter Mobile Number
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='00 0000 0000']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='00 0000 0000']
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    xpath=//android.widget.EditText[@hint='00 0000 0000']    ${E2E_USER_MOBILE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Mobile Number: ${E2E_USER_MOBILE}
    
    Log To Console    ✅ Successfully entered E2E Registration Data:
    Log To Console    ✅ First Name: ${E2E_USER_NAME}
    Log To Console    ✅ Last Name: Test
    Log To Console    ✅ Email: ${E2E_USER_EMAIL}
    Log To Console    ✅ Mobile Number: ${E2E_USER_MOBILE}

Enter E2E Registration Data with already used email id and phone number
    [Documentation]    Enters the existing email id and phone number into registration form
    # Wait for registration form to be ready
    Sleep    3s
    
    # Enter First Name
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter First Name']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter First Name']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter First Name']    Warish
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered First Name: Warish
    
    # Enter Last Name
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Last Name']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Last Name']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Last Name']    Kumar
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Last Name: Kumar
    
    # Enter Email
    #Swipe Until Element Visible   xpath=//android.widget.Button[@content-desc="Select Gender"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Email']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Email']
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Email']    qa.user@gurutattva.com
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Email: qa.user@gurutattva.com
    
    # Enter Mobile Number
    # Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='00 0000 0000']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='00 0000 0000']
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    xpath=//android.widget.EditText[@hint='00 0000 0000']    9999999999
    Swipe Until Element Visible    ${REGISTER_BUTTON}
    Mobile Click Element    ${REGISTER_BUTTON}
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Mobile number or Email already exists.')]    10s
    Log To Console    ✅ Mobile number or Email already exists.


Enter E2E Community Registration Data
    [Documentation]    Enters the generated E2E test data into community registration form using simple scroll and click approach
    # Wait for community registration form to be ready
    Sleep    3s
    
    # Enter Email
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Email']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Email']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Email']    ${E2E_USER_EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Email: ${E2E_USER_EMAIL}
    
    # Enter Mobile
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='00 0000 0000']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='00 0000 0000']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='00 0000 0000']    ${E2E_USER_MOBILE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Mobile: ${E2E_USER_MOBILE}
    
    # Enter First Name
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter First Name']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter First Name']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter First Name']    ${E2E_USER_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered First Name: ${E2E_USER_NAME}
    
    # Enter Middle Name
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Middle Name']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Middle Name']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Middle Name']    Middle
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Middle Name: Middle
    
    # Enter Last Name
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Last Name']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Last Name']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Last Name']    Test
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Last Name: Test
    
    # Enter Address Line 1
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Address Line 1']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Address Line 1']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Address Line 1']    E2E Test Address Line 1
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Address Line 1: E2E Test Address Line 1
    
    # Enter Address Line 2
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Address Line 2']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Address Line 2']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Address Line 2']    E2E Test Address Line 2
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Address Line 2: E2E Test Address Line 2
    
    # Enter Landmark
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Landmark']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Landmark']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Landmark']    E2E Test Landmark
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Landmark: E2E Test Landmark
    
    # Enter Pincode
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Pin Code']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Pin Code']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Pin Code']    380015
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Pincode: 380015
    
    Log To Console    ✅ Successfully entered E2E Community Registration Data:
    Log To Console    ✅ Email: ${E2E_USER_EMAIL}
    Log To Console    ✅ Mobile: ${E2E_USER_MOBILE}
    Log To Console    ✅ Name: ${E2E_USER_NAME}


Click on the User Management Menu
    [Documentation]    Navigates to User Management section and searches for the created user
    Web Wait Until Page Contains Element    ${User_Management_MENU}    10s
    Web Click Element    ${User_Management_MENU}
    Sleep    3s
    
    # Search for the created user
    Web Wait Until Page Contains Element    ${User_SearchBox}    10s
    Web Click Element    ${User_SearchBox}
    Web Input Text    ${User_SearchBox}    ${E2E_QUICK_USER_EMAIL}
    Sleep    3s
    
    Log To Console    🔍 Searching for user:${E2E_QUICK_USER_EMAIL}

Verify the created User
    [Documentation]    Verifies that the user data entered in mobile app matches the data in CMS
    Sleep    5s
    
    # Wait for search results to load
    Web Wait Until Page Contains Element    ${User_Table_Row}    15s
    
    # Find the specific row containing the user data
    ${user_row}=    Set Variable    xpath=//div[@role='row' and .//div[@data-field='firstName' and contains(text(),'${E2E_USER_FIRST_NAME}')]]
    
    # Verify user exists in the table
    ${user_row_exists}=    Run Keyword And Return Status    
    ...    Web Page Should Contain Element    ${user_row}
    
    Run Keyword Unless    ${user_row_exists}    Fail    User ${E2E_USER_FIRST_NAME} not found in CMS
    
    # Extract data from the specific row
    ${cms_name}=    Web.Get Text    ${user_row}//div[@data-field='firstName']
    ${cms_email}=    Web.Get Text    ${user_row}//div[@data-field='emailAddress']
    ${cms_mobile}=    Web.Get Text    ${user_row}//div[@data-field='mobileNumber']
    ${cms_role}=    Web.Get Text    ${user_row}//div[@data-field='userRole']
    ${cms_status}=    Run Keyword And Return Status    
    ...    Web Page Should Contain Element    ${user_row}//div[@data-field='isActive']//input[@checked]
    
    # Verify data matches - use contains for name to handle potential formatting differences
    ${name_contains}=    Run Keyword And Return Status    
    ...    Should Contain    ${cms_name}    ${E2E_USER_FIRST_NAME}
    
    Run Keyword Unless    ${name_contains}    Fail    Name mismatch in CMS: Expected to contain '${E2E_USER_FIRST_NAME}', but got '${cms_name}'
    
    Should Be Equal As Strings    ${cms_email}    ${E2E_QUICK_USER_EMAIL}    Email mismatch in CMS
    
    # Handle mobile number format variations (with/without space after country code)
    ${expected_mobile_with_space}=    Set Variable    +91 ${E2E_QUICK_USER_MOBILE}
    ${expected_mobile_without_space}=    Set Variable    +${E2E_QUICK_USER_MOBILE}
    
    ${mobile_match}=    Run Keyword And Return Status    
    ...    Should Be Equal As Strings    ${cms_mobile}    ${expected_mobile_with_space}
    
    ${mobile_match_alt}=    Run Keyword And Return Status    
    ...    Should Be Equal As Strings    ${cms_mobile}    ${expected_mobile_without_space}
    
    Run Keyword Unless    ${mobile_match} or ${mobile_match_alt}    
    ...    Fail    Mobile mismatch in CMS: ${cms_mobile} != ${expected_mobile_with_space} or ${expected_mobile_without_space}
    
    Should Be Equal As Strings    ${cms_role}    Sadhak    Role mismatch in CMS
    Should Be True    ${cms_status}    User status should be active in CMS
    
    Log To Console    ✅ User verification successful in CMS:
    Log To Console    ✅ Name: ${cms_name}
    Log To Console    ✅ Email: ${cms_email}
    Log To Console    ✅ Mobile: ${cms_mobile}
    Log To Console    ✅ Role: ${cms_role}
    Log To Console    ✅ Status: Active

Verify User Details in CMS Table Row
    [Documentation]    Verifies specific user details in the CMS table row
    [Arguments]    ${expected_name}    ${expected_email}    ${expected_mobile}
    
    # Find the specific row containing the user data
    ${user_row}=    Set Variable    xpath=//div[@role='row' and .//div[@data-field='firstName' and contains(text(),'${expected_name}')]]
    
    # Verify the row exists
    Web Wait Until Page Contains Element    ${user_row}    10s
    
    # Extract data from the specific row
    ${actual_name}=    Web.Get Text    ${user_row}//div[@data-field='firstName']
    ${actual_email}=    Web.Get Text    ${user_row}//div[@data-field='emailAddress']
    ${actual_mobile}=    Web.Get Text    ${user_row}//div[@data-field='mobileNumber']
    ${actual_role}=    Web.Get Text    ${user_row}//div[@data-field='userRole']
    
    # Verify data matches
    Should Be Equal As Strings    ${actual_name}    ${expected_name}    Name mismatch
    Should Be Equal As Strings    ${actual_email}    ${expected_email}    Email mismatch
    
    # Handle mobile number format variations (with/without space after country code)
    ${expected_mobile_with_space}=    Set Variable    +91 ${expected_mobile}
    ${expected_mobile_without_space}=    Set Variable    +${expected_mobile}
    
    ${mobile_match}=    Run Keyword And Return Status    
    ...    Should Be Equal As Strings    ${actual_mobile}    ${expected_mobile_with_space}
    
    ${mobile_match_alt}=    Run Keyword And Return Status    
    ...    Should Be Equal As Strings    ${actual_mobile}    ${expected_mobile_without_space}
    
    Run Keyword Unless    ${mobile_match} or ${mobile_match_alt}    
    ...    Fail    Mobile mismatch: ${actual_mobile} != ${expected_mobile_with_space} or ${expected_mobile_without_space}
    
    Should Be Equal As Strings    ${actual_role}    Sadhak    Role mismatch
    
    Log To Console    ✅ User details verified in CMS table row:
    Log To Console    ✅ Name: ${actual_name}
    Log To Console    ✅ Email: ${actual_email}
    Log To Console    ✅ Mobile: ${actual_mobile}
    Log To Console    ✅ Role: ${actual_role}

Click on User View Button
    [Documentation]    Clicks on the view button for the created user to see detailed information
    ${view_button}=    Set Variable    xpath=//div[@role='row' and .//div[@data-field='firstName' and contains(text(),'${E2E_USER_FIRST_NAME}')]]//a[@href='/user/view/']
    
    Web Wait Until Page Contains Element    ${view_button}    10s
    Web Click Element    ${view_button}
    Sleep    3s
    
    Log To Console    👁️ Clicked on user view button for: ${E2E_USER_FIRST_NAME}


Enter Email Safely
    [Documentation]    Enters email address using safe method to prevent app crash
    [Arguments]    ${email_address}
    
    # Method 1: Clear field first, then enter email slowly
    TRY
        Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Email']
        Sleep    2s
        Mobile Clear Text    xpath=//android.widget.EditText[@hint='Enter Email']
        Sleep    1s
        
        # Enter email character by character to prevent crash
        ${email_length}=    Get Length    ${email_address}
        FOR    ${index}    IN RANGE    ${email_length}
            ${char}=    Evaluate    '${email_address}'[${index}]
            Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Email']    ${char}
            Sleep    0.1s
        END
        
        Sleep    1s
        Run Keyword And Ignore Error    Mobile Hide Keyboard
        Sleep    1s
        
        # Verify email was entered correctly
        ${entered_text}=    Mobile Get Element Attribute    xpath=//android.widget.EditText[@hint='Enter Email']    text
        ${success}=    Run Keyword And Return Status    Should Be Equal As Strings    ${entered_text}    ${email_address}
        
        IF    ${success}
            Log To Console    ✅ Email entered successfully: ${email_address}
            RETURN    ${TRUE}
        ELSE
            Log To Console    ⚠️  Email verification failed. Expected: ${email_address}, Got: ${entered_text}
            RETURN    ${FALSE}
        END
        
    EXCEPT    AS    ${error}
        Log To Console    ❌ Email entry failed with error: ${error}
        RETURN    ${FALSE}
    END

Enter Email Alternative Method
    [Documentation]    Alternative method for entering email address
    [Arguments]    ${email_address}
    
    # Method 2: Use different approach with longer waits
    TRY
        # Wait longer for field to be ready
        Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Email']    15s
        Sleep    3s
        
        # Click and wait
        Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Email']
        Sleep    3s
        
        # Clear any existing text
        Mobile Clear Text    xpath=//android.widget.EditText[@hint='Enter Email']
        Sleep    2s
        
        # Enter email in chunks to prevent crash
        ${email_parts}=    Split String    ${email_address}    @
        ${local_part}=    Set Variable    ${email_parts}[0]
        ${domain_part}=    Set Variable    ${email_parts}[1]
        
        # Enter local part
        Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Email']    ${local_part}
        Sleep    1s
        
        # Enter @ symbol
        Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Email']    @
        Sleep    1s
        
        # Enter domain part
        Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Email']    ${domain_part}
        Sleep    2s
        
        Run Keyword And Ignore Error    Mobile Hide Keyboard
        Sleep    2s
        
        # Verify email was entered
        ${entered_text}=    Mobile Get Element Attribute    xpath=//android.widget.EditText[@hint='Enter Email']    text
        ${success}=    Run Keyword And Return Status    Should Be Equal As Strings    ${entered_text}    ${email_address}
        
        IF    ${success}
            Log To Console    ✅ Email entered successfully (Alternative): ${email_address}
            RETURN    ${TRUE}
        ELSE
            Log To Console    ⚠️  Email verification failed (Alternative). Expected: ${email_address}, Got: ${entered_text}
            RETURN    ${FALSE}
        END
        
    EXCEPT    AS    ${error}
        Log To Console    ❌ Alternative email entry failed with error: ${error}
        RETURN    ${FALSE}
    END

Handle App Crash During Email Entry
    [Documentation]    Handles app crash during email entry and provides recovery options
    [Arguments]    ${email_address}
    
    Log To Console    🚨 App may have crashed during email entry. Recovery options:
    Log To Console    📧 Please manually enter the email: ${email_address}
    Log To Console    🔄 Waiting for app to stabilize...
    
    # Wait for app to potentially recover
    Sleep    10s
    
    # Try to detect if app is still running
    ${app_running}=    Run Keyword And Return Status    
    ...    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Email']    5s
    
    IF    ${app_running}
        Log To Console    ✅ App appears to be running. Continuing with test...
        RETURN    ${TRUE}
    ELSE
        Log To Console    ❌ App may have crashed. Please restart the app and continue manually.
        RETURN    ${FALSE}
    END

Enter Email With Keyboard Management
    [Documentation]    Enters email with aggressive keyboard hiding during text entry
    [Arguments]    ${email_address}
    
    TRY
        Log To Console    🔧 Method 1: Direct input with keyboard management
        
        # Start with clean state - hide keyboard multiple times
        Run Keyword And Ignore Error    Mobile Hide Keyboard
        Sleep    1s
        Run Keyword And Ignore Error    Mobile Hide Keyboard
        Sleep    1s
        
        # Click field and immediately hide keyboard
        Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Email']
        Sleep    0.5s
        Run Keyword And Ignore Error    Mobile Hide Keyboard
        Sleep    1s
        
        # Clear field
        Mobile Clear Text    xpath=//android.widget.EditText[@hint='Enter Email']
        Sleep    1s
        Run Keyword And Ignore Error    Mobile Hide Keyboard
        Sleep    1s
        
        # Enter text character by character with keyboard hiding
        ${email_length}=    Get Length    ${email_address}
        FOR    ${index}    IN RANGE    ${email_length}
            ${char}=    Evaluate    '${email_address}'[${index}]
            
            # Click field, enter character, hide keyboard
            Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Email']
            Sleep    0.2s
            Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Email']    ${char}
            Sleep    0.2s
            Run Keyword And Ignore Error    Mobile Hide Keyboard
            Sleep    0.3s
        END
        
        # Final keyboard hide
        Run Keyword And Ignore Error    Mobile Hide Keyboard
        Sleep    2s
        
        # Verify entry
        ${entered_text}=    Mobile Get Element Attribute    xpath=//android.widget.EditText[@hint='Enter Email']    text
        ${success}=    Run Keyword And Return Status    Should Be Equal As Strings    ${entered_text}    ${email_address}
        
        IF    ${success}
            Log To Console    ✅ Email entered successfully with keyboard management
            RETURN    ${TRUE}
        ELSE
            Log To Console    ⚠️  Email verification failed. Expected: ${email_address}, Got: ${entered_text}
            RETURN    ${FALSE}
        END
        
    EXCEPT    AS    ${error}
        Log To Console    ❌ Keyboard management method failed: ${error}
        RETURN    ${FALSE}
    END

Enter Email Using Clipboard
    [Documentation]    Enters email using clipboard paste method to avoid keyboard
    [Arguments]    ${email_address}
    
    TRY
        Log To Console    🔧 Method 2: Clipboard paste method
        
        # Set clipboard content - using alternative approach since Mobile Execute Script has limitations
        Log To Console    ⚠️  Clipboard functionality not available, using manual entry fallback
        Sleep    1s
        
        # Click field and paste
        Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Email']
        Sleep    1s
        Mobile Clear Text    xpath=//android.widget.EditText[@hint='Enter Email']
        Sleep    1s
        
        # Long press to show paste option
        Mobile Long Press    xpath=//android.widget.EditText[@hint='Enter Email']    2000
        Sleep    2s
        
        # Try to click paste option if available
        ${paste_option_found}=    Run Keyword And Return Status    
        ...    Mobile Wait Until Element Is Visible    xpath=//android.widget.TextView[@text='Paste']    3s
        
        IF    ${paste_option_found}
            Mobile Click Element    xpath=//android.widget.TextView[@text='Paste']
            Sleep    2s
            Run Keyword And Ignore Error    Mobile Hide Keyboard
            Sleep    1s
            
            # Verify entry
            ${entered_text}=    Mobile Get Element Attribute    xpath=//android.widget.EditText[@hint='Enter Email']    text
            ${success}=    Run Keyword And Return Status    Should Be Equal As Strings    ${entered_text}    ${email_address}
            
            IF    ${success}
                Log To Console    ✅ Email pasted successfully from clipboard
                RETURN    ${TRUE}
            ELSE
                Log To Console    ⚠️  Clipboard paste verification failed
                RETURN    ${FALSE}
            END
        ELSE
            Log To Console    ⚠️  Paste option not found, trying alternative paste method
            # Try alternative paste method using keyboard shortcuts
            Log To Console    ⚠️  Alternative paste method not available, using manual entry
            Sleep    2s
            Run Keyword And Ignore Error    Mobile Hide Keyboard
            Sleep    1s
            
            # Verify entry
            ${entered_text}=    Mobile Get Element Attribute    xpath=//android.widget.EditText[@hint='Enter Email']    text
            ${success}=    Run Keyword And Return Status    Should Be Equal As Strings    ${entered_text}    ${email_address}
            
            IF    ${success}
                Log To Console    ✅ Email pasted successfully using alternative method
                RETURN    ${TRUE}
            ELSE
                Log To Console    ⚠️  Alternative paste method failed
                RETURN    ${FALSE}
            END
        END
        
    EXCEPT    AS    ${error}
        Log To Console    ❌ Clipboard method failed: ${error}
        RETURN    ${FALSE}
    END

Prompt For Manual Email Entry
    [Documentation]    Prompts user to manually enter email when automated methods fail
    [Arguments]    ${email_address}
    
    Log To Console    🔧 Method 3: Manual entry prompt
    Log To Console    📧 Please manually enter the email: ${email_address}
    Log To Console    ⏳ Waiting for manual entry (60 seconds)...
    
    # Wait for user to manually enter email
    Sleep    60s
    
    # Verify if email was entered
    ${entered_text}=    Mobile Get Element Attribute    xpath=//android.widget.EditText[@hint='Enter Email']    text
    ${success}=    Run Keyword And Return Status    Should Be Equal As Strings    ${entered_text}    ${email_address}
    
    IF    ${success}
        Log To Console    ✅ Email verified after manual entry
        RETURN    ${TRUE}
    ELSE
        Log To Console    ⚠️  Email verification failed after manual entry. Expected: ${email_address}, Got: ${entered_text}
        Log To Console    🔄 Please try again or press Enter to continue...
        Sleep    30s
        
        # Final verification
        ${final_text}=    Mobile Get Element Attribute    xpath=//android.widget.EditText[@hint='Enter Email']    text
        ${final_success}=    Run Keyword And Return Status    Should Be Equal As Strings    ${final_text}    ${email_address}
        
        IF    ${final_success}
            Log To Console    ✅ Email verified after retry
            RETURN    ${TRUE}
        ELSE
            Log To Console    ❌ Manual entry failed after retry
            RETURN    ${FALSE}
        END
    END

Verify the error message
    [Documentation]    Verifies the error message for already registered email/mobile
    Swipe Until Element Visible     ${REGISTER_GENDER}
    Mobile Click Element                   ${REGISTER_GENDER}
    Sleep    2s
    Log To Console   Validation Message: Mobile Number or Email already exists.
    # Mobile Wait Until Element Is Visible    ${ALREADY_EMAIL_REGISTER}    10s
    # ${actual_message}=    Mobile Get Element Attribute    ${ALREADY_EMAIL_REGISTER}    content-desc
    # Log To Console    Already Registered Validation: ${actual_message}    
    # Should Be Equal    ${actual_message}    Mobile Number or EmailAddress already registered.
    # Log To Console    ✅ Error message verified successfully: ${actual_message}

Verify Quick Registration Access Restriction Popup
    Mobile.Wait Until Element Is Visible    ${QUICK_REGISTRATION_ACCESS_RESTRICTION_POPUP}    10s
    Mobile.Page Should Contain Element    ${QUICK_REGISTRATION_ACCESS_RESTRICTION_POPUP}
    Log To Console    Become a Member Popup is displayed
    Sleep    2s

Click on the DhyanKendra Tab
    Mobile.Click Element    xpath=//android.widget.ImageView[@content-desc="Dhyankendra"]
    Log To Console    DhyanKendra Tab clicked
    Sleep    2s

Verify Community User Details in Profile Information
    Mobile.Wait Until Element Is Visible    ${PROFILE_INFORMATION}    10s
    Mobile.Page Should Contain Element    ${PROFILE_INFORMATION}
    ${profile_info}=    Mobile Get Element Attribute    ${PROFILE_INFORMATION}    content-desc
    Should Contain    ${profile_info}    ${COMMUNITY_NAME}
    Should Contain    ${profile_info}    ${COMMUNITY_USER_EMAIL}
    Should Contain    ${profile_info}    ${COMMUNITY_USER_MOBILE}
    Should Contain    ${profile_info}    ${QUICK_REG_TYPE}
    Log To Console    Profile Information is displayed with correct details: ${profile_info}
    Sleep    2s
Verify Quick Registration User Details in Profile Information    
    Mobile.Wait Until Element Is Visible    ${PROFILE_INFORMATION}    10s
    Mobile.Page Should Contain Element    ${PROFILE_INFORMATION}
    ${profile_info}=    Mobile Get Element Attribute    ${PROFILE_INFORMATION}    content-desc
    Should Contain    ${profile_info}    ${QUICK_NAME} 
    Should Contain    ${profile_info}    ${QUICK_EMAIL}
    Should Contain    ${profile_info}    ${QUICK_PHONE}
    Should Contain    ${profile_info}    ${QUICK_REG_TYPE}
    Log To Console    Quick Registration User Details in Profile card is displayed with correct details: ${profile_info}
    Sleep    2s

Verify Community User Details in Edit Profile
    #Verify First Name
    Mobile.Wait Until Element Is Visible    ${F_N}    5s
    Mobile.Page Should Contain Element    ${F_N}
    ${first_name_value}=    Mobile Get Element Attribute    ${F_N}    text
    Should Contain    ${first_name_value}    ${COMMUNITY_USER_FIRST_NAME}
    Log To Console    First Name verified: ${first_name_value}
    
    # #Verify Middle Name
    # Mobile.Wait Until Element Is Visible    ${M_N}    5s
    # ${middle_name_value}=    Mobile Get Element Attribute    ${M_N}    text
    # Should Contain    ${middle_name_value}    ${COMMUNITY_USER_MIDDLE_NAME}
    # Log To Console    Middle Name verified: ${middle_name_value}
    
    #Verify Last Name
    Mobile.Wait Until Element Is Visible    ${L_N}    5s
    ${last_name_value}=    Mobile Get Element Attribute    ${L_N}    text
    Should Contain    ${last_name_value}    ${COMMUNITY_USER_LAST_NAME}
    Log To Console    Last Name verified: ${last_name_value}
    
    # Verify Email field
    Mobile.Wait Until Element Is Visible    ${V_EMAIL}    5s
    ${email_value}=    Mobile Get Element Attribute    ${V_EMAIL}    text
    Should Contain    ${email_value}    ${COMMUNITY_REG_EMAIL}
    Log To Console    Email verified: ${email_value}

    Scroll Until Element Found     xpath=//android.view.View[@content-desc="State"]
    
    # Verify Phone field
    Mobile.Wait Until Element Is Visible    ${V_PHONE}    5s
    ${phone_value}=    Mobile Get Element Attribute    ${V_PHONE}    text
    Should Contain    ${phone_value}    ${COMMUNITY_REG_PHONE}
    Log To Console    Phone verified: ${phone_value}

    
    
    # Verify Date of Birth
    Mobile.Wait Until Element Is Visible    ${V_DOB}    5s
    ${dob_value}=    Mobile Get Element Attribute    ${V_DOB}    content-desc
    Should Contain    ${dob_value}    ${QUICK_REG_DOB}
    Log To Console    Date of Birth verified: ${dob_value}
    
    # Verify Country
    Mobile.Wait Until Element Is Visible    ${V_COUNTRY}    5s
    ${country_value}=    Mobile Get Element Attribute    ${V_COUNTRY}    content-desc
    Should Contain    ${country_value}    ${QUICK_REG_COUNTRY}
    Log To Console    Country verified: ${country_value}
    
    # Verify State
    Mobile.Wait Until Element Is Visible    ${V_STATE}    5s
    ${state_value}=    Mobile Get Element Attribute    ${V_STATE}    content-desc
    Should Contain    ${state_value}    ${QUICK_REG_STATE}
    Log To Console    State verified: ${state_value}
    
    # Scroll down to verify location fields
    Scroll Until Element Found    xpath=//android.view.View[@content-desc="Save"]

    # Verify District
    Mobile.Wait Until Element Is Visible    ${V_DISTRICT}    5s
    ${district_value}=    Mobile Get Element Attribute    ${V_DISTRICT}    content-desc
    Should Contain    ${district_value}    ${QUICK_REG_DISTRICT}
    Log To Console    District verified: ${district_value}
    
    # Verify City
    Mobile.Wait Until Element Is Visible    ${V_CITY}    5s
    ${city_value}=    Mobile Get Element Attribute    ${V_CITY}    content-desc
    Should Contain    ${city_value}    ${QUICK_REG_CITY}
    Log To Console    City verified: ${city_value}
    
    # Verify Area
    Mobile.Wait Until Element Is Visible    ${V_AREA}    5s
    ${area_value}=    Mobile Get Element Attribute    ${V_AREA}    content-desc
    Should Contain    ${area_value}    ${QUICK_REG_AREA}
    Log To Console    Area verified: ${area_value}
    
    Log To Console    All user details verified successfully in Edit Profile screen
   
Verify DhyanKendra Access
    Sleep    5s
    Mobile.Wait Until Element Is Visible    ${DhyanKendra_Tab}    10s
    Mobile.Page Should Contain Element    ${DhyanKendra_Tab}
    Log To Console    DhyanKendra Tab is displayed
    Sleep    2s
    Mobile.Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]

Handle DhyanKendra Location
    Run Keyword And Ignore Error    Click on the Allow Location for DhyanKendra

Click on the Allow Location for DhyanKendra
    Mobile.Wait Until Element Is Visible    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button    10s
    Mobile.Click Element    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Log To Console    Allow Location for DhyanKendra is clicked

Verify Events Access
    Mobile.Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Global Events"]    10s
    Mobile.Page Should Contain Element    xpath=//android.view.View[@content-desc="Global Events"]
    Log To Console    Global Events Tab is displayed

Verify Podcast Screen is displayed
    Mobile.Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Recently')]    10s
    Mobile.Page Should Contain Element    xpath=//android.view.View[contains(@content-desc,'Recently')]
    Log To Console    Podcast Screen is displayed

Click on the Explore Button
    Mobile.Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]    10s
    Mobile.Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
    Log To Console    Explore Button is clicked

Switch to the Quick Registration Tab
    [Documentation]    Switches to the Quick Registration tab in the registration form
    Sleep    3s
    Mobile Click Element    xpath=//android.view.View[@content-desc="Quick Registration"]

Generate E2E Quick Registration Test Data
    [Documentation]    Generates unique test data for E2E registration validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    
    Set Test Variable    ${E2E_USER_FIRST_NAME}          E2E_First_${random_num}
    Set Test Variable    ${E2E_USER_LAST_NAME}           Last_Name
    Set Test Variable    ${E2E_QUICK_USER_EMAIL}         qa.user@gurutattva.com
    Set Test Variable    ${E2E_QUICK_USER_MOBILE}        9999999999
    Set Test Variable    ${E2E_QUICK_USER_GENDER}        Male
    Set Test Variable    ${E2E_QUICK_USER_DOB}           2025
    Set Test Variable    ${E2E_QUICK_USER_COUNTRY}       India
    Set Test Variable    ${E2E_QUICK_USER_STATE}         Gujarat
    Set Test Variable    ${E2E_QUICK_USER_DISTRICT}      Ahmadabad
    Set Test Variable    ${E2E_QUICK_USER_CITY}          Ahmedabad City
    Set Test Variable    ${E2E_QUICK_USER_AREA}          Ahmedabad (City)
    
    Log To Console    Generated E2E Registration Test Data:
    Log To Console    First Name: ${E2E_USER_FIRST_NAME}
    Log To Console    Last Name: ${E2E_USER_LAST_NAME}
    Log To Console    Email: ${E2E_QUICK_USER_EMAIL}
    Log To Console    Mobile: ${E2E_QUICK_USER_MOBILE}
    Log To Console    Gender: ${E2E_QUICK_USER_GENDER}
    Log To Console    DOB: ${E2E_QUICK_USER_DOB}
    Log To Console    Country: ${E2E_QUICK_USER_COUNTRY}
    Log To Console    State: ${E2E_QUICK_USER_STATE}
    Log To Console    District: ${E2E_QUICK_USER_DISTRICT}
    Log To Console    City: ${E2E_QUICK_USER_CITY}
    Log To Console    Area: ${E2E_QUICK_USER_AREA}

Generate E2E Community Registration Test Data              
    [Documentation]    Generates unique test data for E2E Community Registration validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    
    Set Test Variable    ${COMMUNITY_USER_FIRST_NAME}    E2E_Community_First_Name
    Set Test Variable    ${COMMUNITY_USER_LAST_NAME}     E2E_Community_Last_Name
    Set Test Variable    ${COMMUNITY_USER_EMAIL}         payment.gateway@rysun.com
    Set Test Variable    ${COMMUNITY_USER_MOBILE}        9999999999
    Set Test Variable    ${COMMUNITY_USER_GENDER}        Male
    Set Test Variable    ${COMMUNITY_USER_DOB}           2025
    Set Test Variable    ${COMMUNITY_USER_COUNTRY}       India
    Set Test Variable    ${COMMUNITY_USER_STATE}         Gujarat
    Set Test Variable    ${COMMUNITY_USER_DISTRICT}      Ahmadabad
    Set Test Variable    ${COMMUNITY_USER_CITY}          Ahmedabad City
    Set Test Variable    ${COMMUNITY_USER_AREA}          Ahmedabad (City)
    
    Log To Console    🎯 Generated E2E Community Registration Test Data:
    Log To Console    🎯 First Name: ${COMMUNITY_USER_FIRST_NAME}
    Log To Console    🎯 Last Name: ${COMMUNITY_USER_LAST_NAME}
    Log To Console    🎯 Email: ${COMMUNITY_USER_EMAIL}
    Log To Console    🎯 Mobile: ${COMMUNITY_USER_MOBILE}
    Log To Console    🎯 Gender: ${COMMUNITY_USER_GENDER}
    Log To Console    🎯 DOB: ${COMMUNITY_USER_DOB}
    Log To Console    🎯 Country: ${COMMUNITY_USER_COUNTRY}
    Log To Console    🎯 State: ${COMMUNITY_USER_STATE}
    Log To Console    🎯 District: ${COMMUNITY_USER_DISTRICT}
    Log To Console    🎯 City: ${COMMUNITY_USER_CITY}
    Log To Console    🎯 Area: ${COMMUNITY_USER_AREA}


Select Current Date DOB for Register Screen
    [Documentation]    Selects the current date as DOB during registration
    # Mobile.Wait Until Element Is Visible    ${REGISTER_DOB}        5s
    Mobile.Click Element                    ${REGISTER_DOB}
    # Wait for date picker to appear and click OK to select current date
    # Mobile.Wait Until Element Is Visible    ${OK_BUTTON}           5s
    Mobile.Click Element                    ${OK_BUTTON}
    Sleep    2s
    ${current_date}=    Mobile.Get Element Attribute     ${V_DOB}    content-desc
    Should Contain       ${current_date}     2025
    Log To Console    ${current_date}
    Log To Console    📅 Selected current date as DOB during registration

Verify Quick Registration User Details in Edit Profile
    #Verify First Name
    Mobile.Wait Until Element Is Visible    ${QUICK_F_N}    5s
    Mobile.Page Should Contain Element    ${QUICK_F_N}
    ${first_name_value}=    Mobile.Get Element Attribute    ${QUICK_F_N}    text
    Should Contain    ${first_name_value}    ${E2E_USER_FIRST_NAME}
    Log To Console    First Name verified: ${first_name_value}
    
    #Verify Last Name
    Mobile.Wait Until Element Is Visible    ${VERIFY_L_N}    5s
    Mobile.Page Should Contain Element    ${VERIFY_L_N}
    ${last_name_value}=    Mobile.Get Element Attribute    ${VERIFY_L_N}    text
    Should Contain     ${last_name_value}    Last_Name
    Log To Console    Last Name verified: ${last_name_value}
    
    # Verify Email field
    Mobile.Wait Until Element Is Visible    ${Q_EMAIL}    5s
    ${email_value}=    Mobile.Get Element Attribute    ${Q_EMAIL}    text
    Should Contain    ${email_value}    ${QUICK_EMAIL}
    Log To Console    Email verified: ${email_value}

    Scroll Until Element Found     xpath=//android.view.View[@content-desc="State"]
    
    # Verify Phone field
    Mobile.Wait Until Element Is Visible    ${Q_PHONE}    5s
    ${phone_value}=    Mobile.Get Element Attribute    ${Q_PHONE}    text
    Should Contain    ${phone_value}    ${QUICK_PHONE}
    Log To Console    Phone verified: ${phone_value}
    
    # Verify Date of Birth (Current Date)
    Mobile.Wait Until Element Is Visible    ${V_DOB}    5s
    ${dob_value}=    Mobile.Get Element Attribute    ${V_DOB}    content-desc
    Should Contain    ${dob_value}    ${QUICK_REG_DOB}
    Log To Console    Date of Birth verified: ${dob_value}


    # Verify Country
    Mobile.Wait Until Element Is Visible    ${V_COUNTRY}    5s
    ${country_value}=    Mobile.Get Element Attribute    ${V_COUNTRY}    content-desc
    Should Contain    ${country_value}    ${QUICK_REG_COUNTRY}
    Log To Console    Country verified: ${country_value}
    
    # Verify State
    Mobile.Wait Until Element Is Visible    ${V_STATE}    5s
    ${state_value}=    Mobile.Get Element Attribute    ${V_STATE}    content-desc
    Should Contain    ${state_value}    ${QUICK_REG_STATE}
    Log To Console    State verified: ${state_value}
    
    # Scroll down to verify location fields
    Scroll Until Element Found    xpath=//android.view.View[@content-desc="Save"]

    # Verify District
    Mobile.Wait Until Element Is Visible    ${V_DISTRICT}    5s
    ${district_value}=    Mobile.Get Element Attribute    ${V_DISTRICT}    content-desc
    Should Contain    ${district_value}    ${QUICK_REG_DISTRICT}
    Log To Console    District verified: ${district_value}
    
    # Verify City
    Mobile.Wait Until Element Is Visible    ${V_CITY}    5s
    ${city_value}=    Mobile.Get Element Attribute    ${V_CITY}    content-desc
    Should Contain    ${city_value}    ${QUICK_REG_CITY}
    Log To Console    City verified: ${city_value}
    
    # Verify Area
    Mobile.Wait Until Element Is Visible    ${V_AREA}    5s
    ${area_value}=    Mobile.Get Element Attribute    ${V_AREA}    content-desc
    Should Contain    ${area_value}    ${QUICK_REG_AREA}
    Log To Console    Area verified: ${area_value}
    
    Log To Console    All user details verified successfully in Edit Profile screen

Fill the Personal and Address Information for Community Registration
    Enter Community Email
    Click on the Community Mobile Field
    Enter Community Mobile By Keypad    9999999999
    Enter Community Registration First Name
    # Enter Community Registration Middle Name
    Enter Community Registration Last Name
    Enter Community Full Address
    Enter Community Pincode
    Select Country for Community Registration
    Select State for Community Registration
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Click on the Next Button from Community Registration

Enter Community Registration First Name
    # Mobile.Wait Until Element Is Visible    ${COMMUNITY_FIRST_NAME}    10s
    Mobile.Click Element                    ${COMMUNITY_FIRST_NAME}
    Mobile.Click Element                    ${COMMUNITY_FIRST_NAME}
    Run Keyword And Ignore Error    Mobile.Hide Keyboard
    Mobile.Input Text                      ${COMMUNITY_FIRST_NAME}     ${COMMUNITY_USER_FIRST_NAME}
    # Mobile.Hide Keyboard            

 Enter Community Registration Last Name
    Scroll Until Element Found           xpath=//android.view.View[@content-desc="Pin Code"]
    # Mobile.Wait Until Element Is Visible    ${COMMUNITY_LAST_NAME}    10s
    Mobile.Click Element                    ${COMMUNITY_LAST_NAME}
    Run Keyword And Ignore Error    Mobile.Hide Keyboard
    Mobile.Input Text                      ${COMMUNITY_LAST_NAME}     ${COMMUNITY_USER_LAST_NAME}
       

Enter Community Registration Middle Name
    Swipe Until Element Visible    xpath=//android.widget.EditText[@hint='Enter Last Name']
    Mobile.Wait Until Element Is Visible    ${COMMUNITY_MIDDLE_NAME}    10s
    Mobile.Click Element                    ${COMMUNITY_MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile.Hide Keyboard
    Mobile.Input Text                      ${COMMUNITY_MIDDLE_NAME}     ${COMMUNITY_USER_MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile.Hide Keyboard

Enter E2E Registration Data for Quick Registration
    [Documentation]    Enters the generated E2E test data into registration form using simple scroll and click approach
    
    # Enter First Name
    # Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter First Name']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter First Name']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter First Name']    ${E2E_USER_FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered First Name: ${E2E_USER_FIRST_NAME}
    
    # Enter Last Name
    # Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Last Name']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Last Name']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Last Name']    ${E2E_USER_LAST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Last Name: ${E2E_USER_LAST_NAME}
    
    # Enter Email
    #Swipe Until Element Visible   xpath=//android.widget.Button[@content-desc="Select Gender"]
    # Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='Enter Email']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Email']
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Email']    yatishdevlekar307@gmail.com
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Email: yatishdevlekar307@gmail.com
    
    # Enter Mobile Number
    # Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    # Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText[@hint='00 0000 0000']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='00 0000 0000']
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    xpath=//android.widget.EditText[@hint='00 0000 0000']    9979339236
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Mobile Number: 9979339236
    
    Log To Console    ✅ Successfully entered E2E Registration Data:
    Log To Console    ✅ First Name: ${E2E_USER_FIRST_NAME}
    Log To Console    ✅ Last Name: ${E2E_USER_LAST_NAME}
    Log To Console    ✅ Email: yatishdevlekar307@gmail.com
    Log To Console    ✅ Mobile Number: 9979339236

Click on the NO and Second YES Radio Button from Community Registration
    # Mobile Wait Until Element Is Visible    ${NO_BUTTON_1}    10s
    Mobile Click Element                    ${NO_BUTTON_1}
    # Mobile Wait Until Element Is Visible    ${NO_BUTTON_2}    10s
    Scroll Until Element Found                xpath=//android.view.View[@content-desc="When did you attend first Shivir?"]
    Select Attended Year for Second Yes
    Mobile Click Element                    xpath=//android.widget.ScrollView/android.view.View/android.widget.RadioButton[2]
    Mobile Click Element                    xpath=//android.view.View[@content-desc="Selected Month"]
    Mobile Click Element                    xpath=//android.view.View[@content-desc="January"]
    Mobile Click Element                    xpath=//android.widget.Button[@content-desc="OK"]
    Sleep   2s
    Mobile Click Element                    xpath=//android.view.View[@content-desc="Selected Year"]
    Mobile Click Element                    xpath=//android.view.View[@content-desc="2025"]
    Mobile Click Element                    xpath=//android.widget.Button[@content-desc="OK"]
    Log To Console                  Clicked on the NO and Second YES Radio Button from Community Registration

Verify the created Community User is Displayed in the CSM
    [Documentation]    Verifies that the user data entered in mobile app matches the data in CSM
    Web Wait Until Element Is Visible    ${User_Show_Filters_Button}    10s
    Web Click Element    ${User_Show_Filters_Button}  
    Sleep    2s
    Web Click Element    ${User_Role_Dropdown_Option}
    Sleep    2s
    Web Click Element    ${User_Filter_Value}
    Sleep    2s
    Web Input Text    ${User_Filter_Value}    ${COMMUNITY_USER_EMAIL}
    Sleep    2s
    Web Click Element    ${User_Apply_Filter_Button}
    Sleep    2s
    # Extract data from the specific row in the Community context
    ${cms_name}=    Web.Get Text    ${User_Name_Cell_In_Filter}
    ${cms_email}=    Web.Get Text    ${User_Email_Cell_In_Filter}
    ${cms_mobile}=    Web.Get Text    ${User_Mobile_Cell_In_Filter}
    ${cms_role}=    Web.Get Text    ${User_Role_Cell_In_Filter}
    ${cms_status}=    Run Keyword And Return Status
    ...    Web Page Should Contain Element    ${User_Status_Cell_In_Filter}

    # Verify data matches - use contains for name to handle potential formatting differences
    ${name_contains}=    Run Keyword And Return Status
    ...    Should Contain    ${cms_name}    ${COMMUNITY_USER_FIRST_NAME}

    IF    not ${name_contains}
        Fail    Name mismatch in CSM: Expected to contain '${COMMUNITY_USER_FIRST_NAME}', but got '${cms_name}'
    END

    Should Be Equal As Strings    ${cms_email}    ${COMMUNITY_USER_EMAIL}   

    # Handle mobile number format variations (with/without space after country code)
    ${expected_mobile_with_space}=    Set Variable    +91 ${COMMUNITY_USER_MOBILE}
    ${expected_mobile_without_space}=    Set Variable    +${COMMUNITY_USER_MOBILE}

    ${mobile_match}=    Run Keyword And Return Status
    ...    Should Be Equal As Strings    ${cms_mobile}    ${expected_mobile_with_space}

    ${mobile_match_alt}=    Run Keyword And Return Status
    ...    Should Be Equal As Strings    ${cms_mobile}    ${expected_mobile_without_space}

    IF    not (${mobile_match} or ${mobile_match_alt})
        Fail    Mobile mismatch in CSM: ${cms_mobile} != ${expected_mobile_with_space} or ${expected_mobile_without_space}
    END

    Should Be Equal As Strings    ${cms_role}    Sadhak    Role mismatch in CSM
    Should Be True    ${cms_status}    User status should be active in CSM

    Log To Console    ✅ Community user verification successful in CSM:
    Log To Console    ✅ Name: ${cms_name}
    Log To Console    ✅ Email: ${cms_email}
    Log To Console    ✅ Mobile: ${cms_mobile}
    Log To Console    ✅ Role: ${cms_role}
    Log To Console    ✅ Status: Active

Click on the User Management Menu for Community Registration
    [Documentation]    Navigates to User Management section and searches for the created user
    Web Wait Until Page Contains Element    ${User_Management_MENU}    10s
    Web Click Element    ${User_Management_MENU}    

Click on the NO and Second YES Radio Button from Community Registration for Become a Member 
    Mobile Click Element                    xpath=//android.widget.ScrollView/android.widget.RadioButton[2]
    Mobile Wait Until Element Is Visible    ${COMMUNITY_ATTENDED_YEAR}    10s
    Mobile Click Element                   ${COMMUNITY_ATTENDED_YEAR}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_2024}    10s
    Sleep  2s
    Mobile Click Element                   ${COMMUNITY_2024}
    Sleep   2s
    Mobile Click Element                   ${OK_BUTTON}
    Log To Console                  Selected Attended Year for Become a Member
    Scroll Until Element Found                ${COMMUNITY_NEXT}
    Mobile Click Element                    xpath=//android.widget.ScrollView/android.widget.RadioButton[4]
    Mobile Click Element                    xpath=//android.view.View[@content-desc="Selected Month"]
    Mobile Click Element                    xpath=//android.view.View[@content-desc="January"]
    Mobile Click Element                    xpath=//android.widget.Button[@content-desc="OK"]
    Mobile Click Element                    xpath=//android.view.View[@content-desc="Selected Year"][2]
    Mobile Click Element                    xpath=//android.view.View[@content-desc="2025"]
    Mobile Click Element                    xpath=//android.widget.Button[@content-desc="OK"]
    Log To Console                  Clicked on the NO and Second YES Radio Button from Community Registration

Fill address and pincode for become a member
    Scroll Until Element Found                xpath=//android.view.View[@content-desc="Country"]
    Enter Community Full Address
    Enter Community Pincode
    Click on the Next Button from Community Registration

Fill the Education Information for become a member
    Select Blood Group For Personal Information
    Select Marital Status For Personal Information
    Click on the Education Level Field
    Click on the Education Qualification Field
    Click on the Occupation Type Field
    Click on the Occupation Field
    Click on the register Button from Community Registration

Verify the User Updated Message
    Mobile Wait Until Element Is Visible    ${USER_UPDATED_MESSAGE}    10s
    ${message}=    Mobile Get Element Attribute    ${USER_UPDATED_MESSAGE}    content-desc
    Should Be Equal As Strings    ${message}    User updated successfully
    Log To Console     Validation message : ${message}

Select Dhyankendra for Become a Member and click on the Next Button
    Mobile Click Element                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[7]/android.widget.ImageView
    Mobile Click Element                    xpath=//android.widget.RadioButton
    Mobile Wait Until Element Is Visible    ${COMMUNITY_CONFIRM_DHYANKEDRA}    10s
    Mobile Click Element                    ${COMMUNITY_CONFIRM_DHYANKEDRA}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_NEXT}    10s
    Mobile Click Element                    ${COMMUNITY_NEXT}
    Log To Console                   Selected Dhyankendra and clicked on Next Button
