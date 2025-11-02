*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot
Resource    ExplorePage.robot


*** Variables ***
${EXPLORE_MENU}                    xpath=//android.widget.ImageView[3]
${NAMKARAN_HEADER}                 xpath=//android.view.View[@content-desc="Namkaran"]
${NAMKARAN_MENU}                   xpath=//android.widget.ImageView[@content-desc="Namkaran"]
${NAMKARAN_CONTENT}                xpath=//android.widget.ScrollView/android.view.View[1]
${APPLY_NOW_BUTTON}                xpath=//android.view.View[@content-desc="Apply Now"]	
${IAGREE_BUTTON}                   xpath=//android.view.View[@content-desc="I Agree"]
${CANCEL_BUTTON}                   xpath=//android.view.View[@content-desc="Cancel"]
${CONFIRMATION_MESSAGE}            xpath=//android.view.View[@content-desc="Do you agree to all the terms ?"]
${successMessage}                  xpath=//android.view.View[@content-desc="Namkaran Submitted successfully"]
${SelectOtherNamkaran}             xpath=//android.widget.ScrollView/android.widget.RadioButton[1]
${CategoryDropdown}                xpath=//android.widget.Button[@content-desc="Bride Namkaran"]
${BrideNamkaran}                   xpath=//android.widget.Button[@content-desc="Bride Namkaran"]
${FNameInputField}                 xpath=//android.widget.EditText[@hint='Enter First Name'][1]
${MNameInputField}                 xpath=//android.widget.EditText[@hint='Enter Middle Name'][1]
${LNameInputField}                 xpath=//android.widget.EditText[@hint='Enter Last Name'][1]
${EmailInputField}                 xpath=//android.widget.EditText[@hint='Enter Email']
${SelectMarriageDateField}         xpath=//android.widget.ImageView[@content-desc="Select Marriage Date"]
${SelectYrs}                       xpath=//android.view.View[@content-desc="2025"]
${Select2019}                      xpath=//android.view.View[@content-desc="2019"]
${SelectDay}                       xpath=//android.view.View[contains(@content-desc, "June 19, 2025")]
${SelectOK}                        xpath=//android.widget.Button[@content-desc="OK"]
${MarriageInputfield}              xpath=//android.widget.EditText[@hint='Enter Marriage Place']
${Invalid_email}                   xpath=//android.view.View[@content-desc="Please enter valid email"]  
${Invalid_mobile}                  xpath=//android.view.View[@content-desc="Please enter valid phone number"]
${Clear_email}                     xpath=//android.widget.EditText[@text="test2"]
${Bride_First_Name}                xpath=//android.view.View[@content-desc="Please enter bride's first name"]
${Bride_Middle_Name}               xpath=//android.view.View[@content-desc="Enter Middle Name"]
${Bride_Last_Name}                 xpath=//android.view.View[@content-desc="Please enter bride's last name"]
${Groom_First_Name}                xpath=//android.view.View[@content-desc="Please enter groom's first name"]
${Groom_Middle_Name}               xpath=//android.view.View[@content-desc="Please enter groom's middle name"]
${Groom_Last_Name}                 xpath=//android.view.View[@content-desc="Please enter groom's middle name"]
${EMAIL}                           xpath=//android.view.View[@content-desc="Enter Email"]
${Phone_Number}                    xpath=//android.view.View[@content-desc="00 0000 0000"]
${Marriage_date}                   xpath=//android.view.View[@content-desc="Please select marriage date"]
${Marriage_Place}                  xpath=//android.view.View[@content-desc="Please select marriage date"]
${Bride_detail}                    xpath=//android.view.View[@content-desc="Bride Name Detail"]
${ChildNamkaran}                   xpath=//android.widget.Button[@content-desc="Child Namkaran"]
${Email_Title}                     xpath=//android.view.View[@content-desc="Email *"]
${message_mobile}                  xpath=//android.view.View[@content-desc="Please enter valid phone number"]   
${SelectNumberofChild}             xpath=//android.widget.ScrollView/android.widget.RadioButton[1]
${Select_DOB}                      xpath=//android.widget.ImageView[@content-desc="Select DOB"]
${Select_Gender}                   xpath=//android.view.View[@content-desc="Select Gender"]
${Gender_Pick}                     xpath=//android.widget.Button[@content-desc="Male"]
${Select_Time}                     xpath=//android.widget.ImageView[@content-desc="00:00"]
${Select_AM}                       xpath=//android.widget.RadioButton[@content-desc="AM"]
${Enter_Birth_Place}               xpath=//android.widget.EditText[@hint='Enter Birth Place']
${SelectTwins}                     xpath=//android.widget.ScrollView/android.view.View/android.view.View/android.widget.RadioButton[2]
${Gender_Pick_2}                   xpath=//android.widget.Button[@content-desc="Female"]
${SELECT_MULTIPLE_CHILD}           xpath=//android.widget.ScrollView/android.widget.RadioButton[4]
${NAME_CHOICE_1}                   xpath=//android.widget.EditText[@hint='Enter Name Choice 1']
${NAME_CHOICE_2}                   xpath=//android.widget.EditText[@hint='Enter Name Choice 2']
${FIRST_ADD}                       xpath=//android.widget.ScrollView/android.widget.ImageView[4]
${NAME_CHOICE_3}                   xpath=//android.widget.EditText[@hint='Enter Name Choice 3']
${SECOND_ADD}                      xpath=//android.widget.ScrollView/android.widget.ImageView[2]
${NAME_CHOICE_4}                   xpath=//android.widget.EditText[@hint='Enter Name Choice 4']
${MOTHER_FIRST_NAME_VALIDATION}    xpath=//android.view.View[@content-desc="Please enter mother's first name"]
${MOTHER_MIDDLE_NAME_VALIDATION}   xpath=//android.view.View[@content-desc="Please enter mother's middle name"]
${MOTHER_LAST_NAME_VALIDATION}     xpath=//android.view.View[@content-desc="Please enter mother's last name"]
${FATHER_FIRST_NAME_VALIDATION}    xpath=//android.view.View[@content-desc="Please enter father's first name"]
${FATHER_MIDDLE_NAME_VALIDATION}   xpath=//android.view.View[@content-desc="Please enter father's middle name"]
${FATHER_LAST_NAME_VALIDATION}     xpath=//android.view.View[@content-desc="Please enter father's last name"] 
${EMAIL_VALIDATION}                xpath=//android.view.View[@content-desc="Please enter email"]
${PHONE_VALIDATION}                xpath=//android.view.View[@content-desc="Please enter phone number"]
${DOB_VALIDATION}                  xpath=//android.view.View[@content-desc="Please select DOB"]
${GENDER_VALIDATION}               xpath=//android.view.View[@content-desc="Please select gender"]
${BIRTH_TIME_VALIDATION}           xpath=//android.view.View[@content-desc="Please select birth time"]
${BIRTH_PLACE_VALIDATION}          xpath=//android.view.View[@content-desc="Please enter birth place"]
${Father_Title}                    xpath=//android.view.View[@content-desc="Father’s Detail"]
# ${EXPLORE_MENU}                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[3]
${SelectHouseNamkaran}             xpath=//android.widget.Button[@content-desc="House Namkaran"]
${SelectBusinessNamkaran}          xpath=//android.widget.Button[@content-desc="Business Namkaran"]
${PhoneInputField}                 xpath=//android.widget.EditText[contains(@hint, '00 0000 0000')]
${AddressInputField}               xpath=//android.widget.EditText[@hint='Enter House Full Address']
${YesRadioButton}                  xpath=//android.widget.ScrollView/android.widget.RadioButton[2]    
${AddButton}                       xpath=//android.widget.ScrollView/android.widget.ImageView 
${SubmitButton}                    xpath=//android.view.View[@content-desc="Submit"]
${ADD_NAMKARAN_BUTTON}             xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2]
# ${SELF_RADIO}                      xpath=//android.view.View[@content-desc="Self"]
# ${OTHER_RADIO}                     xpath=//android.view.View[@content-desc="Other"]
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
${OWNER_PHONE}                     xpath=//android.view.View[@content-desc="Owner Phone Number *"]/following-sibling::android.widget.EditText[1]
${BUSINESS_DESC}                   xpath=//android.view.View[@content-desc="Business Description *"]/following-sibling::android.widget.EditText[1]
${FULL_ADDRESS}                    xpath=//android.view.View[@content-desc="Business Full Address *"]/following-sibling::android.widget.EditText[1]
${YES_MULTIPLE_NAMES}              xpath=//android.view.View[@content-desc="Yes"]
# ${NAME_CHOICE_1}                   xpath=(//android.widget.EditText)[last()-2]
# ${NAME_CHOICE_2}                   xpath=(//android.widget.EditText)[last()-1]
# ${SUBMIT_BUTTON}                   xpath=//android.widget.Button[@content-desc="Submit"]
${Clear_email_2}                   xpath=//android.widget.EditText[@text="aman"]
${FirstOwner_FN_VALIDATION}        xpath=//android.view.View[@content-desc="Please enter first owner's first name"]
${FirstOwner_MN_VALIDATION}        xpath=//android.view.View[@content-desc="Please enter first owner's middle name"]
${FirstOwner_LN_VALIDATION}        xpath=//android.view.View[@content-desc="Please enter first owner's last name"]
${BUSINESS_DESCRIPTION_VALIDATION}  xpath=//android.view.View[@content-desc="Please enter business description"]
${BUSINESS_ADDRESS_VALIDATION}     xpath=//android.view.View[@content-desc="Please enter business address"]
${BusinessDetail}                  xpath=//android.view.View[@content-desc="Business Detail"]
${OwnerAddressErrorMessage}        xpath=//android.view.View[@content-desc="Please enter house address"]
${submitBrideNamkaran}             xpath=//android.widget.ScrollView/android.widget.ImageView[2]
${NAMKARAN_CATEGORIES}             xpath=//android.view.View[contains(@content-desc,'Namkaran Categories')]
${NAMKARAN_ADD_CONTENT}            xpath=//android.widget.ImageView[contains(@content-desc,'Namkaran')][1]
${ADD_NAMKARAN_TEXT}               xpath=//android.view.View[contains(@content-desc,'NO NAMKARAN FOUND.')]

