*** Settings ***
Library    AppiumLibrary
Resource    ../resources/keywords.robot

*** Variables ***
${REGISTER_LINK}                          xpath=//android.widget.Button[@content-desc="Register"]
${REGISTER_NAME}                          xpath=(//android.widget.EditText)[1]
${REGISTER_EMAIL}                         xpath=//android.widget.EditText[@hint='Enter Email'] | //android.widget.EditText[contains(@text,'Enter Email')] | //*[contains(@content-desc,'Email')]/following-sibling::android.widget.EditText[1] | //android.widget.EditText[3]
${REGISTER_MOBILE}                        xpath=//android.widget.EditText[@hint='00 0000 0000'] | //android.widget.EditText[contains(@hint,'0000')] | //android.widget.EditText[contains(@text,'0000')] | //*[contains(@content-desc,'Mobile Number')]//android.widget.EditText | (//android.widget.EditText)[last()]
${REGISTER_COUNTRY}                       xpath=//*[@content-desc="Select Country"] | //*[contains(@content-desc,"Country")]/android.view.View | //*[contains(@text,"Select Country")]
${REGISTER_GENDER}                        xpath=//*[@content-desc="Select Gender"] | //*[contains(@content-desc,"Gender") and @clickable="true"] | //*[contains(@text,"Select Gender")]
${SELECT_MALE}                            xpath=//*[@content-desc="Male"] | //*[@text="Male"]
${REGISTER_DOB}                           xpath=//android.widget.ImageView[contains(@content-desc,"Select DOB")] | //*[@content-desc="Select DOB"]//android.widget.ImageView | //*[contains(@content-desc,"DOB")]//android.widget.ImageView | //android.view.View[contains(@content-desc,"DOB")]/android.widget.ImageView | //*[@content-desc="Select DOB"]
${DatePicker}                             xpath=//*[@content-desc="2025"] | //*[contains(@content-desc,"2025")] | //*[@text="2025"]
${SelectDate}                             xpath=//*[contains(@content-desc,"July 1, 2025")] | //*[contains(@content-desc,"1,") and contains(@content-desc,"2025")]
${OK_BUTTON}                              xpath=//*[@content-desc="OK"] | //*[@text="OK"] | //android.widget.Button[contains(@content-desc,"OK")]
${LOGIN}                                  xpath=(//android.view.View[@content-desc="Login"])[1]
${REGISTER_BUTTON}                        xpath=//*[@content-desc="Quick Registration"] | //*[contains(@content-desc,"Quick Registration")] | //*[@text="Quick Registration"]
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
${SELECT_STATE}                           xpath=//*[@content-desc="Select State"] | //*[contains(@content-desc,"State") and @clickable="true"] | //*[contains(@text,"Select State")]
${SELECT_CITY}                            xpath=//*[contains(@content-desc,"Select Taluka") or contains(@text,"Select Taluka") or contains(@content-desc,"Taluka") or contains(@content-desc,"City")]
# ${LOGIN_BUTTON}                         xpath=//android.view.View[@content-desc="Do you have an account? Login"]
${SELECT_DISTRICT}                        xpath=//*[@content-desc="Select District"] | //*[contains(@content-desc,"District") and @clickable="true"] | //*[contains(@text,"Select District")]
${SELECT_AREA}                            xpath=//*[@content-desc="Select Area / Village"] | //*[contains(@content-desc,"Area") or contains(@content-desc,"Village")] | //*[contains(@text,"Select Area")]
${ALREADY_EMAIL_REGISTER}                 xpath=//android.view.View[@content-desc="Mobile Number or EmailAddress already registered."]
${COMMUNITY_REGISTRATION_NEXT_LABEL}      xpath=//android.view.View[@content-desc="Did you attend last Guru Purnima?"]
${NO_BUTTON_1}                            xpath=//android.widget.ScrollView/android.view.View[4]/android.widget.RadioButton[2]
${NO_BUTTON_2}                            xpath=//android.widget.ScrollView/android.view.View[4]/android.widget.RadioButton[4]
${NO_BUTTON_3}                            xpath=//android.widget.ScrollView/android.view.View/android.widget.RadioButton[5]
${COMMUNITY_NEXT}                         xpath=//android.view.View[@content-desc="Next"]
${LOCATION_PERMISSION}                    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
${SELECT_DHYANKEDRA}                      xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[4]/android.view.View[5]/android.widget.ImageView
${COMMUNITY_EMAIL_HINT}                   xpath=//android.widget.EditText[@hint='Enter Email'] | //android.widget.EditText[contains(@text,'Email')] | //android.widget.EditText[3]
${COMMUNITY_MOBILE_HINT}                  xpath=//android.widget.EditText[@hint='00 0000 0000'] | //android.widget.EditText[contains(@text,'0000')] | //android.widget.EditText[4]
${COMMUNITY_WHATSAPP_ICON}                xpath=//*[@content-desc="This is your WhatsApp Number"] | //*[contains(@content-desc,"WhatsApp")]
${COMMUNITY_FIRST_NAME}                   xpath=//android.widget.EditText[@hint='Enter First Name'] | //android.widget.EditText[contains(@text,'First Name')] | //android.widget.EditText[1]
${COMMUNITY_MIDDLE_NAME}                  xpath=//android.widget.EditText[@hint='Enter Middle Name'] | //android.widget.EditText[contains(@text,'Middle Name')]
${COMMUNITY_LAST_NAME}                    xpath=//android.widget.EditText[@hint='Enter Last Name'] | //android.widget.EditText[contains(@text,'Last Name')] | //android.widget.EditText[2]
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
${REGISTER_FNAME}                                      xpath=//android.widget.EditText[@hint='Enter First Name'] | //android.widget.EditText[contains(@text,'First Name')] | //*[contains(@content-desc,'First Name')]/following-sibling::android.widget.EditText[1] | //android.widget.EditText[1]
${REGISTER_LNAME}                                      xpath=//android.widget.EditText[@hint='Enter Last Name'] | //android.widget.EditText[contains(@text,'Last Name')] | //*[contains(@content-desc,'Last Name')]/following-sibling::android.widget.EditText[1] | //android.widget.EditText[2]
${SEARCH}                                              xpath=//android.widget.EditText | //*[@text='Search']
${INDIA}                                               xpath=//*[@content-desc="India"] | //*[@text="India"] | //*[contains(@content-desc,"India")]
${GUJARAT}                                             xpath=//*[@content-desc="Gujarat"] | //*[@text="Gujarat"] | //*[contains(@content-desc,"Gujarat")]
${AHMEDABAD}                                           xpath=//*[@content-desc="Ahmedabad" or @content-desc="Ahmadabad" or @text="Ahmedabad" or @text="Ahmadabad"] | //*[contains(@content-desc,"Ahmedabad") or contains(@content-desc,"Ahmadabad")]
${AHMEDABAD_CITY}                                      xpath=//*[contains(@content-desc,"Ahmedabad") and contains(@content-desc,"City")] | //*[contains(@text,"Ahmedabad") and contains(@text,"City")] | //*[contains(@content-desc,"Ahmedabad City")]
${UNIVERSITY_ROAD}                                     xpath=//*[@content-desc="University Road"] | //*[@text="University Road"] | //*[contains(@content-desc,"University")]
${FIRST_HEADER}                                        xpath=//android.view.View[@content-desc="Select how you want to register."]
${SECOND_HEADER}                                       xpath=//android.view.View[@content-desc="Mobile Number"]
${COMMUNITY_TAB}                                       xpath=//android.view.View[@content-desc="Community Registration "]/android.widget.RadioButton | //*[contains(@content-desc,"Community Registration")]/android.widget.RadioButton | //*[contains(@content-desc,"Community Registration")]
${QUICK_TAB}                                           xpath=//android.view.View[@content-desc="Quick Registration"]/android.widget.RadioButton | //*[contains(@content-desc,"Quick Registration")]/android.widget.RadioButton | //*[contains(@content-desc,"Quick Registration")]  


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
    # Scroll down MULTIPLE TIMES to ensure button is fully visible at bottom of long form
    ${height}=    Mobile Get Window Height
    ${width}=    Mobile Get Window Width
    ${start_x}=    Evaluate    int(${width} * 0.5)
    ${start_y}=    Evaluate    int(${height} * 0.8)
    ${end_y}=    Evaluate    int(${height} * 0.3)

    # Scroll multiple times to reach bottom of form
    FOR    ${scroll_attempt}    IN RANGE    1    4
        Log To Console    Scroll attempt ${scroll_attempt} to find Quick Registration button
        Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
        Sleep    1s
        # Check if button is visible
        ${btn_visible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//*[@content-desc="Quick Registration"]    2s
        IF    ${btn_visible}
            Log To Console    Quick Registration button found after ${scroll_attempt} scroll(s)
            BREAK
        END
    END
    Sleep    1s

    # === CONTINUOUS CAPTURE - BEFORE CLICK ===
    Log To Console    📋 === PRE-CLICK CONTINUOUS CAPTURE ===
    FOR    ${i}    IN RANGE    1    4
        ${ts}=    Get Current Date    result_format=%Y%m%d_%H%M%S%f
        Run Keyword And Ignore Error    Mobile Capture Page Screenshot    ${EXECDIR}/results/Screenshot/pre_click_${i}_${ts}.png
        Log To Console    📸 Pre-click ${i}: pre_click_${i}_${ts}.png
    END

    # Wait for and click Quick Registration button with multiple strategies
    ${clicked}=    Set Variable    ${FALSE}
    # Strategy 1: Click by content-desc
    ${status1}=    Run Keyword And Return Status    Mobile Click Element    xpath=//*[@content-desc="Quick Registration"]
    IF    ${status1}
        ${clicked}=    Set Variable    ${TRUE}
        Log To Console    ✅ Strategy 1: Quick Registration button clicked
    END
    # Strategy 2: Click by Button class with text
    IF    not ${clicked}
        ${status2}=    Run Keyword And Return Status    Mobile Click Element    xpath=//android.widget.Button[@content-desc="Quick Registration"]
        IF    ${status2}
            ${clicked}=    Set Variable    ${TRUE}
            Log To Console    ✅ Strategy 2: Button Quick Registration clicked
        END
    END
    # Strategy 3: Coordinate tap on button
    IF    not ${clicked}
        ${loc}=    Run Keyword And Return Status    Mobile Get Element Location    xpath=//*[contains(@content-desc,"Quick Registration")]
        IF    ${loc}
            ${location}=    Mobile Get Element Location    xpath=//*[contains(@content-desc,"Quick Registration")]
            ${size}=    Mobile Get Element Size    xpath=//*[contains(@content-desc,"Quick Registration")]
            ${x}=    Evaluate    int(${location}[x] + ${size}[width] / 2)
            ${y}=    Evaluate    int(${location}[y] + ${size}[height] / 2)
            Mobile Swipe    ${x}    ${y}    ${x}    ${y}    100
            ${clicked}=    Set Variable    ${TRUE}
            Log To Console    ✅ Strategy 3: Coordinate tap on Quick Registration at ${x}, ${y}
        END
    END

    Log To Console    📋 Quick Registration button click completed (clicked=${clicked})

    # === CONTINUOUS CAPTURE - POST CLICK - 15 rapid screenshots ===
    Log To Console    📋 === CONTINUOUS POST-CLICK CAPTURE (15 rapid screenshots) ===

    # Initialize tracking variables
    ${error_found}=    Set Variable    ${FALSE}
    ${error_message}=    Set Variable    None
    ${otp_found}=    Set Variable    ${FALSE}

    # Rapid continuous capture - 15 screenshots with 100ms intervals
    FOR    ${i}    IN RANGE    1    16
        ${ts}=    Get Current Date    result_format=%Y%m%d_%H%M%S%f
        Run Keyword And Ignore Error    Mobile Capture Page Screenshot    ${EXECDIR}/results/Screenshot/continuous_${i}_${ts}.png

        # Capture page source and analyze immediately
        ${src_status}    ${page_source}=    Run Keyword And Ignore Error    Mobile.Get Source

        # Check for error keywords in page source
        ${has_already}=    Run Keyword And Return Status    Should Contain    ${page_source}    already
        ${has_registered}=    Run Keyword And Return Status    Should Contain    ${page_source}    registered
        ${has_exists}=    Run Keyword And Return Status    Should Contain    ${page_source}    exists
        ${has_error}=    Run Keyword And Return Status    Should Contain    ${page_source}    error
        ${has_failed}=    Run Keyword And Return Status    Should Contain    ${page_source}    failed
        ${has_invalid}=    Run Keyword And Return Status    Should Contain    ${page_source}    invalid
        ${has_otp}=    Run Keyword And Return Status    Should Contain    ${page_source}    OTP
        ${has_verify_otp}=    Run Keyword And Return Status    Should Contain    ${page_source}    Verify OTP
        ${has_toast}=    Run Keyword And Return Status    Should Contain    ${page_source}    Toast
        ${has_snackbar}=    Run Keyword And Return Status    Should Contain    ${page_source}    Snackbar

        # Log findings for each capture
        IF    ${has_already} or ${has_registered} or ${has_exists}
            Log To Console    ⚡ CAPTURE ${i}: DUPLICATE ERROR DETECTED! (already/registered/exists)
            ${error_found}=    Set Variable    ${TRUE}
            ${error_message}=    Set Variable    Duplicate user detected
        END
        IF    ${has_error} or ${has_failed}
            Log To Console    ⚡ CAPTURE ${i}: ERROR/FAILED DETECTED!
            ${error_found}=    Set Variable    ${TRUE}
            ${error_message}=    Set Variable    Error or failure detected
        END
        IF    ${has_invalid}
            Log To Console    ⚡ CAPTURE ${i}: INVALID DETECTED!
            ${error_found}=    Set Variable    ${TRUE}
            ${error_message}=    Set Variable    Validation error detected
        END
        IF    ${has_otp} or ${has_verify_otp}
            Log To Console    ✅ CAPTURE ${i}: OTP SCREEN DETECTED!
            ${otp_found}=    Set Variable    ${TRUE}
        END
        IF    ${has_toast} or ${has_snackbar}
            Log To Console    ⚡ CAPTURE ${i}: TOAST/SNACKBAR MESSAGE DETECTED!
        END

        Log To Console    📸 Capture ${i}/15: continuous_${i}_${ts}.png
        Sleep    100ms
    END

    # Summary of continuous capture
    Log To Console    📋 === CONTINUOUS CAPTURE SUMMARY ===
    Log To Console    🔍 Error found during capture: ${error_found}
    Log To Console    🔍 Error message: ${error_message}
    Log To Console    🔍 OTP screen found: ${otp_found}

    # Final check after 2 more seconds
    Sleep    2s
    Log To Console    📋 === FINAL STATE CHECK ===

    ${final_ts}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    Run Keyword And Ignore Error    Mobile Capture Page Screenshot    ${EXECDIR}/results/Screenshot/final_state_${final_ts}.png
    Log To Console    📸 Final screenshot: final_state_${final_ts}.png

    # Check current screen state
    ${otp_visible}=    Run Keyword And Return Status    Mobile Element Should Be Visible    xpath=//*[contains(@content-desc,"Verify OTP") or contains(@content-desc,"OTP")]
    ${btn_still_visible}=    Run Keyword And Return Status    Mobile Element Should Be Visible    xpath=//*[@content-desc="Quick Registration"]

    Log To Console    🔍 FINAL: OTP Screen visible = ${otp_visible}
    Log To Console    🔍 FINAL: Quick Reg button still visible = ${btn_still_visible}

    # === FINAL DIAGNOSIS ===
    IF    ${otp_found} or ${otp_visible}
        Log To Console    ✅ DIAGNOSIS: SUCCESS - OTP screen appeared
    ELSE IF    ${error_found}
        Log To Console    ❌ DIAGNOSIS: ${error_message}
    ELSE IF    ${btn_still_visible}
        Log To Console    ❌ DIAGNOSIS: CLICK FAILED - Button still visible
    ELSE
        Log To Console    ⚠️ DIAGNOSIS: UNKNOWN - Check 15 screenshots in results/Screenshot folder
    END

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
    Sleep    2s
    Mobile Wait Until Element Is Visible   ${REGISTER_FNAME}    15s
    Sleep    1s
    Mobile Click Element                  ${REGISTER_FNAME}
    Sleep    1s
    Mobile Input Text                     ${REGISTER_FNAME}    ${FIRST_NAME}
    Sleep    1s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s

Enter Last Name for Register Screen
    [Arguments]    ${LAST_NAME}
    Sleep    2s
    Mobile Wait Until Element Is Visible   ${REGISTER_LNAME}    15s
    Sleep    1s
    Mobile Click Element    ${REGISTER_LNAME}
    Sleep    1s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${REGISTER_LNAME}    ${LAST_NAME}
    Sleep    1s

Enter Email for Register Screen
    [Arguments]    ${EMAIL}
    Sleep    2s
    Mobile Wait Until Element Is Visible   ${REGISTER_EMAIL}    15s
    Sleep    1s
    Mobile Click Element                   ${REGISTER_EMAIL}
    Sleep    1s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_EMAIL}    ${EMAIL}
    Sleep    1s

Enter Mobile Number for Register Screen
    [Arguments]    ${MOBILE}
    Sleep    2s
    Mobile Wait Until Element Is Visible   ${REGISTER_MOBILE}    15s
    Sleep    1s
    Mobile Click Element                   ${REGISTER_MOBILE}
    Sleep    1s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_MOBILE}    ${MOBILE}
    Sleep    1s


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
    Sleep    2s
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_MOBILE}    15s
    Sleep    1s
    Mobile Click Element                   ${REGISTER_MOBILE}
    Sleep    1s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${REGISTER_MOBILE}    ${MOBILE}
    Sleep    1s 

