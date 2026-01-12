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
    [Tags]  E2E  TC07  Registration  QuickRegistration
    # SEQUENTIAL TEST SUITE - START OF USER JOURNEY
    # Phone: 9960232311 | OTP: 999999
    # This test CREATES a new user that will be used by TC08, TC09, and TC10
    # Must pass first before other tests can proceed
    # NOTE: 9999999999 is SUPER ADMIN - do not use for registration!
    Generate E2E Quick Registration Test Data

    Open Gurutattva App
    Handle First Time Setup
    # TC07 Setup: Logout current user, check if TC07 user exists, delete if needed
    TC07 Pre-Registration Setup
    Click on Register Text Only
    Click on the Quick Registration Tab
    Enter First Name for Register Screen       ${E2E_USER_FIRST_NAME}
    Enter Last Name for Register Screen        ${E2E_USER_LAST_NAME}
    Enter Email for Register Screen            ${E2E_QUICK_USER_EMAIL}
    Enter Mobile Number for Register Screen    ${E2E_QUICK_USER_MOBILE}
    Select Gender for register screen
    Select Current Date DOB for Register Screen
    Select Country for Register Screen
    Select State for Register Screen
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Click on the Quick Registration Button
    Verify OTP Screen is Displayed
    Enter OTP Automatically    999999
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
     [Tags]  E2E  TC08  Registration  QuickRegistration
    # SEQUENTIAL - DEPENDENT ON TC07
    # Phone: 9960232311 (SAME AS TC07)
    # This test validates that the user created by TC07 cannot be registered again
    # Tests duplicate prevention for both email and phone number
    # Must run AFTER TC07 passes

    # --- Mobile App: Quick Registration ---
    Open Gurutattva App
    Handle First Time Setup
    # TC08 Setup: Logout current user, try login with TC07 user and logout
    TC08 Pre-Registration Setup
    Click on Register Text Only
    Click on the Quick Registration Tab
    Enter First Name for Register Screen        TestFN
    Enter Last Name for Register Screen        Lastname
    Select Gender for register screen
    Select Current Date DOB for Register Screen
    Select Country for Register Screen
    Select State for Register Screen
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Enter Registered Email for Register Screen            ${E2E_TEST_EMAIL}
    Enter Valid Mobile Number                             ${E2E_TEST_PHONE}
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
    [Tags]  E2E  TC09  Registration   QuickRegistration
    # SEQUENTIAL - DEPENDENT ON TC07
    # Phone: 9960232311 (SAME AS TC07 - logs in with this user)
    # This test verifies that quick-registered users have feature access restrictions
    # Logs in the user created by TC07 and tests access restrictions
    # Must run AFTER TC07 passes
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
    [Tags]  E2E  TC10  Registration   QuickRegistration
    # TC10: Quick Registration user (9960232311) upgrades to Community Member
    # DEPENDENT ON TC07 - Reuses TC07's Quick Reg user (same as TC08, TC09)
    # Must run AFTER TC07, TC08, TC09 (LAST in sequence)
    # After TC10 passes, user becomes Community Member
    # To rerun: TC07 will delete and recreate the user in its pre-setup
    Open Gurutattva App
    Handle First Time Setup
    Login As Non Community Member
    # Trigger Become a Member flow from Events Tab
    Click on the Events Tab
    Click on the Become a Member Button
    Click on the NO and Second YES Radio Button from Community Registration for Become a Member
    Click on the Next Button from Community Registration
    Handle Location Permission
    Select Dhyankendra for Become a Member and click on the Next Button
    Fill address and pincode for become a member
    Fill the Education Information for become a member
    Verify Home Screen is displayed with correct details
    # After becoming member, verify full access to all features
    # Audio/Podcast verification
    Click on the Audio Tab
    Click on the Podcast Tab
    Verify Podcast Screen is displayed
    # Events verification
    Click on the Events Tab
    Verify Events Access
    # DhyanKendra verification
    Click on the Explore Button
    Click on the DhyanKendra Tab
    Handle DhyanKendra Location
    Verify DhyanKendra Access
    # Logout
    Click on the Profile Tab
    Click on the Logout Tab
    Click on the Yes Button from Logout Alert
    Close Gurutattva App
Verify that Community registration on the mobile app reflects correctly in the CMS and user details are displayed properly in profile and flip card.
    [Tags]  E2E  Registration   CommunityRegistration

    Open Gurutattva App
    Handle First Time Setup
    # TC11 Setup: Find available phone number, delete if exists
    TC11 Pre-Registration Setup
    # Generate unique test data for E2E validation (mobile number already set by pre-setup)
    Generate E2E Community Registration Test Data
    Click on Register Text Only
    Click on the Community Registration Tab
    Click on the NO and Second YES Radio Button from Community Registration
    Click on the Next Button from Community Registration
    Handle Location Permission
    Select Dhyankendra and click on the Next Button
    Fill the Personal and Address Information for Community Registration
    Fill the Personal,Select Unmarried and Education Information
    Verify OTP Screen is Displayed
    Enter OTP Automatically    999999
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
    [Tags]  TC14  E2E   Registration   CommunityRegistration
    # DEPENDENT ON TC11 - Uses Community Member created in TC11
    Open Gurutattva App
    Handle First Time Setup
    # TC14 Setup: Login as Community Member from TC11
    TC14 Login As Community Member
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