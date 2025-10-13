*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    ../pages/registerPage.robot
Resource    ../pages/loginPage.robot
Resource    ../pages/NewsPage.robot
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot
Resource    ../resources/web_keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    ../pages/E2EAudioPage.robot
Resource    ../pages/CRM_AudioPage.robot
Resource    ../pages/E2ERegistrationPage.robot
Resource    ../pages/homePage.robot
Resource    ../pages/ProfilePage.robot
Resource    ../pages/eventsPage.robot


Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***
Verify that quick registration on the mobile app reflects correctly in the CMS and user details are displayed properly in profile and flip card.
    [Tags]  E2E   Registration   QuickRegistration
    Generate E2E Quick Registration Test Data

    Open Gurutattva App
    Handle First Time Setup
    Click on Register Text Only
    Click on the Quick Registration Tab
    Enter First Name for Register Screen       ${E2E_USER_FIRST_NAME}
    Enter Last Name for Register Screen        ${E2E_USER_LAST_NAME}
    Enter Email for Register Screen            qa.user@gurutattva.com
    Enter Mobile Number for Register Screen    8888888888
    Select Gender for register screen
    Select Current Date DOB for Register Screen
    Select Country for Register Screen
    Select State for Register Screen
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Click on the Quick Registration Button
    Verify OTP Screen is Displayed
    Enter Mobile OTP Manually
    Click on the Verify Button
    Verify Home Screen is Displayed
    Click on the Profile Tab
    Verify Quick Registration User Details in Profile Information
    Click on the Edit Profile Tab
    Verify Quick Registration User Details in Edit Profile
    Click on the Back Button from Edit Profile Screen
    Click on the Logout Tab
    Click on the Yes Button from Logout Alert
    Verify Login Screen Is Displayed
    Close Gurutattva App

    # --- Web CRM: Verify created user in CRM---
    Open Web Browser
    Login in with valid credentials
    Click on the User Management Menu
    Verify the created User
    Close Web Browser

Verify user is not able to do quick registration on mobile app with already used email id and phone number
     [Tags]  TC08    E2E   Registration   QuickRegistration
    # # --- Generate Unique Test Data ---
    # Generate E2E Registration Test Data
   
    # --- Mobile App: Quick Registration ---
    Open Gurutattva App
    Handle First Time Setup
    Click on Register Text Only
    Click on the Quick Registration Tab
    Enter First Name for Register Screen        FN
    Enter Last Name for Register Screen        Last_Name
    Select Gender for register screen
    Select DOB for Register Screen
    Select Country for Register Screen
    Select State for Register Screen
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Enter Registered Email for Register Screen            qa.user@gurutattva.com
    Enter Valid Mobile Number                             8888888888
    Click on the Quick Registration Button
    Verify Validation Message for Registered Email Address and Mobile Number
    Close Gurutattva App

# Verify user is able to do quick regisration on mobile app and confirm that the user is reflected correctly in the CSM
#     [Tags]  TC008  Register  Gurutattva
#     Open Gurutattva App
#     Handle First Time Setup
#     Click on the Register Link
#     Click on the Quick Registration Tab
#     Enter First Name for Register Screen       ${E2E_USER_FIRST_NAME}
#     Enter Last Name for Register Screen        ${E2E_USER_LAST_NAME}
#     Enter Email for Register Screen            yatishdevlekar307@gmail.com
#     Enter Mobile Number for Register Screen    9979339236
#     Select Gender for register screen
#     Select Current Date DOB for Register Screen
#     Select Country for Register Screen
#     Select State for Register Screen
#     Select District for Register Screen
#     Select Taluka/City for Register Screen
#     Select Area/Village for Register Screen
#     Click on the Quick Registration Button
    

#     # --- Web CRM: Verify created user in CRM---
#     Open Web Browser
#     Login in with valid credentials
#     Click on the User Management Menu
#     Verify the created User


Verify that the quick registration user is not able to access Events, Dhyan Kendra, and Podcasts , Home screen on the mobile app, and that a pop-up message is displayed
    [Tags]  TC09   E2E   Registration   QuickRegistration
    Open Gurutattva App
	Handle First Time Setup
	Login As Non Community Member
    Click on the Explore Button
    Click on the DhyanKendra Tab
    Verify Quick Registration Access Restriction Popup
    Click on the Cancel Button from Become a Member Popup
	Click on the Events Tab
	Verify Quick Registration Access Restriction Popup
    Click on the Cancel Button from Become a Member Popup
    Click on the Audio Tab
    Click on the Podcast Tab
    Verify Quick Registration Access Restriction Popup
    Click on the Cancel Button from Become a Member Popup
    Close Gurutattva App

