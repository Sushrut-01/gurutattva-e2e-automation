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
Resource    ../pages/DhyankendraPage.robot
Resource    ../pages/UserManagementPage.robot
Resource    ../pages/ExplorePage.robot
Resource    ../pages/E2EPrayerPage.robot

Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***
Verify when super admin is able to reject the dhyankendra request of sadhak and verify the status as Rejected on the mobile app
    [Tags]  E2E    Dhyankendra    TC46  
    Generate Center Name for Dhyankendra
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login
    Click on the DhyanKendra Tab
    Handle DhyanKendra Location
    Click on the Register Now for Dhyankendra
    Enter Center Name
    Select Premise Type
    Select Ownership
    Enter Sitting Capacity
    Enter Full Address For Dhyankendra
    Enter Pincode For Dhyankendra
    Select Country for Dhyankendra
    Select State for Dhyankendra
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Click on the Next Button for Dhyankendra
    Enter Hall Length
    Enter Hall Width
    Enter Hall Height
    Select Library
    Select Parking Space
    Select Ground Floor
    Select Air Conditioner
    Select Toilet/Bathrooms
    Select Notice Board
    Select Noise Level
    Select Ventilation
    Select Roof Type
    Select User for Dhyankendra    yatish
    Enter Email for Dhyankendra
    Enter Mobile for Dhyankendra
    Click on the Submit Button for Dhyankendra
    Close Gurutattva App
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Verify the created Dhyankendra in CMS
    Click on the Edit Button in CMS
    Click on the reject button in CMS
    Verify the Update Message For Dhyankendra
    Click on the Cancel Button in CMS
    Verify the Rejected Status in CMS
    Close Web Browser
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Verify the Dhyankendra in the List
    Close Gurutattva App

Verify Sadhak registration, Sanchalak approval, DhyanKendra activation/deactivation by Super Admin, update approval, and CMS login access
    [Tags]  E2E    Dhyankendra      
    Generate Center Name for Dhyankendra
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Handle DhyanKendra Location
    Click on the Register Now for Dhyankendra
    Enter Center Name
    Select Premise Type
    Select Ownership
    Enter Sitting Capacity
    Enter Full Address For Dhyankendra
    Enter Pincode For Dhyankendra
    Select Country for Dhyankendra
    Select State for Dhyankendra
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Click on the Next Button for Dhyankendra
    Enter Hall Length
    Enter Hall Width
    Enter Hall Height
    Select Library
    Select Parking Space
    Select Ground Floor
    Select Air Conditioner
    Select Toilet/Bathrooms
    Select Notice Board
    Select Noise Level
    Select Ventilation
    Select Roof Type
    Select User for Dhyankendra    yatish
    Enter Email for Dhyankendra
    Enter Mobile for Dhyankendra
    Click on the Submit Button for Dhyankendra
    Verify Dhyankendra Success Message
    Close the success message for Dhyankendra
    Verify Submitted Application Content
    # Click on the Back Button from Application List
    # Click on the Profile Tab
    # Click on the Logout Tab
    # Click on the Yes Button from Logout Alert
    Close Gurutattva App
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Verify the created Dhyankendra in CMS
    Click on the Edit Button in CMS
    Click on the approve button in CMS
    Click on the Cancel Button in CMS
    Verify the Approved Status in CMS
    Close Web Browser
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login
    Click on the DhyanKendra Tab
    Verify the Approved Dhyankendra in the List
    # Click on the Back Button from Dhyankendra List
    # Click on the Profile Tab
    # Verify the user is assigned as a sanchalak in the Profile Card
    Close Gurutattva App
    Open Web Browser
    Login in with valid credentials
    Click on the Prayer Menu
    Click on the Dhyankendra Management Menu
    Filter the Dhyankendra in CMS by Center Name
    Click on the User Status Checkbox
    Click on the User Inactive Button
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Verify the Dhyankendra in the List
    Close Gurutattva App
    Click on the User Status Checkbox
    Click on the User Active Button
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Verify the Approved Dhyankendra in the List
    Close Gurutattva App
    Close Web Browser
    Open Web Browser
    Login in with Sanchalak credentials
    Click on the Dhyankendra Management Menu
    Filter the Dhyankendra in CMS by Center Name
    Click on the Edit Button in CMS
    Select Community Hall Premise Type
    Click on the Submit Button for Web
    Verify the Edit Request Message
    Click on the Audio Menu
    Click on the Dhyankendra Management Menu
    Verify the Review Status as Pending
    Close Web Browser
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Verify the Review Status as Pending
    Click on the Edit Button in CMS
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Approve Button from Edit Request
    Verify the Edit Dhyankendra Success Message
    Click on the Prayer Menu
    Click on the Dhyankendra Management Menu
    Verify the Review Status as Approved
    Close Web Browser

Sanchalak login to CMS application and as per the role and rights it should have access to left menu. News, Event, Dhyankendra added by own, Dhyansthali   
    [Tags]  E2E  TC65  Dhyankendra   milestone2   
    Open Web Browser
    Login in with Sanchalak credentials
    Verify the left menu access
    Close Web Browser

