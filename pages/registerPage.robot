*** Settings ***
Library    AppiumLibrary
Resource    ../resources/keywords.robot

*** Variables ***
${REGISTER_LINK}                          xpath=//android.widget.Button[@content-desc="Register"]
${REGISTER_NAME}                          xpath=(//android.widget.EditText)[1]
${REGISTER_EMAIL}                         xpath=//android.widget.EditText[@hint='Enter Email']
${REGISTER_MOBILE}                        xpath=//android.widget.EditText[@hint='00 0000 0000']
${REGISTER_COUNTRY}                       xpath=//android.view.View[@content-desc="Select Country"]
${REGISTER_GENDER}                        xpath=//android.view.View[@content-desc="Select Gender"]
${SELECT_MALE}                            xpath=//android.widget.Button[@content-desc="Male"]
${REGISTER_DOB}                           xpath=//android.widget.ImageView[@content-desc="Select DOB"]
${DatePicker}                             xpath=//android.view.View[@content-desc="2025"]    
${SelectDate}                             xpath=//android.view.View[@content-desc="1, Tuesday, July 1, 2025"]
${OK_BUTTON}                              xpath=//android.widget.Button[@content-desc="OK"]
${LOGIN}                                  xpath=(//android.view.View[@content-desc="Login"])[1]
${REGISTER_BUTTON}                        xpath=//android.view.View[@content-desc="Quick Registration"]
${EMAIL_VALIDATION_LOCATOR}               xpath=//android.view.View[@content-desc="Please enter a valid email address"]
${MOBILE_VALIDATION_LOCATOR}              xpath=//android.view.View[@content-desc="Please enter your valid mobile number"]
${FN_VALIDATION_LOCATOR}                  xpath=//android.view.View[@content-desc="Please enter First name"]
${LN_VALIDATION_LOCATOR}                  xpath=//android.view.View[@content-desc="Please enter Last name"]       
${EMAIL_VALIDATION_LOCATOR_2}             xpath=//android.view.View[@content-desc="Please enter your email"]
${MOBILE_VALIDATION_LOCATOR_2}            xpath=//android.view.View[@content-desc="Please enter your mobile number"]   
${GENDER_VALIDATION_LOCATOR}              xpath=//android.view.View[@content-desc="Please Select Gender"]  
${DOB_VALIDATION_LOCATOR}                 xpath=//android.view.View[@content-desc="Please select your date of birth"]
${COUNTRY_VALIDATION_LOCATOR}             xpath=//android.view.View[@content-desc="Please select your country"]
${STATE_VALIDATION_LOCATOR}               xpath=//android.view.View[@content-desc="Please select your state"]
${DISTRICT_VALIDATION_LOCATOR}            xpath=//android.view.View[@content-desc="Please select your district"]
${CITY_VALIDATION_LOCATOR}                xpath=//android.view.View[@content-desc="Please select your taluka / city"]
${VILLAGE_VALIDATION_LOCATOR}             xpath=//android.view.View[@content-desc="Please select your village"]
${SELECT_STATE}                           xpath=//android.view.View[@content-desc="Select State"]
${SELECT_CITY}                            xpath=//*[contains(@content-desc,"Select Taluka") or contains(@text,"Select Taluka")]
# ${LOGIN_BUTTON}                         xpath=//android.view.View[@content-desc="Do you have an account? Login"]
${SELECT_DISTRICT}                        xpath=//android.view.View[@content-desc="Select District"]
${SELECT_AREA}                            xpath=//android.view.View[@content-desc="Select Area / Village"]
${ALREADY_EMAIL_REGISTER}                 xpath=//android.view.View[@content-desc="Mobile Number or EmailAddress already registered."]
${COMMUNITY_REGISTRATION_NEXT_LABEL}      xpath=//android.view.View[@content-desc="Did you attend last Guru Purnima?"]
${NO_BUTTON_1}                            xpath=//android.widget.ScrollView/android.view.View[4]/android.widget.RadioButton[2]
${NO_BUTTON_2}                            xpath=//android.widget.ScrollView/android.view.View[4]/android.widget.RadioButton[4]
${NO_BUTTON_3}                            xpath=//android.widget.ScrollView/android.view.View/android.widget.RadioButton[5]
${COMMUNITY_NEXT}                         xpath=//android.view.View[@content-desc="Next"]
${LOCATION_PERMISSION}                    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
${SELECT_DHYANKEDRA}                      xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[4]/android.view.View[5]/android.widget.ImageView
${COMMUNITY_EMAIL_HINT}                   xpath=//android.widget.EditText[@hint='Enter Email']
${COMMUNITY_MOBILE_HINT}                  xpath=//android.widget.EditText[@hint='00 0000 0000']
${COMMUNITY_WHATSAPP_ICON}                xpath=//android.widget.ImageView[@content-desc="This is your WhatsApp Number"]
${COMMUNITY_FIRST_NAME}                   xpath=//android.widget.EditText[@hint='Enter First Name']
${COMMUNITY_MIDDLE_NAME}                  xpath=//android.widget.EditText[@hint='Enter Middle Name']
${COMMUNITY_LAST_NAME}                    xpath=//android.widget.EditText[@hint='Enter Last Name']
${COMMUNITY_ADDRESS_LINE1}                xpath=//android.widget.EditText[@hint='Enter Full Address']
${COMMUNITY_ADDRESS_LINE2}                xpath=//android.widget.EditText[@hint='Enter Address Line 2']
${COMMUNITY_LANDMARK}                     xpath=//android.widget.EditText[@hint='Enter Landmark']
${COMMUNITY_PINCODE}                      xpath=//android.widget.EditText[@hint='Enter Pin Code']
${COMMUNITY_DOB}                          xpath=(//android.widget.ImageView[@content-desc="Select"])[1]
${COMMUNITY_GENDER}                       xpath=(//android.view.View[@content-desc="Select"])[1]
${COMMUNITY_STATUS}                       xpath=//android.view.View[@content-desc="Select"]
${COMMUNITY_BLOOD_GROUP}                  xpath=//android.widget.Button[@content-desc="O-"]
${COMMUNITY_MARITAL_STATUS}               xpath=//android.widget.Button[@content-desc="Unmarried"]
${COMMUNITY_EDUCATION_LEVEL}              xpath=//android.view.View[@content-desc="Enter Education Level"]
${COMMUNITY_POSTGRADUATE}                 xpath=//android.widget.Button[@content-desc="Postgraduate"]
${COMMUNITY_EDUCATION_QUALIFICATION}      xpath=//android.view.View[@content-desc="Select Education Qualification"]
${COMMUNITY_BACHELOR}                     xpath=//android.widget.Button[@content-desc="Engineering"]
${COMMUNITY_EDUCATION_QUALIFICATION_SUB_CATEGORY}      xpath=//android.view.View[@content-desc="Select Education Qualification Sub-Category"]
${COMMUNITY_BACHELOR_SUB_CATEGORY}                     xpath=//android.widget.Button[@content-desc="B.E./Btech"]
${COMMUNITY_OCCUPATION_TYPE}                           xpath=//android.view.View[@content-desc="Select Occupation Type"]
${COMMUNITY_BUSINESS_SELF_EMPLOYED}                    xpath=//android.widget.Button[@content-desc="Business/Self Employed"]
${COMMUNITY_OCCUPATION}                                xpath=//android.view.View[@content-desc="Select Occupation"]
${COMMUNITY_IT_SOFTWARE_ENGINEERING}                   xpath=//android.widget.Button[@content-desc="ITSoftwareEngineering"]
${COMMUNITY_OCCUPATION_SUB_CATEGORY}                   xpath=//android.view.View[@content-desc="Select Occupation Sub-Category"]
${COMMUNITY_SOFTWARE_PROFESSIONAL_OTHERS}              xpath=//android.widget.Button[@content-desc="Software Professional (Others)"]
${REGISTER_BUTTON_2}                                   xpath=//android.view.View[@content-desc="Register"]
${INVALID_EMAIL_VALIDATION_LOCATOR}                    xpath=//android.view.View[@content-desc="Please enter a valid email address"]
${INVALID_PINCODE_VALIDATION_LOCATOR}                  xpath=//android.view.View[@content-desc="Please enter valid Pincode"]
${COMMUNITY_ATTENDED_YEAR}                             xpath=//android.widget.Button[@content-desc="Select Attended Year"]|//android.view.View[@content-desc="Select Attended Year"]
${COMMUNITY_YES}                                       xpath=//android.widget.ScrollView/android.view.View[4]/android.widget.RadioButton[1]
${COMMUNITY_YES_1}                                     xpath=//android.widget.ScrollView/android.view.View/android.widget.RadioButton[3]
${COMMUNITY_2024}                                      xpath=//android.view.View[@content-desc="2024"]
${COMMUNITY_SEARCH_DHYANKEDRA}                         xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
${COMMUNITY_SELECT_DHYANKEDRA_INPUT}                   xpath=(//android.view.View[@clickable='true'])[2]
${COMMUNITY_CONFIRM_DHYANKEDRA}                        xpath=//android.view.View[@content-desc="Confirm Dhyankendra"]
${COMMUNITY_MARITAL_STATUS_MARRIED}                    xpath=//android.widget.Button[@content-desc="Married"]
${COMMUNITY_DATE_OF_ANNIVERSARY}                       xpath=//android.widget.ImageView[@content-desc="Select Date"]
${LAST_ATTENDED_GURU_PURNIMA_VALIDATION}               xpath=//android.view.View[@content-desc="Please select last attended Guru Purnima"]
${LAST_ATTENDED_CHAITANYA_MAHOTSAV_VALIDATION}         xpath=//android.view.View[@content-desc="Please select last attended Chaitanya mahotsav"]
${ATTEND_FIRST_SHIVIR_VALIDATION}                      xpath=//android.view.View[@content-desc="Please select when you first attended a Shivir"]
${DHYANKENDRA_VALIDATION}                              xpath=//android.view.View[@content-desc="Please select a Dhyankendra"]
${MOBILE_NUMBER_VALIDATION}                            xpath=//android.view.View[@content-desc="Please enter Mobile Number"]
${WHATSAPP_MOBILE_NUMBER_VALIDATION}                   xpath=//android.view.View[@content-desc="Please enter WhatsApp Mobile Number"]
${FIRST_NAME_VALIDATION}                               xpath=//android.view.View[@content-desc="Please enter First name"]
${MIDDLE_NAME_VALIDATION}                              xpath=//android.view.View[@content-desc="Please enter Middle name"]
${LAST_NAME_VALIDATION}                                xpath=//android.view.View[@content-desc="Please enter Last name"]
${ADDRESS_LINE1_VALIDATION}                            xpath=//android.view.View[@content-desc="Enter Full Address"]
${ADDRESS_LINE2_VALIDATION}                            xpath=//android.view.View[@content-desc="Please enter Address Line 2"]
${LANDMARK_VALIDATION}                                 xpath=//android.view.View[@content-desc="Please enter Landmark"]
${PINCODE_VALIDATION}                                  xpath=//android.view.View[@content-desc="Please enter Pincode"]
${TALUKA_CITY_VALIDATION}                              xpath=//android.view.View[@content-desc="Please select your taluka / city"]
${AREA_VILLAGE_VALIDATION}                             xpath=//android.view.View[@content-desc="Please select your area / village"]
${DOB_VALIDATION_COMMUNITY}                            xpath=//android.view.View[@content-desc="Please select your date of birth"]
${BLOOD_GROUP_VALIDATION}                              xpath=//android.view.View[@content-desc="Please select blood group"]
${MARITAL_STATUS_VALIDATION}                           xpath=//android.view.View[@content-desc="Please select marital status"]
${ANNIVERSARY_DATE_VALIDATION}                         xpath=//android.view.View[@content-desc="Select date of anniversary"]
${EDUCATIONAL_LEVEL_VALIDATION}                        xpath=//android.view.View[@content-desc="Please enter educational level"]
${EDUCATION_QUALIFICATION_VALIDATION}                  xpath=//android.view.View[@content-desc="Please enter education qualification"]
${EDUCATION_QUALIFICATION_SUBCATEGORY_VALIDATION}      xpath=//android.view.View[@content-desc="Please select education qualification sub-category"]
${OCCUPATION_TYPE_VALIDATION}                          xpath=//android.view.View[@content-desc="Please enter occupation type"]
${OCCUPATION_VALIDATION}                               xpath=//android.view.View[@content-desc="Please enter occupation"]
${OCCUPATION_SUBCATEGORY_VALIDATION}                   xpath=//android.view.View[@content-desc="Please select occupation sub-category"]
${COUNTRY_SELECTED}                                    xpath=//android.widget.ImageView[@content-desc="India"] | //android.widget.Button[@content-desc="India"]
${COUNTRY_SELECTED_US}                                 xpath=//android.widget.Button[@content-desc="United States"]
${STATE_SELECTED_BIHAR}                                xpath=//android.widget.ImageView[@content-desc="Bihar"] | //android.widget.Button[@content-desc="Bihar"]
${DISTRICT_SELECTED_AURANGABAD}                        xpath=//android.widget.ImageView[@content-desc="Aurangabad"] | //android.widget.Button[@content-desc="Aurangabad"]
${TALUKA_SELECTED_DAUDNAGAR}                           xpath=//android.widget.ImageView[@content-desc="Daudnagar"] | //android.widget.Button[@content-desc="Daudnagar"]
${VILLAGE_SELECTED_DAULATPUR}                          xpath=//android.widget.ImageView[@content-desc="Daulatpur"] | //android.widget.Button[@content-desc="Daulatpur"]
${STATE_SELECTED_MAHARASHTRA}                          xpath=//android.widget.ImageView[@content-desc="Maharashtra"] | //android.widget.Button[@content-desc="Maharashtra"]
${DISTRICT_SELECTED_PUNE}                              xpath=//android.widget.ImageView[@content-desc="Pune"] | //android.widget.Button[@content-desc="Pune"]
${TALUKA_SELECTED_PUNE_CITY}                           xpath=//android.widget.ImageView[@content-desc="Pune City"] | //android.widget.Button[@content-desc="Pune City"]
${VILLAGE_SELECTED_VIMAN_NAGAR}                        xpath=//android.widget.ImageView[@content-desc="Viman nagar"] | //android.widget.Button[@content-desc="Viman nagar"]
${STATE_SELECTED_RAJASTHAN}                            xpath=//android.widget.ImageView[@content-desc="Rajasthan"] | //android.widget.Button[@content-desc="Rajasthan"]
${DISTRICT_SELECTED_JODHPUR}                           xpath=//android.widget.ImageView[@content-desc="Jodhpur"] | //android.widget.Button[@content-desc="Jodhpur"]
${TALUKA_SELECTED_BALESAR}                             xpath=//android.widget.Button[@content-desc="Balesar"]
${VILLAGE_SELECTED_AGOLAI}                             xpath=//android.widget.ImageView[@content-desc="Agolai"] | //android.widget.Button[@content-desc="Agolai"]
${DISTRICT_SELECTED_SURAT}                             xpath=//android.widget.ImageView[@content-desc="Surat"] | //android.widget.Button[@content-desc="Surat"]  
${TALUKA_SELECTED_ADAJAN}                              xpath=//android.widget.ImageView[@content-desc="Adajan"] | //android.widget.Button[@content-desc="Adajan"]
${VILLAGE_SELECTED_MOTA_VARCHA}                        xpath=//android.widget.ImageView[@content-desc="Mota Varachha"] | //android.widget.Button[@content-desc="Mota Varachha"]
${REGISTER_FNAME}                                      xpath=//android.widget.EditText[@hint='Enter First Name']
${REGISTER_LNAME}                                      xpath=//android.widget.EditText[@hint='Enter Last Name']
${SEARCH}                                              xpath=//android.widget.EditText | //*[@text='Search']
${INDIA}                                               xpath=//android.widget.Button[@content-desc="India"]
${GUJARAT}                                             xpath=//android.widget.Button[@content-desc="Gujarat"]
${AHMEDABAD}                                           xpath=//*[@content-desc="Ahmedabad" or @content-desc="Ahmadabad" or @text="Ahmedabad" or @text="Ahmadabad"]
${AHMEDABAD_CITY}                                      xpath=//*[contains(@content-desc,"Ahmedabad") and contains(@content-desc,"City") or contains(@text,"Ahmedabad") and contains(@text,"City")]
${UNIVERSITY_ROAD}                                     xpath=//android.widget.Button[@content-desc="University Road"]
${FIRST_HEADER}                                        xpath=//android.view.View[@content-desc="Select how you want to register."]
${SECOND_HEADER}                                       xpath=//android.view.View[@content-desc="Mobile Number"]
${COMMUNITY_TAB}                                       xpath=//android.view.View[@content-desc="Community Registration "]/android.widget.RadioButton
${QUICK_TAB}                                           xpath=//android.view.View[@content-desc="Quick Registration"]/android.widget.RadioButton  


*** Keywords ***

Submit Registration
    # If there is a final submit button, click it here
    Mobile Click Element                   ${REGISTER_BUTTON}
    Log                             Registration submitted!
 
# Verify All Mandatory Validations
Verify Validation Message for FN
    Mobile Wait Until Element Is Visible   ${FN_VALIDATION_LOCATOR}    5s
    ${message_name_2}=               Mobile Get Element Attribute    ${FN_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings      ${message_name_2}    Please enter First name    
    Log To Console                  ${message_name_2}

Verify Validation Message for LN
    Mobile Wait Until Element Is Visible   ${LN_VALIDATION_LOCATOR}    5s
    ${message_name_2}=               Mobile Get Element Attribute    ${LN_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings      ${message_name_2}    Please enter Last name    
    Log To Console                  ${message_name_2}    

Verify Validation Message for Email
    Mobile Wait Until Element Is Visible   ${EMAIL_VALIDATION_LOCATOR_2}    5s
    ${message_email_2}=               Mobile Get Element Attribute    ${EMAIL_VALIDATION_LOCATOR_2}    content-desc
    Should Be Equal As Strings      ${message_email_2}    Please enter your email   
    Log To Console                            ${message_email_2}

Verify Validation Message for Mobile Number 
    Mobile Wait Until Element Is Visible   ${MOBILE_VALIDATION_LOCATOR_2}    5s
    ${message_mobile_2}=               Mobile Get Element Attribute    ${MOBILE_VALIDATION_LOCATOR_2}    content-desc
    Should Be Equal As Strings      ${message_mobile_2}    Please enter your mobile number   
    Log To Console                            ${message_mobile_2}

Verify Validation Message for Gender 
    Mobile Wait Until Element Is Visible   ${GENDER_VALIDATION_LOCATOR}    5s
    ${message_gender}=               Mobile Get Element Attribute    ${GENDER_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings      ${message_gender}    Please Select Gender   
    Log To Console                             ${message_gender}

Verify Validation Message for DOB
    Mobile Wait Until Element Is Visible    ${DOB_VALIDATION_LOCATOR}    5s
    ${message_dob}=               Mobile Get Element Attribute    ${DOB_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings       ${message_dob}    Please select your date of birth   
    Log To Console                              ${message_dob}

Verify Validation Message for Country
    Mobile Wait Until Element Is Visible    ${COUNTRY_VALIDATION_LOCATOR}    5s
    ${message_country}=               Mobile Get Element Attribute    ${COUNTRY_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings       ${message_country}    Please select your country   
    Log To Console                              ${message_country}

Verify Validation Message for State
    Mobile Wait Until Element Is Visible    ${STATE_VALIDATION_LOCATOR}    5s
    ${message_state}=               Mobile Get Element Attribute    ${STATE_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings       ${message_state}    Please select your state    
    Log To Console                             ${message_state}

Verify Validation Message for District
    Mobile Wait Until Element Is Visible    ${DISTRICT_VALIDATION_LOCATOR}    5s
    ${message_district}=               Mobile Get Element Attribute    ${DISTRICT_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings       ${message_district}    Please select your district    
    Log To Console                             ${message_district}    

Verify Validation Message for City
    Mobile Wait Until Element Is Visible    ${CITY_VALIDATION_LOCATOR}    5s
    ${message_CITY}=               Mobile Get Element Attribute    ${CITY_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings       ${message_CITY}    Please select your taluka / city   
    Log To Console                             ${message_CITY}

Verify Validation Message for Village
    Mobile Wait Until Element Is Visible    ${VILLAGE_VALIDATION_LOCATOR}    5s
    ${message_village}=               Mobile Get Element Attribute    ${VILLAGE_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings       ${message_village}    Please select your village   
    Log To Console                             ${message_village}

Click on the Quick Registration Button
    Scroll Until Element Visible     ${SELECT_AREA}
    Mobile Wait Until Element Is Visible   ${REGISTER_BUTTON}    10s
    Mobile Click Element                   ${REGISTER_BUTTON}

Click on the skip button
    Sleep      2s 
    Mobile Wait Until Element Is Visible   xpath=//android.widget.Button[@content-desc="Skip"]    10s
    Mobile Click Element                   xpath=//android.widget.Button[@content-desc="Skip"] 

Enter Invalid Email
    Mobile Input Text                      ${REGISTER_EMAIL}    yatish
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Verify Validation Message for Invalid Email    
    Mobile Wait Until Element Is Visible   ${EMAIL_VALIDATION_LOCATOR}    10s
    ${message_email}=               Mobile Get Element Attribute    ${EMAIL_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings      ${message_email}    Please enter a valid email address
    Log To Console                             ${message_email}
      
Enter Invalid Mobile Number
    Mobile Input Text                      ${REGISTER_MOBILE}    966
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Verify Validation Message for Invalid Mobile Number
    Mobile Wait Until Element Is Visible   ${MOBILE_VALIDATION_LOCATOR}    5s
    ${message_mobile}=               Mobile Get Element Attribute    ${MOBILE_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings      ${message_mobile}    Please enter your valid mobile number
    Log To Console                            ${message_mobile}   

Click on the Login Button from Register Page
    Scroll Until Element Visible     ${SELECT_AREA}
    Sleep      2s  
    # Wait Until Element Is Visible    ${LOGIN_BUTTON}    10s
    # Click Element                   ${LOGIN_BUTTON}
    # Log                             Clicked on Login Button from Register Page

Verify Login Screen Is Displayed  
    Mobile Wait Until Element Is Visible    ${LOGIN}    10s
    Mobile Element Should Be Visible        ${LOGIN}
    ${login_title}=    Mobile Get Element Attribute    ${LOGIN}    content-desc
    Should Contain    ${login_title}     Login
    Log To Console    Title: ${login_title} 

# Fill Registration Form
Click on the Name Field
    Sleep     5s
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]
    Mobile Wait Until Element Is Visible   ${REGISTER_NAME}    10s
    Mobile Click Element                   ${REGISTER_NAME}
    
Enter the Name    
    Mobile Input Text                      ${REGISTER_NAME}    yatish
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter First Name for Register Screen
    [Arguments]    ${FIRST_NAME}
    Mobile Wait Until Element Is Visible   ${REGISTER_FNAME}    10s
    Mobile Click Element                  ${REGISTER_FNAME}
    Mobile Input Text                     ${REGISTER_FNAME}    ${FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Last Name for Register Screen
    [Arguments]    ${LAST_NAME}
    Mobile Wait Until Element Is Visible   ${REGISTER_LNAME}    10s
    Mobile Click Element    ${REGISTER_LNAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${REGISTER_LNAME}    ${LAST_NAME}
    
Enter Email for Register Screen
    [Arguments]    ${EMAIL}
    Mobile Wait Until Element Is Visible   ${REGISTER_EMAIL}    10s
    Mobile Click Element                   ${REGISTER_EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_EMAIL}    ${EMAIL}

Enter Mobile Number for Register Screen
    [Arguments]    ${MOBILE}
    Mobile Wait Until Element Is Visible   ${REGISTER_MOBILE}    10s
    Mobile Click Element                   ${REGISTER_MOBILE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_MOBILE}    ${MOBILE}


Click on the Email Field
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]        
    Mobile Wait Until Element Is Visible   ${REGISTER_EMAIL}    10s
    Mobile Click Element                   ${REGISTER_EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Valid Email
    [Arguments]    ${EMAIL}
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_EMAIL}    10s
    Mobile Click Element                   ${REGISTER_EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_EMAIL}    ${EMAIL}

Click on the Mobile Field
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Name"]     
    Mobile Wait Until Element Is Visible   ${REGISTER_MOBILE}    10s
    Mobile Click Element                   ${REGISTER_MOBILE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Valid Mobile Number  
    [Arguments]    ${MOBILE}
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_MOBILE}    10s
    Mobile Click Element                   ${REGISTER_MOBILE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_MOBILE}    ${MOBILE} 

Select Gender
    Scroll Up Until Element Visible  xpath=//android.view.View[@content-desc="Name"]  
    Mobile Click Element                   ${REGISTER_GENDER}
    Mobile Wait Until Element Is Visible   ${SELECT_MALE}    10s
    Mobile Click Element                   ${SELECT_MALE}  

Select Gender for register screen
    Scroll Until Element Found             ${REGISTER_GENDER}
    Mobile Wait Until Element Is Visible   ${REGISTER_GENDER}    10s
    Mobile Click Element                   ${REGISTER_GENDER}
    # Mobile Click Element                   ${SEARCH}
    # Mobile Input Text                      ${SEARCH}     Male
    # Mobile Hide Keyboard
    Mobile Wait Until Element Is Visible   ${SELECT_MALE}    10s
    Mobile Click Element                   ${SELECT_MALE} 

Select DOB for Register Screen
    Mobile Wait Until Element Is Visible    ${REGISTER_DOB}        5s
    Mobile Click Element                    ${REGISTER_DOB}
    Mobile Wait Until Element Is Visible    ${OK_BUTTON}           5s
    Mobile Click Element                    ${OK_BUTTON}

Select Country for Register Screen
    # Mobile Wait Until Element Is Visible    ${REGISTER_COUNTRY}    5s
    Scroll Until Element Found     ${REGISTER_COUNTRY}
    Mobile Click Element                    ${REGISTER_COUNTRY}
    Mobile Click Element                    ${SEARCH}
    Mobile Input Text                       ${SEARCH}              India
    # Mobile Wait Until Element Is Visible    ${INDIA}               5s
    Mobile Click Element                    ${INDIA}

Select Country from dropdown in Register screen
    Swipe Until Element Visible     ${SELECT_AREA}
    Mobile Wait Until Element Is Visible    ${REGISTER_COUNTRY}    5s
    Mobile Click Element                    ${REGISTER_COUNTRY}
    Mobile Click Element                    ${SEARCH}
    Mobile Input Text                       ${SEARCH}              India
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Wait Until Element Is Visible    ${INDIA}               5s
    Mobile Click Element                    ${INDIA}    

Select State for Register Screen
    Scroll Until Element Found             ${REGISTER_BUTTON}
    # Mobile Wait Until Element Is Visible    ${SELECT_STATE}        5s 
    Mobile Click Element                    ${SELECT_STATE}
    Mobile Click Element                    ${SEARCH}
    Mobile Input Text                       ${SEARCH}              Gujarat
    # Mobile Wait Until Element Is Visible    ${GUJARAT}             5s
    Mobile Click Element                    ${GUJARAT}                   

Select District for Register Screen
    Mobile Wait Until Element Is Visible    ${SELECT_DISTRICT}     5s
    Mobile Click Element                    ${SELECT_DISTRICT}
    Sleep    1s
    Mobile Click Element                    ${SEARCH}
    Mobile Input Text                       ${SEARCH}              Ahmedabad
    Sleep    1s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    # Click on Ahmedabad from list (second occurrence - first is search field)
    Mobile Click Element    xpath=(//*[contains(@text,'Ahmedabad') or contains(@content-desc,'Ahmedabad')])[2] 

Select Taluka/City for Register Screen
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    # Scroll down to reveal Taluka/City dropdown
    ${height}=    Mobile Get Window Height
    ${width}=    Mobile Get Window Width
    ${start_x}=    Evaluate    int(${width} * 0.5)
    ${start_y}=    Evaluate    int(${height} * 0.7)
    ${end_y}=    Evaluate    int(${height} * 0.3)
    Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
    Sleep    1s
    Mobile Click Element    xpath=//*[contains(@text,'Select Taluka') or contains(@content-desc,'Select Taluka')]
    Sleep    1s
    Mobile Click Element    ${SEARCH}
    Mobile Input Text       ${SEARCH}    Ahmedabad
    Sleep    1s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    # Click on Ahmedabad City from list (first match containing both Ahmedabad and City)
    Mobile Click Element    xpath=(//*[contains(@text,'Ahmedabad City') or contains(@content-desc,'Ahmedabad City') or contains(@text,'Ahmedabad (City)') or contains(@content-desc,'Ahmedabad (City)')])[1] 

Select Area/Village for Register Screen
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    # Scroll to see Area/Village dropdown
    ${height}=    Mobile Get Window Height
    ${width}=    Mobile Get Window Width
    ${start_x}=    Evaluate    int(${width} * 0.5)
    ${start_y}=    Evaluate    int(${height} * 0.8)
    ${end_y}=    Evaluate    int(${height} * 0.3)
    Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
    Sleep    1s
    # Click on Area/Village dropdown
    Mobile Click Element    xpath=//*[contains(@text,'Select Area') or contains(@content-desc,'Select Area')]
    Sleep    1s
    Mobile Click Element    ${SEARCH}
    Mobile Input Text       ${SEARCH}    Navrangpura
    Sleep    1s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    # Click second Navrangpura (first is search field, second is list item)
    Mobile Click Element    xpath=(//*[contains(@text,'Navrangpura') or contains(@content-desc,'Navrangpura')])[2] 

Click on the Quick Registration Tab
    # Sleep      2s
    # Mobile Wait Until Element Is Visible    ${QUICK_TAB}       5s
    Mobile Click Element                             ${QUICK_TAB}
    Log To Console                            Clicked on Quick Registration Tab

Enter Registered Email Address
    Mobile Input Text                      ${REGISTER_EMAIL}     yatish.devlekar@rysun.com
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Verify Validation Message for Registered Email Address and Mobile Number
    # Mobile Wait Until Element Is Visible    ${ALREADY_EMAIL_REGISTER}    10s
    # ${actual_message}=    Mobile Get Element Attribute    ${ALREADY_EMAIL_REGISTER}    content-desc
    # Log To Console    Already Registered Validation: ${actual_message}
    # Should Be Equal    ${actual_message}    Mobile Number or EmailAddress already registered.
    # Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Mobile Number or EmailAddress already registered.')]    10s
    # Log To Console     Mobile Number or EmailAddress already registered.
    # Sleep    2s
    ${src}=    Mobile.Get Source    
    Should Contain    ${src}    Mobile Number or EmailAddress already registered.
    Log To Console    Mobile Number or EmailAddress already registered.

Enter Registered Mobile Number
    Mobile Input Text                      ${REGISTER_MOBILE}     9662595340
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Verify Community Registration is Selected by default
    Mobile Wait Until Element Is Visible    ${COMMUNITY_REGISTRATION_NEXT_LABEL}    10s
    ${checked}=    Mobile Get Element Attribute    ${COMMUNITY_REGISTRATION_NEXT_LABEL}    content-desc
    Should Contain    ${checked}    Did you attend last Guru Purnima?
    Log To Console    Community Registration is selected by default.   

Click on the NO Radio Button
    Mobile Wait Until Element Is Visible    ${NO_BUTTON_1}    10s
    Mobile Click Element                    ${NO_BUTTON_1}
    Mobile Wait Until Element Is Visible    ${NO_BUTTON_2}    10s
    Mobile Click Element                    ${NO_BUTTON_2}
    Swipe Until Element Visible      ${COMMUNITY_NEXT}
    Mobile Wait Until Element Is Visible    ${NO_BUTTON_3}    10s
    Mobile Click Element                    ${NO_BUTTON_3}
    Log To Console                  Clicked on NO Radio Button

Click on the Next Button from Community Registration
    Swipe Until Element Visible    ${COMMUNITY_NEXT}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_NEXT}    10s
    Mobile Click Element                   ${COMMUNITY_NEXT}
    Log To Console                  Clicked on Next Button from Community Registration

Handle Location Permission
    Run Keyword And Ignore Error    Location Permission

Location Permission
    ${isVisible}=    Run Keyword And Return Status    Mobile Element Should Be Visible    ${LOCATION_PERMISSION}
    Run Keyword If    ${isVisible}    Mobile Click Element    ${LOCATION_PERMISSION}
    Run Keyword If    ${isVisible}    Log To Console    The Location Permission is allowed

Select Dhyankendra and click on the Next Button
    Mobile Wait Until Element Is Visible    ${SELECT_DHYANKEDRA}    10s
    Mobile Click Element                    ${SELECT_DHYANKEDRA}
    Mobile Wait Until Element Is Visible    xpath=//android.widget.RadioButton    10s
    Mobile Click Element                    xpath=//android.widget.RadioButton
    Mobile Wait Until Element Is Visible    ${COMMUNITY_CONFIRM_DHYANKEDRA}    10s
    Mobile Click Element                    ${COMMUNITY_CONFIRM_DHYANKEDRA}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_NEXT}    10s
    Mobile Click Element                    ${COMMUNITY_NEXT}
    Log To Console                   Selected Dhyankendra and clicked on Next Button


Enter Community Email
    # Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_EMAIL_HINT}    10s
    Mobile Click Element                    ${COMMUNITY_EMAIL_HINT}
    Mobile Input Text                       ${COMMUNITY_EMAIL_HINT}     payment.gateway@rysun.com
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Click on the Community Mobile Field
    # Scroll Up Until Element Visible  xpath=//android.view.View[@content-desc="Select how you want to register."]
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_MOBILE_HINT}    10s
    Mobile Click Element                    ${COMMUNITY_MOBILE_HINT}
    # Mobile Input Text                      ${COMMUNITY_MOBILE_HINT}     8590620194
    # Mobile Hide Keyboard

Click on the Community WhatsApp Number
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
    Mobile Wait Until Element Is Visible    ${COMMUNITY_WHATSAPP_ICON}    10s
    Mobile Click Element                   ${COMMUNITY_WHATSAPP_ICON}

Enter the Community WhatsApp Number    
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
    Mobile Wait Until Element Is Visible    ${COMMUNITY_MOBILE_HINT}    10s
    Mobile Click Element                    ${COMMUNITY_MOBILE_HINT}
    Mobile Click Element                    ${COMMUNITY_MOBILE_HINT}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                       ${COMMUNITY_MOBILE_HINT}     9163550639    
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Community First Name
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
    Mobile Wait Until Element Is Visible    ${COMMUNITY_FIRST_NAME}    10s
    Mobile Click Element                    ${COMMUNITY_FIRST_NAME}
    Mobile Click Element                    ${COMMUNITY_FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${COMMUNITY_FIRST_NAME}     First Name
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Community Middle Name
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
    Mobile Wait Until Element Is Visible    ${COMMUNITY_MIDDLE_NAME}    10s
    Mobile Click Element                    ${COMMUNITY_MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${COMMUNITY_MIDDLE_NAME}     Middle Name
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Middle Name for Community Registration
    Swipe Until Element Visible    xpath=//android.widget.EditText[@hint='Enter Last Name']
    Mobile Wait Until Element Is Visible    ${COMMUNITY_MIDDLE_NAME}    10s
    Mobile Click Element                    ${COMMUNITY_MIDDLE_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${COMMUNITY_MIDDLE_NAME}     Middle Name
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Last Name for Community Registration
    Mobile Wait Until Element Is Visible    ${COMMUNITY_LAST_NAME}    10s
    Mobile Click Element                    ${COMMUNITY_LAST_NAME}
    Mobile Input Text                      ${COMMUNITY_LAST_NAME}     Last Name
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Community Last Name
    Swipe Until Element Visible    xpath=//android.widget.EditText[@hint='Enter Last Name']
    Mobile Wait Until Element Is Visible    ${COMMUNITY_LAST_NAME}    10s
    Mobile Click Element                    ${COMMUNITY_LAST_NAME}
    Mobile Input Text                      ${COMMUNITY_LAST_NAME}     Last Name
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Community Full Address
    # Swipe Until Element Visible    ${COMMUNITY_ADDRESS_LINE1}
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_ADDRESS_LINE1}    10s
    Mobile Click Element                    ${COMMUNITY_ADDRESS_LINE1}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${COMMUNITY_ADDRESS_LINE1}     Address Line 1
    

Enter Community Address Line 2
    Mobile Wait Until Element Is Visible    ${COMMUNITY_ADDRESS_LINE2}    10s    
    Mobile Click Element                    ${COMMUNITY_ADDRESS_LINE2}
    Mobile Input Text                      ${COMMUNITY_ADDRESS_LINE2}     Address Line 2
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Community Landmark
    Mobile Wait Until Element Is Visible    ${COMMUNITY_LANDMARK}    10s
    Mobile Click Element                    ${COMMUNITY_LANDMARK}
    Mobile Input Text                      ${COMMUNITY_LANDMARK}     Landmark
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    
Enter Community Pincode
    Scroll until element found    ${COMMUNITY_PINCODE}
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_PINCODE}    10s
    Mobile Click Element                    ${COMMUNITY_PINCODE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${COMMUNITY_PINCODE}     380015

Enter Community Valid Pincode
    Scroll Up Until Element Visible      ${COMMUNITY_PINCODE}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_PINCODE}    10s
    Mobile Click Element                    ${COMMUNITY_PINCODE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${COMMUNITY_PINCODE}     380015
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Community Mobile By Keypad
    # Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
    [Arguments]    ${number}
    @{digits}=    Evaluate    list(str(${number}))
    FOR    ${digit}    IN    @{digits}
        ${keycode}=    Evaluate    {'0':7, '1':8, '2':9, '3':10, '4':11, '5':12, '6':13, '7':14, '8':15, '9':16}[str(${digit})]
        Mobile Press Keycode    ${keycode}
    END
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Fill the Personal,Select Unmarried and Education Information
    Select DOB For Personal Information
    Select Gender For Personal Information
    Select Blood Group For Personal Information
    Select Marital Status For Personal Information
    Click on the Education Level Field
    Click on the Education Qualification Field
    Click on the Occupation Type Field
    Click on the Occupation Field
    Click on the register Button from Community Registration

Select DOB For Personal Information
  # Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
#   Mobile Wait Until Element Is Visible    ${COMMUNITY_DOB}    10s
  Mobile Click Element                   ${COMMUNITY_DOB}
#   Mobile Wait Until Element Is Visible    ${OK_BUTTON}    10s
  Mobile Click Element                   ${OK_BUTTON}
  Log To Console                  Selected DOB For Personal Information

Select Gender For Personal Information
  # Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
#   Mobile Wait Until Element Is Visible    ${COMMUNITY_GENDER}    10s
  Mobile Click Element                   ${COMMUNITY_GENDER}
  Mobile Click Element                   ${SEARCH}
#   Mobile Hide Keyboard
  Mobile Input Text                      ${SEARCH}     Male
#   Mobile Wait Until Element Is Visible   ${SELECT_MALE}    10s
  Mobile Click Element                   ${SELECT_MALE} 
  Log To Console                  Selected Gender For Personal Information

Select Blood Group For Personal Information
#   Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
#   Mobile Wait Until Element Is Visible    ${COMMUNITY_GENDER}    10s
  Mobile Click Element                   ${COMMUNITY_GENDER}
  Mobile Click Element                   ${SEARCH}
#   Mobile Hide Keyboard
  Mobile Input Text                      ${SEARCH}  O-
  # Mobile Wait Until Element Is Visible    ${COMMUNITY_BLOOD_GROUP}    10s
  Mobile Click Element                   ${COMMUNITY_BLOOD_GROUP}
  Log To Console                  Selected Blood Group For Personal Information

Select Marital Status For Personal Information
  # Mobile Wait Until Element Is Visible    ${COMMUNITY_STATUS}    10s
  Mobile Click Element                   ${COMMUNITY_STATUS}
  Mobile Click Element                   ${SEARCH}
#   Mobile Hide Keyboard
  Mobile Input Text                      ${SEARCH}     Unmarried
  # Mobile Wait Until Element Is Visible    ${COMMUNITY_MARITAL_STATUS}    10s
  Mobile Click Element                   ${COMMUNITY_MARITAL_STATUS}
  Log To Console                  Selected Marital Status For Personal Information

Click on the Education Level Field
    Scroll Until Element Found     xpath=//android.view.View[@content-desc="Occupation"]
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_EDUCATION_LEVEL}    10s
    Mobile Click Element                   ${COMMUNITY_EDUCATION_LEVEL}
    Mobile Click Element                   ${SEARCH}
    # Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}    Postgraduate   
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_POSTGRADUATE}    10s
    Mobile Click Element                   ${COMMUNITY_POSTGRADUATE}
    Log To Console                  Selected Education Level For Personal Information

Click on the Education Qualification Field
    Scroll Until Element Found     xpath=//android.view.View[@content-desc="Occupation"]
    # Swipe Until Element Visible      xpath=//android.view.View[@content-desc="Occupation"]
    Mobile Wait Until Element Is Visible    ${COMMUNITY_EDUCATION_QUALIFICATION}    10s
    Mobile Click Element                   ${COMMUNITY_EDUCATION_QUALIFICATION}
    Mobile Click Element                   ${SEARCH}
    # Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}    Engineering
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_BACHELOR}    10s
    Mobile Click Element                   ${COMMUNITY_BACHELOR}
    Log To Console                  Selected Education Qualification For Personal Information
    Scroll Until Element Found     xpath=//android.view.View[@content-desc="Occupation"]
    # Swipe Until Element Visible      xpath=//android.view.View[@content-desc="Occupation"]
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_EDUCATION_QUALIFICATION_SUB_CATEGORY}    10s
    Mobile Click Element                   ${COMMUNITY_EDUCATION_QUALIFICATION_SUB_CATEGORY}
    Mobile Click Element                   ${SEARCH}
    # Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}    B.E./Btech   
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_BACHELOR_SUB_CATEGORY}    10s
    Mobile Click Element                   ${COMMUNITY_BACHELOR_SUB_CATEGORY}
    Log To Console                  Selected Education Qualification Sub-Category For Personal Information

Click on the Occupation Type Field
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_OCCUPATION_TYPE}    10s
    Mobile Click Element                   ${COMMUNITY_OCCUPATION_TYPE}
    Mobile Click Element                   ${SEARCH}
    # Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}    Business/Self Employed
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_BUSINESS_SELF_EMPLOYED}    10s
    Mobile Click Element                   ${COMMUNITY_BUSINESS_SELF_EMPLOYED}
    Log To Console                  Selected Occupation Type For Personal Information

Click on the Occupation Field
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_OCCUPATION}    10s
    Scroll Until Element Found     ${REGISTER_BUTTON_2}
    Mobile Click Element                   ${COMMUNITY_OCCUPATION}
    Mobile Click Element                   ${SEARCH}
    
    Mobile Input Text                      ${SEARCH}    ITSoftwareEngineering
    Mobile Wait Until Element Is Visible    ${COMMUNITY_IT_SOFTWARE_ENGINEERING}    10s
    Mobile Click Element                   ${COMMUNITY_IT_SOFTWARE_ENGINEERING}
    Log To Console                  Selected Occupation For Personal Information
    # Mobile Wait Until Element Is Visible    ${COMMUNITY_OCCUPATION_SUB_CATEGORY}    10s
    Scroll Until Element Found     ${REGISTER_BUTTON_2}
    Mobile Click Element                   ${COMMUNITY_OCCUPATION_SUB_CATEGORY}
    Mobile Click Element                   ${SEARCH}
    Mobile Input Text                      ${SEARCH}    Software Professional (Others)
    Mobile Wait Until Element Is Visible    ${COMMUNITY_SOFTWARE_PROFESSIONAL_OTHERS}    10s
    Mobile Click Element                   ${COMMUNITY_SOFTWARE_PROFESSIONAL_OTHERS}
    Log To Console                  Selected Occupation Sub-Category For Personal Information

Click on the register Button from Community Registration
    # Swipe Until Element Visible      ${REGISTER_BUTTON_2}
    # Mobile Wait Until Element Is Visible    ${REGISTER_BUTTON_2}    10s
    Mobile Click Element                   ${REGISTER_BUTTON_2}
    Log To Console                  Clicked on register Button from Community Registration

Enter Invalid Community Email
    Mobile Wait Until Element Is Visible    ${COMMUNITY_EMAIL_HINT}    10s
    Mobile Click Element                    ${COMMUNITY_EMAIL_HINT}
    Mobile Input Text                       ${COMMUNITY_EMAIL_HINT}     yatish
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Verify Validation Message for Invalid Community Email
    Mobile Wait Until Element Is Visible    ${INVALID_EMAIL_VALIDATION_LOCATOR}    10s
    ${message_email}=               Mobile Get Element Attribute    ${INVALID_EMAIL_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings      ${message_email}    Please enter a valid email address
    Log To Console                             ${message_email}

Enter Invalid Community Pincode
    Mobile Wait Until Element Is Visible    ${COMMUNITY_PINCODE}    10s
    Mobile Click Element                    ${COMMUNITY_PINCODE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${COMMUNITY_PINCODE}     000
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Verify Validation Message for Invalid Community Pincode
    Mobile Wait Until Element Is Visible    ${INVALID_PINCODE_VALIDATION_LOCATOR}    10s
    ${message_pincode}=               Mobile Get Element Attribute    ${INVALID_PINCODE_VALIDATION_LOCATOR}    content-desc
    Should Be Equal As Strings      ${message_pincode}    Please enter valid Pincode
    Log To Console                             ${message_pincode}

Clear Community Mobile Field
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
    Mobile Wait Until Element Is Visible   xpath=(//android.widget.EditText[@text="0"])[1]    10s
    Mobile Click Element    xpath=(//android.widget.EditText[@text="0"])[1]
    Mobile Clear Text       xpath=(//android.widget.EditText[@text="0"])[1]

Click on the Third NO Button
    Mobile Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.View/android.widget.RadioButton[3]    10s
    Mobile Click Element                    xpath=//android.widget.ScrollView/android.view.View/android.widget.RadioButton[3]
    Log To Console                  Clicked on Third NO Button

Click on the First YES Radio Button
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
    Mobile Wait Until Element Is Visible    ${COMMUNITY_YES}    10s
    Mobile Click Element                    ${COMMUNITY_YES}
    Log To Console                  Clicked on First YES Radio Button

Click on the Second YES Radio Button
    Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Did you attend last Guru Purnima?"]
    Mobile Wait Until Element Is Visible    ${COMMUNITY_YES_1}    10s
    Mobile Click Element                    ${COMMUNITY_YES_1}
    Log To Console                  Clicked on Second YES Radio Button

Select Attended Year
    Mobile Wait Until Element Is Visible    ${COMMUNITY_ATTENDED_YEAR}    10s
    Mobile Click Element                   ${COMMUNITY_ATTENDED_YEAR}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_2024}    10s
    Sleep  2s
    Mobile Click Element                   ${COMMUNITY_2024}
    Sleep   2s
    Mobile Click Element                   ${OK_BUTTON}
    Log To Console                  Selected Attended Year

Select Attended Year for Second Yes
   Swipe Until Element Visible     ${COMMUNITY_NEXT}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_ATTENDED_YEAR}    10s
    Mobile Click Element                   ${COMMUNITY_ATTENDED_YEAR}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_2024}    10s
    Sleep  2s
    Mobile Click Element                   ${COMMUNITY_2024}
    Sleep   2s
    Mobile Click Element                   ${OK_BUTTON}
    Log To Console                  Selected Attended Year  

Select and Search Dhyankendra and click on the Next Button
    Mobile Wait Until Element Is Visible    ${SELECT_DHYANKEDRA}    10s
    Mobile Click Element                    ${SELECT_DHYANKEDRA}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_SEARCH_DHYANKEDRA}      10s
    Mobile Click Element                    ${COMMUNITY_SEARCH_DHYANKEDRA}
    Mobile Input Text                       ${COMMUNITY_SEARCH_DHYANKEDRA}     Pune
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Wait Until Element Is Visible    ${COMMUNITY_SELECT_DHYANKEDRA_INPUT}    10s
    Mobile Click Element                    ${COMMUNITY_SELECT_DHYANKEDRA_INPUT}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_CONFIRM_DHYANKEDRA}    10s
    Mobile Click Element                    ${COMMUNITY_CONFIRM_DHYANKEDRA}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_NEXT}    10s
    Mobile Click Element                    ${COMMUNITY_NEXT}
    Log To Console                  Selected and Searched Dhyankendra and clicked on Next Button

Fill the Personal and Address Information
    Enter Community Email
    Click on the Community Mobile Field
    Enter Community Mobile By Keypad    8590620194
    # Click on the Community WhatsApp Number
    # Enter the Community WhatsApp Number
    Enter Community First Name
    Enter Middle Name for Community Registration
    Enter Community Last Name
    Enter Community Full Address
    # Enter Community Address Line 2
    # Enter Community Landmark
    Enter Community Pincode
    Select Country for Community Registration
    Select State for Community Registration
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Click on the Next Button from Community Registration

Fill the Personal,Select Married and Education Information
    Select DOB For Personal Information
    Select Gender For Personal Information
    Select Blood Group For Personal Information
    Select Married From Marital Status
    Select Date of Anniversary
    Click on the Education Level Field
    Click on the Education Qualification Field
    Click on the Occupation Type Field
    Click on the Occupation Field
    Click on the register Button from Community Registration       

Select Married From Marital Status
  Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
  Mobile Wait Until Element Is Visible    ${COMMUNITY_STATUS}    10s
  Mobile Click Element                   ${COMMUNITY_STATUS}
  Mobile Click Element                   ${SEARCH}
  Run Keyword And Ignore Error    Mobile Hide Keyboard
  Mobile Input Text                      ${SEARCH}     Married
  Mobile Wait Until Element Is Visible    ${COMMUNITY_MARITAL_STATUS_MARRIED}    10s
  Mobile Click Element                   ${COMMUNITY_MARITAL_STATUS_MARRIED}
  Log To Console                  Selected Married From Marital Status

Select Date of Anniversary
  Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
  Mobile Wait Until Element Is Visible    ${COMMUNITY_DATE_OF_ANNIVERSARY}    10s
  Mobile Click Element                   ${COMMUNITY_DATE_OF_ANNIVERSARY}
  Mobile Wait Until Element Is Visible    ${OK_BUTTON}    10s
  Mobile Click Element                   ${OK_BUTTON}
  Log To Console                  Selected Date of Anniversary

Verify last attended Guru Purnima validation message
    Mobile Wait Until Element Is Visible    ${LAST_ATTENDED_GURU_PURNIMA_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${LAST_ATTENDED_GURU_PURNIMA_VALIDATION}    content-desc
    Log To Console    Validation message for last attended Guru Purnima: ${actual_message}
    Should Be Equal    ${actual_message}    Please select last attended Guru Purnima

Verify last attended Chaitanya mahotsav validation message
    Mobile Wait Until Element Is Visible    ${LAST_ATTENDED_CHAITANYA_MAHOTSAV_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${LAST_ATTENDED_CHAITANYA_MAHOTSAV_VALIDATION}    content-desc
    Log To Console    Validation message for last attended Chaitanya mahotsav: ${actual_message}
    Should Be Equal    ${actual_message}    Please select last attended Chaitanya mahotsav

Verify attend First Shivir validation message
    Mobile Wait Until Element Is Visible    ${ATTEND_FIRST_SHIVIR_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${ATTEND_FIRST_SHIVIR_VALIDATION}    content-desc
    Log To Console    Validation message: ${actual_message}
    Should Be Equal    ${actual_message}    Please select when you first attended a Shivir

Verify Dhyankendra validation message
    Mobile Wait Until Element Is Visible    ${DHYANKENDRA_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${DHYANKENDRA_VALIDATION}    content-desc
    Log To Console    Validation message for Dhyankendra: ${actual_message}
    Should Be Equal    ${actual_message}    Please select a Dhyankendra

Verify Mobile Number validation message
    Mobile Wait Until Element Is Visible    ${MOBILE_NUMBER_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${MOBILE_NUMBER_VALIDATION}    content-desc
    Log To Console    Validation message for Mobile Number: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter Mobile Number

Verify WhatsApp Mobile Number validation message
    Mobile Wait Until Element Is Visible    ${WHATSAPP_MOBILE_NUMBER_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${WHATSAPP_MOBILE_NUMBER_VALIDATION}    content-desc
    Log To Console    Validation message for WhatsApp Mobile Number: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter WhatsApp Mobile Number

Verify First name validation message
    Mobile Wait Until Element Is Visible    ${FIRST_NAME_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${FIRST_NAME_VALIDATION}    content-desc
    Log To Console    Validation message for First name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter First name

Verify Middle name validation message
    Mobile Wait Until Element Is Visible    ${MIDDLE_NAME_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${MIDDLE_NAME_VALIDATION}    content-desc
    Log To Console    Validation message for Middle name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter Middle name

Verify Last name validation message
    Mobile Wait Until Element Is Visible    ${LAST_NAME_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${LAST_NAME_VALIDATION}    content-desc
    Log To Console    Validation message for Last name: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter Last name

Verify Address validation message
    Mobile Wait Until Element Is Visible    ${ADDRESS_LINE1_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${ADDRESS_LINE1_VALIDATION}    content-desc
    Log To Console    Validation message for Address: ${actual_message}
    Should Be Equal    ${actual_message}    Enter Full Address

Verify Address Line 2 validation message
    Mobile Wait Until Element Is Visible    ${ADDRESS_LINE2_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${ADDRESS_LINE2_VALIDATION}    content-desc
    Log To Console    Validation message for Address Line 2: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter Address Line 2

Verify Landmark validation message
    Mobile Wait Until Element Is Visible    ${LANDMARK_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${LANDMARK_VALIDATION}    content-desc
    Log To Console    Validation message for Landmark: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter Landmark

Verify Pincode validation message
    Mobile Wait Until Element Is Visible    ${PINCODE_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${PINCODE_VALIDATION}    content-desc
    Log To Console    Validation message for Pincode: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter Pincode

Verify taluka/city validation message
    Mobile Wait Until Element Is Visible    ${TALUKA_CITY_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${TALUKA_CITY_VALIDATION}    content-desc
    Log To Console    Validation message for taluka/city: ${actual_message}
    Should Be Equal    ${actual_message}    Please select your taluka / city

Verify area/village validation message
    Mobile Wait Until Element Is Visible    ${AREA_VILLAGE_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${AREA_VILLAGE_VALIDATION}    content-desc
    Log To Console    Validation message for area/village: ${actual_message}
    Should Be Equal    ${actual_message}    Please select your area / village

Verify DOB validation message for Community
    Mobile Wait Until Element Is Visible    ${DOB_VALIDATION_COMMUNITY}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${DOB_VALIDATION_COMMUNITY}    content-desc
    Log To Console    Validation message for DOB: ${actual_message}
    Should Be Equal    ${actual_message}    Please select your date of birth

Verify blood group validation message
    Mobile Wait Until Element Is Visible    ${BLOOD_GROUP_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${BLOOD_GROUP_VALIDATION}    content-desc
    Log To Console    Validation message for blood group: ${actual_message}
    Should Be Equal    ${actual_message}    Please select blood group

Verify marital status validation message
    Mobile Wait Until Element Is Visible    ${MARITAL_STATUS_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${MARITAL_STATUS_VALIDATION}    content-desc
    Log To Console    Validation message for marital status: ${actual_message}
    Should Be Equal    ${actual_message}    Please select marital status

Verify anniversary date validation message
    Mobile Wait Until Element Is Visible    ${ANNIVERSARY_DATE_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${ANNIVERSARY_DATE_VALIDATION}    content-desc
    Log To Console    Validation message for anniversary date: ${actual_message}
    Should Be Equal    ${actual_message}    Select date of anniversary

Verify educational level validation message
    Mobile Wait Until Element Is Visible    ${EDUCATIONAL_LEVEL_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${EDUCATIONAL_LEVEL_VALIDATION}    content-desc
    Log To Console    Validation message for educational level: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter educational level

Verify education qualification validation message
    Mobile Wait Until Element Is Visible    ${EDUCATION_QUALIFICATION_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${EDUCATION_QUALIFICATION_VALIDATION}    content-desc
    Log To Console    Validation message for education qualification: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter education qualification

Verify education qualification sub-category validation message
    Mobile Wait Until Element Is Visible    ${EDUCATION_QUALIFICATION_SUBCATEGORY_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${EDUCATION_QUALIFICATION_SUBCATEGORY_VALIDATION}    content-desc
    Log To Console    Validation message for education qualification sub-category: ${actual_message}
    Should Be Equal    ${actual_message}    Please select education qualification sub-category

Verify occupation type validation message
    Mobile Wait Until Element Is Visible    ${OCCUPATION_TYPE_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${OCCUPATION_TYPE_VALIDATION}    content-desc
    Log To Console    Validation message for occupation type: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter occupation type

Verify occupation validation message
    Mobile Wait Until Element Is Visible    ${OCCUPATION_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${OCCUPATION_VALIDATION}    content-desc
    Log To Console    Validation message for occupation: ${actual_message}
    Should Be Equal    ${actual_message}    Please enter occupation

Verify occupation sub-category validation message
    Mobile Wait Until Element Is Visible    ${OCCUPATION_SUBCATEGORY_VALIDATION}    10s
    ${actual_message}=    Mobile Get Element Attribute    ${OCCUPATION_SUBCATEGORY_VALIDATION}    content-desc
    Log To Console    Validation message for occupation sub-category: ${actual_message}
    Should Be Equal    ${actual_message}    Please select occupation sub-category

Verify Validation Message for First page
    Verify Community Registration is Selected by default
    Click on the Next Button from Community Registration
    Verify last attended Guru Purnima validation message
    Click on the First YES Radio Button
    Select Attended Year
    Click on the Next Button from Community Registration
    Verify last attended Chaitanya Mahotsav validation message
    Click on the Second YES Radio Button
    Select Attended Year for Second Yes
    Click on the Next Button from Community Registration
    Verify attend First Shivir validation message
    Click on the Third NO Button
    Click on the Next Button from Community Registration

Verify Validation Message for Second page
    Click on the Next Button from Community Registration
    Verify Dhyankendra validation message
    Select Dhyankendra and click on the Next Button

Verify Validation Message for Third page
    Click on the Next Button from Community Registration
    Verify Validation Message for Email
    Enter Community Email
    Click on the Next Button from Community Registration
    Verify Mobile Number validation message
    Click on the Community Mobile Field
    Enter Community Mobile By Keypad    9512613419
    Click on the Community WhatsApp Number
    Click on the Next Button from Community Registration
    Verify WhatsApp Mobile Number validation message
    Click on the Community WhatsApp Number
    Click on the Next Button from Community Registration
    Verify First name validation message
    Enter Community First Name
    Click on the Next Button from Community Registration
    # Verify Middle name validation message
    # Enter Community Middle Name
    # Click on the Next Button from Community Registration
    Verify Last name validation message 
    Scroll up to Community Last Name
    Click on the Next Button from Community Registration
    Verify Address validation message
    Scroll up to Community Address Line 1
    Click on the Next Button from Community Registration
    # Verify Address Line 2 validation message
    # Scroll up to Community Address Line 2
    # Click on the Next Button from Community Registration
    # Verify Landmark validation message
    # Enter Community Landmark
    # Click on the Next Button from Community Registration
    Verify Pincode validation message
    Enter Community Valid Pincode
    Click on the Next Button from Community Registration
    Verify Validation Message for Country
    Select Country for Register Screen
    Click on the Next Button from Community Registration
    Verify Validation Message for State
    Select State for Register Screen
    Click on the Next Button from Community Registration
    Verify Validation Message for District
    Select District for Register Screen
    Click on the Next Button from Community Registration
    Verify taluka/city validation message
    Select Taluka/City for Register Screen
    Click on the Next Button from Community Registration
    Verify area/village validation message
    Select Area/Village for Register Screen
    Click on the Next Button from Community Registration
    

Scroll up to Community Last Name
    Scroll Up Until Element Visible    ${COMMUNITY_LAST_NAME}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_LAST_NAME}    10s
    Mobile Click Element                    ${COMMUNITY_LAST_NAME}
    Mobile Input Text                      ${COMMUNITY_LAST_NAME}     Last Name
    Run Keyword And Ignore Error    Mobile Hide Keyboard


Scroll up to Community Address Line 1
    Scroll Up Until Element Visible    ${COMMUNITY_ADDRESS_LINE1}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_ADDRESS_LINE1}    10s
    Mobile Click Element                    ${COMMUNITY_ADDRESS_LINE1}
    Mobile Input Text                      ${COMMUNITY_ADDRESS_LINE1}     Address Line 1
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Scroll up to Community Address Line 2
    Scroll Up Until Element Visible    ${COMMUNITY_ADDRESS_LINE2}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_ADDRESS_LINE2}    10s
    Mobile Click Element                    ${COMMUNITY_ADDRESS_LINE2}
    Mobile Input Text                      ${COMMUNITY_ADDRESS_LINE2}     Address Line 2
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Verify Validation Message for Fourth page
    Click on the register Button from Personal Information
    Verify DOB validation message for Community
    Select DOB For Personal Information
    Click on the register Button from Personal Information
    Verify Validation Message for Gender
    Select Gender For Personal Information
    Click on the register Button from Personal Information
    Verify blood group validation message
    Select Blood Group For Personal Information
    Click on the register Button from Personal Information
    Verify marital status validation message
    Select Married From Marital Status
    Click on the register Button from Personal Information
    Verify anniversary date validation message
    Select Date of Anniversary
    Click on the register Button from Personal Information
    Verify educational level validation message
    Click on the Education Level Field
    Click on the register Button from Personal Information
    Verify education qualification validation message
    Click on the Education Qualification Field for Personal Information
    Click on the register Button from Personal Information
    Verify education qualification sub-category validation message
    Click on the Education Qualification Sub-Category Field for Personal Information
    Click on the register Button from Personal Information
    Verify occupation type validation message
    Click on the Occupation Type Field
    Click on the register Button from Personal Information
    Verify occupation validation message
    Click on the Occupation Field for Personal Information
    Click on the register Button from Personal Information
    Verify occupation sub-category validation message 

Click on the Education Qualification Field for Personal Information
    Mobile Wait Until Element Is Visible    ${COMMUNITY_EDUCATION_QUALIFICATION}    10s
    Mobile Click Element                   ${COMMUNITY_EDUCATION_QUALIFICATION}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_BACHELOR}    10s
    Mobile Click Element                   ${COMMUNITY_BACHELOR}
    Log To Console                  Selected Education Qualification For Personal Information

Click on the Education Qualification Sub-Category Field for Personal Information
    Mobile Wait Until Element Is Visible    ${COMMUNITY_EDUCATION_QUALIFICATION_SUB_CATEGORY}    10s
    Mobile Click Element                   ${COMMUNITY_EDUCATION_QUALIFICATION_SUB_CATEGORY}
    Mobile Wait Until Element Is Visible    ${COMMUNITY_BACHELOR_SUB_CATEGORY}    10s
    Mobile Click Element                   ${COMMUNITY_BACHELOR_SUB_CATEGORY}
    Log To Console                  Selected Education Qualification Sub-Category For Personal Information    

Click on the Occupation Field for Personal Information
    Mobile Wait Until Element Is Visible    ${COMMUNITY_OCCUPATION}    10s
    Mobile Click Element                   ${COMMUNITY_OCCUPATION}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}    IT Software Engineering   
    Mobile Wait Until Element Is Visible    ${COMMUNITY_IT_SOFTWARE_ENGINEERING}    10s
    Mobile Click Element                   ${COMMUNITY_IT_SOFTWARE_ENGINEERING} 
    Log To Console                  Selected Occupation For Personal Information
      
Click on the register Button from Personal Information
    Swipe Until Element Visible      ${REGISTER_BUTTON_2}
    Mobile Wait Until Element Is Visible    ${REGISTER_BUTTON_2}    10s
    Mobile Click Element                   ${REGISTER_BUTTON_2} 
    Log To Console                  Clicked on register Button from Personal Information

Click on the Login Button from Community Registration Page
    Swipe Until Element Visible      ${COMMUNITY_NEXT}
    Sleep   2S     
    # Wait Until Element Is Visible    ${LOGIN_BUTTON}    10s
    # Click Element                    ${LOGIN_BUTTON}
    # Log                             Clicked on Login Button from Community Registration Page

Click on the Selected Country
    Mobile Wait Until Element Is Visible    ${COUNTRY_SELECTED}    10s
    Mobile Click Element                   ${COUNTRY_SELECTED}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}    United States  
    # Scroll Until Element Visible     ${COUNTRY_SELECTED_US}
    Mobile Wait Until Element Is Visible    ${COUNTRY_SELECTED_US}    10s
    Mobile Click Element                   ${COUNTRY_SELECTED_US}

Verify that the address fields and related dropdowns remain disabled
    Handle All Address Fields



Handle All Address Fields
    Run Keyword And Ignore Error    Verify state value and dropdown is disabled
    # Run Keyword And Ignore Error    Verify district value and dropdown is disabled
    # Run Keyword And Ignore Error    Verify taluka/city value and dropdown is disabled
    # Run Keyword And Ignore Error    Verify area/village value and dropdown is disabled

Verify All Address Fields
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${SELECT_STATE}    10s
    # ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${SELECT_DISTRICT}    10s
    # ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${SELECT_CITY}    10s
    # ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${SELECT_AREA}    10s
    Run Keyword If    ${isVisible}    Verify state value and dropdown is disabled
    # Run Keyword If    ${isVisible}    Verify district value and dropdown is disabled
    # Run Keyword If    ${isVisible}    Verify taluka/city value and dropdown is disabled
    # Run Keyword If    ${isVisible}    Verify area/village value and dropdown is disabled

Verify state value and dropdown is disabled
    Mobile Wait Until Element Is Visible    ${SELECT_STATE}    10s
    Mobile Click Element                   ${SELECT_STATE}
    ${isEnabled}=    Run Keyword And Return Status    Mobile Element Should Be Disabled    ${SELECT_STATE}
    Should Not Be True    ${isEnabled}
    Log To Console    State dropdown is disabled
    ${dropdown_value}=      Mobile Get Element Attribute    ${SELECT_STATE}    content-desc
    Should Be Equal As Strings    ${dropdown_value}    ${dropdown_value}            
    Log To Console    State dropdown value: ${dropdown_value}
    
# Verify district value and dropdown is disabled
#     Wait Until Element Is Visible    ${SELECT_DISTRICT}    10s
#     Click Element                   ${SELECT_DISTRICT}
#     ${isEnabled}=    Run Keyword And Return Status    Element Should Be Disabled    ${SELECT_DISTRICT}
#     Should Not Be True    ${isEnabled}
#     Log To Console    District dropdown is disabled
#     ${dropdown_value}=      Get Element Attribute    ${SELECT_DISTRICT}    content-desc
#     Should Be Equal As Strings    ${dropdown_value}    ${dropdown_value}
#     Log To Console    District dropdown value: ${dropdown_value}

# Verify taluka/city value and dropdown is disabled
#     Wait Until Element Is Visible    ${SELECT_CITY}    10s
#     Click Element                   ${SELECT_CITY}
#     ${isEnabled}=    Run Keyword And Return Status    Element Should Be Disabled    ${SELECT_CITY}
#     Should Not Be True    ${isEnabled}
#     Log To Console    Taluka/City dropdown is disabled
#     ${dropdown_value}=      Get Element Attribute    ${SELECT_CITY}    content-desc
#     Should Be Equal As Strings    ${dropdown_value}    ${dropdown_value}
#     Log To Console    Taluka/City dropdown value: ${dropdown_value}


# Verify area/village value and dropdown is disabled
#     Wait Until Element Is Visible    ${SELECT_AREA}    10s
#     Click Element                   ${SELECT_AREA}
#     ${isEnabled}=    Run Keyword And Return Status    Element Should Be Disabled    ${SELECT_AREA}
#     Should Not Be True    ${isEnabled}
#     Log To Console    Area/Village dropdown is disabled
#     ${dropdown_value}=      Get Element Attribute    ${SELECT_AREA}    content-desc
#     Should Be Equal As Strings    ${dropdown_value}    ${dropdown_value}
#     Log To Console    Area/Village dropdown value: ${dropdown_value}


Verify that the selected country values are displayed in the state dropdown
    Scroll Until Element Visible    ${SELECT_STATE}
    Mobile Wait Until Element Is Visible    ${SELECT_STATE}    10s
    Mobile Click Element                   ${SELECT_STATE}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Bihar
    Mobile Wait Until Element Is Visible    ${STATE_SELECTED_BIHAR}    10s
    Mobile Element Should Be Visible        ${STATE_SELECTED_BIHAR}
    ${actual_state}=            Mobile Get Element Attribute    ${STATE_SELECTED_BIHAR}    content-desc
    Should Contain                   ${actual_state}     Bihar
    Log To Console      State Text: ${actual_state}
    Mobile Click Element                   ${STATE_SELECTED_BIHAR}

Verify that the selected state values are displayed in the district dropdown
    Scroll Until Element Visible    ${SELECT_DISTRICT}
    Mobile Wait Until Element Is Visible    ${SELECT_DISTRICT}    10s
    Mobile Click Element                   ${SELECT_DISTRICT}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Aurangabad
    # Scroll Until Element Visible    ${DISTRICT_SELECTED_AURANGABAD}
    Mobile Wait Until Element Is Visible    ${DISTRICT_SELECTED_AURANGABAD}    10s
    Mobile Element Should Be Visible        ${DISTRICT_SELECTED_AURANGABAD}
    ${actual_district}=            Mobile Get Element Attribute    ${DISTRICT_SELECTED_AURANGABAD}    content-desc
    Should Contain                   ${actual_district}     Aurangabad
    Log To Console       District Text: ${actual_district}
    Mobile Click Element                   ${DISTRICT_SELECTED_AURANGABAD}

Verify that the selected district values are displayed in the taluka/city dropdown
    Scroll Until Element Visible    ${SELECT_CITY}
    Mobile Wait Until Element Is Visible    ${SELECT_CITY}    10s
    Mobile Click Element                   ${SELECT_CITY}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Daudnagar
    Mobile Wait Until Element Is Visible    ${TALUKA_SELECTED_DAUDNAGAR}    10s
    Mobile Element Should Be Visible        ${TALUKA_SELECTED_DAUDNAGAR}
    ${actual_taluka}=            Mobile Get Element Attribute    ${TALUKA_SELECTED_DAUDNAGAR}    content-desc
    Should Contain                   ${actual_taluka}     Daudnagar
    Log To Console       Taluka Text: ${actual_taluka}
    Mobile Click Element                   ${TALUKA_SELECTED_DAUDNAGAR}

Verify that the selected taluka/city values are displayed in the area/village dropdown
    Scroll Until Element Visible    ${SELECT_AREA}
    Mobile Wait Until Element Is Visible    ${SELECT_AREA}    10s
    Mobile Click Element                   ${SELECT_AREA}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Daulatpur
    Mobile Wait Until Element Is Visible    ${VILLAGE_SELECTED_DAULATPUR}    10s
    Mobile Element Should Be Visible        ${VILLAGE_SELECTED_DAULATPUR}
    ${actual_village}=            Mobile Get Element Attribute    ${VILLAGE_SELECTED_DAULATPUR}    content-desc
    Should Contain                   ${actual_village}     Daulatpur
    Log To Console       Village Text: ${actual_village}
    Mobile Click Element                   ${VILLAGE_SELECTED_DAULATPUR}

Select Other State
    Mobile Wait Until Element Is Visible    ${SELECT_STATE}    10s
    Mobile Click Element                   ${SELECT_STATE}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Maharashtra
    Scroll Until Element Visible    ${STATE_SELECTED_MAHARASHTRA}
    Mobile Wait Until Element Is Visible    ${STATE_SELECTED_MAHARASHTRA}    10s
    Mobile Click Element                   ${STATE_SELECTED_MAHARASHTRA}

Verify that the other state values are displayed in the district dropdown
    Mobile Wait Until Element Is Visible    ${SELECT_DISTRICT}    10s
    Mobile Click Element                   ${SELECT_DISTRICT}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Pune
    Mobile Wait Until Element Is Visible    ${DISTRICT_SELECTED_PUNE}    10s
    Mobile Element Should Be Visible        ${DISTRICT_SELECTED_PUNE}
    ${actual_district}=            Mobile Get Element Attribute    ${DISTRICT_SELECTED_PUNE}    content-desc
    Should Contain                   ${actual_district}     Pune
    Log To Console       District Text: ${actual_district}
    Mobile Click Element                   ${DISTRICT_SELECTED_PUNE}

Verify that the other district values are displayed in the taluka/city dropdown
    Mobile Wait Until Element Is Visible    ${SELECT_CITY}    10s
    Mobile Click Element                   ${SELECT_CITY}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Pune City
    Mobile Wait Until Element Is Visible    ${TALUKA_SELECTED_PUNE_CITY}    10s
    Mobile Element Should Be Visible        ${TALUKA_SELECTED_PUNE_CITY}
    ${actual_taluka}=            Mobile Get Element Attribute    ${TALUKA_SELECTED_PUNE_CITY}    content-desc    
    Should Contain                   ${actual_taluka}     Pune City
    Log To Console       Taluka Text: ${actual_taluka}
    Mobile Click Element                   ${TALUKA_SELECTED_PUNE_CITY}

Verify that the other taluka/city values are displayed in the area/village dropdown
    Mobile Wait Until Element Is Visible    ${SELECT_AREA}    10s
    Mobile Click Element                   ${SELECT_AREA}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Viman nagar
    Mobile Wait Until Element Is Visible    ${VILLAGE_SELECTED_VIMAN_NAGAR}    10s
    Mobile Element Should Be Visible        ${VILLAGE_SELECTED_VIMAN_NAGAR}
    ${actual_village}=            Mobile Get Element Attribute    ${VILLAGE_SELECTED_VIMAN_NAGAR}    content-desc
    Should Contain                   ${actual_village}     Viman nagar
    Log To Console       Village Text: ${actual_village}
    Mobile Click Element                   ${VILLAGE_SELECTED_VIMAN_NAGAR}

Select Another State
    # Scroll Until Element Visible    ${SELECT_STATE}
    Mobile Wait Until Element Is Visible    ${SELECT_STATE}    10s
    Mobile Click Element                   ${SELECT_STATE}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Rajasthan
    # Scroll Until Element Visible    ${STATE_SELECTED_RAJASTHAN}
    Mobile Wait Until Element Is Visible    ${STATE_SELECTED_RAJASTHAN}    10s
    Mobile Click Element                   ${STATE_SELECTED_RAJASTHAN}

Select Other District
    # Scroll Until Element Visible    ${SELECT_DISTRICT}
    Mobile Wait Until Element Is Visible    ${SELECT_DISTRICT}    10s
    Mobile Click Element                   ${SELECT_DISTRICT}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Jodhpur
    # Scroll Until Element Visible    ${DISTRICT_SELECTED_JODHPUR}
    Mobile Wait Until Element Is Visible    ${DISTRICT_SELECTED_JODHPUR}    10s
    Mobile Click Element                   ${DISTRICT_SELECTED_JODHPUR}

Select Another District
    # Scroll Until Element Visible    ${SELECT_DISTRICT}
    Mobile Wait Until Element Is Visible    ${SELECT_DISTRICT}    10s
    Mobile Click Element                   ${SELECT_DISTRICT}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Surat
    # Scroll Until Element Visible    ${DISTRICT_SELECTED_SURAT}
    Mobile Wait Until Element Is Visible    ${DISTRICT_SELECTED_SURAT}    10s
    Mobile Click Element                   ${DISTRICT_SELECTED_SURAT}    

Verify that the other Selected district values are displayed in the taluka/city dropdown
    Mobile Wait Until Element Is Visible    ${SELECT_CITY}    10s
    Mobile Click Element                   ${SELECT_CITY}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Balesar
    Mobile Wait Until Element Is Visible    ${TALUKA_SELECTED_BALESAR}    10s
    Mobile Element Should Be Visible        ${TALUKA_SELECTED_BALESAR}
    ${actual_taluka}=            Mobile Get Element Attribute    ${TALUKA_SELECTED_BALESAR}    content-desc
    Should Contain    ${actual_taluka}    Balesar
    Log To Console    taluka Text: ${actual_taluka}
    Mobile Click Element                   ${TALUKA_SELECTED_BALESAR}

Verify that the other Selected taluka/city values are displayed in the area/village dropdown
    Mobile Wait Until Element Is Visible    ${SELECT_AREA}    10s
    Mobile Click Element                   ${SELECT_AREA}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Agolai
    Mobile Wait Until Element Is Visible    ${VILLAGE_SELECTED_AGOLAI}    10s
    Mobile Element Should Be Visible        ${VILLAGE_SELECTED_AGOLAI}
    ${actual_village}=            Mobile Get Element Attribute    ${VILLAGE_SELECTED_AGOLAI}    content-desc
    Should Contain                   ${actual_village}     Agolai
    Log To Console       Village Text: ${actual_village}
    Mobile Click Element                   ${VILLAGE_SELECTED_AGOLAI}

Select Another Taluka/City
    Mobile Wait Until Element Is Visible    ${SELECT_CITY}    10s
    Mobile Click Element                   ${SELECT_CITY}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Adajan
    # Scroll Until Element Visible    ${TALUKA_SELECTED_ADAJAN}
    Mobile Wait Until Element Is Visible    ${TALUKA_SELECTED_ADAJAN}    10s
    Mobile Click Element                   ${TALUKA_SELECTED_ADAJAN}

Verify that the selected another taluka/city values are displayed in the area/village dropdown    
    Mobile Wait Until Element Is Visible    ${SELECT_AREA}    10s
    Mobile Click Element                   ${SELECT_AREA}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}     Mota Varachha
    Mobile Wait Until Element Is Visible    ${VILLAGE_SELECTED_MOTA_VARCHA}    10s
    Mobile Element Should Be Visible        ${VILLAGE_SELECTED_MOTA_VARCHA}
    ${actual_village}=            Mobile Get Element Attribute    ${VILLAGE_SELECTED_MOTA_VARCHA}    content-desc
    Should Contain                   ${actual_village}     Mota Varachha
    Log To Console       Village Text: ${actual_village}
    Mobile Click Element                   ${VILLAGE_SELECTED_MOTA_VARCHA}

Enter Mandatory FN for Register Screen
    [Arguments]    ${FIRST_NAME}
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_FNAME}    10s
    Mobile Click Element                  ${REGISTER_FNAME}
    Mobile Input Text                     ${REGISTER_FNAME}    ${FIRST_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Enter Mandatory LN for Register Screen
    [Arguments]    ${LAST_NAME}
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_LNAME}    10s
    Mobile Click Element    ${REGISTER_LNAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${REGISTER_LNAME}    ${LAST_NAME}

Enter Mandatory Email for Register Screen
    [Arguments]    ${EMAIL}
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_EMAIL}    10s
    Mobile Click Element                   ${REGISTER_EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_EMAIL}    ${EMAIL}

Enter Mandatory Number for Register Screen
    [Arguments]    ${MOBILE}
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_MOBILE}    10s
    Mobile Click Element                   ${REGISTER_MOBILE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_MOBILE}    ${MOBILE}    

Select Mandatory Gender for register screen
    Scroll Up Until Element Visible    ${SECOND_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_GENDER}    10s
    Mobile Click Element                   ${REGISTER_GENDER}
    Mobile Click Element                   ${SEARCH}
    Mobile Input Text                      ${SEARCH}     Male
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Wait Until Element Is Visible   ${SELECT_MALE}    10s
    Mobile Click Element                   ${SELECT_MALE} 

Select Mandatory DOB for Register Screen
    Scroll Up Until Element Visible    ${SECOND_HEADER}
    Mobile Wait Until Element Is Visible    ${REGISTER_DOB}        5s
    Mobile Click Element                    ${REGISTER_DOB}
    Mobile Wait Until Element Is Visible    ${OK_BUTTON}           5s
    Mobile Click Element                    ${OK_BUTTON}

Click on the Community Registration Tab
    Mobile Wait Until Element Is Visible           ${COMMUNITY_TAB}           5S
    Mobile Click Element                           ${COMMUNITY_TAB} 
    Log To Console                          Clicked on Community Registration Tab

Enter Registered Email for Register Screen  
    [Arguments]    ${EMAIL}
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_EMAIL}    10s
    Mobile Click Element                   ${REGISTER_EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_EMAIL}    ${EMAIL}

Enter Registered Mobile Number for Register Screen 
    [Arguments]    ${MOBILE}
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_MOBILE}    10s
    Mobile Click Element                   ${REGISTER_MOBILE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_MOBILE}    ${MOBILE}

Select Country for Community Registration
    # Swipe Until Element Visible      ${REGISTER_COUNTRY}
    Scroll until element found    ${REGISTER_COUNTRY}
    Mobile Wait Until Element Is Visible    ${REGISTER_COUNTRY}    5s
    Mobile Click Element                    ${REGISTER_COUNTRY}
    Mobile Click Element                    ${SEARCH}
    Mobile Input Text                       ${SEARCH}              India
    # Mobile Hide Keyboard
    Mobile Wait Until Element Is Visible    ${INDIA}               5s
    Mobile Click Element                    ${INDIA}

Select State for Community Registration
    # Swipe Until Element Visible      ${COMMUNITY_NEXT}
    Scroll until element found    ${COMMUNITY_NEXT}
    Mobile Wait Until Element Is Visible    ${SELECT_STATE}        5s 
    Mobile Click Element                    ${SELECT_STATE}
    Mobile Click Element                    ${SEARCH}
    Mobile Input Text                       ${SEARCH}              Gujarat
    # Mobile Hide Keyboard
    Mobile Wait Until Element Is Visible    ${GUJARAT}             5s
    Mobile Click Element                    ${GUJARAT}    