*** Keywords ***
Click on the Explore Menu
    Mobile Wait Until Element Is Visible    ${EXPLORE_MENU}    15s
    Mobile Click Element    ${EXPLORE_MENU}

Click on the Namkaran Card
    Mobile Wait Until Element Is Visible    ${NAMKARAN_MENU}    10s
    Mobile Click Element    ${NAMKARAN_MENU}

verify Namkaran header and content
    Mobile Wait Until Element Is Visible    ${NAMKARAN_HEADER}    10s
    Mobile Page Should Contain Element      ${NAMKARAN_CONTENT}
    

Click on the Apply Now Button
    Scroll Until Element Visible      ${APPLY_NOW_BUTTON}
    Mobile Wait Until Element Is Visible   ${APPLY_NOW_BUTTON}     10s
    Mobile Click Element        ${APPLY_NOW_BUTTON}

Click on the Cancel Button
    Mobile Wait Until Element Is Visible   ${CANCEL_BUTTON}     10s
    Mobile Click Element        ${CANCEL_BUTTON}

Click on the I agree Button
    Mobile Wait Until Element Is Visible   ${IAGREE_BUTTON}     10s
    Mobile Click Element     ${IAGREE_BUTTON}

Verify Namkaran screen
    Mobile Wait Until Element Is Visible    ${NAMKARAN_CATEGORIES}    10s
    Mobile Element Should Be Visible        ${NAMKARAN_CATEGORIES}
    ${Content}=    Mobile Get Element Attribute    ${NAMKARAN_CATEGORIES}    content-desc
    Should Contain    ${Content}       Namkaran Categories
    Log To Console    Namkaran screen content: ${Content}


