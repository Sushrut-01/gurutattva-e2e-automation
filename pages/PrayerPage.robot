*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot
Resource    ExplorePage.robot


*** Variables ***
${Prayer_Card}                        xpath=//android.widget.ImageView[@content-desc="Prayer"]
${Add_Prayer_Button}                  xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2]
${TOOLTIP_INFO_PRAYER}                xpath=//android.view.View[contains(@content-desc,'of')]
${Verify_Prayer_Screen}               xpath=//android.view.View[@content-desc="By whom the prayer is being registered"]
${PrayerTooltip}                      xpath=//android.widget.ScrollView/android.view.View[2]
${Prayer_call}                        xpath=(//android.widget.Button[contains(@content-desc,'+')])[2]
${Name_P}                             xpath=//android.widget.EditText[contains(@text,'yatish  ')]
${Enter_Name}                         xpath=//android.widget.EditText[@hint="Enter Name"]
${Enter_Place}                        xpath=//android.widget.EditText[@hint="Enter Area"]
${Enter_Email}                        xpath=//android.widget.EditText[@hint="Enter Email Address"][1]
${Select_Prayer_Category}             xpath=//android.view.View[@content-desc="Select Category"]
${Pick_Prayer_Category}               xpath=//android.widget.Button[@content-desc="Career"]
${Enter_Address}                      xpath=//android.widget.EditText[@hint="Enter Full Address"]
${Select_DOB_Prayer}                  xpath=//android.widget.ImageView[@content-desc="Select DOB"]
${ok_DOB}                             xpath=//android.widget.Button[@content-desc="OK"]
${Enter_Description}                  xpath=//android.widget.EditText[@hint="Enter Text Here"]
${Submit_Prayer_Button}               xpath=//android.view.View[@content-desc="Submit"]
${Prayer_Message}                     xpath=//android.view.View[contains(@content-desc,'Jay Aatmeshwar!')]
${Email_TEXT}                         xpath=//android.widget.EditText[@text="yatish.devlekar@rysun.com"]
${close_success}                      xpath=//android.widget.ImageView[1]
${PRAYER_HEADER}                      xpath=//android.widget.ImageView[contains(@content-desc,'Prayer')][1]
${other_Prayer}                       xpath=//android.widget.ScrollView/android.widget.RadioButton[1]
${Email_Validation_Prayer}            xpath=//android.view.View[@content-desc="Please enter a valid email address"]
${Name_Validation_Prayer}             xpath=//android.view.View[@content-desc="Please enter your name"]
${Area_Validation_Prayer}             xpath=//android.view.View[@content-desc="Enter Area"]
${Valid_Email_Validation}             xpath=//android.view.View[@content-desc="Enter Email Address"]
${Category_Validation}                xpath=//android.view.View[@content-desc="Select Category"]
${Address_Validation}                 xpath=//android.view.View[@content-desc="Enter City Name"]
${DOB_Validation_Prayer}              xpath=//android.view.View[@content-desc="Age"]
${Description_Validation}             xpath=//android.view.View[@content-desc="Description"]
${Back_Button_Prayer}                 xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
${ADD_PRAYER_TEXT}                    xpath=//android.view.View[contains(@content-desc,'YOU CAN REGISTER YOUR PRAYERS HERE.')]

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
    Mobile Wait Until Element Is Visible    ${Prayer_Card}    10s
    Mobile Click Element    ${Prayer_Card} 

Click on Add Prayer Button
    Sleep       5s
    Mobile Wait Until Element Is Visible    ${Add_Prayer_Button}    10s
    Mobile Click Element    ${Add_Prayer_Button}       

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
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Prayer Category *"]    10s
    Mobile Click Element    xpath=//android.view.View[@content-desc="Prayer Category *"]       

Verify Prayer screen
    Mobile Wait Until Element Is Visible    ${Verify_Prayer_Screen}    10s
    Mobile Element Should Be Visible        ${Verify_Prayer_Screen}
    ${Content}=    Mobile Get Element Attribute    ${Verify_Prayer_Screen}    content-desc
    Should Contain    ${Content}             By whom the prayer is being registered
    Log To Console    Prayer screen content: ${Content}

Clear Name and Email Field
    Clear Name Field    ${Name_P}
    Clear Name Field    ${Email_TEXT}
    Mobile Hide Keyboard

Enter Name for Prayer
    Scroll Up Until Element Visible    ${Verify_Prayer_Screen}
    Mobile Wait Until Element Is Visible    ${Enter_Name}    10s
    Mobile Click Element    ${Enter_Name}
    Mobile Input Text    ${Enter_Name}    Name
    Mobile Hide Keyboard

Enter Place/Area for Prayer
    Scroll Up Until Element Visible    ${Verify_Prayer_Screen}
    Mobile Wait Until Element Is Visible    ${Enter_Place}    10s
    Mobile Click Element    ${Enter_Place}
    Mobile Input Text    ${Enter_Place}    Place
    Mobile Hide Keyboard
    
Enter Email for Prayer
    Scroll Up Until Element Visible    ${Verify_Prayer_Screen}
    Mobile Wait Until Element Is Visible    ${Enter_Email}    10s
    Mobile Click Element    ${Enter_Email}
    Mobile Input Text    ${Enter_Email}    yatish.devlekar@rysun.com
    Mobile Hide Keyboard

Select Prayer Category
    Scroll Up Until Element Visible    ${Verify_Prayer_Screen}
    Mobile Wait Until Element Is Visible    ${Select_Prayer_Category}    10s
    Mobile Click Element    ${Select_Prayer_Category}
    Mobile Wait Until Element Is Visible    ${Pick_Prayer_Category}    10s
    Mobile Click Element    ${Pick_Prayer_Category}

Enter Second Name for Prayer
    Scroll Until Element Visible     ${Submit_Prayer_Button}
    Mobile Wait Until Element Is Visible    ${Enter_Name}    10s
    Mobile Click Element    ${Enter_Name}
    Mobile Input Text    ${Enter_Name}   second_name
    Mobile Hide Keyboard    
    
Enter Second Place/Area for Prayer
    Mobile Wait Until Element Is Visible    ${Enter_Place}    10s
    Mobile Click Element    ${Enter_Place}
    Mobile Input Text    ${Enter_Place}   second_place
    Mobile Hide Keyboard

Enter Address for Prayer
    Mobile Wait Until Element Is Visible    ${Enter_Address}    10s
    Mobile Click Element    ${Enter_Address}
    Mobile Input Text    ${Enter_Address}    Gujarat University
    Mobile Hide Keyboard  

Select DOB for Prayer
    # Calculate a past year dynamically (1 year ago to ensure it's in the past)
    ${current_year}=    Get Current Date    result_format=%Y
    ${past_year}=    Evaluate    int(${current_year}) - 1
    ${year_header_xpath}=    Set Variable    xpath=//android.view.View[@content-desc="${current_year}"]
    ${past_year_xpath}=    Set Variable    xpath=//android.view.View[@content-desc="${past_year}"]

    # Open date picker
    Mobile Wait Until Element Is Visible    ${Select_DOB_Prayer}    10s
    Mobile Click Element    ${Select_DOB_Prayer}
    Sleep    2s

    # Click on the year header to switch to year selection mode
    Mobile Wait Until Element Is Visible    ${year_header_xpath}    10s
    Mobile Click Element    ${year_header_xpath}
    Sleep    2s

    # Select past year to ensure DOB is in the past
    Mobile Wait Until Element Is Visible    ${past_year_xpath}    10s
    Mobile Click Element    ${past_year_xpath}
    Sleep    2s

    # Confirm selection
    Mobile Wait Until Element Is Visible    ${ok_DOB}    10s
    Mobile Click Element    ${ok_DOB}
    Log To Console    ✅ Selected DOB year: ${past_year} (Past date validated)
    
Enter Description for Prayer
    Mobile Wait Until Element Is Visible    ${Enter_Description}    10s
    Mobile Click Element  ${Enter_Description}
    Mobile Input Text    ${Enter_Description}    OM NAMAY SHIVAY
    Mobile Hide Keyboard  

Click on Submit Prayer Button
    Scroll Until Element Visible    ${Submit_Prayer_Button}
    Mobile Wait Until Element Is Visible    ${Submit_Prayer_Button}    10s
    Mobile Click Element    ${Submit_Prayer_Button}
    Log To Console    Clicked on Submit Prayer Button

Verify Prayer Submission Success
    Mobile Wait Until Element Is Visible    ${Prayer_Message}    10s
    Mobile Element Should Be Visible    ${Prayer_Message}
    ${Content}=    Mobile Get Element Attribute    ${Prayer_Message}    content-desc
    Should Contain    ${Content}        Jay Aatmeshwar!
    Log To Console    Prayer submission success message: ${Content}

Close the success message
    Mobile Click Element    ${close_success}
    Log To Console    Closed the success message

Verify Prayer Header Content 
    Mobile Wait Until Element Is Visible   ${PRAYER_HEADER}     10s
    ${text}=    Mobile Get Element Attribute   ${PRAYER_HEADER}    content-desc
    Should Contain    ${text}    Prayer ID :
    Should Contain    ${text}    Category :
    Log To Console    Prayer Header content: ${text}

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
    Navigate to Prayer Screen
    Clear Name and Email Field
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
    Run Keyword And Ignore Error             Verify Prayer add screen
    Run Keyword And Ignore Error             Verify Prayer Add Screen Text
    Run Keyword And Ignore Error             Verify Prayer Header Content

Verify Prayer add screen
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${PRAYER_HEADER}    10s
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${ADD_PRAYER_TEXT}    10s
    Run Keyword If    ${isVisible}    Verify Prayer Header Content
    Run Keyword If    ${isVisible}    Verify Prayer Add Screen Text

Verify Prayer Add Screen Text
    Mobile Wait Until Element Is Visible    ${ADD_PRAYER_TEXT}    10s
    ${Content}=    Mobile Get Element Attribute    ${ADD_PRAYER_TEXT}    content-desc
    Should Contain    ${Content}    YOU CAN REGISTER YOUR PRAYERS HERE.
    Log To Console    Prayer Add Screen Text: ${Content}

Select Other for the Prayer
    Mobile Wait Until Element Is Visible    ${other_Prayer}    10s
    Mobile Click Element    ${other_Prayer}

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
    Mobile Hide Keyboard
       

Verify validation message for invalid email in prayer form
    Mobile Wait Until Element Is Visible    ${Email_Validation_Prayer}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Email_Validation_Prayer}    content-desc
    Log To Console    Validation message for Invalid Email: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter a valid email address 

Verify validation message for name         
    Mobile Wait Until Element Is Visible    ${Name_Validation_Prayer}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Name_Validation_Prayer}    content-desc
    Log To Console    Validation message for Name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter your name

Verify validation message for Place/Area         
    Mobile Wait Until Element Is Visible    ${Area_Validation_Prayer}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${Area_Validation_Prayer}    content-desc
    Log To Console    Validation message for Area: ${actual_message}
    Should Be Equal    ${actual_message}    Enter Area

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









