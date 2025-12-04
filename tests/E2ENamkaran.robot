*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    ../pages/registerPage.robot
Resource    ../pages/loginPage.robot
Resource    ../pages/NewsPage.robot
Resource    ../resources/web_keywords.robot
Resource    ../pages/E2ERegistrationPage.robot
Resource    ../pages/E2ENamkaranPage.robot
Resource    ../pages/CRM_AudioPage.robot

Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***
Verify user is able to add Bride Namkaran with NO Option on the mobile app and verify the details in CSM
    [Tags]  TC08  Namkaran  Gurutattva  E2E
    Open Gurutattva App
    Handle First Time Setup
    
    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Bride
    
    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen
    
    # Select Bride Namkaran category
    Select Bride Namkaran from category dropdown
    
    # Enter E2E test data (different from existing test)
    Enter E2E Bride Namkaran Data
    
    # Select Marriage Date
    Select Marriage Date
    
    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message
    Close Gurutattva App
    
    # --- Web CRM: Verify created namkaran in CMS---
    Open Web Browser
    Login in with valid credentials
    
    # Navigate to Namkaran Management and verify the created namkaran
    Click on the Namkaran Management Menu
    Verify the created Namkaran
    
    Log To Console    🎉 E2E Namkaran Test Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Bride: ${E2E_BRIDE_FIRST_NAME} ${E2E_BRIDE_MIDDLE_NAME} ${E2E_BRIDE_LAST_NAME}
    Log To Console    🎉 Groom: ${E2E_GROOM_FIRST_NAME} ${E2E_GROOM_MIDDLE_NAME} ${E2E_GROOM_LAST_NAME}
    Log To Console    🎉 Email: ${E2E_NAMKARAN_EMAIL}
    Log To Console    🎉 Phone: ${E2E_NAMKARAN_PHONE}
    Log To Console    🎉 Namkaran ID: ${E2E_NAMKARAN_ID}
    
    Close Web Browser
    
    
Verify user is able to add Business Namkaran with NO Option on the mobile app and verify the details in CSM
    [Tags]    TC09    Namkaran    Gurutattva    E2E
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Business

    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Business Namkaran category
    Select Business Namkaran from category dropdown

    # Enter E2E test data for Business Namkaran
    Enter E2E Business Namkaran Data

    # Select NO for multiple name choice (for NO Option test)
    namkaranPage.Select NO Radio Button

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message
    Close Gurutattva App

    # --- Web CRM: Verify created namkaran in CMS ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management and verify the created namkaran
    Click on the Namkaran Management Menu
    Verify the created Business Namkaran

    Log To Console    🎉 E2E Business Namkaran Test Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 First Owner: ${E2E_BUSINESS_OWNER_FIRST} ${E2E_BUSINESS_OWNER_MIDDLE} ${E2E_BUSINESS_OWNER_LAST}
    Log To Console    🎉 Second Owner: ${E2E_BUSINESS_SECOND_OWNER_FIRST} ${E2E_BUSINESS_SECOND_OWNER_MIDDLE} ${E2E_BUSINESS_SECOND_OWNER_LAST}
    Log To Console    🎉 Third Owner: ${E2E_BUSINESS_THIRD_OWNER_FIRST} ${E2E_BUSINESS_THIRD_OWNER_MIDDLE} ${E2E_BUSINESS_THIRD_OWNER_LAST}
    Log To Console    🎉 Email: ${E2E_BUSINESS_EMAIL}
    Log To Console    🎉 Phone: ${E2E_BUSINESS_PHONE}
    Log To Console    🎉 Business Address: ${E2E_BUSINESS_ADDRESS}
    Log To Console    🎉 Namkaran ID: ${E2E_NAMKARAN_ID}

    Close Web Browser
    

Verify user is able to add House Namkaran with NO Option on the mobile app and verify the details in CSM
    [Tags]    TC13    Namkaran    Gurutattva    E2E
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For House

    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select House Namkaran category
    Select House Namkaran from category dropdown

    # Enter E2E test data for House Namkaran
    Enter E2E House Namkaran Data

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message
    Close Gurutattva App

    # --- Web CRM: Verify created namkaran in CMS ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management and verify the created namkaran
    Click on the Namkaran Management Menu
    Verify the created Namkaran

    Log To Console    🎉 E2E House Namkaran Test Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 House Owner: ${E2E_HOUSE_OWNER_FIRST} ${E2E_HOUSE_OWNER_MIDDLE} ${E2E_HOUSE_OWNER_LAST}
    Log To Console    🎉 Email: ${E2E_HOUSE_EMAIL}
    Log To Console    🎉 Phone: ${E2E_HOUSE_PHONE}
    Log To Console    🎉 Description: ${E2E_HOUSE_DESC}
    Log To Console    🎉 Address: ${E2E_HOUSE_ADDRESS}

    Close Web Browser
    