Verify Namkaran submission success message
    Mobile Wait Until Element Is Visible    ${successMessage}    10s
    ${message}=    Mobile Get Element Attribute    ${successMessage}    content-desc
    Should Be Equal As Strings      ${message}    Namkaran Submitted successfully
    Log To Console                  ${message}
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Submitted Namkaran"]    10s
    Mobile Element Should Be Visible        xpath=//android.view.View[@content-desc="Submitted Namkaran"]
    ${Content}=    Mobile Get Element Attribute    xpath=//android.view.View[@content-desc="Submitted Namkaran"]    content-desc
    Should Contain    ${Content}    Submitted Namkaran
    Log To Console    message:${Content}

Verify Namkaran Header Content
    Mobile Wait Until Element Is Visible   ${NAMKARAN_ADD_CONTENT}     10s
    ${text}=    Mobile Get Element Attribute   ${NAMKARAN_ADD_CONTENT}    content-desc
    Should Contain    ${text}    Namkaran ID :
    Should Contain    ${text}    Category :
    Log To Console    Namkaran Header content: ${text}

Handle Namkaran Add Screen
    Run Keyword And Ignore Error             Verify Namkaran add screen
    Run Keyword And Ignore Error             Verify Namkaran Add Screen Text

Verify Namkaran add screen
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${NAMKARAN_ADD_CONTENT}    10s
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${ADD_NAMKARAN_TEXT}    10s
    Run Keyword If    ${isVisible}    Verify Namkaran Header Content    
    Run Keyword If    ${isVisible}    Verify Namkaran Add Screen Text

Verify Namkaran Add Screen Text
    Mobile Wait Until Element Is Visible    ${ADD_NAMKARAN_TEXT}    10s
    ${Content}=    Mobile Get Element Attribute    ${ADD_NAMKARAN_TEXT}    content-desc
    Should Contain    ${Content}    NO NAMKARAN FOUND.
    Log To Console    Namkaran Add Screen Text: ${Content}

Select Other for the register prayer
    Mobile Wait Until Element Is Visible   ${SelectOtherNamkaran}    10s
    Mobile Click Element        ${SelectOtherNamkaran}
   


Select Bride Namkaran from category dropdown
    Mobile Wait Until Element Is Visible   ${CategoryDropdown}    10s
    Mobile Click Element        ${CategoryDropdown}
    Mobile Click Element        ${BrideNamkaran}   

Enter Bride First Name
    [Arguments]    ${BRIDE_FIRST_NAME}
    Scroll Up Until Element Visible           ${Bride_detail}      
    Mobile Wait Until Element Is Visible   ${FNameInputField}    10s
    Mobile Click Element    ${FNameInputField}
    Mobile Input Text    ${FNameInputField}    ${BRIDE_FIRST_NAME}
    Mobile Hide Keyboard

Enter Bride Middle Name
    [Arguments]    ${BRIDE_MIDDLE_NAME}
    Scroll Up Until Element Visible           ${Bride_detail}
    Mobile Wait Until Element Is Visible   ${MNameInputField}    10s
    Mobile Click Element    ${MNameInputField}
    Mobile Input Text    ${MNameInputField}    ${BRIDE_MIDDLE_NAME}
    Mobile Hide Keyboard

Enter Bride Last Name
    [Arguments]    ${BRIDE_LAST_NAME}
    Scroll Up Until Element Visible           ${Bride_detail}
    Mobile Wait Until Element Is Visible   ${LNameInputField}    10s
    Mobile Click Element    ${LNameInputField}
    Mobile Input Text    ${LNameInputField}    ${BRIDE_LAST_NAME}
    Mobile Hide Keyboard

Enter Groom First Name
    [Arguments]    ${GROOM_FIRST_NAME}
    Mobile Wait Until Element Is Visible   ${FNameInputField}    10s
    Mobile Click Element    ${FNameInputField}
    Mobile Input Text    ${FNameInputField}    ${GROOM_FIRST_NAME}
    Mobile Hide Keyboard

Enter Groom Middle Name
    [Arguments]    ${GROOM_MIDDLE_NAME}
    Mobile Wait Until Element Is Visible   ${MNameInputField}    10s
    Mobile Click Element    ${MNameInputField}
    Mobile Input Text    ${MNameInputField}    ${GROOM_MIDDLE_NAME}
    Mobile Hide Keyboard

Enter Groom Last Name
    [Arguments]    ${GROOM_LAST_NAME}
    Mobile Wait Until Element Is Visible   ${LNameInputField}    10s
    Mobile Click Element    ${LNameInputField}
    Mobile Input Text    ${LNameInputField}    ${GROOM_LAST_NAME}
    Mobile Hide Keyboard

Enter Email Address
    [Arguments]    ${EMAIL}
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    ${EMAIL}
    Mobile Hide Keyboard

Enter Email Address for Child Namkaran 
    Scroll Up Until Element Visible            ${Father_Title}
    [Arguments]    ${EMAIL}
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    ${EMAIL}
    Mobile Hide Keyboard