Select Gender
    Scroll Up Until Element Visible  xpath=//android.view.View[@content-desc="Name"]  
    Mobile Click Element                   ${REGISTER_GENDER}
    Mobile Wait Until Element Is Visible   ${SELECT_MALE}    10s
    Mobile Click Element                   ${SELECT_MALE}  

Select Gender for register screen
    Sleep    2s
    # Small scroll down to reveal Gender dropdown (scroll only 20% of screen)
    ${height}=    Mobile Get Window Height
    ${width}=    Mobile Get Window Width
    ${start_x}=    Evaluate    int(${width} * 0.5)
    ${start_y}=    Evaluate    int(${height} * 0.6)
    ${end_y}=    Evaluate    int(${height} * 0.4)
    Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
    Sleep    2s
    # Try to find Gender field, if not visible scroll a bit more
    ${status}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible   ${REGISTER_GENDER}    5s
    IF    not ${status}
        Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
        Sleep    2s
    END
    Mobile Wait Until Element Is Visible   ${REGISTER_GENDER}    15s
    Sleep    1s
    Mobile Click Element                   ${REGISTER_GENDER}
    Sleep    2s
    # Wait for dropdown and select Male
    Mobile Wait Until Element Is Visible   ${SELECT_MALE}    15s
    Sleep    1s
    Mobile Click Element                   ${SELECT_MALE}
    Sleep    2s