Verify user is able to add Child Namkaran with NO Option on the mobile app and verify the details in CSM
    [Tags]    TC14    Namkaran    Gurutattva    E2E
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Child

    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Child Namkaran category
    Select Child Namkaran from category dropdown

    # Enter E2E test data for Child Namkaran
    Enter E2E Child Namkaran Data

    # Additional steps for Child Namkaran
    Select DOB
    namkaranPage.Select Gender
    Select Time
    Enter Birth Place    ${E2E_CHILD_BIRTH_PLACE}

    # Submit the namkaran
    Click on the Submit Button
    Sleep    5s
    #Verify Namkaran submission success message
    Close Gurutattva App

    # --- Web CRM: Verify created namkaran in CMS ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management and verify the created namkaran
    Click on the Namkaran Management Menu
    Verify the created Namkaran

    Log To Console    🎉 E2E Child Namkaran Test Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Child Name: ${E2E_CHILD_NAME}
    Log To Console    🎉 Mother: ${E2E_MOTHER_FIRST} ${E2E_MOTHER_MIDDLE} ${E2E_MOTHER_LAST}
    Log To Console    🎉 Father: ${E2E_FATHER_FIRST} ${E2E_FATHER_MIDDLE} ${E2E_FATHER_LAST}
    Log To Console    🎉 Email: ${E2E_CHILD_EMAIL}
    Log To Console    🎉 Phone: ${E2E_CHILD_PHONE}
    Log To Console    🎉 DOB: ${E2E_CHILD_DOB}
    Log To Console    🎉 Gender: ${E2E_CHILD_GENDER}
    Log To Console    🎉 Birth Time: ${E2E_CHILD_BIRTH_TIME}
    Log To Console    🎉 Birth Place: ${E2E_CHILD_BIRTH_PLACE}

    Close Web Browser
    


Verify user is able to add Bride Namkaran with YES Option on the mobile app and verify the details in CSM
    [Tags]    TC12    Namkaran    Gurutattva    E2E
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Bride With YES Option

    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Bride Namkaran category
    Select Bride Namkaran from category dropdown

    # Enter E2E test data with YES option for multiple names
    Enter E2E Bride Namkaran Data With YES Option

    # Select Marriage Date
    Select Marriage Date

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message
    Close Gurutattva App

    # --- Web CRM: Verify created namkaran in CMS ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management and verify the created namkaran
    Click on the Namkaran Management Menu
    Verify the created Namkaran

    Log To Console    🎉 E2E Bride Namkaran Test (YES Option) Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Bride: ${E2E_BRIDE_FIRST_NAME} ${E2E_BRIDE_MIDDLE_NAME} ${E2E_BRIDE_LAST_NAME}
    Log To Console    🎉 Groom: ${E2E_GROOM_FIRST_NAME} ${E2E_GROOM_MIDDLE_NAME} ${E2E_GROOM_LAST_NAME}
    Log To Console    🎉 Email: ${E2E_NAMKARAN_EMAIL}
    Log To Console    🎉 Phone: ${E2E_NAMKARAN_PHONE}
    Log To Console    🎉 Name Choices: ${E2E_FIRST_NAME_CHOICE}, ${E2E_SECOND_NAME_CHOICE}, ${E2E_THIRD_NAME_CHOICE}

    Close Web Browser
    