Select House Namkaran from category dropdown
    Mobile Wait Until Element Is Visible   ${CategoryDropdown}    10s
    Mobile Click Element        ${CategoryDropdown}
    Mobile Click Element        ${SelectHouseNamkaran}

Enter Owner First Name
    [Arguments]    ${FIRST_NAME}
    Mobile Wait Until Element Is Visible   ${FNameInputField}    10s
    Mobile Click Element    ${FNameInputField}
    Mobile Input Text    ${FNameInputField}    ${FIRST_NAME}
    Mobile Hide Keyboard

Enter Owner Middle Name
    [Arguments]    ${MIDDLE_NAME}
    Mobile Wait Until Element Is Visible   ${MNameInputField}    10s
    Mobile Click Element    ${MNameInputField}
    Mobile Input Text    ${MNameInputField}    ${MIDDLE_NAME}
    Mobile Hide Keyboard

Enter Owner Last Name
    [Arguments]    ${LAST_NAME}
    Mobile Wait Until Element Is Visible   ${LNameInputField}    10s
    Mobile Click Element    ${LNameInputField}
    Mobile Input Text    ${LNameInputField}    ${LAST_NAME}
    Mobile Hide Keyboard
    Scroll Until Element Visible    ${EmailInputField}

Enter Owner Email
    [Arguments]    ${EMAIL}
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    ${EMAIL}
    Mobile Hide Keyboard

Clear email upon validation failure
    Mobile Wait Until Element Is Visible   ${Clear_email}    10s
    Mobile Click Element    ${Clear_email}
    Mobile Clear Text       ${Clear_email}
        
Enter Phone Number
    [Arguments]    ${PHONE_NUMBER}
    Mobile Wait Until Element Is Visible   ${PhoneInputField}    10s
    Mobile Click Element    ${PhoneInputField}
    Mobile Input Text    ${PhoneInputField}    ${PHONE_NUMBER}
    Mobile Hide Keyboard

Enter Phone Number for Child Namkaran
    Scroll Up Until Element Visible            ${Father_Title} 
    [Arguments]    ${PHONE_NUMBER}
    Mobile Wait Until Element Is Visible   ${PhoneInputField}    10s
    Mobile Click Element    ${PhoneInputField}
    Mobile Input Text    ${PhoneInputField}    ${PHONE_NUMBER}
    Mobile Hide Keyboard    

Enter Owner Phone Number
    [Arguments]    ${PHONE_NUMBER}
    Mobile Wait Until Element Is Visible   ${PhoneInputField}    10s
    Mobile Click Element    ${PhoneInputField}
    Mobile Input Text    ${PhoneInputField}    ${PHONE_NUMBER}
    Mobile Hide Keyboard

Select Marriage Date
    Mobile Wait Until Element Is Visible     ${SelectMarriageDateField}    10s        
    Mobile Click Element     ${SelectMarriageDateField}
    # Mobile Click Element     ${SelectYrs}
    # Mobile Wait Until Element Is Visible   ${Select2019}    10s
    # Mobile Click Element     ${Select2019}
    # Mobile Wait Until Element Is Visible   ${SelectDay}    10s
    # Mobile Click Element     ${SelectDay}
    Mobile Click Element     ${SelectOK}

Enter Marriage Place    
    [Arguments]    ${MARRIAGE_PLACE}
    Mobile Wait Until Element Is Visible   ${MarriageInputfield}    10s
    Mobile Click Element    ${MarriageInputfield}
    Mobile Input Text    ${MarriageInputfield}    ${MARRIAGE_PLACE}
    Mobile Hide Keyboard

Verify Invalid Email message
    Mobile Wait Until Element Is Visible    ${Invalid_email}    10s
    ${message}=    Mobile Get Element Attribute    ${Invalid_email}    content-desc
    Should Be Equal As Strings      ${message}    Please enter valid email  
    Log To Console                  ${message}

Verify Invalid Mobile message
    Mobile Wait Until Element Is Visible    ${Invalid_mobile}    10s
    ${message}=    Mobile Get Element Attribute    ${Invalid_mobile}    content-desc
    Should Be Equal As Strings      ${message}    Please enter valid phone number  
    Log To Console                  ${message}  

Verify bride first name validation message
    Mobile Wait Until Element Is Visible    ${Bride_First_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Bride_First_Name}    content-desc
    Should Be Equal As Strings      ${message}    Please enter bride's first name  
    Log To Console                  ${message}
    
Verify bride middle name validation message
    Mobile Wait Until Element Is Visible    ${Bride_Middle_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Bride_Middle_Name}    content-desc
    Should Be Equal As Strings    ${message}    Enter Middle Name
    Log To Console    ${message}

Verify bride last name validation message
    Mobile Wait Until Element Is Visible    ${Bride_Last_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Bride_Last_Name}    content-desc
    Should Be Equal As Strings    ${message}    Please enter bride's last name
    Log To Console    ${message}

Verify groom first name validation message
    Mobile Wait Until Element Is Visible    ${Groom_First_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Groom_First_Name}    content-desc
    Should Be Equal As Strings    ${message}    Please enter groom's first name
    Log To Console    ${message}

Verify groom middle name validation message
    Mobile Wait Until Element Is Visible    ${Groom_Middle_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Groom_Middle_Name}    content-desc
    Should Be Equal As Strings    ${message}    Please enter groom's middle name
    Log To Console    ${message}

Verify groom last name validation message
    Mobile Wait Until Element Is Visible    ${Groom_Last_Name}    10s
    ${message}=    Mobile Get Element Attribute    ${Groom_Last_Name}    content-desc
    Should Be Equal As Strings    ${message}    Please enter groom's middle name
    Log To Console    ${message}