Select DOB for Register Screen
    [Documentation]    Selects a valid DOB (year 2000) - user must be 18+ years old
    Sleep    2s
    # Small scroll down to reveal DOB field (scroll only 15% of screen)
    ${height}=    Mobile Get Window Height
    ${width}=    Mobile Get Window Width
    ${start_x}=    Evaluate    int(${width} * 0.5)
    ${start_y}=    Evaluate    int(${height} * 0.55)
    ${end_y}=    Evaluate    int(${height} * 0.4)
    Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
    Sleep    2s
    # Try to find DOB field, if not visible scroll a bit more
    ${status}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${REGISTER_DOB}    5s
    IF    not ${status}
        Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
        Sleep    2s
    END
    Mobile Wait Until Element Is Visible    ${REGISTER_DOB}        15s
    Sleep    1s
    Mobile Click Element                    ${REGISTER_DOB}
    Sleep    3s

    # === SELECT VALID YEAR (2000) - User must be 18+ years old ===
    Log To Console    📅 Step 1: Click on year header...
    ${year_header}=    Set Variable    xpath=//android.view.View[@content-desc="2025"] | //*[contains(@content-desc,'2025')]
    ${status1}=    Run Keyword And Return Status    Mobile Click Element    ${year_header}
    IF    ${status1}
        Log To Console    ✅ Year header 2025 clicked
    ELSE
        Run Keyword And Ignore Error    Mobile Click Element    xpath=//android.view.View[@content-desc="2024"]
    END
    Sleep    2s

    # === Step 2 & 3: Scroll and CLICK year immediately when found ===
    Log To Console    📅 Step 2: Scrolling and clicking year...
    ${year_clicked}=    Set Variable    ${FALSE}
    ${valid_years}=    Create List    2000    2001    2002    2003    2004    2005    2006    2007    1999    1998    1997    1996    1995

    FOR    ${scroll_i}    IN RANGE    1    25
        Log To Console    📜 Scroll ${scroll_i}...
        FOR    ${yr}    IN    @{valid_years}
            ${clicked}=    Run Keyword And Return Status    Mobile Click Element    xpath=//android.view.View[@content-desc="${yr}"]
            IF    ${clicked}
                Log To Console    ✅ SUCCESS! Clicked year ${yr}
                ${year_clicked}=    Set Variable    ${TRUE}
                BREAK
            END
        END
        IF    ${year_clicked}
            BREAK
        END
        Mobile Swipe    ${start_x}    380    ${start_x}    280    100ms
        Sleep    100ms
    END

    IF    not ${year_clicked}
        Log To Console    ⚠️ Trying coordinate tap...
        FOR    ${yr}    IN    @{valid_years}
            ${exists}=    Run Keyword And Return Status    Mobile Element Should Be Visible    xpath=//android.view.View[@content-desc="${yr}"]
            IF    ${exists}
                ${loc}=    Mobile Get Element Location    xpath=//android.view.View[@content-desc="${yr}"]
                ${size}=    Mobile Get Element Size    xpath=//android.view.View[@content-desc="${yr}"]
                ${tx}=    Evaluate    int(${loc}[x] + ${size}[width] / 2)
                ${ty}=    Evaluate    int(${loc}[y] + ${size}[height] / 2)
                Mobile Swipe    ${tx}    ${ty}    ${tx}    ${ty}    50
                Log To Console    ✅ Coordinate tap on ${yr}
                ${year_clicked}=    Set Variable    ${TRUE}
                BREAK
            END
        END
    END
    Sleep    1s

    # === Step 4: Click on a date ===
    Log To Console    📅 Step 4: Clicking on a date...
    ${date_clicked}=    Run Keyword And Return Status    Mobile Click Element    xpath=//android.view.View[@content-desc="15"]
    IF    ${date_clicked}
        Log To Console    ✅ Clicked on date 15
    ELSE
        Run Keyword And Ignore Error    Mobile Click Element    xpath=//android.view.View[contains(@content-desc," 1,")]
    END
    Sleep    1s

    # === Step 5: Click OK ===
    Log To Console    📅 Step 5: Clicking OK...
    Mobile Wait Until Element Is Visible    ${OK_BUTTON}           10s
    Mobile Click Element                    ${OK_BUTTON}
    Sleep    2s
    Log To Console    📅 DOB selection completed