Verify that the quick registration user is able to become a member on the mobile app
    [Tags]  TC10  E2E   Registration   QuickRegistration
    Open Gurutattva App
    Handle First Time Setup
    Click on the Events Tab
    Click on the Become a Member Button
    Click on the NO and Second YES Radio Button from Community Registration for Become a Member
    Click on the Next Button from Community Registration
    Handle Location Permission
    Select Dhyankendra for Become a Member and click on the Next Button
    Fill address and pincode for become a member
    Fill the Education Information for become a member
    Verify Home Screen is displayed with correct details
    # Verify the User Updated Message
    Click on the Audio Tab
    Click on the Podcast Tab
    Verify Podcast Screen is displayed
    Click on the Events Tab
    Verify Events Access
    Click on the Explore Button
    Click on the DhyanKendra Tab
    Handle DhyanKendra Location
    Verify DhyanKendra Access
    Click on the Profile Tab
    Click on the Logout Tab
    Click on the Yes Button from Logout Alert
    Close Gurutattva App
Verify that Community registration on the mobile app reflects correctly in the CMS and user details are displayed properly in profile and flip card.
    [Tags]   E2E   Registration   CommunityRegistration
    # Generate unique test data for E2E validation
    Generate E2E Community Registration Test Data

    Open Gurutattva App
    Handle First Time Setup
    Click on Register Text Only
    Click on the Community Registration Tab
    Click on the NO and Second YES Radio Button from Community Registration
    Click on the Next Button from Community Registration
    Handle Location Permission
    Select Dhyankendra and click on the Next Button
    Fill the Personal and Address Information for Community Registration
    Fill the Personal,Select Unmarried and Education Information
    Verify OTP Screen is Displayed
    Enter Mobile OTP Manually
    Click on the Verify Button
    Verify Home Screen is Displayed
    Click on the Profile Tab
    Verify Community User Details in Profile Information
    Click on the Edit Profile Tab
    Verify Community User Details in Edit Profile
    # Click on the Back Button from Edit Profile Screen
    # Click on the Delete Account Tab
    # Click on the Delete Button from Delete Account Alert
    # Verify Login Screen Is Displayed
    Close Gurutattva App

# Verify that the quick registration user details in profile and flip card on the mobile app
#     [Tags]  TC11  QuickRegistration
#     # Generate unique test data for E2E validation
#     Generate E2E Quick Registration Test Data

#     Open Gurutattva App
#     Handle First Time Setup
#     Click on the Register Link
#     Click on the Quick Registration Tab
#     Enter First Name for Register Screen       ${E2E_USER_FIRST_NAME}
#     Enter Last Name for Register Screen        ${E2E_USER_LAST_NAME}
#     Enter Email for Register Screen            yatishdevlekar307@gmail.com
#     Enter Mobile Number for Register Screen    9979339236
#     Select Gender for register screen
#     Select Current Date DOB for Register Screen
#     Select Country for Register Screen
#     Select State for Register Screen
#     Select District for Register Screen
#     Select Taluka/City for Register Screen
#     Select Area/Village for Register Screen
#     Click on the Quick Registration Button
#     Verify OTP Screen is Displayed
#     Enter Email OTP Manually
#     Click on the Verify Button
#     Verify Home Screen is Displayed
#     Click on the Profile Tab
#     Verify Quick Registration User Details in Profile Information
#     Click on the Edit Profile Tab
#     Verify Quick Registration User Details in Edit Profile
#     Click on the Back Button from Edit Profile Screen
#     Click on the Delete Account Tab
#     Click on the Delete Button from Delete Account Alert
#     Verify Login Screen Is Displayed
#     Close Gurutattva App

# Verify that the user is able to complete community registration using both YES and NO options, on the mobile app and confirm that the user is reflected correctly in the CSM
#     [Tags]  TC12  CommunityRegistration
#     # # Generate unique test data for E2E validation
#     Generate E2E Community Registration Test Data

#     Open Gurutattva App
#     Handle First Time Setup
#     Click on the Register Link
#     Click on the Community Registration Tab
#     Click on the NO and Second YES Radio Button from Community Registration
#     Click on the Next Button from Community Registration
#     Handle Location Permission
#     Select Dhyankendra and click on the Next Button
#     Fill the Personal and Address Information for Community Registration
#     Fill the Personal,Select Unmarried and Education Information
#     Verify OTP Screen is Displayed
#     Enter Email OTP Manually
#     Click on the Verify Button
#     Verify Home Screen is Displayed
#     Close Gurutattva App

    #Verify the user is reflected correctly in the CSM
    Open Web Browser
    Login in with valid credentials
    Click on the User Management Menu for Community Registration
    Verify the created Community User is Displayed in the CSM
    Close Web Browser

    # Delete the user from the app
    # Open Gurutattva App
    # Click on the Profile Tab
    # Click on the Delete Account Tab
    # Click on the Delete Button from Delete Account Alert
    # Verify Login Screen Is Displayed
    # Close Gurutattva App

Verify that the community registered user is able to access Events, Dhyan Kendra, and Podcasts on the mobile app, and ensure that no pop-up message is displayed    
    [Tags]  TC14      E2E   Registration   CommunityRegistration
    Open Gurutattva App
	Handle First Time Setup
    Click on the Explore Button
    Click on the DhyanKendra Tab
    Handle DhyanKendra Location
    Verify DhyanKendra Access
    Click on the Events Tab
    Verify Events Access
    Click on the Audio Tab
    Click on the Podcast Tab
    Verify Podcast Screen is displayed
    Close Gurutattva App