Verify email validation message
    Mobile Wait Until Element Is Visible    ${EMAIL}    10s
    ${message}=    Mobile Get Element Attribute    ${EMAIL}    content-desc
    Should Be Equal As Strings    ${message}    Enter Email
    Log To Console    ${message}

Verify Phone Number validation message
    Mobile Wait Until Element Is Visible    ${Phone_Number}    10s
    ${message}=    Mobile Get Element Attribute    ${Phone_Number}    content-desc
    Should Be Equal As Strings    ${message}    00 0000 0000
    Log To Console    ${message}

Verify Marriage Date validation message
    Mobile Wait Until Element Is Visible    ${Marriage_date}    10s
    ${message}=    Mobile Get Element Attribute    ${Marriage_date}    content-desc
    Should Be Equal As Strings    ${message}    Please select marriage date
    Log To Console    ${message}

Verify Marriage Place validation message
    Mobile Wait Until Element Is Visible    ${Marriage_Place}    10s
    ${message}=    Mobile Get Element Attribute   ${Marriage_Place}    content-desc
    Should Be Equal As Strings    ${message}    Please select marriage date
    Log To Console    ${message}    


Select Child Namkaran from category dropdown
    Mobile Wait Until Element Is Visible   ${CategoryDropdown}    10s
    Mobile Click Element        ${CategoryDropdown}
    Mobile Click Element        ${ChildNamkaran}    


Enter Mother First Name
    [Arguments]    ${MOTHER_FIRST_NAME}
    Scroll Up Until Element Visible            ${ChildNamkaran}
    Mobile Wait Until Element Is Visible              ${FNameInputField}    10s
    Mobile Click Element                              ${FNameInputField}
    Mobile Input Text                                 ${FNameInputField}    ${MOTHER_FIRST_NAME}
    Mobile Hide Keyboard

Enter Mother Middle Name
    [Arguments]    ${MOTHER_MIDDLE_NAME}
    Scroll Up Until Element Visible            ${ChildNamkaran}
    Mobile Wait Until Element Is Visible              ${MNameInputField}    10s
    Mobile Click Element                              ${MNameInputField}
    Mobile Input Text                                 ${MNameInputField}    ${MOTHER_MIDDLE_NAME}
    Mobile Hide Keyboard

Enter Mother Last Name
    [Arguments]    ${MOTHER_LAST_NAME}
    Scroll Up Until Element Visible            ${ChildNamkaran}
    Mobile Wait Until Element Is Visible              ${LNameInputField}    10s
    Mobile Click Element                              ${LNameInputField}
    Mobile Input Text                                 ${LNameInputField}    ${MOTHER_LAST_NAME}
    Mobile Hide Keyboard
   

Enter Father First Name
    [Arguments]    ${FATHER_FIRST_NAME}
    Scroll Up Until Element Visible            ${ChildNamkaran}
    Mobile Wait Until Element Is Visible              ${FNameInputField}    10s
    Mobile Click Element                              ${FNameInputField}
    Mobile Input Text                                 ${FNameInputField}    ${FATHER_FIRST_NAME}
    Mobile Hide Keyboard

Enter Father Middle Name
    [Arguments]    ${FATHER_MIDDLE_NAME}
    Scroll Up Until Element Visible            ${ChildNamkaran}
    Mobile Wait Until Element Is Visible              ${MNameInputField}    10s
    Mobile Click Element                              ${MNameInputField}
    Mobile Input Text                                 ${MNameInputField}    ${FATHER_MIDDLE_NAME}
    Mobile Hide Keyboard

Enter Father Last Name
    [Arguments]    ${FATHER_LAST_NAME}
    Scroll Up Until Element Visible            ${Father_Title} 
    Mobile Wait Until Element Is Visible              ${LNameInputField}    10s
    Mobile Click Element                              ${LNameInputField}
    Mobile Input Text                                 ${LNameInputField}    ${FATHER_LAST_NAME}
    Mobile Hide Keyboard

Clear email upon validation failure for Child Namkaran
    Scroll Up Until Element Visible   ${Email_Title}
    Mobile Wait Until Element Is Visible   ${Clear_email}    10s
    Mobile Click Element    ${Clear_email}
    Mobile Clear Text       ${Clear_email}

Verify Invalid Mobile message for Child Namkaran
    Mobile Wait Until Element Is Visible    ${message_mobile}    10s
    ${message}=    Mobile Get Element Attribute    ${message_mobile}    content-desc
    Should Be Equal As Strings      ${message}    Please enter valid phone number  
    Log To Console                  ${message}    

Select Single Number of child
    Mobile Wait Until Element Is Visible   ${SelectNumberofChild}    10s
    Mobile Click Element        ${SelectNumberofChild}

Select DOB
    Mobile Wait Until Element Is Visible     ${Select_DOB}    10s        
    Mobile Click Element     ${Select_DOB}
    # Mobile Click Element     ${SelectYrs}
    # Mobile Wait Until Element Is Visible   ${Select2019}    10s
    # Mobile Click Element     ${Select2019}
    # Mobile Wait Until Element Is Visible   ${SelectDay}    10s
    # Mobile Click Element     ${SelectDay}
    Mobile Click Element     ${SelectOK}
    Mobile Hide Keyboard

Select Gender
    Scroll Until Element Visible      ${SubmitButton}
    Mobile Wait Until Element Is Visible     ${Select_Gender}    10s        
    Mobile Click Element     ${Select_Gender}
    Mobile Click Element     ${Gender_Pick}
    

Select Time
    Mobile Wait Until Element Is Visible     ${Select_Time}    10s        
    Mobile Click Element                     ${Select_Time}
    Mobile Wait Until Element Is Visible     ${Select_AM}    5s
    Mobile Click Element                     ${Select_AM}
    Mobile Click Element                     ${SelectOK}