Verify user is able to add Business Namkaran with YES Option on the mobile app and verify the details in CSM
    [Tags]    TC15    Namkaran    Gurutattva    E2E
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Business With YES Option

    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Business Namkaran category
    Select Business Namkaran from category dropdown

    # Enter E2E test data with YES option for multiple names
    Enter E2E Business Namkaran Data With YES Option

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message
    Close Gurutattva App


    # --- Web CRM: Verify created namkaran in CMS ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management and verify the created namkaran
    Click on the Namkaran Management Menu
    Verify the created Namkaran

    Log To Console    🎉 E2E Business Namkaran Test (YES Option) Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Business Owner: ${E2E_BUSINESS_OWNER_FIRST} ${E2E_BUSINESS_OWNER_MIDDLE} ${E2E_BUSINESS_OWNER_LAST}
    Log To Console    🎉 Email: ${E2E_BUSINESS_EMAIL}
    Log To Console    🎉 Phone: ${E2E_BUSINESS_PHONE}
    Log To Console    🎉 Description: ${E2E_BUSINESS_DESC}
    Log To Console    🎉 Address: ${E2E_BUSINESS_ADDRESS}
    Log To Console    🎉 Business Name Choices: ${E2E_BUSINESS_FIRST_NAME_CHOICE}, ${E2E_BUSINESS_SECOND_NAME_CHOICE}, ${E2E_BUSINESS_THIRD_NAME_CHOICE}

    Close Web Browser

Verify user is able to add House Namkaran with YES Option on the mobile app and verify the details in CSM
    [Tags]    TC16    Namkaran    Gurutattva    E2E
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For House With YES Option

    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select House Namkaran category
    Select House Namkaran from category dropdown

    # Enter E2E test data with YES option for multiple names
    Enter E2E House Namkaran Data With YES Option

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message
    Close Gurutattva App
    # --- Web CRM: Verify created namkaran in CMS ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management and verify the created namkaran
    Click on the Namkaran Management Menu
    Verify the created Namkaran

    Log To Console    🎉 E2E House Namkaran Test (YES Option) Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 House Owner: ${E2E_HOUSE_OWNER_FIRST} ${E2E_HOUSE_OWNER_MIDDLE} ${E2E_HOUSE_OWNER_LAST}
    Log To Console    🎉 Email: ${E2E_HOUSE_EMAIL}
    Log To Console    🎉 Phone: ${E2E_HOUSE_PHONE}
    Log To Console    🎉 Description: ${E2E_HOUSE_DESC}
    Log To Console    🎉 Address: ${E2E_HOUSE_ADDRESS}
    Log To Console    🎉 House Name Choices: ${E2E_HOUSE_FIRST_NAME_CHOICE}, ${E2E_HOUSE_SECOND_NAME_CHOICE}, ${E2E_HOUSE_THIRD_NAME_CHOICE}

    Close Web Browser

Verify user is able to add Child Namkaran with YES Option on the mobile app and verify the details in CSM
    [Tags]    TC17    Namkaran    Gurutattva    E2E
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Child With YES Option

    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Child Namkaran category
    Select Child Namkaran from category dropdown

    # Enter E2E test data with YES option for multiple names
    Enter E2E Child Namkaran Data With YES Option

    

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message
    Close Gurutattva App

    # --- Web CRM: Verify created namkaran in CMS ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management and verify the created namkaran
    Click on the Namkaran Management Menu
    Verify the created Namkaran

    Log To Console    🎉 E2E Child Namkaran Test (YES Option) Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Child Name: ${E2E_CHILD_NAME}
    Log To Console    🎉 Mother: ${E2E_MOTHER_FIRST} ${E2E_MOTHER_MIDDLE} ${E2E_MOTHER_LAST}
    Log To Console    🎉 Father: ${E2E_FATHER_FIRST} ${E2E_FATHER_MIDDLE} ${E2E_FATHER_LAST}
    Log To Console    🎉 Email: ${E2E_CHILD_EMAIL}
    Log To Console    🎉 Phone: ${E2E_CHILD_PHONE}
    Log To Console    🎉 DOB: ${E2E_CHILD_DOB}
    Log To Console    🎉 Gender: ${E2E_CHILD_GENDER}
    Log To Console    🎉 Birth Time: ${E2E_CHILD_BIRTH_TIME}
    Log To Console    🎉 Birth Place: ${E2E_CHILD_BIRTH_PLACE}
    Log To Console    🎉 Child Name Choices: ${E2E_CHILD_FIRST_NAME_CHOICE}, ${E2E_CHILD_SECOND_NAME_CHOICE}, ${E2E_CHILD_THIRD_NAME_CHOICE}

    Close Web Browser
    