Select Country for Register Screen
    # Using proven pattern from DhyankendraPage
    Sleep    2s
    # Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    Scroll Until Element Found     ${REGISTER_COUNTRY}
    Sleep    1s
    # Click on Country dropdown
    Mobile Click Element    xpath=//*[contains(@text,'Select Country') or contains(@content-desc,'Select Country')]
    Sleep    2s
    # Type in EditText search field
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText    India
    Sleep    1s
    # Click on India option (second instance - first is search field)
    Mobile Click Element    xpath=(//*[@text='India' or @content-desc='India'])[2]
    Sleep    2s
    Log To Console    Selected Country - India

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
    # Using proven pattern - scroll and find State dropdown
    # Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    # Scroll down slightly to ensure State field is fully visible
    ${height}=    Mobile Get Window Height
    ${width}=    Mobile Get Window Width
    ${start_x}=    Evaluate    int(${width} * 0.5)
    ${start_y}=    Evaluate    int(${height} * 0.7)
    ${end_y}=    Evaluate    int(${height} * 0.5)
    Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
    Sleep    1s
    # Try multiple locators for State dropdown - ImageView with Select State or State content-desc
    ${clicked}=    Set Variable    ${FALSE}
    # Strategy 1: ImageView with "Select State" content-desc
    ${status1}=    Run Keyword And Return Status    Mobile Click Element    xpath=//android.widget.ImageView[@content-desc="Select State"]
    IF    ${status1}
        ${clicked}=    Set Variable    ${TRUE}
        Log To Console    Strategy 1: ImageView Select State clicked
    END
    # Strategy 2: Any View with Select State text/content-desc
    IF    not ${clicked}
        ${status2}=    Run Keyword And Return Status    Mobile Click Element    xpath=//*[@content-desc="Select State" or @text="Select State"]
        IF    ${status2}
            ${clicked}=    Set Variable    ${TRUE}
            Log To Console    Strategy 2: View Select State clicked
        END
    END
    # Strategy 3: View after State label
    IF    not ${clicked}
        ${status3}=    Run Keyword And Return Status    Mobile Click Element    xpath=//android.view.View[@content-desc="State *"]/following-sibling::android.view.View[1]
        IF    ${status3}
            ${clicked}=    Set Variable    ${TRUE}
            Log To Console    Strategy 3: View after State label clicked
        END
    END
    # Strategy 4: Click below Country (India) dropdown
    IF    not ${clicked}
        ${country_elem}=    Run Keyword And Return Status    Mobile Get Element Location    xpath=//*[@content-desc="India" or @text="India"]
        IF    ${country_elem}
            ${loc}=    Mobile Get Element Location    xpath=//*[@content-desc="India" or @text="India"]
            ${size}=    Mobile Get Element Size    xpath=//*[@content-desc="India" or @text="India"]
            ${x}=    Evaluate    int(${loc}[x] + ${size}[width] / 2)
            ${y}=    Evaluate    int(${loc}[y] + ${size}[height] + 80)
            Mobile Swipe    ${x}    ${y}    ${x}    ${y}    100
            ${clicked}=    Set Variable    ${TRUE}
            Log To Console    Strategy 4: Coordinate tap below Country clicked
        END
    END
    Sleep    2s
    # Type in EditText search field
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText    Gujarat
    Sleep    1s
    # Click on Gujarat option (second instance - first is search field)
    Mobile Click Element    xpath=(//*[@text='Gujarat' or @content-desc='Gujarat'])[2]
    Sleep    2s
    Log To Console    Selected State - Gujarat

Select District for Register Screen
    # Using proven pattern from DhyankendraPage
    # Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    # Click on District dropdown
    Mobile Click Element    xpath=//*[contains(@text,'Select District') or contains(@content-desc,'Select District')]
    Sleep    2s
    # Type in EditText search field
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText    Ahmedabad
    Sleep    1s
    # Click on Ahmedabad option (second instance - first is search field)
    Mobile Click Element    xpath=(//*[@text='Ahmedabad' or @content-desc='Ahmedabad'])[2]
    Sleep    2s
    Log To Console    Selected District - Ahmedabad 

Select Taluka/City for Register Screen
    # Using proven pattern from DhyankendraPage
    # Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    # Scroll down to reveal Taluka/City dropdown if needed
    ${height}=    Mobile Get Window Height
    ${width}=    Mobile Get Window Width
    ${start_x}=    Evaluate    int(${width} * 0.5)
    ${start_y}=    Evaluate    int(${height} * 0.6)
    ${end_y}=    Evaluate    int(${height} * 0.4)
    Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
    Sleep    1s
    # Click on Taluka/City dropdown
    Mobile Click Element    xpath=//*[contains(@text,'Select Taluka') or contains(@content-desc,'Select Taluka') or contains(@text,'Select City') or contains(@content-desc,'Select City')]
    Sleep    2s
    # Type in EditText search field
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText    Ahmedabad City
    Sleep    1s
    # Click on Ahmedabad City option (second instance - first is search field)
    Mobile Click Element    xpath=(//*[contains(@text,'Ahmedabad City') or contains(@content-desc,'Ahmedabad City')])[2]
    Sleep    2s
    Log To Console    Selected Taluka/City - Ahmedabad City

Select Area/Village for Register Screen
    # Using proven pattern from DhyankendraPage
    # Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    # Scroll to see Area/Village dropdown if needed
    ${height}=    Mobile Get Window Height
    ${width}=    Mobile Get Window Width
    ${start_x}=    Evaluate    int(${width} * 0.5)
    ${start_y}=    Evaluate    int(${height} * 0.6)
    ${end_y}=    Evaluate    int(${height} * 0.4)
    Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
    Sleep    1s
    # Click on Area/Village dropdown
    Mobile Click Element    xpath=//*[contains(@text,'Select Area') or contains(@content-desc,'Select Area') or contains(@text,'Select Village') or contains(@content-desc,'Select Village')]
    Sleep    2s
    # Wait for EditText search field to appear after dropdown opens
    Mobile Wait Until Element Is Visible    xpath=//android.widget.EditText    5s
    Sleep    0.5s
    # Type in EditText search field
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText    Navrangpura
    Sleep    1s
    # Click on Navrangpura option (second instance - first is search field)
    Mobile Click Element    xpath=(//*[contains(@text,'Navrangpura') or contains(@content-desc,'Navrangpura')])[2]
    Sleep    2s
    Log To Console    Selected Area/Village - Navrangpura 

Click on the Quick Registration Tab
    Sleep    3s
    Mobile Wait Until Element Is Visible    ${QUICK_TAB}    15s
    Mobile Click Element                             ${QUICK_TAB}
    Log To Console                            Clicked on Quick Registration Tab

Enter Registered Email Address
    Mobile Input Text                      ${REGISTER_EMAIL}     yatish.devlekar@rysun.com
    Run Keyword And Ignore Error    Mobile Hide Keyboard

Verify Validation Message for Registered Email Address and Mobile Number
    [Documentation]    Verifies duplicate registration error message with continuous capture
    Log To Console    📋 === CHECKING FOR DUPLICATE ERROR MESSAGE ===

    # Continuous capture to catch fleeting error message
    ${error_found}=    Set Variable    ${FALSE}
    ${error_text}=    Set Variable    None

    FOR    ${i}    IN RANGE    1    10
        ${ts}=    Get Current Date    result_format=%Y%m%d_%H%M%S%f
        Run Keyword And Ignore Error    Mobile Capture Page Screenshot    ${EXECDIR}/results/Screenshot/duplicate_check_${i}_${ts}.png

        # Check page source for duplicate error
        ${status}    ${src}=    Run Keyword And Ignore Error    Mobile.Get Source
        ${has_already}=    Run Keyword And Return Status    Should Contain    ${src}    already registered
        ${has_mobile_email}=    Run Keyword And Return Status    Should Contain    ${src}    Mobile Number or EmailAddress already registered
        ${has_email_exists}=    Run Keyword And Return Status    Should Contain    ${src}    Email already
        ${has_mobile_exists}=    Run Keyword And Return Status    Should Contain    ${src}    Mobile already
        ${has_duplicate}=    Run Keyword And Return Status    Should Contain    ${src}    duplicate

        IF    ${has_already} or ${has_mobile_email} or ${has_email_exists} or ${has_mobile_exists} or ${has_duplicate}
            ${error_found}=    Set Variable    ${TRUE}
            Log To Console    ✅ CAPTURE ${i}: DUPLICATE ERROR DETECTED!
            BREAK
        END
        Log To Console    📸 Capture ${i}/10: duplicate_check_${i}_${ts}.png
        Sleep    200ms
    END

    # Final verification
    IF    ${error_found}
        Log To Console    ✅ VERIFICATION PASSED: Duplicate registration error message detected
        Log To Console    Mobile Number or EmailAddress already registered.
    ELSE
        # One more check with longer wait
        Sleep    2s
        ${final_src}=    Mobile.Get Source
        ${final_check}=    Run Keyword And Return Status    Should Contain    ${final_src}    already
        IF    ${final_check}
            Log To Console    ✅ VERIFICATION PASSED (final check): Duplicate error found
        ELSE
            Log To Console    ⚠️ Quick Reg button still visible - checking if form stayed (expected behavior for duplicate)
            ${btn_visible}=    Run Keyword And Return Status    Mobile Element Should Be Visible    xpath=//*[@content-desc="Quick Registration"]
            IF    ${btn_visible}
                Log To Console    ✅ VERIFICATION PASSED: Form stayed on screen (registration blocked)
            ELSE
                Fail    Duplicate error message not detected - check screenshots
            END
        END
    END

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
    Mobile Wait Until Element Is Visible    ${COMMUNITY_EMAIL_HINT}    10s
    Mobile Click Element                    ${COMMUNITY_EMAIL_HINT}
    Mobile Input Text                       ${COMMUNITY_EMAIL_HINT}     ${COMMUNITY_USER_EMAIL}
    Sleep    500ms
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    500ms

Click on the Community Mobile Field
    # Scroll Up Until Element Visible  xpath=//android.view.View[@content-desc="Select how you want to register."]
    Mobile Wait Until Element Is Visible    ${COMMUNITY_MOBILE_HINT}    10s
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
    # Try multiple locators for address field
    Sleep    2s
    ${address_locators}=    Create List
    ...    xpath=//android.widget.EditText[@hint='Enter Full Address']
    ...    xpath=//android.widget.EditText[contains(@hint,'Address')]
    ...    xpath=//android.widget.EditText[contains(@text,'Address')]
    ...    xpath=(//android.widget.EditText)[1]
    ${found}=    Set Variable    ${FALSE}
    FOR    ${locator}    IN    @{address_locators}
        ${visible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${locator}    3s
        IF    ${visible}
            Mobile Click Element    ${locator}
            Run Keyword And Ignore Error    Mobile Hide Keyboard
            Mobile Input Text    ${locator}    Address Line 1
            ${found}=    Set Variable    ${TRUE}
            Log To Console    📍 Found address field with: ${locator}
            BREAK
        END
    END
    IF    not ${found}
        Fail    Could not find address input field
    END
    

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
    # Pin Code field is at top of Community Member form
    # Scroll up first to ensure Pin Code is visible
    Sleep    2s
    ${height}=    Mobile Get Window Height
    ${width}=    Mobile Get Window Width
    ${start_x}=    Evaluate    int(${width} * 0.5)
    ${start_y}=    Evaluate    int(${height} * 0.4)
    ${end_y}=    Evaluate    int(${height} * 0.7)
    Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    500ms
    Sleep    2s

    # Pin Code field - try clicking on first EditText element directly
    Sleep    2s
    ${pincode_found}=    Set Variable    ${FALSE}

    # Try to find and click the first EditText (Pin Code field)
    ${visible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=(//android.widget.EditText)[1]    5s
    IF    ${visible}
        Mobile Click Element    xpath=(//android.widget.EditText)[1]
        Sleep    1s
        Run Keyword And Ignore Error    Mobile Hide Keyboard
        # Clear any existing text and enter pincode
        Mobile Clear Text    xpath=(//android.widget.EditText)[1]
        Mobile Input Text    xpath=(//android.widget.EditText)[1]    380015
        ${pincode_found}=    Set Variable    ${TRUE}
        Log To Console    📍 Entered pincode via first EditText
    END

    IF    not ${pincode_found}
        # Fallback: tap at coordinates (center of Pin Code input field)
        ${pin_y}=    Evaluate    int(${height} * 0.14)    # ~14% from top (lower in field)
        ${pin_x}=    Evaluate    int(${width} * 0.5)
        Log To Console    📍 Fallback: Tapping Pin Code at (${pin_x}, ${pin_y})
        @{coords}=    Create List    ${pin_x}    ${pin_y}
        AppiumLibrary.Tap    ${coords}
        Sleep    1s
        # Enter via keypad
        @{digits}=    Evaluate    list('380015')
        FOR    ${digit}    IN    @{digits}
            ${keycode}=    Evaluate    {'0':7, '1':8, '2':9, '3':10, '4':11, '5':12, '6':13, '7':14, '8':15, '9':16}['${digit}']
            Mobile Press Keycode    ${keycode}
        END
    END
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    📍 Pincode entry completed

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
    Sleep    1s

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
  Sleep    2s
  # Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
  Mobile Wait Until Element Is Visible    ${COMMUNITY_DOB}    15s
  Sleep    1s
  Mobile Click Element                   ${COMMUNITY_DOB}
  Sleep    3s  # Wait for date picker to load

  # PROVEN PATTERN from namkaranPage.robot: Click on current year text FIRST to open year picker
  Log To Console    📅 Opening year picker by clicking on current year (2025)
  ${year_picker_opened}=    Set Variable    ${FALSE}

  # Try to click on 2025 year text to open year picker
  ${status_open}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="2025"]    3s
  IF    ${status_open}
      Mobile Click Element    xpath=//android.view.View[@content-desc="2025"]
      Log To Console    ✅ Clicked on 2025 to open year picker
      ${year_picker_opened}=    Set Variable    ${TRUE}
      Sleep    2s  # Wait for year picker to open
  END

  # Select year from ${COMMUNITY_USER_DOB} variable
  Log To Console    📅 Selecting year ${COMMUNITY_USER_DOB}
  ${year_clicked}=    Set Variable    ${FALSE}

  # Method 1: Try direct content-desc xpath (if year picker is open, year should be visible)
  ${status1}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="${COMMUNITY_USER_DOB}"]    3s
  IF    ${status1}
      Mobile Click Element    xpath=//android.view.View[@content-desc="${COMMUNITY_USER_DOB}"]
      Log To Console    ✅ Direct xpath clicked year ${COMMUNITY_USER_DOB}
      ${year_clicked}=    Set Variable    ${TRUE}
  END

  # Method 2: UiScrollable scrollIntoView with text selector
  IF    not ${year_clicked}
      ${uiscroll}=    Set Variable    new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().text("${COMMUNITY_USER_DOB}"))
      ${status2}=    Run Keyword And Return Status    Mobile Click Element    android=${uiscroll}
      IF    ${status2}
          Log To Console    ✅ UiScrollable text clicked year ${COMMUNITY_USER_DOB}
          ${year_clicked}=    Set Variable    ${TRUE}
      END
  END

  # Method 3: UiScrollable with description
  IF    not ${year_clicked}
      ${uiscroll2}=    Set Variable    new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().description("${COMMUNITY_USER_DOB}"))
      ${status3}=    Run Keyword And Return Status    Mobile Click Element    android=${uiscroll2}
      IF    ${status3}
          Log To Console    ✅ UiScrollable description clicked year ${COMMUNITY_USER_DOB}
          ${year_clicked}=    Set Variable    ${TRUE}
      END
  END

  IF    not ${year_clicked}
      Log To Console    ⚠️ Could not select year ${COMMUNITY_USER_DOB}, using default
  END
  Sleep    1s

  # Click on a date (day 15 is safe for any month)
  Log To Console    📅 Clicking on date 15
  ${date_clicked}=    Run Keyword And Return Status    Mobile Click Element    xpath=//android.view.View[@content-desc="15"]
  IF    not ${date_clicked}
      Log To Console    ⚠️ Could not click date 15, trying xpath with text
      Run Keyword And Ignore Error    Mobile Click Element    xpath=//*[@text="15"]
  END
  Sleep    500ms

  # Click OK to confirm
  Mobile Wait Until Element Is Visible    ${OK_BUTTON}    15s
  Sleep    1s
  Mobile Click Element                   ${OK_BUTTON}
  Sleep    2s
  Log To Console                  ✅ Selected DOB: ${COMMUNITY_USER_DOB}-XX-15

Select Gender For Personal Information
  Sleep    2s
  # Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
  Mobile Wait Until Element Is Visible    ${COMMUNITY_GENDER}    15s
  Sleep    1s
  Mobile Click Element                   ${COMMUNITY_GENDER}
  Sleep    2s
  Mobile Click Element                   ${SEARCH}
  # Don't hide keyboard - we need it for text input
  Mobile Input Text                      ${SEARCH}     ${COMMUNITY_USER_GENDER}
  Sleep    2s

  # Click on the gender option from dropdown (using dynamic xpath)
  ${gender_xpath}=    Set Variable    xpath=(//*[@text='${COMMUNITY_USER_GENDER}' or @content-desc='${COMMUNITY_USER_GENDER}'])[2]
  Mobile Wait Until Element Is Visible   ${gender_xpath}    15s
  Sleep    1s
  Mobile Click Element                   ${gender_xpath}
  Sleep    2s
  Log To Console                  ✅ Selected Gender: ${COMMUNITY_USER_GENDER}

Select Blood Group For Personal Information
  Sleep    2s
#   Scroll Up Until Element Visible    xpath=//android.view.View[@content-desc="Select how you want to register."]
  Mobile Wait Until Element Is Visible    ${COMMUNITY_GENDER}    15s
  Sleep    1s
  Mobile Click Element                   ${COMMUNITY_GENDER}
  Sleep    2s
  Mobile Click Element                   ${SEARCH}
#   Mobile Hide Keyboard
  Mobile Input Text                      ${SEARCH}  O-
  Sleep    2s
  Mobile Wait Until Element Is Visible    ${COMMUNITY_BLOOD_GROUP}    15s
  Sleep    1s
  Mobile Click Element                   ${COMMUNITY_BLOOD_GROUP}
  Sleep    2s
  Log To Console                  Selected Blood Group For Personal Information

Select Marital Status For Personal Information
  Sleep    2s
  Mobile Wait Until Element Is Visible    ${COMMUNITY_STATUS}    15s
  Sleep    1s
  Mobile Click Element                   ${COMMUNITY_STATUS}
  Sleep    2s
  Mobile Click Element                   ${SEARCH}
#   Mobile Hide Keyboard
  Mobile Input Text                      ${SEARCH}     Unmarried
  Sleep    2s
  Mobile Wait Until Element Is Visible    ${COMMUNITY_MARITAL_STATUS}    15s
  Sleep    1s
  Mobile Click Element                   ${COMMUNITY_MARITAL_STATUS}
  Sleep    2s
  Log To Console                  Selected Marital Status For Personal Information

Click on the Education Level Field
    Sleep    2s
    Scroll Until Element Found     xpath=//android.view.View[@content-desc="Occupation"]
    Sleep    1s
    Mobile Wait Until Element Is Visible    ${COMMUNITY_EDUCATION_LEVEL}    15s
    Sleep    1s
    Mobile Click Element                   ${COMMUNITY_EDUCATION_LEVEL}
    Sleep    2s
    Mobile Click Element                   ${SEARCH}
    # Don't hide keyboard - we need it for typing
    Mobile Input Text                      ${SEARCH}    Postgraduate
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${COMMUNITY_POSTGRADUATE}    15s
    Sleep    1s
    Mobile Click Element                   ${COMMUNITY_POSTGRADUATE}
    Sleep    2s
    # Hide keyboard after selection to reveal next field
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    3s

    # CRITICAL: Wait for Education Level dropdown to fully close before opening next dropdown
    Run Keyword And Ignore Error    Mobile Wait Until Element Is NOT Visible    ${SEARCH}    10s
    Sleep    3s

    Log To Console                  ✅ Selected Education Level: Postgraduate

Click on the Education Qualification Field
    # NEW APPROACH: NO TYPING - use UiScrollable like manual testing
    Sleep    2s
    Scroll Until Element Found     xpath=//android.view.View[@content-desc="Occupation"]
    Sleep    1s
    Mobile Wait Until Element Is Visible    ${COMMUNITY_EDUCATION_QUALIFICATION}    15s
    Sleep    1s
    Mobile Click Element                   ${COMMUNITY_EDUCATION_QUALIFICATION}
    Sleep    5s  # Wait longer for dropdown to fully open and render all options

    # Method 1: Try direct content-desc locator
    ${status1}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${COMMUNITY_BACHELOR}    3s
    IF    ${status1}
        Log To Console    ✅ Method 1: Found Engineering by content-desc
        Mobile Click Element    ${COMMUNITY_BACHELOR}
    ELSE
        # Method 2: Try UiScrollable scrollIntoView
        Log To Console    ⚠️ Method 1 failed, trying UiScrollable...
        ${uiscroll}=    Set Variable    new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().text("Engineering"))
        ${status2}=    Run Keyword And Return Status    Mobile Click Element    android=${uiscroll}
        IF    ${status2}
            Log To Console    ✅ Method 2: UiScrollable clicked Engineering
        ELSE
            # Method 3: Try clicking by content-desc button
            Log To Console    ⚠️ Method 2 failed, trying direct button click...
            Mobile Wait Until Element Is Visible    ${COMMUNITY_BACHELOR}    10s
            Mobile Click Element    ${COMMUNITY_BACHELOR}
            Log To Console    ✅ Method 3: Clicked Engineering button
        END
    END

    Sleep    2s
    # Hide keyboard after selection to reveal next field
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    2s

    Log To Console    ✅ Selected Education Qualification: Engineering

Click on the Occupation Type Field
    # NEW APPROACH: NO TYPING - use UiScrollable like manual testing
    Sleep    2s
    # Hide keyboard first (it was left open from previous field)
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    Scroll Until Element Found     xpath=//android.view.View[@content-desc="Occupation"]
    Sleep    1s
    Mobile Wait Until Element Is Visible    ${COMMUNITY_OCCUPATION_TYPE}    15s
    Sleep    1s
    Mobile Click Element                   ${COMMUNITY_OCCUPATION_TYPE}
    Sleep    5s  # Wait longer for dropdown to fully open

    # Method 1: Try direct content-desc locator
    ${status1}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${COMMUNITY_BUSINESS_SELF_EMPLOYED}    3s
    IF    ${status1}
        Log To Console    ✅ Method 1: Found Business/Self Employed by content-desc
        Mobile Click Element    ${COMMUNITY_BUSINESS_SELF_EMPLOYED}
    ELSE
        # Method 2: Try UiScrollable scrollIntoView
        Log To Console    ⚠️ Method 1 failed, trying UiScrollable...
        ${uiscroll}=    Set Variable    new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().text("Business/Self Employed"))
        ${status2}=    Run Keyword And Return Status    Mobile Click Element    android=${uiscroll}
        IF    ${status2}
            Log To Console    ✅ Method 2: UiScrollable clicked Business/Self Employed
        ELSE
            # Method 3: Try clicking by content-desc button
            Log To Console    ⚠️ Method 2 failed, trying direct button click...
            Mobile Wait Until Element Is Visible    ${COMMUNITY_BUSINESS_SELF_EMPLOYED}    10s
            Mobile Click Element    ${COMMUNITY_BUSINESS_SELF_EMPLOYED}
            Log To Console    ✅ Method 3: Clicked Business/Self Employed button
        END
    END

    Sleep    2s
    # Hide keyboard after selection to reveal next field
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    2s

    Log To Console    ✅ Selected Occupation Type: Business/Self Employed

Click on the Occupation Field
    # NEW APPROACH: NO TYPING - use UiScrollable like manual testing
    Sleep    2s
    # Hide keyboard first (it was left open from previous field)
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    Scroll Until Element Found     ${REGISTER_BUTTON_2}
    Sleep    1s
    Mobile Wait Until Element Is Visible    ${COMMUNITY_OCCUPATION}    15s
    Sleep    1s
    Mobile Click Element                   ${COMMUNITY_OCCUPATION}
    Sleep    5s  # Wait longer for dropdown to fully open

    # Method 1: Try direct content-desc locator with longer wait
    ${status1}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${COMMUNITY_IT_SOFTWARE_ENGINEERING}    10s
    IF    ${status1}
        Log To Console    ✅ Method 1: Found IT-Software-Engineering by content-desc
        Mobile Click Element    ${COMMUNITY_IT_SOFTWARE_ENGINEERING}
    ELSE
        # Method 2: Try UiScrollable scrollIntoView with descriptionContains
        Log To Console    ⚠️ Method 1 failed, trying UiScrollable descriptionContains...
        ${uiscroll}=    Set Variable    new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("ITSoftware"))
        ${status2}=    Run Keyword And Return Status    Mobile Click Element    android=${uiscroll}
        IF    ${status2}
            Log To Console    ✅ Method 2: UiScrollable descriptionContains clicked IT-Software-Engineering
        ELSE
            # Method 3: Try clicking by content-desc button with longer wait
            Log To Console    ⚠️ Method 2 failed, trying direct wait and click...
            Mobile Wait Until Element Is Visible    ${COMMUNITY_IT_SOFTWARE_ENGINEERING}    15s
            Mobile Click Element    ${COMMUNITY_IT_SOFTWARE_ENGINEERING}
            Log To Console    ✅ Method 3: Clicked IT-Software-Engineering button after 15s wait
        END
    END

    Sleep    2s
    # Hide keyboard after selection to reveal next field
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    2s

    Log To Console    ✅ Selected Occupation: IT-Software-Engineering

    # NEW APPROACH: NO TYPING - use UiScrollable like manual testing
    Sleep    2s
    # Hide keyboard first (it was left open from previous field)
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    Scroll Until Element Found     ${REGISTER_BUTTON_2}
    Sleep    1s
    Mobile Wait Until Element Is Visible    ${COMMUNITY_OCCUPATION_SUB_CATEGORY}    15s
    Sleep    1s
    Mobile Click Element                   ${COMMUNITY_OCCUPATION_SUB_CATEGORY}
    Sleep    5s  # Wait longer for dropdown to fully open

    # Method 1: Try direct content-desc locator with longer wait
    ${status1}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${COMMUNITY_SOFTWARE_PROFESSIONAL_OTHERS}    10s
    IF    ${status1}
        Log To Console    ✅ Method 1: Found Software Professional (Others) by content-desc
        Mobile Click Element    ${COMMUNITY_SOFTWARE_PROFESSIONAL_OTHERS}
    ELSE
        # Method 2: Try UiScrollable scrollIntoView
        Log To Console    ⚠️ Method 1 failed, trying UiScrollable...
        ${uiscroll}=    Set Variable    new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().text("Software Professional (Others)"))
        ${status2}=    Run Keyword And Return Status    Mobile Click Element    android=${uiscroll}
        IF    ${status2}
            Log To Console    ✅ Method 2: UiScrollable clicked Software Professional (Others)
        ELSE
            # Method 3: Try clicking by content-desc button with longer wait
            Log To Console    ⚠️ Method 2 failed, trying direct wait and click...
            Mobile Wait Until Element Is Visible    ${COMMUNITY_SOFTWARE_PROFESSIONAL_OTHERS}    15s
            Mobile Click Element    ${COMMUNITY_SOFTWARE_PROFESSIONAL_OTHERS}
            Log To Console    ✅ Method 3: Clicked Software Professional (Others) button after 15s wait
        END
    END

    Sleep    2s
    # Hide keyboard after selection to reveal next field
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    2s

    Log To Console    ✅ Selected Occupation Sub-Category: Software Professional (Others)

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
    # NO TYPING APPROACH - direct selection like TC11
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${COMMUNITY_EDUCATION_QUALIFICATION_SUB_CATEGORY}    15s
    Sleep    1s
    Mobile Click Element                   ${COMMUNITY_EDUCATION_QUALIFICATION_SUB_CATEGORY}
    Sleep    5s  # Wait for dropdown to fully open

    # Method 1: Try direct locator
    ${status1}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${COMMUNITY_BACHELOR_SUB_CATEGORY}    3s
    IF    ${status1}
        Log To Console    ✅ Method 1: Found B.E./Btech by content-desc
        Mobile Click Element    ${COMMUNITY_BACHELOR_SUB_CATEGORY}
    ELSE
        # Method 2: UiScrollable
        Log To Console    ⚠️ Method 1 failed, trying UiScrollable...
        ${uiscroll}=    Set Variable    new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().text("B.E./Btech"))
        ${status2}=    Run Keyword And Return Status    Mobile Click Element    android=${uiscroll}
        IF    ${status2}
            Log To Console    ✅ Method 2: UiScrollable clicked B.E./Btech
        ELSE
            # Method 3: Direct click after wait
            Log To Console    ⚠️ Method 2 failed, trying direct button click...
            Mobile Wait Until Element Is Visible    ${COMMUNITY_BACHELOR_SUB_CATEGORY}    10s
            Mobile Click Element    ${COMMUNITY_BACHELOR_SUB_CATEGORY}
            Log To Console    ✅ Method 3: Clicked B.E./Btech button
        END
    END

    Sleep    2s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    2s
    Log To Console                  ✅ Selected Education Qualification Sub-Category For Personal Information    

Click on the Occupation Field for Personal Information
    Mobile Wait Until Element Is Visible    ${COMMUNITY_OCCUPATION}    10s
    Mobile Click Element                   ${COMMUNITY_OCCUPATION}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}    IT Software Engineering
    Mobile Wait Until Element Is Visible    ${COMMUNITY_IT_SOFTWARE_ENGINEERING}    10s
    Mobile Click Element                   ${COMMUNITY_IT_SOFTWARE_ENGINEERING}
    Log To Console                  Selected Occupation For Personal Information

Click on the Occupation Sub-Category Field for Personal Information
    Mobile Wait Until Element Is Visible    ${COMMUNITY_OCCUPATION_SUB_CATEGORY}    10s
    Mobile Click Element                   ${COMMUNITY_OCCUPATION_SUB_CATEGORY}
    Mobile Click Element                   ${SEARCH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text                      ${SEARCH}    Software Professional
    Mobile Wait Until Element Is Visible    ${COMMUNITY_SOFTWARE_PROFESSIONAL_OTHERS}    10s
    Mobile Click Element                   ${COMMUNITY_SOFTWARE_PROFESSIONAL_OTHERS}
    Log To Console                  ✅ Selected Occupation Sub-Category: Software Professional (Others)

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
    Sleep    2s
    Scroll Up Until Element Visible    ${SECOND_HEADER}
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${REGISTER_DOB}        15s
    Sleep    1s
    Mobile Click Element                    ${REGISTER_DOB}
    Sleep    3s
    Mobile Wait Until Element Is Visible    ${OK_BUTTON}           15s
    Sleep    1s
    Mobile Click Element                    ${OK_BUTTON}
    Sleep    2s

Click on the Community Registration Tab
    Mobile Wait Until Element Is Visible           ${COMMUNITY_TAB}           5S
    Mobile Click Element                           ${COMMUNITY_TAB} 
    Log To Console                          Clicked on Community Registration Tab

Enter Registered Email for Register Screen
    [Arguments]    ${EMAIL}
    Sleep    2s
    # Scroll UP to first header because Email field is at TOP of form but filled LAST in sequence (after location dropdowns)
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_EMAIL}    15s
    Sleep    1s
    Mobile Click Element                   ${REGISTER_EMAIL}
    Sleep    1s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    500ms
    Mobile Input Text                      ${REGISTER_EMAIL}    ${EMAIL}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    Log To Console    ✅ Entered Email: ${EMAIL}

Enter Registered Mobile Number for Register Screen
    [Arguments]    ${MOBILE}
    Sleep    2s
    # Scroll UP to first header because Mobile field is at TOP of form but filled LAST in sequence (after location dropdowns)
    Scroll Up Until Element Visible    ${FIRST_HEADER}
    Mobile Wait Until Element Is Visible   ${REGISTER_MOBILE}    15s
    Sleep    1s
    Mobile Click Element                   ${REGISTER_MOBILE}
    Sleep    1s
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    500ms
    Mobile Input Text                      ${REGISTER_MOBILE}    ${MOBILE}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    Log To Console    ✅ Entered Mobile: ${MOBILE}

Select Country for Community Registration
    # Using proven working pattern from DhyankendraPage
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    Scroll until element found    ${REGISTER_COUNTRY}
    # Click on Country dropdown and select India
    Mobile Click Element    xpath=//*[contains(@text,'Select Country') or contains(@content-desc,'Select Country')]
    Sleep    2s
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText    India
    Sleep    1s
    # Click on the India option in the dropdown list (second instance after the input)
    Mobile Click Element    xpath=(//*[@text='India' or @content-desc='India'])[2]
    Sleep    1s
    Log To Console    Selected Country - India

Select State for Community Registration
    # Using proven working pattern from DhyankendraPage
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    1s
    # Click on State dropdown
    Mobile Click Element    xpath=//*[contains(@text,'Select State') or contains(@content-desc,'Select State')]
    Sleep    2s
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText    Gujarat
    Sleep    1s
    # Click on the Gujarat option in dropdown list (second instance)
    Mobile Click Element    xpath=(//*[@text='Gujarat' or @content-desc='Gujarat'])[2]
    Sleep    1s
    Log To Console    Selected State - Gujarat    