Enter Birth Place
    [Arguments]    ${BIRTH_PLACE}
    Mobile Wait Until Element Is Visible    ${Enter_Birth_Place}    10s
    Mobile Click Element                    ${Enter_Birth_Place}
    Mobile Input Text                       ${Enter_Birth_Place}    ${BIRTH_PLACE}
    Mobile Hide Keyboard

Select Twins Number of child
    Mobile Wait Until Element Is Visible   ${SelectTwins}    10s
    Mobile Click Element        ${SelectTwins}   	

Select DOB of Child No. 2
    Scroll Until Element Visible     ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${Select_DOB}    10s
    Mobile Click Element                    ${Select_DOB}
    Mobile Click Element     ${SelectYrs}
    Mobile Wait Until Element Is Visible   ${Select2019}    10s
    Mobile Click Element     ${Select2019}
    # Mobile Wait Until Element Is Visible   ${SelectDay}    10s
    # Mobile Click Element     ${SelectDay}
    Mobile Click Element     ${SelectOK}
    Mobile Hide Keyboard


Select Gender of Child No. 2
    Scroll Until Element Visible      ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${Select_Gender}    10s
    Mobile Click Element                    ${Select_Gender}
    Mobile Click Element     ${Gender_Pick_2}
    

Select Time of Child No. 2
    Mobile Wait Until Element Is Visible    ${Select_Time}    10s
    Mobile Click Element                    ${Select_Time}
    Mobile Wait Until Element Is Visible    ${Select_AM}    5s
    Mobile Click Element                    ${Select_AM}
    Mobile Click Element                    ${SelectOK}

Enter Birth Place of Child No. 2
    [Arguments]    ${BIRTH_PLACE}
    Scroll Until Element Visible     ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${Enter_Birth_Place}    10s
    Mobile Click Element                    ${Enter_Birth_Place}
    Mobile Input Text                       ${Enter_Birth_Place}    ${BIRTH_PLACE}
    Mobile Hide Keyboard


Select Yes for the multiple name choice for the child
    Mobile Wait Until Element Is Visible   ${SELECT_MULTIPLE_CHILD}
    Mobile Click Element                   ${SELECT_MULTIPLE_CHILD}

Enter name choice 1
    [Arguments]    ${ONE}
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_1}
    Mobile Click Element                   ${NAME_CHOICE_1}
    Mobile Input Text                      ${NAME_CHOICE_1}    ${ONE}
    Mobile Hide Keyboard

Enter name choice 2
    [Arguments]    ${SECOND}
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_2}
    Mobile Click Element                   ${NAME_CHOICE_2}
    Mobile Input Text                      ${NAME_CHOICE_2}    ${SECOND}
    Mobile Hide Keyboard

Click on the Add Button for Child Namkaran
    Mobile Wait Until Element Is Visible   ${FIRST_ADD}
    Mobile Click Element                   ${FIRST_ADD}

Enter name choice 3
    [Arguments]    ${THIRD}
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_3}
    Mobile Click Element                   ${NAME_CHOICE_3}
    Mobile Input Text                      ${NAME_CHOICE_3}    ${THIRD}
    Mobile Hide Keyboard

Click on the Add Button for 4 Child Namkaran
    Mobile Wait Until Element Is Visible   ${SECOND_ADD}
    Mobile Click Element                   ${SECOND_ADD}

Enter name choice 4
    Sleep  5s
    [Arguments]    ${FOURTH}
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_4}
    Mobile Click Element                   ${NAME_CHOICE_4}
    Mobile Input Text                      ${NAME_CHOICE_4}    ${FOURTH}
    Mobile Hide Keyboard