Verify that admin user is able to approve Bride Namkaran in CMS and verify the details on mobile app
    [Tags]    TC18    Namkaran    Gurutattva    E2E    Admin
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Bride

    # --- Mobile App: Create Bride Namkaran ---
    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Bride Namkaran category
    Select Bride Namkaran from category dropdown

    # Enter E2E test data
    Enter E2E Bride Namkaran Data

    # Select Marriage Date
    Select Marriage Date

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message
    
    # Get Namkaran ID from the first record (newly added records appear at the top)
    ${namkaran_id}=    Get Namkaran ID From First Record
    Set Test Variable    ${E2E_NAMKARAN_ID}    ${namkaran_id}
    
    Close Gurutattva App
    
    # --- Web CMS: Admin Approval Workflow ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management
    Navigate To Namkaran Management In CMS

    # Verify the created namkaran is in In Progress status using Namkaran ID
    Verify Namkaran In In Progress Status    ${namkaran_id}

    # Click three dots and view the namkaran using Namkaran ID
    Click Three Dots And View For Namkaran By ID    ${namkaran_id}

    # Verify bride and groom details
    Verify Bride And Groom Details In CMS    ${E2E_BRIDE_FIRST_NAME}    ${E2E_BRIDE_MIDDLE_NAME}    ${E2E_BRIDE_LAST_NAME}    ${E2E_GROOM_FIRST_NAME}    ${E2E_GROOM_MIDDLE_NAME}    ${E2E_GROOM_LAST_NAME}

    # Generate and enter random name for Guruji suggestion
    ${guruji_name}=    Generate Random Name For Guruji Suggestion
    Enter Guruji Suggested Name    ${guruji_name}

    # Generate and enter dummy remarks
    ${remarks}=    Generate Dummy Remarks For Namkaran
    Enter Namkaran Remarks    ${remarks}

    # Click Approve button
    Click Approve Button

    # Verify status changed to completed using Namkaran ID
    Verify Namkaran Status Changed To Completed By ID    ${namkaran_id}

    Log To Console    🎉 Admin Approval Test for Bride Namkaran Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Bride: ${E2E_BRIDE_FIRST_NAME} ${E2E_BRIDE_MIDDLE_NAME} ${E2E_BRIDE_LAST_NAME}
    Log To Console    🎉 Groom: ${E2E_GROOM_FIRST_NAME} ${E2E_GROOM_MIDDLE_NAME} ${E2E_GROOM_LAST_NAME}
    Log To Console    🎉 Email: ${E2E_NAMKARAN_EMAIL}
    Log To Console    🎉 Namkaran ID: ${namkaran_id}
    Log To Console    🎉 Guruji Suggested Name: ${guruji_name}
    Log To Console    🎉 Remarks: ${remarks}

    Close Web Browser
    

Verify that admin user is able to approve Business Namkaran in CMS and verify the details on mobile app
    [Tags]    TC19    Namkaran    Gurutattva    E2E    Admin
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Business

    # --- Mobile App: Create Business Namkaran ---
    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Business Namkaran category
    Select Business Namkaran from category dropdown

    # Enter E2E test data
    Enter E2E Business Namkaran Data

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message

    # Get Namkaran ID from the first record (newly added records appear at the top)
    ${namkaran_id}=    Get Namkaran ID From First Record
    Set Test Variable    ${E2E_NAMKARAN_ID}    ${namkaran_id}

    # --- Web CMS: Admin Approval Workflow ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management
    Navigate To Namkaran Management In CMS

    # Verify the created namkaran is in pending status
    Verify Namkaran In In Progress Status    ${namkaran_id}

    # Click three dots and view the namkaran
    Click Three Dots And View For Namkaran By ID    ${namkaran_id}

    # Verify business owner details
    Verify Business Owner Details In CMS    ${E2E_BUSINESS_OWNER_FIRST}    ${E2E_BUSINESS_OWNER_MIDDLE}    ${E2E_BUSINESS_OWNER_LAST}

    # Generate and enter random name for Guruji suggestion
    ${guruji_name}=    Generate Random Name For Guruji Suggestion
    Enter Guruji Suggested Name    ${guruji_name}

    # Generate and enter dummy remarks
    ${remarks}=    Generate Dummy Remarks For Namkaran
    Enter Namkaran Remarks    ${remarks}

    # Click Approve button
    Click Approve Button

    # Verify status changed to completed
    Verify Namkaran Status Changed To Completed By ID    ${namkaran_id}

    Log To Console    🎉 Admin Approval Test for Business Namkaran Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Business Owner: ${E2E_BUSINESS_OWNER_FIRST} ${E2E_BUSINESS_OWNER_MIDDLE} ${E2E_BUSINESS_OWNER_LAST}
    Log To Console    🎉 Email: ${E2E_BUSINESS_EMAIL}
    Log To Console    🎉 Description: ${E2E_BUSINESS_DESC}
    Log To Console    🎉 Address: ${E2E_BUSINESS_ADDRESS}
    Log To Console    🎉 Guruji Suggested Name: ${guruji_name}
    Log To Console    🎉 Remarks: ${remarks}

    Close Web Browser
    Close Gurutattva App

