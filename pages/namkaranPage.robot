*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot
Resource    ExplorePage.robot


*** Variables ***
# ============================================================================
# RELATIVE XPATH LOCATORS - Following Automation Best Practices
# ============================================================================

# Navigation Elements
${EXPLORE_MENU}                    xpath=//android.widget.ImageView[3]
${NAMKARAN_HEADER}                 xpath=//android.view.View[@content-desc="Namkaran"]
${NAMKARAN_MENU}                   xpath=//android.widget.ImageView[contains(@content-desc,"Namkaran")]
${NAMKARAN_CONTENT}                xpath=//android.widget.ScrollView/android.view.View[1]

# Buttons and Interactive Elements
${APPLY_NOW_BUTTON}                xpath=//android.view.View[@content-desc="Apply Now"]
${APPLY_NOW_BUTTON_ALT1}           xpath=//android.widget.Button[@content-desc="Apply Now"]
${APPLY_NOW_BUTTON_ALT2}           xpath=//*[contains(@content-desc, "Apply")]
${APPLY_NOW_BUTTON_ALT3}           xpath=//android.view.View[contains(@content-desc, "Apply Now")]
${IAGREE_BUTTON}                   xpath=//android.view.View[@content-desc="I Agree"]
${CANCEL_BUTTON}                   xpath=//android.view.View[@content-desc="Cancel"]
${SubmitButton}                    xpath=//android.view.View[@content-desc="Submit"]
${AddButton}                       xpath=//android.widget.ScrollView/android.widget.ImageView
${ADD_NAMKARAN_BUTTON}             xpath=(//android.widget.ImageView)[2]

# Form Elements - Dynamic indexed locators (context-aware)
${FNameInputField}                 xpath=(//android.widget.EditText)[1]
${MNameInputField}                 xpath=(//android.widget.EditText)[2]
${LNameInputField}                 xpath=(//android.widget.EditText)[3]
${EmailInputField}                 xpath=//android.view.View[contains(@content-desc,"Email") or contains(@content-desc,"email")]/following-sibling::android.widget.EditText[1]
${PhoneInputField}                 xpath=//android.view.View[contains(@content-desc,"Phone") or contains(@content-desc,"phone") or contains(@content-desc,"Mobile")]/following-sibling::android.widget.EditText[1]
${MarriageInputfield}              xpath=//android.view.View[contains(@content-desc,"Marriage Place")]/following-sibling::android.widget.EditText[1]
${AddressInputField}               xpath=//android.widget.EditText

# Confirmation and Status Messages
${CONFIRMATION_MESSAGE}            xpath=//android.view.View[@content-desc="Do you agree to all the terms ?"]
${successMessage}                  xpath=//android.view.View[@content-desc="Namkaran Submitted successfully"]

# Radio Buttons and Selection
${SelectOtherNamkaran}             xpath=//android.widget.ScrollView/android.widget.RadioButton[1]
${YesRadioButton}                  xpath=//android.widget.ScrollView/android.widget.RadioButton[2]

# Category Selection
${CategoryDropdown}                xpath=//android.widget.Button[@content-desc="Bride Namkaran"]
${BrideNamkaran}                   xpath=//android.widget.Button[@content-desc="Bride Namkaran"]
${ChildNamkaran}                   xpath=//android.widget.Button[@content-desc="Child Namkaran"]
${SelectHouseNamkaran}             xpath=//android.widget.Button[@content-desc="House Namkaran"]
${SelectBusinessNamkaran}          xpath=//android.widget.Button[@content-desc="Business Namkaran"]

# Date and Time Selection
${SelectMarriageDateField}         xpath=//android.widget.ImageView[@content-desc="Select Marriage Date"]
${Select_DOB}                      xpath=//android.widget.ImageView[@content-desc="Select DOB"]
${Select_Time}                     xpath=//android.widget.ImageView[@content-desc="00:00"]
${SelectYrs}                       xpath=//android.view.View[@content-desc="2025"]
${Select2019}                      xpath=//android.view.View[@content-desc="2019"]
${SelectDay}                       xpath=//android.view.View[contains(@content-desc, "June 19, 2025")]
${SelectOK}                        xpath=//android.widget.Button[@content-desc="OK"]
${Select_AM}                       xpath=//android.widget.RadioButton[@content-desc="AM"]

# Validation Messages - All use flexible matching
${Invalid_email}                   xpath=//android.view.View[contains(@content-desc,"valid email")]
${Invalid_mobile}                  xpath=//android.view.View[contains(@content-desc,"valid phone number")]
${Bride_First_Name}                xpath=//android.view.View[@content-desc="Please enter bride's first name"]
${Bride_Middle_Name}               xpath=//android.view.View[@content-desc="Enter Middle Name"]
${Bride_Last_Name}                 xpath=//android.view.View[@content-desc="Please enter bride's last name"]
${Groom_First_Name}                xpath=//android.view.View[@content-desc="Please enter groom's first name"]
${Groom_Middle_Name}               xpath=//android.view.View[@content-desc="Please enter groom's middle name"]
${Groom_Last_Name}                 xpath=//android.view.View[@content-desc="Please enter groom's middle name"]
# Child Namkaran Specific Elements
${SelectNumberofChild}             xpath=//android.widget.ScrollView/android.widget.RadioButton[1]
${SelectTwins}                     xpath=//android.widget.ScrollView/android.view.View/android.view.View/android.widget.RadioButton[2]
${SELECT_MULTIPLE_CHILD}           xpath=//android.widget.ScrollView/android.widget.RadioButton[4]
${Select_Gender}                   xpath=//android.view.View[@content-desc="Select Gender"]
${Gender_Pick}                     xpath=//android.widget.Button[@content-desc="Male"]
${Gender_Pick_2}                   xpath=//android.widget.Button[@content-desc="Female"]
${Enter_Birth_Place}               xpath=//android.widget.EditText
${NAME_CHOICE_1}                   xpath=(//android.widget.EditText)[1]
${NAME_CHOICE_2}                   xpath=(//android.widget.EditText)[2]
${NAME_CHOICE_3}                   xpath=(//android.widget.EditText)[3]
${NAME_CHOICE_4}                   xpath=(//android.widget.EditText)[4]
${FIRST_ADD}                       xpath=//android.widget.ScrollView/android.widget.ImageView[4]
${SECOND_ADD}                      xpath=//android.widget.ScrollView/android.widget.ImageView[2]

# Screen Titles and Headers
${Bride_detail}                    xpath=//android.view.View[@content-desc="Bride Name Detail"]
${Father_Title}                    xpath=//android.view.View[@content-desc="Father's Detail"]
${Email_Title}                     xpath=//android.view.View[@content-desc="Email *"]
# Validation Messages - Bride/Groom Namkaran
${MOTHER_FIRST_NAME_VALIDATION}    xpath=//android.view.View[contains(@content-desc,"mother's first name")]
${MOTHER_MIDDLE_NAME_VALIDATION}   xpath=//android.view.View[contains(@content-desc,"mother's middle name")]
${MOTHER_LAST_NAME_VALIDATION}     xpath=//android.view.View[contains(@content-desc,"mother's last name")]
${FATHER_FIRST_NAME_VALIDATION}    xpath=//android.view.View[contains(@content-desc,"father's first name")]
${FATHER_MIDDLE_NAME_VALIDATION}   xpath=//android.view.View[contains(@content-desc,"father's middle name")]
${FATHER_LAST_NAME_VALIDATION}     xpath=//android.view.View[contains(@content-desc,"father's last name")]

# Validation Messages - Common
${EMAIL_VALIDATION}                xpath=//android.view.View[contains(@content-desc,"email")]
${PHONE_VALIDATION}                xpath=//android.view.View[contains(@content-desc,"phone number")]
${DOB_VALIDATION}                  xpath=//android.view.View[contains(@content-desc,"DOB")]
${GENDER_VALIDATION}               xpath=//android.view.View[contains(@content-desc,"gender")]
${BIRTH_TIME_VALIDATION}           xpath=//android.view.View[contains(@content-desc,"birth time")]
${BIRTH_PLACE_VALIDATION}          xpath=//android.view.View[contains(@content-desc,"birth place")]
${Marriage_date}                   xpath=//android.view.View[contains(@content-desc,"marriage date")]
${Marriage_Place}                  xpath=//android.view.View[contains(@content-desc,"marriage")]
${Phone_Number}                    xpath=//android.view.View[@content-desc="00 0000 0000"]
${EMAIL}                           xpath=//android.view.View[@content-desc="Enter Email"]
${message_mobile}                  xpath=//android.view.View[contains(@content-desc,"valid phone number")]
# Business/House Namkaran - Owner Fields (following-sibling pattern)
${OWNER_FIRST_NAME}                xpath=//android.view.View[@content-desc="Owner First Name *"]/following-sibling::android.widget.EditText[1]
${OWNER_MIDDLE_NAME}               xpath=//android.view.View[@content-desc="Owner Middle Name *"]/following-sibling::android.widget.EditText[1]
${OWNER_LAST_NAME}                 xpath=//android.view.View[@content-desc="Owner Last Name *"]/following-sibling::android.widget.EditText[1]
${SECOND_OWNER_FIRST_NAME}         xpath=//android.view.View[@content-desc="Second Owner First Name"]/following-sibling::android.widget.EditText[1]
${SECOND_OWNER_MIDDLE_NAME}        xpath=//android.view.View[@content-desc="Second Owner Middle Name"]/following-sibling::android.widget.EditText[1]
${SECOND_OWNER_LAST_NAME}          xpath=//android.view.View[@content-desc="Second Owner Last Name"]/following-sibling::android.widget.EditText[1]
${THIRD_OWNER_FIRST_NAME}          xpath=//android.view.View[@content-desc="Third Owner First Name"]/following-sibling::android.widget.EditText[1]
${THIRD_OWNER_MIDDLE_NAME}         xpath=//android.view.View[@content-desc="Third Owner Middle Name"]/following-sibling::android.widget.EditText[1]
${THIRD_OWNER_LAST_NAME}           xpath=//android.view.View[@content-desc="Third Owner Last Name"]/following-sibling::android.widget.EditText[1]
${OWNER_EMAIL}                     xpath=//android.view.View[@content-desc="Owner Email *"]/following-sibling::android.widget.EditText[1]
${OWNER_PHONE}                     xpath=//android.view.View[@content-desc="Owner Phone Number *"]/..//android.widget.EditText[2]
${BUSINESS_DESC}                   xpath=//android.view.View[@content-desc="Business Description *"]/following-sibling::android.widget.EditText[1]
${FULL_ADDRESS}                    xpath=//android.view.View[@content-desc="Business Full Address *"]/following-sibling::android.widget.EditText[1]
${HOUSE_FULL_ADDRESS}              xpath=//android.view.View[contains(@content-desc,"House") and contains(@content-desc,"Address")]/following-sibling::android.widget.EditText[1]

# Multiple Names Selection
${YES_MULTIPLE_NAMES}              xpath=//android.view.View[@content-desc="Yes"]

# Validation Messages - Business/House Namkaran
${FirstOwner_FN_VALIDATION}        xpath=//android.view.View[contains(@content-desc,"first owner's first name")]
${FirstOwner_MN_VALIDATION}        xpath=//android.view.View[contains(@content-desc,"first owner's middle name")]
${FirstOwner_LN_VALIDATION}        xpath=//android.view.View[contains(@content-desc,"first owner's last name")]
${BUSINESS_DESCRIPTION_VALIDATION}  xpath=//android.view.View[contains(@content-desc,"business description")]
${BUSINESS_ADDRESS_VALIDATION}     xpath=//android.view.View[contains(@content-desc,"business address")]
${OwnerAddressErrorMessage}        xpath=//android.view.View[contains(@content-desc,"house address")]

# Screen Verification Elements
${BusinessDetail}                  xpath=//android.view.View[@content-desc="Business Detail"]
${submitBrideNamkaran}             xpath=//android.widget.ScrollView/android.widget.ImageView[2]
${NAMKARAN_CATEGORIES}             xpath=//android.view.View[contains(@content-desc,'Namkaran Categories')]
${NAMKARAN_ADD_CONTENT}            xpath=//android.widget.ImageView[contains(@content-desc,'Namkaran')][1]
${ADD_NAMKARAN_TEXT}               xpath=//android.view.View[contains(@content-desc,'NO NAMKARAN FOUND.')]

# Web CMS - Export functionality locators
${NAMKARAN_SELECT_ROW}            xpath=//input[@aria-label='Select row']
${NAMKARAN_EXPORT_BUTTON}         xpath=//button[normalize-space()='Export']
${NAMKARAN_EXPORTED_STATUS}       xpath=//span[contains(text(),'Exported')]

*** Keywords ***
# ============================================================================
# NAVIGATION KEYWORDS
# ============================================================================

Click on the Explore Menu
    [Documentation]    Navigate to Explore menu in the mobile app
    ...    Used to access the Namkaran section from main app navigation
    Mobile Wait Until Element Is Visible    ${EXPLORE_MENU}    15s
    Mobile Click Element    ${EXPLORE_MENU}
    Log To Console    ✅ Clicked on Explore Menu

Click on the Namkaran Card
    [Documentation]    Click on Namkaran card in Explore section
    ...    Opens the Namkaran feature page with categories
    Log To Console    🔄 Scrolling to find Namkaran card...
    Scroll Until Element Visible    ${NAMKARAN_MENU}
    Sleep    2s
    Log To Console    ⏳ Waiting for UI to settle after scroll...
    Mobile Wait Until Element Is Visible    ${NAMKARAN_MENU}    10s
    Mobile Click Element    ${NAMKARAN_MENU}
    Log To Console    ✅ Clicked on Namkaran Card

verify Namkaran header and content
    [Documentation]    Verify Namkaran header and content are displayed
    ...    Validates that Namkaran page loaded successfully
    Mobile Wait Until Element Is Visible    ${NAMKARAN_HEADER}    10s
    Mobile Page Should Contain Element      ${NAMKARAN_CONTENT}
    Log To Console    ✅ Namkaran header and content verified


Click on the Apply Now Button
    [Documentation]    Click Apply Now button to start Namkaran application
    ...    Scrolls to find the button and clicks it
    Sleep    3s
    Scroll Until Element Visible      ${APPLY_NOW_BUTTON}
    Mobile Wait Until Element Is Visible   ${APPLY_NOW_BUTTON}     15s
    Mobile Click Element        ${APPLY_NOW_BUTTON}
    Log To Console    ✅ Clicked on Apply Now Button

Click on the Cancel Button
    [Documentation]    Click Cancel button to abort current operation
    ...    Used to cancel form submission or navigation
    Mobile Wait Until Element Is Visible   ${CANCEL_BUTTON}     10s
    Mobile Click Element        ${CANCEL_BUTTON}
    Log To Console    ✅ Clicked on Cancel Button

Click on the I agree Button
    [Documentation]    Click I Agree button to accept terms and conditions
    ...    Required to proceed with Namkaran application
    Mobile Wait Until Element Is Visible   ${IAGREE_BUTTON}     10s
    Mobile Click Element     ${IAGREE_BUTTON}
    Sleep    2s
    Log To Console    ✅ Clicked on I Agree Button

# ============================================================================
# SCREEN VERIFICATION KEYWORDS
# ============================================================================

Verify Namkaran screen
    [Documentation]    Verifies Namkaran screen is displayed with retry mechanism
    ...    Uses 3 retry attempts to handle timing issues
    ...    Validates that Namkaran Categories element is visible
    FOR    ${retry}    IN RANGE    3
        TRY
            Mobile Wait Until Element Is Visible    ${NAMKARAN_CATEGORIES}    15s
            Sleep    0.5s
            Mobile Element Should Be Visible        ${NAMKARAN_CATEGORIES}
            ${Content}=    Mobile Get Element Attribute    ${NAMKARAN_CATEGORIES}    content-desc
            Should Contain    ${Content}       Namkaran Categories
            Log To Console    ✅ Namkaran screen content: ${Content}
            BREAK
        EXCEPT
            Log To Console    ⚠️ Attempt ${retry + 1} failed to verify Namkaran screen, retrying...
            Sleep    2s
            IF    ${retry} == 2
                Fail    Failed to verify Namkaran screen after 3 attempts. Element '${NAMKARAN_CATEGORIES}' not found.
            END
        END
    END


Verify Namkaran submission success message
    [Documentation]    Verify that Namkaran was submitted successfully
    ...    Checks for success message and Submitted Namkaran screen
    Mobile Wait Until Element Is Visible    ${successMessage}    10s
    ${message}=    Mobile Get Element Attribute    ${successMessage}    content-desc
    Should Be Equal As Strings      ${message}    Namkaran Submitted successfully
    Log To Console    ✅ Success message: ${message}
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Submitted Namkaran"]    10s
    Mobile Element Should Be Visible        xpath=//android.view.View[@content-desc="Submitted Namkaran"]
    ${Content}=    Mobile Get Element Attribute    xpath=//android.view.View[@content-desc="Submitted Namkaran"]    content-desc
    Should Contain    ${Content}    Submitted Namkaran
    Log To Console    ✅ Submitted screen: ${Content}

Verify Namkaran Header Content
    [Documentation]    Verify Namkaran header contains required fields
    ...    Checks for Namkaran ID and Category in header
    Mobile Wait Until Element Is Visible   ${NAMKARAN_ADD_CONTENT}     10s
    ${text}=    Mobile Get Element Attribute   ${NAMKARAN_ADD_CONTENT}    content-desc
    Should Contain    ${text}    Namkaran ID :
    Should Contain    ${text}    Category :
    Log To Console    ✅ Namkaran Header content: ${text}

Handle Namkaran Add Screen
    [Documentation]    Handle Namkaran add screen if it appears
    ...    Uses Run Keyword And Ignore Error to gracefully handle variations
    ...    Verifies both header content and welcome text if present
    Run Keyword And Ignore Error             Verify Namkaran add screen
    Run Keyword And Ignore Error             Verify Namkaran Add Screen Text

Verify Namkaran add screen
    [Documentation]    Verify Namkaran add screen elements are visible
    ...    Checks for both header and add text elements
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${NAMKARAN_ADD_CONTENT}    10s
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${ADD_NAMKARAN_TEXT}    10s
    Run Keyword If    ${isVisible}    Verify Namkaran Header Content
    Run Keyword If    ${isVisible}    Verify Namkaran Add Screen Text

Verify Namkaran Add Screen Text
    [Documentation]    Verify Namkaran add screen welcome text
    ...    Validates "NO NAMKARAN FOUND." message is displayed
    Mobile Wait Until Element Is Visible    ${ADD_NAMKARAN_TEXT}    10s
    ${Content}=    Mobile Get Element Attribute    ${ADD_NAMKARAN_TEXT}    content-desc
    Should Contain    ${Content}    NO NAMKARAN FOUND.
    Log To Console    ✅ Namkaran Add Screen Text: ${Content}

# ============================================================================
# CATEGORY SELECTION KEYWORDS
# ============================================================================

Select Other for the register prayer
    [Documentation]    Select "Other" option for Namkaran registration
    ...    Used when registering Namkaran for someone else
    Mobile Wait Until Element Is Visible   ${SelectOtherNamkaran}    10s
    Mobile Click Element        ${SelectOtherNamkaran}
    Log To Console    ✅ Selected 'Other' for Namkaran registration


Select Bride Namkaran from category dropdown
    [Documentation]    Select Bride Namkaran category from dropdown
    ...    Opens category dropdown and selects Bride Namkaran option
    Mobile Wait Until Element Is Visible   ${CategoryDropdown}    10s
    Mobile Click Element        ${CategoryDropdown}
    Mobile Click Element        ${BrideNamkaran}
    Log To Console    ✅ Selected Bride Namkaran category

# ============================================================================
# FORM INPUT KEYWORDS - BRIDE NAMKARAN
# ============================================================================

Enter Bride First Name
    [Arguments]    ${BRIDE_FIRST_NAME}=DefaultBrideFirstName
    [Documentation]    Enter bride's first name in Bride Namkaran form
    ...    @param BRIDE_FIRST_NAME: Bride's first name to enter (default: DefaultBrideFirstName)
    Scroll Up Until Element Visible           ${Bride_detail}
    Mobile Wait Until Element Is Visible   ${FNameInputField}    10s
    Mobile Click Element    ${FNameInputField}
    Mobile Input Text    ${FNameInputField}    ${BRIDE_FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Bride First Name entered: ${BRIDE_FIRST_NAME}

Enter Bride Middle Name
    [Arguments]    ${BRIDE_MIDDLE_NAME}=DefaultBrideMiddleName
    [Documentation]    Enter bride's middle name in Bride Namkaran form
    ...    @param BRIDE_MIDDLE_NAME: Bride's middle name to enter (default: DefaultBrideMiddleName)
    Scroll Up Until Element Visible           ${Bride_detail}
    Mobile Wait Until Element Is Visible   ${MNameInputField}    10s
    Mobile Click Element    ${MNameInputField}
    Mobile Input Text    ${MNameInputField}    ${BRIDE_MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Bride Middle Name entered: ${BRIDE_MIDDLE_NAME}

Enter Bride Last Name
    [Arguments]    ${BRIDE_LAST_NAME}=DefaultBrideLastName
    [Documentation]    Enter bride's last name in Bride Namkaran form
    ...    @param BRIDE_LAST_NAME: Bride's last name to enter (default: DefaultBrideLastName)
    Scroll Up Until Element Visible           ${Bride_detail}
    Mobile Wait Until Element Is Visible   ${LNameInputField}    10s
    Mobile Click Element    ${LNameInputField}
    Mobile Input Text    ${LNameInputField}    ${BRIDE_LAST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Bride Last Name entered: ${BRIDE_LAST_NAME}

Enter Groom First Name
    [Arguments]    ${GROOM_FIRST_NAME}=DefaultGroomFirstName
    [Documentation]    Enter groom's first name in Bride Namkaran form
    ...    @param GROOM_FIRST_NAME: Groom's first name to enter (default: DefaultGroomFirstName)
    Mobile Wait Until Element Is Visible   ${FNameInputField}    10s
    Mobile Click Element    ${FNameInputField}
    Mobile Input Text    ${FNameInputField}    ${GROOM_FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Groom First Name entered: ${GROOM_FIRST_NAME}

Enter Groom Middle Name
    [Arguments]    ${GROOM_MIDDLE_NAME}=DefaultGroomMiddleName
    [Documentation]    Enter groom's middle name in Bride Namkaran form
    ...    @param GROOM_MIDDLE_NAME: Groom's middle name to enter (default: DefaultGroomMiddleName)
    Mobile Wait Until Element Is Visible   ${MNameInputField}    10s
    Mobile Click Element    ${MNameInputField}
    Mobile Input Text    ${MNameInputField}    ${GROOM_MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Groom Middle Name entered: ${GROOM_MIDDLE_NAME}

Enter Groom Last Name
    [Arguments]    ${GROOM_LAST_NAME}=DefaultGroomLastName
    [Documentation]    Enter groom's last name in Bride Namkaran form
    ...    @param GROOM_LAST_NAME: Groom's last name to enter (default: DefaultGroomLastName)
    Mobile Wait Until Element Is Visible   ${LNameInputField}    10s
    Mobile Click Element    ${LNameInputField}
    Mobile Input Text    ${LNameInputField}    ${GROOM_LAST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Groom Last Name entered: ${GROOM_LAST_NAME}

# ============================================================================
# COMMON FORM FIELDS - EMAIL AND PHONE
# ============================================================================

Enter Email Address
    [Arguments]    ${EMAIL}=test@example.com
    [Documentation]    Enter email address in Namkaran form
    ...    @param EMAIL: Email address to enter (default: test@example.com)
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    ${EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Email entered: ${EMAIL}

Enter Email Address for Child Namkaran
    [Arguments]    ${EMAIL}=test@example.com
    [Documentation]    Enter email address in Child Namkaran form
    ...    @param EMAIL: Email address to enter (default: test@example.com)
    ...    Scrolls to Father section first before entering email
    Scroll Up Until Element Visible            ${Father_Title}
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    ${EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Email entered for Child Namkaran: ${EMAIL}

# ============================================================================
# HOUSE/BUSINESS NAMKARAN CATEGORY SELECTION
# ============================================================================

Select House Namkaran from category dropdown
    [Documentation]    Select House Namkaran category from dropdown
    ...    Opens category dropdown and selects House Namkaran option
    Mobile Wait Until Element Is Visible   ${CategoryDropdown}    10s
    Mobile Click Element        ${CategoryDropdown}
    Mobile Click Element        ${SelectHouseNamkaran}
    Log To Console    ✅ Selected House Namkaran category

# ============================================================================
# FORM INPUT KEYWORDS - HOUSE/BUSINESS OWNER DETAILS
# ============================================================================

Enter Owner First Name
    [Arguments]    ${FIRST_NAME}=DefaultOwnerFirstName
    [Documentation]    Enter owner's first name in House/Business Namkaran form
    ...    @param FIRST_NAME: Owner's first name to enter (default: DefaultOwnerFirstName)
    Mobile Wait Until Element Is Visible   ${FNameInputField}    10s
    Mobile Click Element    ${FNameInputField}
    Mobile Input Text    ${FNameInputField}    ${FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Owner First Name entered: ${FIRST_NAME}

Enter Owner Middle Name
    [Arguments]    ${MIDDLE_NAME}=DefaultOwnerMiddleName
    [Documentation]    Enter owner's middle name in House/Business Namkaran form
    ...    @param MIDDLE_NAME: Owner's middle name to enter (default: DefaultOwnerMiddleName)
    Mobile Wait Until Element Is Visible   ${MNameInputField}    10s
    Mobile Click Element    ${MNameInputField}
    Mobile Input Text    ${MNameInputField}    ${MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Owner Middle Name entered: ${MIDDLE_NAME}

Enter Owner Last Name
    [Arguments]    ${LAST_NAME}=DefaultOwnerLastName
    [Documentation]    Enter owner's last name in House/Business Namkaran form
    ...    @param LAST_NAME: Owner's last name to enter (default: DefaultOwnerLastName)
    Mobile Wait Until Element Is Visible   ${LNameInputField}    10s
    Mobile Click Element    ${LNameInputField}
    Mobile Input Text    ${LNameInputField}    ${LAST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Scroll Until Element Visible    ${EmailInputField}
    Log To Console    ✅ Owner Last Name entered: ${LAST_NAME}

Enter Owner Email
    [Arguments]    ${EMAIL}=owner@example.com
    [Documentation]    Enter owner's email in House/Business Namkaran form
    ...    @param EMAIL: Owner's email to enter (default: owner@example.com)
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    ${EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Owner Email entered: ${EMAIL}

Clear email upon validation failure
    [Documentation]    Clear email field when validation fails
    ...    Used to retry email entry after validation error
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Clear Text       ${EmailInputField}
    Log To Console    🔄 Cleared email field after validation failure

Enter Phone Number
    [Arguments]    ${PHONE_NUMBER}=1234567890
    [Documentation]    Enter phone number in Namkaran form
    ...    @param PHONE_NUMBER: Phone number to enter (default: 1234567890)
    Mobile Wait Until Element Is Visible   ${PhoneInputField}    10s
    Mobile Click Element    ${PhoneInputField}
    Mobile Input Text    ${PhoneInputField}    ${PHONE_NUMBER}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Phone Number entered: ${PHONE_NUMBER}

Enter Phone Number for Child Namkaran
    [Arguments]    ${PHONE_NUMBER}=1234567890
    [Documentation]    Enter phone number in Child Namkaran form
    ...    @param PHONE_NUMBER: Phone number to enter (default: 1234567890)
    ...    Scrolls to Father section first before entering phone
    Scroll Up Until Element Visible            ${Father_Title}
    Mobile Wait Until Element Is Visible   ${PhoneInputField}    10s
    Mobile Click Element    ${PhoneInputField}
    Mobile Input Text    ${PhoneInputField}    ${PHONE_NUMBER}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Phone Number entered for Child Namkaran: ${PHONE_NUMBER}

Enter Owner Phone Number
    [Arguments]    ${PHONE_NUMBER}=1234567890
    [Documentation]    Enter owner's phone number in House/Business Namkaran form
    ...    @param PHONE_NUMBER: Owner's phone number to enter (default: 1234567890)
    Mobile Wait Until Element Is Visible   ${PhoneInputField}    10s
    Mobile Click Element    ${PhoneInputField}
    Mobile Input Text    ${PhoneInputField}    ${PHONE_NUMBER}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Owner Phone Number entered: ${PHONE_NUMBER}

# ============================================================================
# DATE AND TIME SELECTION KEYWORDS
# ============================================================================

Select Marriage Date
    [Documentation]    Select marriage date from date picker
    ...    Opens date picker and selects date by clicking OK
    ...    (Specific date selection logic commented out, using current date)
    Log To Console    🔄 Scrolling to find Marriage Date field...
    Scroll Until Element Visible    ${SelectMarriageDateField}
    Log To Console    📅 Selecting Marriage Date...
    Mobile Wait Until Element Is Visible     ${SelectMarriageDateField}    10s
    Mobile Click Element     ${SelectMarriageDateField}
    Sleep    2s
    # Mobile Click Element     ${SelectYrs}
    # Mobile Wait Until Element Is Visible   ${Select2019}    10s
    # Mobile Click Element     ${Select2019}
    # Mobile Wait Until Element Is Visible   ${SelectDay}    10s
    # Mobile Click Element     ${SelectDay}
    Mobile Click Element     ${SelectOK}
    Log To Console    ✅ Selected Marriage Date

Enter Marriage Place
    [Arguments]    ${MARRIAGE_PLACE}=DefaultMarriagePlace
    [Documentation]    Enter marriage place in Bride Namkaran form
    ...    @param MARRIAGE_PLACE: Marriage place to enter (default: DefaultMarriagePlace)
    Mobile Wait Until Element Is Visible   ${MarriageInputfield}    10s
    Mobile Click Element    ${MarriageInputfield}
    Mobile Input Text    ${MarriageInputfield}    ${MARRIAGE_PLACE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Marriage Place entered: ${MARRIAGE_PLACE}

# ============================================================================
# VALIDATION MESSAGE VERIFICATION KEYWORDS
# ============================================================================

Verify Invalid Email message
    [Documentation]    Verify invalid email validation message is displayed
    ...    Expected message: "Please enter valid email"
    Mobile Wait Until Element Is Visible    ${Invalid_email}    10s
    ${message}=    Mobile Get Element Attribute    ${Invalid_email}    content-desc
    Should Be Equal As Strings      ${message}    Please enter valid email
    Log To Console    ⚠️ Validation: ${message}

Verify Invalid Mobile message
    [Documentation]    Verify invalid phone number validation message is displayed
    ...    Expected message: "Please enter valid phone number"
    Mobile Wait Until Element Is Visible    ${Invalid_mobile}    10s
    ${message}=    Mobile Get Element Attribute    ${Invalid_mobile}    content-desc
    Should Be Equal As Strings      ${message}    Please enter valid phone number
    Log To Console    ⚠️ Validation: ${message}

Verify bride first name validation message
    [Documentation]    Verify bride first name required validation message
    ...    Expected message: "Please enter bride's first name"
    Mobile Wait Until Element Is Visible    ${Bride_First_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Bride_First_Name}    content-desc
    Should Be Equal As Strings      ${message}    Please enter bride's first name
    Log To Console    ⚠️ Validation: ${message}

Verify bride middle name validation message
    [Documentation]    Verify bride middle name required validation message
    ...    Expected message: "Enter Middle Name"
    Mobile Wait Until Element Is Visible    ${Bride_Middle_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Bride_Middle_Name}    content-desc
    Should Be Equal As Strings    ${message}    Enter Middle Name
    Log To Console    ⚠️ Validation: ${message}

Verify bride last name validation message
    [Documentation]    Verify bride last name required validation message
    ...    Expected message: "Please enter bride's last name"
    Mobile Wait Until Element Is Visible    ${Bride_Last_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Bride_Last_Name}    content-desc
    Should Be Equal As Strings    ${message}    Please enter bride's last name
    Log To Console    ⚠️ Validation: ${message}

Verify groom first name validation message
    [Documentation]    Verify groom first name required validation message
    ...    Expected message: "Please enter groom's first name"
    Mobile Wait Until Element Is Visible    ${Groom_First_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Groom_First_Name}    content-desc
    Should Be Equal As Strings    ${message}    Please enter groom's first name
    Log To Console    ⚠️ Validation: ${message}

Verify groom middle name validation message
    [Documentation]    Verify groom middle name required validation message
    ...    Expected message: "Please enter groom's middle name"
    Mobile Wait Until Element Is Visible    ${Groom_Middle_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Groom_Middle_Name}    content-desc
    Should Be Equal As Strings    ${message}    Please enter groom's middle name
    Log To Console    ⚠️ Validation: ${message}

Verify groom last name validation message
    [Documentation]    Verify groom last name required validation message
    ...    Expected message: "Please enter groom's middle name" (Note: this may be a typo in app)
    Mobile Wait Until Element Is Visible    ${Groom_Last_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Groom_Last_Name}    content-desc
    Should Be Equal As Strings    ${message}    Please enter groom's middle name
    Log To Console    ⚠️ Validation: ${message}

Verify email validation message
    [Documentation]    Verify email required validation message
    ...    Expected message: "Enter Email"
    Mobile Wait Until Element Is Visible    ${EMAIL}    10s
    ${message}=    Mobile Get Element Attribute    ${EMAIL}    content-desc
    Should Be Equal As Strings    ${message}    Enter Email
    Log To Console    ⚠️ Validation: ${message}

Verify Phone Number validation message
    [Documentation]    Verify phone number placeholder/validation message
    ...    Expected message: "00 0000 0000"
    Mobile Wait Until Element Is Visible    ${Phone_Number}    10s
    ${message}=    Mobile Get Element Attribute    ${Phone_Number}    content-desc
    Should Be Equal As Strings    ${message}    00 0000 0000
    Log To Console    ⚠️ Validation: ${message}

Verify Marriage Date validation message
    [Documentation]    Verify marriage date required validation message
    ...    Expected message: "Please select marriage date"
    Mobile Wait Until Element Is Visible    ${Marriage_date}    10s
    ${message}=    Mobile Get Element Attribute    ${Marriage_date}    content-desc
    Should Be Equal As Strings    ${message}    Please select marriage date
    Log To Console    ⚠️ Validation: ${message}

Verify Marriage Place validation message
    [Documentation]    Verify marriage place required validation message
    ...    Expected message: "Please select marriage date" (Note: this may be a typo in app)
    Mobile Wait Until Element Is Visible    ${Marriage_Place}    10s
    ${message}=    Mobile Get Element Attribute   ${Marriage_Place}    content-desc
    Should Be Equal As Strings    ${message}    Please select marriage date
    Log To Console    ⚠️ Validation: ${message}    


# ============================================================================
# CHILD NAMKARAN CATEGORY SELECTION AND FORM INPUTS
# ============================================================================

Select Child Namkaran from category dropdown
    [Documentation]    Select Child Namkaran category from dropdown
    ...    Opens category dropdown and selects Child Namkaran option
    Mobile Wait Until Element Is Visible   ${CategoryDropdown}    10s
    Mobile Click Element        ${CategoryDropdown}
    Mobile Click Element        ${ChildNamkaran}
    Log To Console    ✅ Selected Child Namkaran category


Enter Mother First Name
    [Arguments]    ${MOTHER_FIRST_NAME}=DefaultMotherFirstName
    [Documentation]    Enter mother's first name in Child Namkaran form
    ...    @param MOTHER_FIRST_NAME: Mother's first name to enter (default: DefaultMotherFirstName)
    Scroll Up Until Element Visible            ${ChildNamkaran}
    Mobile Wait Until Element Is Visible              ${FNameInputField}    10s
    Mobile Click Element                              ${FNameInputField}
    Mobile Input Text                                 ${FNameInputField}    ${MOTHER_FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Mother First Name entered: ${MOTHER_FIRST_NAME}

Enter Mother Middle Name
    [Arguments]    ${MOTHER_MIDDLE_NAME}=DefaultMotherMiddleName
    [Documentation]    Enter mother's middle name in Child Namkaran form
    ...    @param MOTHER_MIDDLE_NAME: Mother's middle name to enter (default: DefaultMotherMiddleName)
    Scroll Up Until Element Visible            ${ChildNamkaran}
    Mobile Wait Until Element Is Visible              ${MNameInputField}    10s
    Mobile Click Element                              ${MNameInputField}
    Mobile Input Text                                 ${MNameInputField}    ${MOTHER_MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Mother Middle Name entered: ${MOTHER_MIDDLE_NAME}

Enter Mother Last Name
    [Arguments]    ${MOTHER_LAST_NAME}=DefaultMotherLastName
    [Documentation]    Enter mother's last name in Child Namkaran form
    ...    @param MOTHER_LAST_NAME: Mother's last name to enter (default: DefaultMotherLastName)
    Scroll Up Until Element Visible            ${ChildNamkaran}
    Mobile Wait Until Element Is Visible              ${LNameInputField}    10s
    Mobile Click Element                              ${LNameInputField}
    Mobile Input Text                                 ${LNameInputField}    ${MOTHER_LAST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Mother Last Name entered: ${MOTHER_LAST_NAME}


Enter Father First Name
    [Arguments]    ${FATHER_FIRST_NAME}=DefaultFatherFirstName
    [Documentation]    Enter father's first name in Child Namkaran form
    ...    @param FATHER_FIRST_NAME: Father's first name to enter (default: DefaultFatherFirstName)
    Scroll Up Until Element Visible            ${ChildNamkaran}
    Mobile Wait Until Element Is Visible              ${FNameInputField}    10s
    Mobile Click Element                              ${FNameInputField}
    Mobile Input Text                                 ${FNameInputField}    ${FATHER_FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Father First Name entered: ${FATHER_FIRST_NAME}

Enter Father Middle Name
    [Arguments]    ${FATHER_MIDDLE_NAME}=DefaultFatherMiddleName
    [Documentation]    Enter father's middle name in Child Namkaran form
    ...    @param FATHER_MIDDLE_NAME: Father's middle name to enter (default: DefaultFatherMiddleName)
    Scroll Up Until Element Visible            ${ChildNamkaran}
    Mobile Wait Until Element Is Visible              ${MNameInputField}    10s
    Mobile Click Element                              ${MNameInputField}
    Mobile Input Text                                 ${MNameInputField}    ${FATHER_MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Father Middle Name entered: ${FATHER_MIDDLE_NAME}

Enter Father Last Name
    [Arguments]    ${FATHER_LAST_NAME}=DefaultFatherLastName
    [Documentation]    Enter father's last name in Child Namkaran form
    ...    @param FATHER_LAST_NAME: Father's last name to enter (default: DefaultFatherLastName)
    Scroll Up Until Element Visible            ${Father_Title}
    Mobile Wait Until Element Is Visible              ${LNameInputField}    10s
    Mobile Click Element                              ${LNameInputField}
    Mobile Input Text                                 ${LNameInputField}    ${FATHER_LAST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Father Last Name entered: ${FATHER_LAST_NAME}

Clear email upon validation failure for Child Namkaran
    [Documentation]    Clear email field when validation fails in Child Namkaran form
    ...    Scrolls to email field and clears it for retry
    Scroll Up Until Element Visible   ${Email_Title}
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Clear Text       ${EmailInputField}
    Log To Console    🔄 Cleared email field for Child Namkaran after validation failure

Verify Invalid Mobile message for Child Namkaran
    [Documentation]    Verify invalid phone number validation message in Child Namkaran form
    ...    Expected message: "Please enter valid phone number"
    Mobile Wait Until Element Is Visible    ${message_mobile}    10s
    ${message}=    Mobile Get Element Attribute    ${message_mobile}    content-desc
    Should Be Equal As Strings      ${message}    Please enter valid phone number
    Log To Console    ⚠️ Validation for Child Namkaran: ${message}    

# ============================================================================
# CHILD BIRTH DETAILS SELECTION (DOB, Gender, Time, Birth Place)
# ============================================================================

Select Single Number of child
    [Documentation]    Select single child option for Child Namkaran
    ...    Used when registering Namkaran for one child
    Log To Console    🔄 Selecting single child option...
    Mobile Wait Until Element Is Visible   ${SelectNumberofChild}    10s
    Mobile Click Element        ${SelectNumberofChild}
    Log To Console    ✅ Selected single child option

Select DOB
    [Documentation]    Select child's DOB (4 months ago) using arrow navigation
    Log To Console    🔄 Scrolling to find DOB field...
    Scroll Until Element Visible    ${Select_DOB}
    Log To Console    📅 Selecting DOB (4 months ago, day 15)...
    Mobile Wait Until Element Is Visible     ${Select_DOB}    10s
    Mobile Click Element     ${Select_DOB}
    Sleep    2s
    # Navigate backward 4 months using left arrow button
    FOR    ${i}    IN RANGE    4
        Mobile Click Element    xpath=//android.widget.Button[1]
        Sleep    1s
    END
    # Select day 15 from the current month view
    Mobile Wait Until Element Is Visible   xpath=//android.view.View[contains(@content-desc,"15")]    10s
    ${day_elements}=    Mobile Get Webelements    xpath=//android.view.View[contains(@content-desc,"15")]
    Mobile Click Element    ${day_elements}[0]
    Sleep    1s
    Mobile Click Element     ${SelectOK}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Selected DOB: 4 months ago, day 15

Select Gender
    [Documentation]    Select child's gender for Child Namkaran
    ...    Defaults to Male gender selection
    Log To Console    🔄 Scrolling to find Gender field...
    Scroll Until Element Visible      ${SubmitButton}
    Log To Console    ⚧ Selecting Gender...
    Mobile Wait Until Element Is Visible     ${Select_Gender}    10s
    Mobile Click Element     ${Select_Gender}
    Mobile Click Element     ${Gender_Pick}
    Log To Console    ✅ Selected Gender: Male


Select Time
    [Documentation]    Select child's birth time for Child Namkaran
    ...    Selects AM time period from the time picker
    Log To Console    🔄 Scrolling to find Time field...
    Scroll Until Element Visible    ${Select_Time}
    Log To Console    ⏰ Selecting Birth Time...
    Mobile Wait Until Element Is Visible     ${Select_Time}    10s
    Mobile Click Element                     ${Select_Time}
    Mobile Wait Until Element Is Visible     ${Select_AM}    5s
    Mobile Click Element                     ${Select_AM}
    Mobile Click Element                     ${SelectOK}
    Log To Console    ✅ Selected Birth Time: AM

Enter Birth Place
    [Documentation]    Enter child's birth place for Child Namkaran
    ...    @param BIRTH_PLACE: Birth place to enter (default: DefaultBirthPlace)
    [Arguments]    ${BIRTH_PLACE}=DefaultBirthPlace
    Log To Console    🔄 Scrolling to find Birth Place field...
    Scroll Until Element Visible    ${Enter_Birth_Place}
    Log To Console    📍 Entering Birth Place: ${BIRTH_PLACE}
    Mobile Wait Until Element Is Visible    ${Enter_Birth_Place}    10s
    Mobile Click Element                    ${Enter_Birth_Place}
    Mobile Input Text                       ${Enter_Birth_Place}    ${BIRTH_PLACE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Birth Place: ${BIRTH_PLACE}

# ============================================================================
# TWINS SUPPORT
# ============================================================================

Select Twins Number of child
    [Documentation]    Select twins option for Child Namkaran
    ...    Used when registering Namkaran for two children (twins)
    Log To Console    🔄 Selecting twins option...
    Mobile Wait Until Element Is Visible   ${SelectTwins}    10s
    Mobile Click Element        ${SelectTwins}
    Log To Console    ✅ Selected twins option   	

Select DOB of Child No. 2
    [Documentation]    Select date of birth for second child (twin)
    ...    Selects year 2019 from the date picker
    Log To Console    🔄 Selecting DOB for Child No. 2...
    Scroll Until Element Visible     ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${Select_DOB}    10s
    Mobile Click Element                    ${Select_DOB}
    Mobile Click Element     ${SelectYrs}
    Mobile Wait Until Element Is Visible   ${Select2019}    10s
    Mobile Click Element     ${Select2019}
    # Mobile Wait Until Element Is Visible   ${SelectDay}    10s
    # Mobile Click Element     ${SelectDay}
    Mobile Click Element     ${SelectOK}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Selected DOB for Child No. 2: Year 2019


Select Gender of Child No. 2
    [Documentation]    Select gender for second child (twin)
    ...    Selects Female gender for the second twin
    Log To Console    🔄 Selecting Gender for Child No. 2...
    Scroll Until Element Visible      ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${Select_Gender}    10s
    Mobile Click Element                    ${Select_Gender}
    Mobile Click Element     ${Gender_Pick_2}
    Log To Console    ✅ Selected Gender for Child No. 2: Female


Select Time of Child No. 2
    [Documentation]    Select birth time for second child (twin)
    ...    Selects AM time period from the time picker
    Log To Console    🔄 Selecting Time for Child No. 2...
    Mobile Wait Until Element Is Visible    ${Select_Time}    10s
    Mobile Click Element                    ${Select_Time}
    Mobile Wait Until Element Is Visible    ${Select_AM}    5s
    Mobile Click Element                    ${Select_AM}
    Mobile Click Element                    ${SelectOK}
    Log To Console    ✅ Selected Time for Child No. 2: AM

Enter Birth Place of Child No. 2
    [Documentation]    Enter birth place for second child (twin)
    ...    @param BIRTH_PLACE: Birth place to enter (default: DefaultBirthPlace2)
    [Arguments]    ${BIRTH_PLACE}=DefaultBirthPlace2
    Log To Console    🔄 Entering Birth Place for Child No. 2...
    Scroll Until Element Visible     ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${Enter_Birth_Place}    10s
    Mobile Click Element                    ${Enter_Birth_Place}
    Mobile Input Text                       ${Enter_Birth_Place}    ${BIRTH_PLACE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered Birth Place for Child No. 2: ${BIRTH_PLACE}


# ============================================================================
# MULTIPLE NAME CHOICES
# ============================================================================

Select Yes for the multiple name choice for the child
    [Documentation]    Select Yes option for multiple name choices
    ...    Allows entering up to 4 name choices for the child
    Log To Console    🔄 Selecting Yes for multiple name choices...
    Mobile Wait Until Element Is Visible   ${SELECT_MULTIPLE_CHILD}
    Mobile Click Element                   ${SELECT_MULTIPLE_CHILD}
    Log To Console    ✅ Selected Yes for multiple name choices

Enter name choice 1
    [Documentation]    Enter first name choice for Child Namkaran
    ...    @param ONE: First name choice to enter (default: DefaultNameChoice1)
    [Arguments]    ${ONE}=DefaultNameChoice1
    Log To Console    🔄 Entering name choice 1...
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_1}
    Mobile Click Element                   ${NAME_CHOICE_1}
    Mobile Input Text                      ${NAME_CHOICE_1}    ${ONE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered name choice 1: ${ONE}

Enter name choice 2
    [Documentation]    Enter second name choice for Child Namkaran
    ...    @param SECOND: Second name choice to enter (default: DefaultNameChoice2)
    [Arguments]    ${SECOND}=DefaultNameChoice2
    Log To Console    🔄 Entering name choice 2...
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_2}
    Mobile Click Element                   ${NAME_CHOICE_2}
    Mobile Input Text                      ${NAME_CHOICE_2}    ${SECOND}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered name choice 2: ${SECOND}

Click on the Add Button for Child Namkaran
    [Documentation]    Click Add button to enable third name choice field
    ...    Expands form to allow entering name choice 3
    Log To Console    🔄 Clicking Add button to enable 3rd name choice...
    Mobile Wait Until Element Is Visible   ${FIRST_ADD}
    Mobile Click Element                   ${FIRST_ADD}
    Log To Console    ✅ Clicked Add button - 3rd name choice field enabled

Enter name choice 3
    [Documentation]    Enter third name choice for Child Namkaran
    ...    @param THIRD: Third name choice to enter (default: DefaultNameChoice3)
    [Arguments]    ${THIRD}=DefaultNameChoice3
    Log To Console    🔄 Entering name choice 3...
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_3}
    Mobile Click Element                   ${NAME_CHOICE_3}
    Mobile Input Text                      ${NAME_CHOICE_3}    ${THIRD}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered name choice 3: ${THIRD}

Click on the Add Button for 4 Child Namkaran
    [Documentation]    Click second Add button to enable fourth name choice field
    ...    Expands form to allow entering name choice 4 (maximum)
    Log To Console    🔄 Clicking Add button to enable 4th name choice...
    Mobile Wait Until Element Is Visible   ${SECOND_ADD}
    Mobile Click Element                   ${SECOND_ADD}
    Log To Console    ✅ Clicked Add button - 4th name choice field enabled

Enter name choice 4
    [Documentation]    Enter fourth name choice for Child Namkaran
    ...    @param FOURTH: Fourth name choice to enter (default: DefaultNameChoice4)
    [Arguments]    ${FOURTH}=DefaultNameChoice4
    Sleep  5s
    Log To Console    🔄 Entering name choice 4...
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_4}
    Mobile Click Element                   ${NAME_CHOICE_4}
    Mobile Input Text                      ${NAME_CHOICE_4}    ${FOURTH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered name choice 4: ${FOURTH}

# ============================================================================
# CHILD NAMKARAN VALIDATION MESSAGES
# ============================================================================

Verify Mother First Name validation message
    [Documentation]    Verify validation message for missing mother's first name
    ...    Expected message: "Please enter mother's first name"
    Log To Console    ⚠️ Checking Mother First Name validation...
    Mobile Wait Until Element Is Visible    ${MOTHER_FIRST_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${MOTHER_FIRST_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter mother's first name
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Mother Middle Name validation message
    [Documentation]    Verify validation message for missing mother's middle name
    ...    Expected message: "Please enter mother's middle name"
    Log To Console    ⚠️ Checking Mother Middle Name validation...
    Mobile Wait Until Element Is Visible    ${MOTHER_MIDDLE_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${MOTHER_MIDDLE_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter mother's middle name
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Mother Last Name validation message
    [Documentation]    Verify validation message for missing mother's last name
    ...    Expected message: "Please enter mother's last name"
    Log To Console    ⚠️ Checking Mother Last Name validation...
    Mobile Wait Until Element Is Visible    ${MOTHER_LAST_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${MOTHER_LAST_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter mother's last name
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Father First Name validation message
    [Documentation]    Verify validation message for missing father's first name
    ...    Expected message: "Please enter father's first name"
    Log To Console    ⚠️ Checking Father First Name validation...
    Mobile Wait Until Element Is Visible    ${FATHER_FIRST_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FATHER_FIRST_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter father's first name
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Father Middle Name validation message
    [Documentation]    Verify validation message for missing father's middle name
    ...    Expected message: "Please enter father's middle name"
    Log To Console    ⚠️ Checking Father Middle Name validation...
    Mobile Wait Until Element Is Visible    ${FATHER_MIDDLE_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FATHER_MIDDLE_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter father's middle name
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Father Last Name validation message
    [Documentation]    Verify validation message for missing father's last name
    ...    Expected message: "Please enter father's last name"
    Log To Console    ⚠️ Checking Father Last Name validation...
    Mobile Wait Until Element Is Visible    ${FATHER_LAST_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FATHER_LAST_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter father's last name
    Log To Console    ⚠️ Validation message verified: ${message}

Verify email validation message of Child Namkaran
    [Documentation]    Verify validation message for missing email in Child Namkaran
    ...    Expected message: "Please enter email"
    Log To Console    ⚠️ Checking email validation for Child Namkaran...
    Mobile Wait Until Element Is Visible    ${EMAIL_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${EMAIL_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter email
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Phone Number validation message of Child Namkaran
    [Documentation]    Verify validation message for missing phone number in Child Namkaran
    ...    Expected message: "Please enter phone number"
    Log To Console    ⚠️ Checking phone number validation for Child Namkaran...
    Mobile Wait Until Element Is Visible    ${PHONE_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${PHONE_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter phone number
    Log To Console    ⚠️ Validation message verified: ${message}

Verify DOB validation message of Child Namkaran
    [Documentation]    Verify validation message for missing date of birth in Child Namkaran
    ...    Expected message: "Please select DOB"
    Log To Console    ⚠️ Checking DOB validation for Child Namkaran...
    Mobile Wait Until Element Is Visible    ${DOB_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${DOB_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please select DOB
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Gender validation message of Child Namkaran
    [Documentation]    Verify validation message for missing gender in Child Namkaran
    ...    Expected message: "Please select gender"
    Log To Console    ⚠️ Checking Gender validation for Child Namkaran...
    Mobile Wait Until Element Is Visible    ${GENDER_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${GENDER_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please select gender
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Birth Time validation message of Child Namkaran
    [Documentation]    Verify validation message for missing birth time in Child Namkaran
    ...    Expected message: "Please select birth time"
    Log To Console    ⚠️ Checking Birth Time validation for Child Namkaran...
    Mobile Wait Until Element Is Visible    ${BIRTH_TIME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${BIRTH_TIME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please select birth time
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Birth Place validation message of Child Namkaran
    [Documentation]    Verify validation message for missing birth place in Child Namkaran
    ...    Expected message: "Please enter birth place"
    Log To Console    ⚠️ Checking Birth Place validation for Child Namkaran...
    Mobile Wait Until Element Is Visible    ${BIRTH_PLACE_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${BIRTH_PLACE_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter birth place
    Log To Console    ⚠️ Validation message verified: ${message} 



# ============================================================================
# HOUSE NAMKARAN KEYWORDS
# ============================================================================

Enter Owner house full Address
    [Documentation]    Enter house owner's full address for House Namkaran
    ...    @param ADDRESS: Full address to enter (default: DefaultHouseAddress)
    [Arguments]    ${ADDRESS}=DefaultHouseAddress
    Log To Console    🔄 Entering owner house address...
    Mobile Wait Until Element Is Visible   ${HOUSE_FULL_ADDRESS}    10s
    Mobile Click Element    ${HOUSE_FULL_ADDRESS}
    Mobile Input Text    ${HOUSE_FULL_ADDRESS}    ${ADDRESS}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered owner house address: ${ADDRESS}

Select Yes for the multiple name choice
    [Documentation]    Select Yes option for multiple name choices for House Namkaran
    ...    Allows entering up to 3 name choices for the house
    Log To Console    🔄 Selecting Yes for multiple name choices...
    Mobile Wait Until Element Is Visible   ${YesRadioButton}    10s
    Mobile Click Element    ${YesRadioButton}
    Log To Console    ✅ Selected Yes for multiple name choices

Enter First name choice
    [Documentation]    Enter first name choice for House Namkaran
    ...    @param FIRST: First name choice to enter (default: DefaultFirstChoice)
    [Arguments]    ${FIRST}=DefaultFirstChoice
    Log To Console    🔄 Entering first name choice...
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_1}    10s
    Mobile Click Element    ${NAME_CHOICE_1}
    Mobile Input Text    ${NAME_CHOICE_1}    ${FIRST}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered first name choice: ${FIRST}

Enter Second name choice
    [Documentation]    Enter second name choice for House Namkaran
    ...    @param SECOND: Second name choice to enter (default: DefaultSecondChoice)
    [Arguments]    ${SECOND}=DefaultSecondChoice
    Log To Console    🔄 Entering second name choice...
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_2}    10s
    Mobile Click Element    ${NAME_CHOICE_2}
    Mobile Input Text    ${NAME_CHOICE_2}    ${SECOND}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered second name choice: ${SECOND}

Click on the Add Button
    [Documentation]    Click Add button to enable third name choice field for House Namkaran
    ...    Expands form to allow entering name choice 3
    Log To Console    🔄 Clicking Add button for 3rd name choice...
    Mobile Wait Until Element Is Visible   ${AddButton}    10s
    Mobile Click Element    ${AddButton}
    Log To Console    ✅ Clicked Add button - 3rd name choice field enabled

Enter Third name choice
    [Documentation]    Enter third name choice for House Namkaran
    ...    @param THIRD: Third name choice to enter (default: DefaultThirdChoice)
    [Arguments]    ${THIRD}=DefaultThirdChoice
    Log To Console    🔄 Entering third name choice...
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_3}    10s
    Mobile Click Element    ${NAME_CHOICE_3}
    Mobile Input Text    ${NAME_CHOICE_3}    ${THIRD}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered third name choice: ${THIRD}



Select NO Radio Button
    [Documentation]    Selects the NO radio button for multiple name choice question
    Log To Console    🔘 Scrolling to find NO radio button...
    Scroll Until Element Visible    xpath=//android.widget.RadioButton[1]
    Log To Console    🔘 Selecting NO for multiple name choice...
    Mobile Wait Until Element Is Visible    xpath=//android.widget.RadioButton[1]    10s
    Mobile Click Element    xpath=//android.widget.RadioButton[1]
    Log To Console    ✅ Selected NO for multiple name choice
    Sleep    2s

Click on the Submit Button
    Log To Console    🔄 Scrolling to find Submit button...
    Scroll Until Element Visible    ${SubmitButton}
    Log To Console    ⏳ Waiting for Submit button to be visible...
    Mobile Wait Until Element Is Visible   ${SubmitButton}    10s

    # Check if submit button is enabled before clicking
    ${is_enabled}=    Mobile Get Element Attribute    ${SubmitButton}    enabled
    Log To Console    🔍 Submit button enabled status: ${is_enabled}

    Log To Console    👆 Clicking Submit button...
    Mobile Click Element    ${SubmitButton}
    Log To Console    ✅ Clicked Submit button successfully
    Sleep    3s

    # Scroll up slightly to show contact fields area for screenshot
    Log To Console    ⬆️ Scrolling to contact fields area...
    FOR    ${i}    IN RANGE    2
        Mobile Swipe    500    300    500    800    500
        Sleep    0.5s
    END
    Sleep    2s
    Log To Console    ⏳ Waiting for submission to process...

Verify Namkaran Submission Response
    [Documentation]    Verifies if namkaran submission was successful and extracts the Namkaran ID from the Submitted Namkaran list
    Log To Console    🔍 Checking for submission response...

    # Wait for form submission to process (backend may take time)
    Log To Console    ⏳ Waiting for submission to complete (up to 30 seconds)...
    Sleep    5s

    # Self-healing: Wait for the submit button to disappear (indicates form submitted)
    Log To Console    🔍 Waiting for submit button to disappear...
    ${submit_disappeared}=    Run Keyword And Return Status    Wait Until Keyword Succeeds    20s    2s    Mobile Element Should Not Be Visible    ${SubmitButton}

    IF    ${submit_disappeared}
        Log To Console    ✅ Submit button disappeared - form submitted successfully!
    ELSE
        Log To Console    ⚠️ Submit button still visible after 20 seconds - checking for errors
    END

    Sleep    3s

    # After successful submission, app navigates to list page showing submitted namkarans
    # Method 1: Check if we can see Namkaran ID elements in the list (indicates we're on the list page)
    Log To Console    🔍 Looking for Namkaran list page with submitted records...

    # Look for Namkaran ID elements instead of page heading (more reliable)
    ${id_element_found}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//*[contains(@text, 'Namkaran ID') or contains(@content-desc, 'Namkaran ID')]    20s

    IF    ${id_element_found}
        Log To Console    ✅ Successfully navigated to Namkaran list page!
        Sleep    2s

        # Extract Namkaran ID from the first (topmost) record in the list
        # The newest submission appears at the top
        Log To Console    🔍 Extracting Namkaran ID from the first record...

        # Get the first Namkaran ID element (already found above)
        ${id_element_found}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=(//*[contains(@text, 'Namkaran ID') or contains(@content-desc, 'Namkaran ID')])[1]    5s

        IF    ${id_element_found}
            # Try getting text first, then fallback to content-desc
            ${status}    ${id_text}=    Run Keyword And Ignore Error    Mobile Get Element Attribute    xpath=(//*[contains(@text, 'Namkaran ID') or contains(@content-desc, 'Namkaran ID')])[1]    text
            IF    '${status}' == 'FAIL' or '${id_text}' == '${EMPTY}'
                ${id_text}=    Mobile Get Element Attribute    xpath=(//*[contains(@text, 'Namkaran ID') or contains(@content-desc, 'Namkaran ID')])[1]    content-desc
            END
            Log To Console    📝 First record text: ${id_text}

            # Extract the number from "Namkaran ID : 290" or "Namkaran ID: 290"
            ${has_number}=    Run Keyword And Return Status    Should Match Regexp    ${id_text}    \\d+
            IF    ${has_number}
                ${namkaran_id}=    Evaluate    re.search(r'\\d+', '''${id_text}''').group()    re
                Log To Console    ✅ Successfully extracted Namkaran ID: ${namkaran_id}
                Set Test Variable    ${NAMKARAN_ID_FROM_MOBILE}    ${namkaran_id}
                RETURN    ${namkaran_id}
            ELSE
                Log To Console    ⚠️ Could not extract number from: ${id_text}
                RETURN    ${EMPTY}
            END
        ELSE
            Log To Console    ⚠️ Could not find Namkaran ID element in the list
            RETURN    ${EMPTY}
        END
    END

    # Method 2: Check for success popup (fallback - might not exist)
    Log To Console    🔍 Not on Submitted page, checking for success popup...
    ${success_present}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//*[contains(@content-desc, 'successfully') or contains(@content-desc, 'Success') or contains(@content-desc, 'submitted')]    10s

    IF    ${success_present}
        # Try to get the success message element
        ${success_msg}=    Mobile Get Element Attribute    xpath=//*[contains(@content-desc, 'successfully') or contains(@content-desc, 'Success') or contains(@content-desc, 'submitted')]    content-desc
        Log To Console    ✅ SUCCESS MESSAGE FOUND!
        Log To Console    📝 Full success message: ${success_msg}

        # Try to extract Namkaran ID from success message
        # Patterns to look for: "Namkaran ID : 245", "Namkaran ID: 245", "ID : 245", etc.
        ${namkaran_id}=    Set Variable    ${EMPTY}

        # Method 1: Look for "Namkaran ID" (case insensitive)
        ${has_namkaran_id}=    Run Keyword And Return Status    Should Match Regexp    ${success_msg}    (?i)namkaran.*id
        IF    ${has_namkaran_id}
            Log To Console    🔍 Found 'Namkaran ID' pattern in message
            # Split by newlines and find the line with ID
            ${lines}=    Split String    ${success_msg}    \n
            FOR    ${line}    IN    @{lines}
                ${line_upper}=    Convert To Upper Case    ${line}
                ${contains_id}=    Run Keyword And Return Status    Should Contain    ${line_upper}    ID
                IF    ${contains_id}
                    Log To Console    🔍 Checking line: ${line}
                    # Extract number from this line using regex
                    ${match_found}=    Run Keyword And Return Status    Should Match Regexp    ${line}    \\d+
                    IF    ${match_found}
                        ${namkaran_id}=    Evaluate    re.search(r'\\d+', '''${line}''').group()    re
                        Log To Console    ✅ Extracted Namkaran ID: ${namkaran_id}
                        BREAK
                    END
                END
            END
        END

        # Method 2: If Method 1 failed, try extracting any number from the message
        IF    '${namkaran_id}' == '${EMPTY}'
            Log To Console    🔍 Method 1 failed, trying to extract any number from message...
            ${has_number}=    Run Keyword And Return Status    Should Match Regexp    ${success_msg}    \\d+
            IF    ${has_number}
                ${namkaran_id}=    Evaluate    re.search(r'\\d+', '''${success_msg}''').group()    re
                Log To Console    ✅ Extracted ID (any number found): ${namkaran_id}
            END
        END

        # Return the extracted ID or EMPTY
        IF    '${namkaran_id}' != '${EMPTY}'
            Log To Console    📋 Successfully captured Namkaran ID: ${namkaran_id}
            Set Test Variable    ${NAMKARAN_ID_FROM_MOBILE}    ${namkaran_id}
            RETURN    ${namkaran_id}
        ELSE
            Log To Console    ⚠️ Could not extract Namkaran ID from success message
            Log To Console    ⚠️ Message was: ${success_msg}
            RETURN    ${EMPTY}
        END
    ELSE
        # Check for error/validation message
        ${error_present}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//*[contains(@content-desc, 'error') or contains(@content-desc, 'Error') or contains(@content-desc, 'required') or contains(@content-desc, 'invalid') or contains(@content-desc, 'failed') or contains(@content-desc, 'Failed')]    10s

        IF    ${error_present}
            ${error_msg}=    Mobile Get Element Attribute    xpath=//*[contains(@content-desc, 'error') or contains(@content-desc, 'Error') or contains(@content-desc, 'required') or contains(@content-desc, 'invalid') or contains(@content-desc, 'failed') or contains(@content-desc, 'Failed')]    content-desc
            Log To Console    ❌ ERROR/VALIDATION: ${error_msg}
            Fail    Namkaran submission failed with error: ${error_msg}
        ELSE
            # No success or error message found - check if still on form page
            Log To Console    ⚠️ No explicit success or error message found!

            # Check if we're still on the form page (submit might not have worked)
            ${submit_still_visible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${SubmitButton}    3s
            IF    ${submit_still_visible}
                Log To Console    ⚠️ WARNING: Submit button still visible - form may not have been submitted!
                Log To Console    💡 This usually means there's a validation error or the submit didn't register
                Fail    Namkaran submission did not complete - Submit button still visible. Please check form validation.
            ELSE
                Log To Console    ℹ️ Submit button not visible - submission may have completed silently
                Log To Console    ℹ️ Returning empty Namkaran ID - will need to search by email in CMS
                RETURN    ${EMPTY}
            END
        END
    END

Click on Add Namkaran Button
    [Documentation]    Click on Add Namkaran button to create new Namkaran request
    ...    Opens the Namkaran form for creating new submission
    Log To Console    🔄 Clicking Add Namkaran button...
    Mobile Wait Until Element Is Visible   ${ADD_NAMKARAN_BUTTON}     10s
    Mobile Click Element        ${ADD_NAMKARAN_BUTTON}
    Log To Console    ✅ Clicked Add Namkaran button

# ============================================================================
# BUSINESS NAMKARAN KEYWORDS
# ============================================================================

Verify Business Namkaran With Multiple Name Choices
    [Documentation]    Verify Business Namkaran form submission with multiple name choices
    ...    Enters all mandatory fields and two name choices, then submits
    Log To Console    🔄 Filling Business Namkaran with multiple name choices...
    # Mobile Click Element          ${SELF_RADIO}

    Mobile Input Text             ${OWNER_FIRST_NAME}             Aman
    Mobile Input Text             ${OWNER_MIDDLE_NAME}            Kumar
    Mobile Input Text             ${OWNER_LAST_NAME}              Sharma

    Mobile Input Text             ${OWNER_EMAIL}                  aman@example.com
    Mobile Input Text             ${OWNER_PHONE}                  9000000000
    Mobile Input Text             ${BUSINESS_DESC}                Tech consulting firm
    Mobile Input Text             ${FULL_ADDRESS}                 123 Tech Park, Bangalore

    Mobile Click Element          ${YES_MULTIPLE_NAMES}
    Mobile Input Text             ${NAME_CHOICE_1}                DevTech
    Mobile Input Text             ${NAME_CHOICE_2}                InnoWare

    Mobile Click Element          ${SUBMIT_BUTTON}
    Log To Console    ✅ Business Namkaran with multiple name choices submitted

Verify Business Namkaran by entering all mandatory fields for self
    [Documentation]    Verify Business Namkaran form submission with all mandatory fields
    ...    Enters owner details without multiple name choices, then submits
    Log To Console    🔄 Filling Business Namkaran mandatory fields...
    # Mobile Click Element          ${SELF_RADIO}

    Mobile Input Text             ${OWNER_FIRST_NAME}             Aman
    Mobile Input Text             ${OWNER_MIDDLE_NAME}            Kumar
    Mobile Input Text             ${OWNER_LAST_NAME}              Sharma
    Scroll Until Element Visible    ${SubmitButton}
    Mobile Input Text             ${OWNER_EMAIL}                  aman@example.com
    Mobile Input Text             ${OWNER_PHONE}                  9000000000
    Mobile Input Text             ${BUSINESS_DESC}                Tech consulting firm
    Mobile Input Text             ${FULL_ADDRESS}                 123 Tech Park, Bangalore

    Mobile Click Element          ${SUBMIT_BUTTON}
    Log To Console    ✅ Business Namkaran mandatory fields submitted

Select Business Namkaran from category dropdown
    [Documentation]    Select Business Namkaran category from dropdown
    ...    Opens category dropdown and selects Business Namkaran option
    Log To Console    🔄 Selecting Business Namkaran category...
    Mobile Wait Until Element Is Visible   ${CategoryDropdown}    10s
    Mobile Click Element        ${CategoryDropdown}
    Mobile Click Element        ${SelectBusinessNamkaran}
    sleep  5s
    Log To Console    ✅ Selected Business Namkaran category


Enter First Owner First Name
    [Documentation]    Enter first owner's first name for Business Namkaran
    ...    @param FIRST_NAME: First name to enter (default: Aman)
    [Arguments]    ${FIRST_NAME}=Aman
    Log To Console    🔄 Entering first owner's first name...
    Scroll Up Until Element Visible    ${BusinessDetail}
    Mobile Wait Until Element Is Visible   ${FNameInputField}    10s
    Mobile Click Element    ${FNameInputField}
    Mobile Input Text    ${FNameInputField}    ${FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered first owner's first name: ${FIRST_NAME}

Enter First Owner Middle Name
    [Documentation]    Enter first owner's middle name for Business Namkaran
    ...    @param MIDDLE_NAME: Middle name to enter (default: Owner_MN)
    [Arguments]    ${MIDDLE_NAME}=Owner_MN
    Log To Console    🔄 Entering first owner's middle name...
    Scroll Up Until Element Visible    ${BusinessDetail}
    Mobile Wait Until Element Is Visible   ${MNameInputField}    10s
    Mobile Click Element    ${MNameInputField}
    Mobile Input Text    ${MNameInputField}    ${MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered first owner's middle name: ${MIDDLE_NAME}

Enter First Owner Last Name
    [Documentation]    Enter first owner's last name for Business Namkaran
    ...    @param LAST_NAME: Last name to enter (default: Shah)
    [Arguments]    ${LAST_NAME}=Shah
    Log To Console    🔄 Entering first owner's last name...
    Scroll Up Until Element Visible    ${BusinessDetail}
    Mobile Wait Until Element Is Visible   ${LNameInputField}    10s
    Mobile Click Element    ${LNameInputField}
    Mobile Input Text    ${LNameInputField}    ${LAST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered first owner's last name: ${LAST_NAME}



Enter Invalid Email Address for Business Namkaran
    [Documentation]    Enter invalid email format to trigger validation for Business Namkaran
    ...    Enters "aman" without domain to test email validation
    Log To Console    🔄 Entering invalid email for Business Namkaran...
    Scroll Until Element Visible   ${SubmitButton}
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    aman
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ⚠️ Entered invalid email: aman

Clear email upon validation failure for Business Namkaran
    [Documentation]    Clear email field after validation failure for Business Namkaran
    ...    Removes invalid email text to allow re-entry
    Log To Console    🔄 Clearing email field...
    Mobile Wait Until Element Is Visible   ${Clear_email_2}    10s
    Mobile Click Element    ${Clear_email_2}
    Mobile Clear Text       ${Clear_email_2}
    Log To Console    ✅ Cleared email field

Enter Valid Email Address for Business Namkaran
    [Documentation]    Enter valid email address for Business Namkaran
    ...    @param EMAIL: Valid email to enter (default: aman@gmail.com)
    [Arguments]    ${EMAIL}=aman@gmail.com
    Log To Console    🔄 Entering valid email for Business Namkaran...
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    ${EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered valid email: ${EMAIL}

Enter Invalid Owner Phone Number for Business Namkaran
    [Documentation]    Enter invalid phone number to trigger validation for Business Namkaran
    ...    Enters incomplete phone number "966" to test phone validation
    Log To Console    🔄 Entering invalid phone number for Business Namkaran...
    Mobile Wait Until Element Is Visible       xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]     10s
    Mobile Click Element    xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]
    Mobile Input Text    xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]    966
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ⚠️ Entered invalid phone: 966	

Verify email validation message of Business Namkaran
    [Documentation]    Verify validation message for missing email in Business Namkaran
    ...    Expected message: "Please enter email"
    Log To Console    ⚠️ Checking email validation for Business Namkaran...
    Mobile Wait Until Element Is Visible    ${EMAIL_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${EMAIL_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter email
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Phone Number validation message of Business Namkaran
    [Documentation]    Verify validation message for missing phone number in Business Namkaran
    ...    Expected message: "Please enter phone number"
    Log To Console    ⚠️ Checking phone validation for Business Namkaran...
    Mobile Wait Until Element Is Visible    ${PHONE_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${PHONE_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter phone number
    Log To Console    ⚠️ Validation message verified: ${message}

Enter Valid Phone Number for Business Namkaran
    [Documentation]    Enter valid phone number for Business Namkaran
    ...    @param PHONE: Valid phone number to enter (default: 9662595340)
    [Arguments]    ${PHONE}=9662595340
    Log To Console    🔄 Entering valid phone number for Business Namkaran...
    Mobile Wait Until Element Is Visible       xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]     10s
    Mobile Click Element    xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]
    Mobile Input Text    xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]    ${PHONE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered valid phone: ${PHONE}

Verify Validation Message for first owner's first name
    [Documentation]    Verify validation message for missing first owner's first name
    ...    Expected message: "Please enter first owner's first name"
    Log To Console    ⚠️ Checking first owner's first name validation...
    Mobile Wait Until Element Is Visible    ${FirstOwner_FN_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FirstOwner_FN_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter first owner's first name
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Validation Message for first owner's middle name
    [Documentation]    Verify validation message for missing first owner's middle name
    ...    Expected message: "Please enter first owner's middle name"
    Log To Console    ⚠️ Checking first owner's middle name validation...
    Mobile Wait Until Element Is Visible    ${FirstOwner_MN_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FirstOwner_MN_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter first owner's middle name
    Log To Console    ⚠️ Validation message verified: ${message}

Verify Validation Message for first owner's last name
    [Documentation]    Verify validation message for missing first owner's last name
    ...    Expected message: "Please enter first owner's last name"
    Log To Console    ⚠️ Checking first owner's last name validation...
    Mobile Wait Until Element Is Visible    ${FirstOwner_LN_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FirstOwner_LN_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter first owner's last name
    Log To Console    ⚠️ Validation message verified: ${message}

Enter Business Description
    [Documentation]    Enter business description for Business Namkaran
    ...    @param DESCRIPTION: Business description text (default: TechNova Solutions...)
    [Arguments]    ${DESCRIPTION}=TechNova Solutions provides end-to-end software development, cloud services, and IT consulting to help businesses scale efficiently.
    Log To Console    🔄 Entering business description...
    Mobile Wait Until Element Is Visible   ${BUSINESS_DESC}    10s
    Mobile Click Element    ${BUSINESS_DESC}
    Mobile Input Text    ${BUSINESS_DESC}    ${DESCRIPTION}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered business description

Verify Validation Message for Business Description
    [Documentation]    Verify validation message for missing business description
    ...    Expected message: "Please enter business description"
    Log To Console    ⚠️ Checking business description validation...
    Mobile Wait Until Element Is Visible    ${BUSINESS_DESCRIPTION_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${BUSINESS_DESCRIPTION_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter business description
    Log To Console    ⚠️ Validation message verified: ${message}

Enter Business Address
    [Documentation]    Enter business full address for Business Namkaran
    ...    @param ADDRESS: Full business address to enter
    [Arguments]    ${ADDRESS}
    Log To Console    🔄 Entering business address...
    Mobile Wait Until Element Is Visible   ${FULL_ADDRESS}    10s
    Mobile Click Element    ${FULL_ADDRESS}
    Mobile Input Text    ${FULL_ADDRESS}    ${ADDRESS}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered business address: ${ADDRESS}

Verify Validation Message for Business Address
    [Documentation]    Verify validation message for missing business address
    ...    Expected message: "Please enter business address"
    Log To Console    ⚠️ Checking business address validation...
    Mobile Wait Until Element Is Visible    ${BUSINESS_ADDRESS_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${BUSINESS_ADDRESS_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter business address
    Log To Console    ⚠️ Validation message verified: ${message}
# Verify Business Namkaran by entering all mandatory fields for other

    # Mobile Click Element          ${OTHER_RADIO}

#     Mobile Input Text             ${OWNER_FIRST_NAME}             Aman
#     Mobile Input Text             ${OWNER_MIDDLE_NAME}            Kumar
#     Mobile Input Text             ${OWNER_LAST_NAME}              Sharma

#     Mobile Input Text             ${OWNER_EMAIL}                  aman@example.com
#     Mobile Input Text             ${OWNER_PHONE}                  9000000000
#     Mobile Input Text             ${BUSINESS_DESC}                Tech consulting firm
#     Mobile Input Text             ${FULL_ADDRESS}                 123 Tech Park, Bangalore

#     Mobile Click Element          ${SUBMIT_BUTTON}

# ============================================================================
# NAVIGATION HELPER KEYWORDS
# ============================================================================

Navigate to the Namkaran screen
    [Documentation]    Navigate from app launch to Namkaran form screen
    ...    Complete navigation flow: Open App -> Explore -> Namkaran -> Apply -> Agree -> Verify
    Log To Console    🔄 Navigating to Namkaran screen...
    Open Gurutattva App
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen
    Log To Console    ✅ Navigated to Namkaran screen successfully
    

# ============================================================================
# HOUSE NAMKARAN VALIDATION FLOW KEYWORDS
# ============================================================================

Click on Submit button and verify the validation for Owner First Name
    [Documentation]    Submit form and verify Owner First Name validation message
    ...    Expected message: "Please enter first owner's first name"
    Log To Console    🔄 Testing Owner First Name validation...
    Scroll Until Element Visible    ${SubmitButton}
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${FirstOwner_FN_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${FirstOwner_FN_VALIDATION}    content-desc
    Log To Console    ⚠️ Validation message for Owner First Name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter first owner's first name

Click on Submit button and verify the validation for Owner Middle Name
    [Documentation]    Fill first name, submit and verify Owner Middle Name validation
    ...    Expected message: "Please enter first owner's middle name"
    Log To Console    🔄 Testing Owner Middle Name validation...
    Scroll up until Element Visible    xpath=//android.view.View[@content-desc="House Detail"]
    Mobile Click Element    ${FNameInputField}
    Mobile Input Text    ${FNameInputField}    Warish
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Scroll Until Element Visible    ${SubmitButton}
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${FirstOwner_MN_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${FirstOwner_MN_VALIDATION}    content-desc
    Log To Console    ⚠️ Validation message for Owner Middle Name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter first owner's middle name

Click on Submit button and verify the validation for Owner Last Name
    [Documentation]    Fill middle name, submit and verify Owner Last Name validation
    ...    Expected message: "Please enter first owner's last name"
    Log To Console    🔄 Testing Owner Last Name validation...
    Scroll up until Element Visible    xpath=//android.view.View[@content-desc="House Detail"]
    Mobile Click Element    ${MNameInputField}
    Mobile Input Text    ${MNameInputField}    Kumar
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Scroll Until Element Visible    ${SubmitButton}
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${FirstOwner_LN_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${FirstOwner_LN_VALIDATION}    content-desc
    Log To Console    ⚠️ Validation message for Owner Last Name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter first owner's last name

Click on Submit button and verify the validation for Owner Email
    [Documentation]    Fill last name, submit and verify Owner Email validation
    ...    Expected message: "Please enter email"
    Log To Console    🔄 Testing Owner Email validation...
    Scroll up until Element Visible    xpath=//android.view.View[@content-desc="House Detail"]
    Mobile Click Element    ${LNameInputField}
    Mobile Input Text    ${LNameInputField}    Mehta
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Scroll Until Element Visible    ${SubmitButton}
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${EMAIL_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${EMAIL_VALIDATION}    content-desc
    Log To Console    ⚠️ Validation message for Owner Email: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter email

Click on Submit button and verify the validation for Owner Phone Number
    [Documentation]    Fill email, submit and verify Owner Phone Number validation
    ...    Expected message: "Please enter phone number"
    Log To Console    🔄 Testing Owner Phone Number validation...
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    warish@gmail.com
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${PHONE_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${PHONE_VALIDATION}    content-desc
    Log To Console    ⚠️ Validation message for Owner Phone Number: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter phone number

Click on Submit button and verify the validation for Owner house full Address
    [Documentation]    Fill phone number, submit and verify House Address validation
    ...    Expected message: "Please enter house address"
    Log To Console    🔄 Testing Owner House Address validation...
    Mobile Click Element    ${PhoneInputField}
    Mobile Input Text    ${PhoneInputField}    7808689033
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${OwnerAddressErrorMessage}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${OwnerAddressErrorMessage}    content-desc
    Log To Console    ⚠️ Validation message for Owner House Address: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter house address


# ============================================================================
# BRIDE NAMKARAN KEYWORDS
# ============================================================================

Click on the Add Button for Bride Namkaran
    [Documentation]    Click Submit button for Bride Namkaran form
    ...    Submits the bride namkaran form with filled details
    Log To Console    🔄 Clicking Submit button for Bride Namkaran...
    Mobile Wait Until Element Is Visible   ${submitBrideNamkaran}    10s
    Mobile Click Element    ${submitBrideNamkaran}
    Log To Console    ✅ Clicked Submit button for Bride Namkaran

Enter Marraige Place
    [Documentation]    Enter marriage place for Bride Namkaran
    ...    @param MARRIAGE_PLACE: Marriage place to enter (default: DefaultMarriagePlace)
    [Arguments]    ${MARRIAGE_PLACE}=DefaultMarriagePlace
    Log To Console    🔄 Entering marriage place...
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Scroll Until Element Visible    ${MarriageInputfield}
    Mobile Wait Until Element Is Visible   ${MarriageInputfield}    10s
    Mobile Click Element    ${MarriageInputfield}
    Mobile Input Text    ${MarriageInputfield}    ${MARRIAGE_PLACE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Entered marriage place: ${MARRIAGE_PLACE}    
    
# ============================================================================
# TWINS CHILD GENDER SELECTION
# ============================================================================

Select Gender for twins child 1
    [Documentation]    Select gender for first twin child
    ...    Selects Male gender for the first twin
    Log To Console    🔄 Selecting gender for twins child 1...
    Mobile Wait Until Element Is Visible     ${Select_Gender}    10s
    Mobile Click Element     ${Select_Gender}
    Mobile Click Element     ${Gender_Pick}
    Log To Console    ✅ Selected gender for twins child 1: Male

Swipe up and down to see the twins child 1
    [Documentation]    Scroll to view twins child 1 details
    ...    Navigates between Number of Child and Gender fields to verify form
    Log To Console    🔄 Scrolling to view twins child 1 details...
    Scroll Up Until Element Visible            xpath=//android.view.View[@content-desc="Number of Child *"]
    Scroll Until Element Visible               xpath=//android.widget.ImageView[@content-desc="Male"]
    Log To Console    ✅ Twins child 1 details visible

Select Gender for twins child 2
    [Documentation]    Select gender for second twin child
    ...    Selects Male gender for the second twin
    Log To Console    🔄 Selecting gender for twins child 2...
    Scroll Until Element Visible      ${SubmitButton}
    Mobile Wait Until Element Is Visible     ${Select_Gender}    10s
    Mobile Click Element     ${Select_Gender}
    Mobile Click Element     ${Gender_Pick}
    Log To Console    ✅ Selected gender for twins child 2: Male

# ============================================================================
# NAVIGATION BUTTONS
# ============================================================================

Click on the Back Button from Namkaran Form
    [Documentation]    Click back button to exit from Namkaran form
    ...    Returns to previous screen from the form
    Log To Console    🔄 Clicking back button from Namkaran form...
    Mobile Wait Until Element Is Visible   xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView    10s
    Mobile Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView
    Log To Console    ✅ Clicked back button from Namkaran form

Click on the Back Button from Namkaran Screen
    [Documentation]    Click back button to exit from Namkaran screen
    ...    Returns to previous screen from Namkaran main screen
    Log To Console    🔄 Clicking back button from Namkaran screen...
    Mobile Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
    Log To Console    ✅ Clicked back button from Namkaran screen

# ============================================================================
# UTILITY KEYWORDS
# ============================================================================

Clear email upon validation failure for House Namkaran
    [Documentation]    Clear email field after validation failure for House Namkaran
    ...    Removes invalid email text "warish.com" to allow re-entry
    Log To Console    🔄 Clearing email field for House Namkaran...
    Mobile Wait Until Element Is Visible   xpath=//android.widget.EditText[@text="warish.com"]    10s
    Mobile Click Element    xpath=//android.widget.EditText[@text="warish.com"]
    Mobile Clear Text       xpath=//android.widget.EditText[@text="warish.com"]
    Log To Console    ✅ Cleared email field    