Verify Mother First Name validation message
    Mobile Wait Until Element Is Visible    ${MOTHER_FIRST_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${MOTHER_FIRST_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter mother's first name
    Log To Console                  ${message}

Verify Mother Middle Name validation message
    Mobile Wait Until Element Is Visible    ${MOTHER_MIDDLE_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${MOTHER_MIDDLE_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter mother's middle name
    Log To Console                  ${message}

Verify Mother Last Name validation message
    Mobile Wait Until Element Is Visible    ${MOTHER_LAST_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${MOTHER_LAST_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter mother's last name
    Log To Console                  ${message}

Verify Father First Name validation message
    Mobile Wait Until Element Is Visible    ${FATHER_FIRST_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FATHER_FIRST_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter father's first name
    Log To Console                  ${message}

Verify Father Middle Name validation message
    Mobile Wait Until Element Is Visible    ${FATHER_MIDDLE_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FATHER_MIDDLE_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter father's middle name
    Log To Console                  ${message}

Verify Father Last Name validation message
    Mobile Wait Until Element Is Visible    ${FATHER_LAST_NAME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FATHER_LAST_NAME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter father's last name
    Log To Console                  ${message}

Verify email validation message of Child Namkaran
    Mobile Wait Until Element Is Visible    ${EMAIL_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${EMAIL_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter email
    Log To Console                  ${message}

Verify Phone Number validation message of Child Namkaran
    Mobile Wait Until Element Is Visible    ${PHONE_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${PHONE_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter phone number
    Log To Console                  ${message}    

Verify DOB validation message of Child Namkaran
    Mobile Wait Until Element Is Visible    ${DOB_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${DOB_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please select DOB
    Log To Console                  ${message}

Verify Gender validation message of Child Namkaran
    Mobile Wait Until Element Is Visible    ${GENDER_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${GENDER_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please select gender
    Log To Console                  ${message}

Verify Birth Time validation message of Child Namkaran
    Mobile Wait Until Element Is Visible    ${BIRTH_TIME_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${BIRTH_TIME_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please select birth time
    Log To Console                  ${message}

Verify Birth Place validation message of Child Namkaran
    Mobile Wait Until Element Is Visible    ${BIRTH_PLACE_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${BIRTH_PLACE_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter birth place
    Log To Console                  ${message} 



Enter Owner house full Address
    [Arguments]    ${ADDRESS}
    Mobile Wait Until Element Is Visible   ${AddressInputField}    10s
    Mobile Click Element    ${AddressInputField}
    Mobile Input Text    ${AddressInputField}    ${ADDRESS}
    Mobile Hide Keyboard

Select Yes for the multiple name choice
    Mobile Wait Until Element Is Visible   ${YesRadioButton}    10s
    Mobile Click Element    ${YesRadioButton}

Enter First name choice
    [Arguments]    ${FIRST}
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_1}    10s
    Mobile Click Element    ${NAME_CHOICE_1}
    Mobile Input Text    ${NAME_CHOICE_1}    ${FIRST}
    Mobile Hide Keyboard

Enter Second name choice
    [Arguments]    ${SECOND}
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_2}    10s
    Mobile Click Element    ${NAME_CHOICE_2}
    Mobile Input Text    ${NAME_CHOICE_2}    ${SECOND}
    Mobile Hide Keyboard

Click on the Add Button
    Mobile Wait Until Element Is Visible   ${AddButton}    10s
    Mobile Click Element    ${AddButton}

Enter Third name choice
    [Arguments]    ${THIRD}
    Mobile Wait Until Element Is Visible   ${NAME_CHOICE_3}    10s
    Mobile Click Element    ${NAME_CHOICE_3}
    Mobile Input Text    ${NAME_CHOICE_3}    ${THIRD}
    Mobile Hide Keyboard



Click on the Submit Button
    Scroll Until Element Visible    ${SubmitButton}
    Mobile Wait Until Element Is Visible   ${SubmitButton}    10s
    Mobile Click Element    ${SubmitButton} 
    Sleep    5s

Click on Add Namkaran Button
    Mobile Wait Until Element Is Visible   ${ADD_NAMKARAN_BUTTON}     10s
    Mobile Click Element        ${ADD_NAMKARAN_BUTTON}

Verify Business Namkaran With Multiple Name Choices

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

Verify Business Namkaran by entering all mandatory fields for self

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

Select Business Namkaran from category dropdown
    Mobile Wait Until Element Is Visible   ${CategoryDropdown}    10s
    Mobile Click Element        ${CategoryDropdown}
    Mobile Click Element        ${SelectBusinessNamkaran}
    sleep  5s


Enter First Owner First Name
    Scroll Up Until Element Visible    ${BusinessDetail}      
    Mobile Wait Until Element Is Visible   ${FNameInputField}    10s
    Mobile Click Element    ${FNameInputField}
    Mobile Input Text    ${FNameInputField}    Aman 
    Mobile Hide Keyboard

Enter First Owner Middle Name
    Scroll Up Until Element Visible    ${BusinessDetail} 
    Mobile Wait Until Element Is Visible   ${MNameInputField}    10s
    Mobile Click Element    ${MNameInputField}
    Mobile Input Text    ${MNameInputField}    Owner_MN 
    Mobile Hide Keyboard

Enter First Owner Last Name
    Scroll Up Until Element Visible    ${BusinessDetail} 
    Mobile Wait Until Element Is Visible   ${LNameInputField}    10s
    Mobile Click Element    ${LNameInputField}
    Mobile Input Text    ${LNameInputField}    Shah 
    Mobile Hide Keyboard



Enter Invalid Email Address for Business Namkaran
    Scroll Until Element Visible   ${SubmitButton}
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    aman
    Mobile Hide Keyboard

Clear email upon validation failure for Business Namkaran
    Mobile Wait Until Element Is Visible   ${Clear_email_2}    10s
    Mobile Click Element    ${Clear_email_2}
    Mobile Clear Text       ${Clear_email_2}

Enter Valid Email Address for Business Namkaran
    Mobile Wait Until Element Is Visible   ${EmailInputField}    10s
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    aman@gmail.com
    Mobile Hide Keyboard

Enter Invalid Owner Phone Number for Business Namkaran
    Mobile Wait Until Element Is Visible       xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]     10s
    Mobile Click Element    xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]
    Mobile Input Text    xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]    966
    Mobile Hide Keyboard	

Verify email validation message of Business Namkaran
    Mobile Wait Until Element Is Visible    ${EMAIL_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${EMAIL_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter email
    Log To Console                  ${message}    
       
Verify Phone Number validation message of Business Namkaran
    Mobile Wait Until Element Is Visible    ${PHONE_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${PHONE_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter phone number
    Log To Console                  ${message}
           
Enter Valid Phone Number for Business Namkaran
    Mobile Wait Until Element Is Visible       xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]     10s
    Mobile Click Element    xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]
    Mobile Input Text    xpath=//android.widget.ScrollView/android.view.View/android.widget.EditText[3]    9662595340
    Mobile Hide Keyboard           

Verify Validation Message for first owner's first name
    Mobile Wait Until Element Is Visible    ${FirstOwner_FN_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FirstOwner_FN_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter first owner's first name
    Log To Console                  ${message}    

Verify Validation Message for first owner's middle name
    Mobile Wait Until Element Is Visible    ${FirstOwner_MN_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FirstOwner_MN_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter first owner's middle name
    Log To Console                  ${message}

Verify Validation Message for first owner's last name
    Mobile Wait Until Element Is Visible    ${FirstOwner_LN_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${FirstOwner_LN_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter first owner's last name
    Log To Console                  ${message}   

Enter Business Description
    Mobile Wait Until Element Is Visible   xpath=//android.widget.EditText[@hint='Enter Text Here']    10s
    Mobile Click Element    xpath=//android.widget.EditText[@hint='Enter Text Here']
    Mobile Input Text    xpath=//android.widget.EditText[@hint='Enter Text Here']      TechNova Solutions provides end-to-end software development, cloud services, and IT consulting to help businesses scale efficiently.   
    Mobile Hide Keyboard 

Verify Validation Message for Business Description
    Mobile Wait Until Element Is Visible    ${BUSINESS_DESCRIPTION_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${BUSINESS_DESCRIPTION_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter business description
    Log To Console                  ${message}

Verify Validation Message for Business Address
    Mobile Wait Until Element Is Visible    ${BUSINESS_ADDRESS_VALIDATION}    10s
    ${message}=    Mobile Get Element Attribute    ${BUSINESS_ADDRESS_VALIDATION}    content-desc
    Should Be Equal As Strings      ${message}    Please enter business address
    Log To Console                  ${message}
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

Navigate to the Namkaran screen
    Open Gurutattva App
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen
    

Click on Submit button and verify the validation for Owner First Name
    Scroll Until Element Visible    ${SubmitButton}
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${FirstOwner_FN_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${FirstOwner_FN_VALIDATION}    content-desc
    Log To Console    Validation message for Owner First Name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter first owner's first name

Click on Submit button and verify the validation for Owner Middle Name
    Scroll up until Element Visible    xpath=//android.view.View[@content-desc="House Detail"]
    Mobile Click Element    ${FNameInputField}
    Mobile Input Text    ${FNameInputField}    Warish
    Mobile Hide Keyboard
    Scroll Until Element Visible    ${SubmitButton}
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${FirstOwner_MN_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${FirstOwner_MN_VALIDATION}    content-desc
    Log To Console    Validation message for Owner Middle Name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter first owner's middle name

Click on Submit button and verify the validation for Owner Last Name
    Scroll up until Element Visible    xpath=//android.view.View[@content-desc="House Detail"]
    Mobile Click Element    ${MNameInputField}    
    Mobile Input Text    ${MNameInputField}    Kumar
    Mobile Hide Keyboard
    Scroll Until Element Visible    ${SubmitButton}
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${FirstOwner_LN_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${FirstOwner_LN_VALIDATION}    content-desc
    Log To Console    Validation message for Owner Last Name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter first owner's last name

Click on Submit button and verify the validation for Owner Email
    Scroll up until Element Visible    xpath=//android.view.View[@content-desc="House Detail"]
    Mobile Click Element    ${LNameInputField}
    Mobile Input Text    ${LNameInputField}    Mehta
    Mobile Hide Keyboard
    Scroll Until Element Visible    ${SubmitButton}
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${EMAIL_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${EMAIL_VALIDATION}    content-desc
    Log To Console    Validation message for Owner Email: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter email


Click on Submit button and verify the validation for Owner Phone Number
    Mobile Click Element    ${EmailInputField}
    Mobile Input Text    ${EmailInputField}    warish@gmail.com
    Mobile Hide Keyboard
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${PHONE_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${PHONE_VALIDATION}    content-desc
    Log To Console    Validation message for Owner Phone Number: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter phone number


Click on Submit button and verify the validation for Owner house full Address
    Mobile Click Element    ${PhoneInputField}
    Mobile Input Text    ${PhoneInputField}    7808689033
    Mobile Hide Keyboard
    Mobile Click Element    ${SubmitButton}
    Mobile Wait Until Element Is Visible    ${OwnerAddressErrorMessage}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${OwnerAddressErrorMessage}    content-desc
    Log To Console    Validation message for Owner House Address: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter house address


Click on the Add Button for Bride Namkaran
    Mobile Wait Until Element Is Visible   ${submitBrideNamkaran}    10s
    Mobile Click Element    ${submitBrideNamkaran}

Enter Marraige Place    
    [Arguments]    ${MARRIAGE_PLACE}
    Mobile Hide Keyboard
    Scroll Until Element Visible    ${MarriageInputfield}
    Mobile Wait Until Element Is Visible   ${MarriageInputfield}    10s
    Mobile Click Element    ${MarriageInputfield}
    Mobile Input Text    ${MarriageInputfield}    ${MARRIAGE_PLACE}
    Mobile Hide Keyboard    
    
Select Gender for twins child 1
    Mobile Wait Until Element Is Visible     ${Select_Gender}    10s        
    Mobile Click Element     ${Select_Gender}
    Mobile Click Element     ${Gender_Pick}  

Swipe up and down to see the twins child 1
    Scroll Up Until Element Visible            xpath=//android.view.View[@content-desc="Number of Child *"]
    Scroll Until Element Visible               xpath=//android.widget.ImageView[@content-desc="Male"] 

Select Gender for twins child 2
    Scroll Until Element Visible      ${SubmitButton}
    Mobile Wait Until Element Is Visible     ${Select_Gender}    10s        
    Mobile Click Element     ${Select_Gender}
    Mobile Click Element     ${Gender_Pick}

Click on the Back Button from Namkaran Form
    Mobile Wait Until Element Is Visible   xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView    10s
    Mobile Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView

Click on the Back Button from Namkaran Screen
    Mobile Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]    

Clear email upon validation failure for House Namkaran
    Mobile Wait Until Element Is Visible   xpath=//android.widget.EditText[@text="warish.com"]    10s
    Mobile Click Element    xpath=//android.widget.EditText[@text="warish.com"]
    Mobile Clear Text       xpath=//android.widget.EditText[@text="warish.com"]    