Verify that admin user is able to approve House Namkaran in CMS and verify the details on mobile app
    [Tags]    TC20    Namkaran    Gurutattva    E2E    Admin
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For House

    # --- Mobile App: Create House Namkaran ---
    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select House Namkaran category
    Select House Namkaran from category dropdown

    # Enter E2E test data
    Enter E2E House Namkaran Data

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message

    # Get Namkaran ID from the first record (newly added records appear at the top)
    ${namkaran_id}=    Get Namkaran ID From First Record
    Set Test Variable    ${E2E_NAMKARAN_ID}    ${namkaran_id}
    
    Close Gurutattva App

    # --- Web CMS: Admin Approval Workflow ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management
    Navigate To Namkaran Management In CMS

    # Verify the created namkaran is in In Progress status using Namkaran ID
    Verify Namkaran In In Progress Status    ${namkaran_id}

    # Click three dots and view the namkaran using Namkaran ID
    Click Three Dots And View For Namkaran By ID    ${namkaran_id}

    # Verify house owner details
    Verify House Owner Details In CMS    ${E2E_HOUSE_OWNER_FIRST}    ${E2E_HOUSE_OWNER_MIDDLE}    ${E2E_HOUSE_OWNER_LAST}

    # Generate and enter random name for Guruji suggestion
    ${guruji_name}=    Generate Random Name For Guruji Suggestion
    Enter Guruji Suggested Name    ${guruji_name}

    # Generate and enter dummy remarks
    ${remarks}=    Generate Dummy Remarks For Namkaran
    Enter Namkaran Remarks    ${remarks}

    # Click Approve button
    Click Approve Button

    # Verify status changed to completed using Namkaran ID
    Verify Namkaran Status Changed To Completed By ID    ${namkaran_id}

    Log To Console    🎉 Admin Approval Test for House Namkaran Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 House Owner: ${E2E_HOUSE_OWNER_FIRST} ${E2E_HOUSE_OWNER_MIDDLE} ${E2E_HOUSE_OWNER_LAST}
    Log To Console    🎉 Email: ${E2E_HOUSE_EMAIL}
    Log To Console    🎉 Description: ${E2E_HOUSE_DESC}
    Log To Console    🎉 Address: ${E2E_HOUSE_ADDRESS}
    Log To Console    🎉 Namkaran ID: ${namkaran_id}
    Log To Console    🎉 Guruji Suggested Name: ${guruji_name}
    Log To Console    🎉 Remarks: ${remarks}

    Close Web Browser

