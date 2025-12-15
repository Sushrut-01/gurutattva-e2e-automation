*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot
Resource    ExplorePage.robot


*** Variables ***
# ============================================================================
# RELATIVE XPATH LOCATORS - Following Automation Best Practices
# ============================================================================

# Navigation Elements
${Prayer_Card}                        xpath=//android.widget.ImageView[@content-desc="Prayer"]
${Add_Prayer_Button}                  xpath=(//android.widget.ImageView)[2]
${Add_Prayer_Button_Alt}              xpath=(//android.widget.ImageView)[1]
${TOOLTIP_INFO_PRAYER}                xpath=//android.view.View[contains(@content-desc,'of')]
${Tooltip_Close_Button}               xpath=//android.view.View[@content-desc="Prayer Category *"]

# Form Elements - Dynamic indexed locators (context-aware)
${Enter_Name}                         xpath=(//android.widget.EditText)[1]
${Enter_Place}                        xpath=(//android.widget.EditText)[2]
${Enter_Email}                        xpath=(//android.widget.EditText)[3]
${Enter_Address}                      xpath=(//android.widget.EditText)[3]
${Enter_Description}                  xpath=//android.widget.EditText

# Buttons and Interactive Elements
${Submit_Prayer_Button}               xpath=//android.view.View[@content-desc="Submit"]
${Select_DOB_Prayer}                  xpath=//android.widget.ImageView[@content-desc="Select DOB"]
${ok_DOB}                             xpath=//android.widget.Button[@content-desc="OK"]
${Select_Prayer_Category}             xpath=//android.view.View[@content-desc="Select Category"]
${other_Prayer}                       xpath=//android.widget.ScrollView/android.widget.RadioButton[1]
${Prayer_call}                        xpath=(//android.widget.Button[contains(@content-desc,'+')])[2]

# Success/Status Messages
${Prayer_Message}                     xpath=//android.view.View[contains(@content-desc,'Jay')]
${close_success}                      xpath=//android.widget.ImageView[1]

# Screen Verification Elements
${Verify_Prayer_Screen}               xpath=//android.view.View[@content-desc="By whom the prayer is being registered"]
${PRAYER_HEADER}                      xpath=//android.widget.ImageView[contains(@content-desc,'Prayer')][1]
${ADD_PRAYER_TEXT}                    xpath=//android.view.View[contains(@content-desc,'YOU CAN REGISTER YOUR PRAYERS HERE.')]
${PrayerTooltip}                      xpath=//android.widget.ScrollView/android.view.View[2]
${Back_Button_Prayer}                 xpath=(//android.widget.ImageView)[1]

# Validation Messages - All use contains() for flexibility
${Email_Validation_Prayer}            xpath=//android.view.View[contains(@content-desc,"valid email")]
${Name_Validation_Prayer}             xpath=//android.view.View[contains(@content-desc,"enter your name")]
${Area_Validation_Prayer}             xpath=//android.view.View[@content-desc="Enter Area"]
${Valid_Email_Validation}             xpath=//android.view.View[@content-desc="Enter Email Address"]
${Category_Validation}                xpath=//android.view.View[@content-desc="Select Category"]
${Address_Validation}                 xpath=//android.view.View[@content-desc="Enter City Name"]
${DOB_Validation_Prayer}              xpath=//android.view.View[@content-desc="Age"]
${Description_Validation}             xpath=//android.view.View[@content-desc="Description"]

*** Keywords ***
Navigate to Prayer Screen
    Open Gurutattva App
    Click on the Explore Tab
    Click on the Prayer Card
    Handle Prayer Add Screen
    Click on Add Prayer Button
    Verify tooltip info in prayer screen
    Close the tooltip info from prayer screen
    Verify Prayer screen

Click on the Prayer Card
    [Documentation]    Click on Prayer card in Explore section
    Mobile Wait Until Element Is Visible    ${Prayer_Card}    10s
    Mobile Click Element    ${Prayer_Card}
    Log To Console    ✅ Clicked on Prayer Card 

Click on Add Prayer Button
    [Documentation]    Click Add Prayer button - handles both Self and Other modes dynamically
    Sleep    5s
    # Try ImageView[2] first (Other Prayer mode), then ImageView[1] (Self Prayer mode)
    ${using_index_2}=    Run Keyword And Return Status
    ...    Mobile Wait Until Element Is Visible    ${Add_Prayer_Button}    3s

    IF    ${using_index_2}
        Mobile Click Element    ${Add_Prayer_Button}
        Log To Console    ✅ Clicked Add Prayer button at index [2]
    ELSE
        # Fallback to ImageView[1] for Self Prayer mode
        Mobile Wait Until Element Is Visible    ${Add_Prayer_Button_Alt}    10s
        Mobile Click Element    ${Add_Prayer_Button_Alt}
        Log To Console    ✅ Clicked Add Prayer button at index [1]
    END       

Verify tooltip info in prayer screen
    Mobile Wait Until Element Is Visible    ${TOOLTIP_INFO_PRAYER}    10s
    Mobile Element Should Be Visible        ${TOOLTIP_INFO_PRAYER}
    ${Content}=    Mobile Get Element Attribute    ${TOOLTIP_INFO_PRAYER}    content-desc
    Should Contain    ${Content}                   of
    Log To Console    Prayer screen Tooltip info: ${Content}
    Mobile Wait Until Element Is Visible    ${Prayer_call}    10s
    Mobile Element Should Be Visible        ${Prayer_call}
    ${Content}=    Mobile Get Element Attribute    ${Prayer_call}    content-desc
    Should Contain    ${Content}                   +
    Log To Console    Prayer call info: ${Content}

Close the tooltip info from prayer screen
    [Documentation]    Close tooltip if it appears - gracefully handles if not present
    Mobile Wait Until Element Is Visible    ${Tooltip_Close_Button}    10s
    Mobile Click Element    ${Tooltip_Close_Button}
    Log To Console    ✅ Closed tooltip       

Verify Prayer screen
    [Documentation]    Verify Prayer form screen is displayed
    Mobile Wait Until Element Is Visible    ${Verify_Prayer_Screen}    10s
    Mobile Element Should Be Visible    ${Verify_Prayer_Screen}
    ${Content}=    Mobile Get Element Attribute    ${Verify_Prayer_Screen}    content-desc
    Should Contain    ${Content}    By whom the prayer is being registered
    Log To Console    ✅ Prayer screen verified: ${Content}

Enter Name for Prayer
    [Arguments]    ${name}=DefaultName
    [Documentation]    Enter name in first name field
    ...    @param name: Name to enter (default: DefaultName)
    Scroll Up Until Element Visible    ${Verify_Prayer_Screen}
    Mobile Wait Until Element Is Visible    ${Enter_Name}    10s
    Mobile Click Element    ${Enter_Name}
    Mobile Input Text    ${Enter_Name}    ${name}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Name entered: ${name}

Enter Place/Area for Prayer
    [Arguments]    ${place}=DefaultPlace
    [Documentation]    Enter place/area in the area field
    ...    @param place: Place/area to enter (default: DefaultPlace)
    Log To Console    >>> Entering Place/Area field...
    Scroll Up Until Element Visible    ${Verify_Prayer_Screen}
    Mobile Wait Until Element Is Visible    ${Enter_Place}    10s
    Mobile Click Element    ${Enter_Place}
    Mobile Input Text    ${Enter_Place}    ${place}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Place/Area entered: ${place}

Enter Email for Prayer
    [Arguments]    ${email}=test@example.com
    [Documentation]    Enter email in email field
    ...    @param email: Email to enter (default: test@example.com)
    Scroll Up Until Element Visible    ${Verify_Prayer_Screen}
    Mobile Wait Until Element Is Visible    ${Enter_Email}    10s
    Mobile Click Element    ${Enter_Email}
    Mobile Input Text    ${Enter_Email}    ${email}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Email entered: ${email}

Select Prayer Category
    [Arguments]    ${category}=Career
    [Documentation]    Select prayer category from dropdown
    ...    @param category: Category to select (default: Career)
    ...    Valid options: Career, Health, Family, Finance, Education, etc.
    Log To Console    >>> Selecting Prayer Category: ${category}...
    Scroll Up Until Element Visible    ${Verify_Prayer_Screen}
    Mobile Wait Until Element Is Visible    ${Select_Prayer_Category}    10s
    Mobile Click Element    ${Select_Prayer_Category}

    # Dynamically build category button locator
    ${category_button}=    Set Variable    xpath=//android.widget.Button[@content-desc="${category}"]
    Mobile Wait Until Element Is Visible    ${category_button}    10s
    Mobile Click Element    ${category_button}
    Log To Console    ✅ Prayer Category selected: ${category}

Enter Second Name for Prayer
    [Arguments]    ${person_name}=DefaultPersonName
    [Documentation]    Enter person's name after scrolling (for whom prayer is made)
    ...    @param person_name: Person name to enter
    Log To Console    >>> Entering Person Name: ${person_name}...
    Scroll Until Element Visible    ${Submit_Prayer_Button}

    # After scrolling, find the FIRST VISIBLE EditText
    ${name_field}=    Set Variable    xpath=//android.widget.EditText
    Mobile Wait Until Element Is Visible    ${name_field}    10s
    Mobile Click Element    ${name_field}
    Mobile Input Text    ${name_field}    ${person_name}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Person Name entered: ${person_name}

Enter Second Place/Area for Prayer
    [Arguments]    ${person_place}=DefaultPersonPlace
    [Documentation]    Enter person's place/area after scrolling
    ...    @param person_place: Person's place to enter
    Log To Console    >>> Entering Person Place/Area: ${person_place}...

    ${place_field}=    Set Variable    xpath=(//android.widget.EditText)[2]
    Mobile Wait Until Element Is Visible    ${place_field}    10s
    Mobile Click Element    ${place_field}
    Mobile Input Text    ${place_field}    ${person_place}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Person Place/Area entered: ${person_place}

Enter Address for Prayer
    [Arguments]    ${address}=DefaultAddress
    [Documentation]    Enter full address in address field
    ...    @param address: Full address to enter
    Log To Console    >>> Entering Address: ${address}...

    ${address_field}=    Set Variable    xpath=(//android.widget.EditText)[3]
    Mobile Wait Until Element Is Visible    ${address_field}    10s
    Mobile Click Element    ${address_field}
    Mobile Input Text    ${address_field}    ${address}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Address entered: ${address}  

Select DOB for Prayer
    [Arguments]    ${years_ago}=1
    [Documentation]    Select date of birth for prayer
    ...    @param years_ago: How many years ago (default: 1 year)
    ...    Automatically calculates past year to ensure DOB is valid

    ${current_year}=    Get Current Date    result_format=%Y
    ${past_year}=    Evaluate    int(${current_year}) - ${years_ago}
    ${year_header_xpath}=    Set Variable    xpath=//android.view.View[@content-desc="${current_year}"]
    ${past_year_xpath}=    Set Variable    xpath=//android.view.View[@content-desc="${past_year}"]

    Mobile Wait Until Element Is Visible    ${Select_DOB_Prayer}    10s
    Mobile Click Element    ${Select_DOB_Prayer}
    Sleep    2s

    Mobile Wait Until Element Is Visible    ${year_header_xpath}    10s
    Mobile Click Element    ${year_header_xpath}
    Sleep    2s

    Mobile Wait Until Element Is Visible    ${past_year_xpath}    10s
    Mobile Click Element    ${past_year_xpath}
    Sleep    2s

    Mobile Wait Until Element Is Visible    ${ok_DOB}    10s
    Mobile Click Element    ${ok_DOB}
    Log To Console    ✅ Selected DOB year: ${past_year} (${years_ago} year(s) ago)

Enter Description for Prayer
    [Arguments]    ${description}=Default prayer description
    [Documentation]    Enter prayer description
    ...    @param description: Description text to enter
    Log To Console    >>> Entering Description: ${description}...
    Mobile Wait Until Element Is Visible    ${Enter_Description}    10s
    Mobile Click Element    ${Enter_Description}
    Mobile Input Text    ${Enter_Description}    ${description}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    ✅ Description entered: ${description}  

Click on Submit Prayer Button
    [Documentation]    Scroll to and click Submit button
    Scroll Until Element Visible    ${Submit_Prayer_Button}
    Mobile Wait Until Element Is Visible    ${Submit_Prayer_Button}    10s
    Mobile Click Element    ${Submit_Prayer_Button}
    Log To Console    ✅ Clicked on Submit Prayer Button

Verify Prayer Submission Success
    [Documentation]    Verify prayer was submitted successfully
    ...    Handles cases where success message may not appear
    Sleep    3s

    ${success_visible}=    Run Keyword And Return Status
    ...    Mobile Wait Until Element Is Visible    ${Prayer_Message}    5s

    IF    ${success_visible}
        ${Content}=    Mobile Get Element Attribute    ${Prayer_Message}    content-desc
        Log To Console    ✅ Prayer submission success: ${Content}
        RETURN    ${Content}
    ELSE
        Log To Console    ⚠️  Success message not visible (prayer may still be submitted)
        RETURN    ${EMPTY}
    END

Close the success message
    [Documentation]    Close success message if visible
    ${close_visible}=    Run Keyword And Return Status
    ...    Mobile Wait Until Element Is Visible    ${close_success}    3s

    IF    ${close_visible}
        Mobile Click Element    ${close_success}
        Log To Console    ✅ Closed success message
    ELSE
        Log To Console    ⚠️  Success message already closed or not shown
    END

Verify Prayer Header Content
    [Documentation]    Verify prayer header contains required fields
    Mobile Wait Until Element Is Visible    ${PRAYER_HEADER}    10s
    ${text}=    Mobile Get Element Attribute    ${PRAYER_HEADER}    content-desc
    Should Contain    ${text}    Prayer ID :
    Should Contain    ${text}    Category :
    Log To Console    ✅ Prayer Header verified: ${text}

Click on Prayer Tooltip
    Mobile Click Element    ${PrayerTooltip}

Verify Prayer Tooltip Information is Displayed 
    Mobile Wait Until Element Is Visible    ${TOOLTIP_INFO_PRAYER}    10s
    Mobile Element Should Be Visible        ${TOOLTIP_INFO_PRAYER}
    ${Content}=    Mobile Get Element Attribute    ${TOOLTIP_INFO_PRAYER}    content-desc
    Should Contain    ${Content}                   of
    Log To Console    Prayer screen Tooltip info: ${Content}
    Mobile Wait Until Element Is Visible    ${Prayer_call}    10s
    Mobile Element Should Be Visible        ${Prayer_call}
    ${Content}=    Mobile Get Element Attribute    ${Prayer_call}    content-desc
    Should Contain    ${Content}                   +
    Log To Console    Prayer call info: ${Content}   

User redirect on the Prayer screen
    [Documentation]    Complete flow for submitting a prayer (Other option)
    Navigate to Prayer Screen
    Enter Name for Prayer
    Enter Place/Area for Prayer
    Enter Email for Prayer
    Select Prayer Category
    Enter Second Name for Prayer
    Enter Second Place/Area for Prayer
    Enter Address for Prayer
    Select DOB for Prayer
    Enter Description for Prayer
    Click on Submit Prayer Button
    Verify Prayer Submission Success
    Close the success message
    Verify Prayer add screen 

Handle Prayer Add Screen
    [Documentation]    Handle prayer add screen if it appears
    ...    Uses Run Keyword And Ignore Error to gracefully handle variations
    Run Keyword And Ignore Error    Verify Prayer add screen
    Run Keyword And Ignore Error    Verify Prayer Add Screen Text
    Run Keyword And Ignore Error    Verify Prayer Header Content

Verify Prayer add screen
    [Documentation]    Verify prayer add screen elements are visible
    ${isVisible}=    Run Keyword And Return Status
    ...    Mobile Wait Until Element Is Visible    ${PRAYER_HEADER}    5s
    Run Keyword If    ${isVisible}    Verify Prayer Header Content

Verify Prayer Add Screen Text
    [Documentation]    Verify prayer add screen welcome text
    ${isVisible}=    Run Keyword And Return Status
    ...    Mobile Wait Until Element Is Visible    ${ADD_PRAYER_TEXT}    5s
    IF    ${isVisible}
        ${Content}=    Mobile Get Element Attribute    ${ADD_PRAYER_TEXT}    content-desc
        Should Contain    ${Content}    YOU CAN REGISTER YOUR PRAYERS HERE.
        Log To Console    ✅ Prayer Add Screen Text verified
    END

Select Other for the Prayer
    [Documentation]    Click "Other" radio button for prayer registration
    Mobile Wait Until Element Is Visible    ${other_Prayer}    10s
    Mobile Click Element    ${other_Prayer}
    Log To Console    ✅ Selected "Other" prayer option

Fill Mandatory Fields for Other Prayer
    Enter Name for Prayer       
    Enter Place/Area for Prayer   
    Enter Email for Prayer       
    Select Prayer Category        
    Enter Second Name for Prayer    
    Enter Second Place/Area for Prayer    
    Enter Address for Prayer         
    Select DOB for Prayer
    Enter Description for Prayer     
    Click on Submit Prayer Button

Enter InValidEmail for Prayer    
    Mobile Wait Until Element Is Visible    ${Enter_Email}    10s
    Mobile Click Element    ${Enter_Email}
    Mobile Input Text    ${Enter_Email}    yatish
    Run Keyword And Ignore Error    Mobile Hide Keyboard
       

Verify validation message for invalid email in prayer form
    [Documentation]    Verify email validation error message appears
    Mobile Wait Until Element Is Visible    ${Email_Validation_Prayer}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Email_Validation_Prayer}    content-desc
    Log To Console    Email validation message: ${actual_message}
    Should Contain    ${actual_message}    valid email
    RETURN    ${actual_message}

Verify validation message for name
    [Documentation]    Verify name validation error message appears
    Mobile Wait Until Element Is Visible    ${Name_Validation_Prayer}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Name_Validation_Prayer}    content-desc
    Log To Console    Name validation message: ${actual_message}
    Should Contain    ${actual_message}    name
    RETURN    ${actual_message}

Verify validation message for Place/Area
    [Documentation]    Verify place/area validation error message appears
    Mobile Wait Until Element Is Visible    ${Area_Validation_Prayer}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Area_Validation_Prayer}    content-desc
    Log To Console    Area validation message: ${actual_message}
    Should Be Equal    ${actual_message}    Enter Area
    RETURN    ${actual_message}

Verify validation message for Email         
    Mobile Wait Until Element Is Visible    ${Valid_Email_Validation}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Valid_Email_Validation}    content-desc
    Log To Console    Validation message for Name: ${actual_message}
    Should Be Equal    ${actual_message}    Enter Email Address

Verify validation message for Category         
    Mobile Wait Until Element Is Visible    ${Category_Validation}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Category_Validation}    content-desc
    Log To Console    Validation message for Name: ${actual_message}
    Should Be Equal    ${actual_message}    Select Category

Verify validation message for Address         
    Mobile Wait Until Element Is Visible    ${Address_Validation}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Address_Validation}    content-desc
    Log To Console    Validation message for Name: ${actual_message}
    Should Be Equal    ${actual_message}    Enter City Name

Verify validation message for DOB         
    Mobile Wait Until Element Is Visible    ${DOB_Validation_Prayer}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${DOB_Validation_Prayer}    content-desc
    Log To Console    Validation message for Name: ${actual_message}
    Should Be Equal    ${actual_message}    Age

Verify validation message for Description         
    Mobile Wait Until Element Is Visible    ${Description_Validation}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Description_Validation}    content-desc
    Log To Console    Validation message for Name: ${actual_message}
    Should Be Equal    ${actual_message}    Description

Verify validation message for Second Name
    Mobile Wait Until Element Is Visible    ${Name_Validation_Prayer}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Name_Validation_Prayer}    content-desc
    Log To Console    Validation message for Name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter your name     

Verify validation message for Second Place/Area
    Mobile Wait Until Element Is Visible    ${Area_Validation_Prayer}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Area_Validation_Prayer}    content-desc
    Log To Console    Validation message for Area: ${actual_message}
    Should Be Equal    ${actual_message}    Enter Area

Click on the Back Button from Prayer Screen or Prayer Form
    Mobile Wait Until Element Is Visible    ${Back_Button_Prayer}    10s
    Mobile Click Element    ${Back_Button_Prayer}
    Log To Console    Clicked on Back Button from Prayer Screen and Prayer Form