Login from Mobile as Sadhak and register for Dhyankendra. Compare all the fields of Mobile with CMS.
    [Tags]  E2E  TC64  Dhyankendra  milestone2
    Generate Center Name for Dhyankendra
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Handle DhyanKendra Location
    Click on the Register Now for Dhyankendra
    Enter Center Name
    Select Premise Type
    Select Ownership
    Enter Sitting Capacity
    Enter Full Address For Dhyankendra
    Enter Pincode For Dhyankendra
    Select Country for Dhyankendra
    Select State for Dhyankendra
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Click on the Next Button for Dhyankendra
    Enter Hall Length
    Enter Hall Width
    Enter Hall Height
    Select Library
    Select Parking Space
    Select Ground Floor
    Select Air Conditioner
    Select Toilet/Bathrooms
    Select Notice Board
    Select Noise Level
    Select Ventilation
    Select Roof Type
    Select User for Dhyankendra    yatish
    Enter Email for Dhyankendra
    Enter Mobile for Dhyankendra
    Click on the Submit Button for Dhyankendra
    Close Gurutattva App
    Validate the filled value on that sadak user on the CMS side

Sanchalak edits any field of Dhyankendra. Super Admin/ Acharya Rejectes the changes requeted. check reflection in mobile app. 
    [Tags]  E2E  TC67  Dhyankendra  milestone2
    Generate Center Name for Dhyankendra
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Handle DhyanKendra Location
    Click on the Register Now for Dhyankendra
    Enter Center Name
    Select Premise Type
    Select Ownership
    Enter Sitting Capacity
    Enter Full Address For Dhyankendra
    Enter Pincode For Dhyankendra
    Select Country for Dhyankendra
    Select State for Dhyankendra
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Click on the Next Button for Dhyankendra
    Enter Hall Length
    Enter Hall Width
    Enter Hall Height
    Select Library
    Select Parking Space
    Select Ground Floor
    Select Air Conditioner
    Select Toilet/Bathrooms
    Select Notice Board
    Select Noise Level
    Select Ventilation
    Select Roof Type
    Select User for Dhyankendra    yatish
    Enter Email for Dhyankendra
    Enter Mobile for Dhyankendra
    Click on the Submit Button for Dhyankendra   
    Close Gurutattva App
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Verify the created Dhyankendra in CMS
    Click on the Edit Button in CMS
    Click on the approve button in CMS
    Click on the Cancel Button in CMS
    Verify the Approved Status in CMS
    Close Web Browser
    Open Web Browser
    Login in with Sanchalak credentials
    Click on the Dhyankendra Management Menu
    Filter the Dhyankendra in CMS by Center Name
    Click on the Edit Button in CMS
    Change the Address of the Dhyankendra
    Select Community Hall Premise Type
    Click on the Submit Button for Web
    Verify the Edit Request Message
    Click on the Audio Menu
    Click on the Dhyankendra Management Menu
    Verify the Review Status as Pending
    Close Web Browser
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Verify the Review Status as Pending
    Click on the Edit Button in CMS
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Reject Button from Edit Request
    Click on the Prayer Menu
    Click on the Dhyankendra Management Menu
    Verify the Review Status as Rejected
    Close Web Browser
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Validate the fields after rejection in the mobile app
    Close Gurutattva App

Sanchalak edits any field of Dhyankendra. Super Admin/ Acharya approves the changes requeted. Check refleciton in Mobile app. 
    [Tags]  E2E  TC66  Dhyankendra  milestone2
    Generate Center Name for Dhyankendra
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Handle DhyanKendra Location
    Click on the Register Now for Dhyankendra
    Enter Center Name
    Select Premise Type
    Select Ownership
    Enter Sitting Capacity
    Enter Full Address For Dhyankendra
    Enter Pincode For Dhyankendra
    Select Country for Dhyankendra
    Select State for Dhyankendra
    Select District for Register Screen
    Select Taluka/City for Register Screen
    Select Area/Village for Register Screen
    Click on the Next Button for Dhyankendra
    Enter Hall Length
    Enter Hall Width
    Enter Hall Height
    Select Library
    Select Parking Space
    Select Ground Floor
    Select Air Conditioner
    Select Toilet/Bathrooms
    Select Notice Board
    Select Noise Level
    Select Ventilation
    Select Roof Type
    Select User for Dhyankendra    yatish
    Enter Email for Dhyankendra
    Enter Mobile for Dhyankendra
    Click on the Submit Button for Dhyankendra   
    Close Gurutattva App
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Verify the created Dhyankendra in CMS
    Click on the Edit Button in CMS
    Click on the approve button in CMS
    Click on the Cancel Button in CMS
    Verify the Approved Status in CMS
    Close Web Browser
    Open Web Browser
    Login in with Sanchalak credentials
    Click on the Dhyankendra Management Menu
    Filter the Dhyankendra in CMS by Center Name
    Click on the Edit Button in CMS
    Change the Address of the Dhyankendra
    Select Community Hall Premise Type
    Click on the Submit Button for Web
    Verify the Edit Request Message
    Click on the Audio Menu
    Click on the Dhyankendra Management Menu
    Verify the Review Status as Pending
    Close Web Browser
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Verify the Review Status as Pending
    Click on the Edit Button in CMS
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Approve Button from Edit Request
    Verify the Edit Dhyankendra Success Message
    Click on the Prayer Menu
    Click on the Dhyankendra Management Menu
    Verify the Review Status as Approved
    Close Web Browser
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Validate the fields after approval in the mobile app
    Close Gurutattva App

Change the Primary Sanchalak from Dhyankendra and add other sanchalak
    [Tags]    Web    Dhyankendra    TC_CHANGE_SANCHALAK    milestone2
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Open Dhyankendra Management And Show Approved Records
    Open Edit For First Approved Dhyankendra
    Go To Sanchalak Details Section
    Change Primary Sanchalak To    Keshav    Keshav - 20
    Handle Validation And Submit Or Cancel
    Verify Sanchalak Update Outcome
    Close Web Browser