Verify that admin user is able to approve Child Namkaran in CMS and verify the details on mobile app
    [Tags]    TC21    Namkaran    Gurutattva    E2E    Admin
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Child

    # --- Mobile App: Create Child Namkaran ---
    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Child Namkaran category
    Select Child Namkaran from category dropdown

    # Enter E2E test data
    Enter E2E Child Namkaran Data

    # Additional steps for Child Namkaran
    Select DOB
    namkaranPage.Select Gender
    Select Time
    Enter Birth Place    ${E2E_CHILD_BIRTH_PLACE}

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message

    # Get Namkaran ID from the first record (newly added records appear at the top)
    ${namkaran_id}=    Get Namkaran ID From First Record
    Set Test Variable    ${E2E_NAMKARAN_ID}    ${namkaran_id}
    
    Close Gurutattva App

    # --- Web CMS: Admin Approval Workflow ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management
    Navigate To Namkaran Management In CMS

    # Verify the created namkaran is in In Progress status using Namkaran ID
    Verify Namkaran In In Progress Status    ${namkaran_id}

    # Click three dots and view the namkaran using Namkaran ID
    Click Three Dots And View For Namkaran By ID    ${namkaran_id}

    # Verify child and parent details
    Verify Child And Parent Details In CMS    ${E2E_CHILD_NAME}    ${E2E_MOTHER_FIRST}    ${E2E_MOTHER_MIDDLE}    ${E2E_MOTHER_LAST}    ${E2E_FATHER_FIRST}    ${E2E_FATHER_MIDDLE}    ${E2E_FATHER_LAST}

    # Generate and enter random name for Guruji suggestion
    ${guruji_name}=    Generate Random Name For Guruji Suggestion
    Enter Guruji Suggested Name    ${guruji_name}

    # Generate and enter dummy remarks
    ${remarks}=    Generate Dummy Remarks For Namkaran
    Enter Namkaran Remarks    ${remarks}

    # Click Approve button
    Click Approve Button

    # Verify status changed to completed using Namkaran ID
    Verify Namkaran Status Changed To Completed By ID    ${namkaran_id}

    Log To Console    🎉 Admin Approval Test for Child Namkaran Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Child Name: ${E2E_CHILD_NAME}
    Log To Console    🎉 Mother: ${E2E_MOTHER_FIRST} ${E2E_MOTHER_MIDDLE} ${E2E_MOTHER_LAST}
    Log To Console    🎉 Father: ${E2E_FATHER_FIRST} ${E2E_FATHER_MIDDLE} ${E2E_FATHER_LAST}
    Log To Console    🎉 Email: ${E2E_CHILD_EMAIL}
    Log To Console    🎉 Namkaran ID: ${namkaran_id}
    Log To Console    🎉 DOB: ${E2E_CHILD_DOB}
    Log To Console    🎉 Gender: ${E2E_CHILD_GENDER}
    Log To Console    🎉 Birth Time: ${E2E_CHILD_BIRTH_TIME}
    Log To Console    🎉 Birth Place: ${E2E_CHILD_BIRTH_PLACE}
    Log To Console    🎉 Guruji Suggested Name: ${guruji_name}
    Log To Console    🎉 Remarks: ${remarks}

    Close Web Browser

Verify that admin user is able to reject Bride Namkaran in CMS and verify the details on mobile app
    [Tags]    TC22    Namkaran    Gurutattva    E2E    Admin    Reject
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Bride

    # --- Mobile App: Create Bride Namkaran ---
    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Bride Namkaran category
    Select Bride Namkaran from category dropdown

    # Enter E2E test data
    Enter E2E Bride Namkaran Data

    # Select Marriage Date
    Select Marriage Date

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message

    # Get Namkaran ID from the first record (newly added records appear at the top)
    ${namkaran_id}=    Get Namkaran ID From First Record
    Set Test Variable    ${E2E_NAMKARAN_ID}    ${namkaran_id}
    
    Close Gurutattva App

    # --- Web CMS: Admin Rejection Workflow ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management
    Navigate To Namkaran Management In CMS

    # Verify the created namkaran is in In Progress status using Namkaran ID
    Verify Namkaran In In Progress Status    ${namkaran_id}

    # Click three dots and view the namkaran using Namkaran ID
    Click Three Dots And View For Namkaran By ID    ${namkaran_id}

    # Verify bride and groom details
    Verify Bride And Groom Details In CMS    ${E2E_BRIDE_FIRST_NAME}    ${E2E_BRIDE_MIDDLE_NAME}    ${E2E_BRIDE_LAST_NAME}    ${E2E_GROOM_FIRST_NAME}    ${E2E_GROOM_MIDDLE_NAME}    ${E2E_GROOM_LAST_NAME}

    # Generate and enter dummy remarks for rejection
    ${rejection_remarks}=    Generate Dummy Remarks For Namkaran
    Enter Namkaran Remarks    ${rejection_remarks}

    # Click Reject button
    Click Reject Button

    # Verify status changed to rejected using Namkaran ID
    Verify Namkaran Status Changed To Rejected By ID    ${namkaran_id}

    Log To Console    🎉 Admin Rejection Test for Bride Namkaran Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Bride: ${E2E_BRIDE_FIRST_NAME} ${E2E_BRIDE_MIDDLE_NAME} ${E2E_BRIDE_LAST_NAME}
    Log To Console    🎉 Groom: ${E2E_GROOM_FIRST_NAME} ${E2E_GROOM_MIDDLE_NAME} ${E2E_GROOM_LAST_NAME}
    Log To Console    🎉 Email: ${E2E_NAMKARAN_EMAIL}
    Log To Console    🎉 Namkaran ID: ${namkaran_id}
    Log To Console    🎉 Rejection Remarks: ${rejection_remarks}

    Close Web Browser

Verify that admin user is able to reject Business Namkaran in CMS and verify the details on mobile app
    [Tags]    TC23    Namkaran    Gurutattva    E2E    Admin    Reject
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Business

    # --- Mobile App: Create Business Namkaran ---
    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Business Namkaran category
    Select Business Namkaran from category dropdown

    # Enter E2E test data
    Enter E2E Business Namkaran Data

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message

    # Get Namkaran ID from the first record (newly added records appear at the top)
    ${namkaran_id}=    Get Namkaran ID From First Record
    Set Test Variable    ${E2E_NAMKARAN_ID}    ${namkaran_id}
    
    Close Gurutattva App

    # --- Web CMS: Admin Rejection Workflow ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management
    Navigate To Namkaran Management In CMS

    # Verify the created namkaran is in In Progress status using Namkaran ID
    Verify Namkaran In In Progress Status    ${namkaran_id}

    # Click three dots and view the namkaran using Namkaran ID
    Click Three Dots And View For Namkaran By ID    ${namkaran_id}

    # Verify business owner details
    Verify Business Owner Details In CMS    ${E2E_BUSINESS_OWNER_FIRST}    ${E2E_BUSINESS_OWNER_MIDDLE}    ${E2E_BUSINESS_OWNER_LAST}

    # Generate and enter dummy remarks for rejection
    ${rejection_remarks}=    Generate Dummy Remarks For Namkaran
    Enter Namkaran Remarks    ${rejection_remarks}

    # Click Reject button
    Click Reject Button

    # Verify status changed to rejected using Namkaran ID
    Verify Namkaran Status Changed To Rejected By ID    ${namkaran_id}

    Log To Console    🎉 Admin Rejection Test for Business Namkaran Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Business Owner: ${E2E_BUSINESS_OWNER_FIRST} ${E2E_BUSINESS_OWNER_MIDDLE} ${E2E_BUSINESS_OWNER_LAST}
    Log To Console    🎉 Email: ${E2E_BUSINESS_EMAIL}
    Log To Console    🎉 Description: ${E2E_BUSINESS_DESC}
    Log To Console    🎉 Address: ${E2E_BUSINESS_ADDRESS}
    Log To Console    🎉 Namkaran ID: ${namkaran_id}
    Log To Console    🎉 Rejection Remarks: ${rejection_remarks}

    Close Web Browser

Verify that admin user is able to reject House Namkaran in CMS and verify the details on mobile app
    [Tags]    TC24    Namkaran    Gurutattva    E2E    Admin    Reject
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For House

    # --- Mobile App: Create House Namkaran ---
    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select House Namkaran category
    Select House Namkaran from category dropdown

    # Enter E2E test data
    Enter E2E House Namkaran Data

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message

    # Get Namkaran ID from the first record (newly added records appear at the top)
    ${namkaran_id}=    Get Namkaran ID From First Record
    Set Test Variable    ${E2E_NAMKARAN_ID}    ${namkaran_id}
    
    Close Gurutattva App

    # --- Web CMS: Admin Rejection Workflow ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management
    Navigate To Namkaran Management In CMS

    # Verify the created namkaran is in In Progress status using Namkaran ID
    Verify Namkaran In In Progress Status    ${namkaran_id}

    # Click three dots and view the namkaran using Namkaran ID
    Click Three Dots And View For Namkaran By ID    ${namkaran_id}

    # Verify house owner details
    Verify House Owner Details In CMS    ${E2E_HOUSE_OWNER_FIRST}    ${E2E_HOUSE_OWNER_MIDDLE}    ${E2E_HOUSE_OWNER_LAST}

    # Generate and enter dummy remarks for rejection
    ${rejection_remarks}=    Generate Dummy Remarks For Namkaran
    Enter Namkaran Remarks    ${rejection_remarks}

    # Click Reject button
    Click Reject Button

    # Verify status changed to rejected using Namkaran ID
    Verify Namkaran Status Changed To Rejected By ID    ${namkaran_id}

    Log To Console    🎉 Admin Rejection Test for House Namkaran Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 House Owner: ${E2E_HOUSE_OWNER_FIRST} ${E2E_HOUSE_OWNER_MIDDLE} ${E2E_HOUSE_OWNER_LAST}
    Log To Console    🎉 Email: ${E2E_HOUSE_EMAIL}
    Log To Console    🎉 Description: ${E2E_HOUSE_DESC}
    Log To Console    🎉 Address: ${E2E_HOUSE_ADDRESS}
    Log To Console    🎉 Namkaran ID: ${namkaran_id}
    Log To Console    🎉 Rejection Remarks: ${rejection_remarks}

    Close Web Browser

Verify that admin user is able to reject Child Namkaran in CMS and verify the details on mobile app
    [Tags]    TC25    Namkaran    Gurutattva    E2E    Admin    Reject
    Open Gurutattva App
    Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E Namkaran Test Data For Child

    # --- Mobile App: Create Child Namkaran ---
    # Navigate to Namkaran section
    Click on the Explore Tab
    Click on the Namkaran Card
    Click on Add Namkaran Button
    Click on the Apply Now Button
    Click on the I agree Button
    Verify Namkaran screen

    # Select Child Namkaran category
    Select Child Namkaran from category dropdown

    # Enter E2E test data
    Enter E2E Child Namkaran Data

    # Additional steps for Child Namkaran
    Select DOB
    namkaranPage.Select Gender
    Select Time
    Enter Birth Place    ${E2E_CHILD_BIRTH_PLACE}

    # Submit the namkaran
    Click on the Submit Button
    #Verify Namkaran submission success message

    # Get Namkaran ID from the first record (newly added records appear at the top)
    ${namkaran_id}=    Get Namkaran ID From First Record
    Set Test Variable    ${E2E_NAMKARAN_ID}    ${namkaran_id}
    
    Close Gurutattva App

    # --- Web CMS: Admin Rejection Workflow ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Namkaran Management
    Navigate To Namkaran Management In CMS

    # Verify the created namkaran is in In Progress status using Namkaran ID
    Verify Namkaran In In Progress Status    ${namkaran_id}

    # Click three dots and view the namkaran using Namkaran ID
    Click Three Dots And View For Namkaran By ID    ${namkaran_id}

    # Verify child and parent details
    Verify Child And Parent Details In CMS    ${E2E_CHILD_NAME}    ${E2E_MOTHER_FIRST}    ${E2E_MOTHER_MIDDLE}    ${E2E_MOTHER_LAST}    ${E2E_FATHER_FIRST}    ${E2E_FATHER_MIDDLE}    ${E2E_FATHER_LAST}

    # Generate and enter dummy remarks for rejection
    ${rejection_remarks}=    Generate Dummy Remarks For Namkaran
    Enter Namkaran Remarks    ${rejection_remarks}

    # Click Reject button
    Click Reject Button

    # Verify status changed to rejected using Namkaran ID
    Verify Namkaran Status Changed To Rejected By ID    ${namkaran_id}

    Log To Console    🎉 Admin Rejection Test for Child Namkaran Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Child Name: ${E2E_CHILD_NAME}
    Log To Console    🎉 Mother: ${E2E_MOTHER_FIRST} ${E2E_MOTHER_MIDDLE} ${E2E_MOTHER_LAST}
    Log To Console    🎉 Father: ${E2E_FATHER_FIRST} ${E2E_FATHER_MIDDLE} ${E2E_FATHER_LAST}
    Log To Console    🎉 Email: ${E2E_CHILD_EMAIL}
    Log To Console    🎉 Namkaran ID: ${namkaran_id}
    Log To Console    🎉 DOB: ${E2E_CHILD_DOB}
    Log To Console    🎉 Gender: ${E2E_CHILD_GENDER}
    Log To Console    🎉 Birth Time: ${E2E_CHILD_BIRTH_TIME}
    Log To Console    🎉 Birth Place: ${E2E_CHILD_BIRTH_PLACE}
    Log To Console    🎉 Rejection Remarks: ${rejection_remarks}

    Close Web Browser