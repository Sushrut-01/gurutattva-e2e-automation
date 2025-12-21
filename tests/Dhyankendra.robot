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
    [Tags]    Dhyankendra    TC46
    # Mobile: Sadhak user (OTP-based) - Register Dhyankendra
    # CMS Step 1: Super Admin (sushrut.nistane@rysun.com / Sharu@051220) - Initial approval
    # CMS Step 2: Sanchalak - Vaishali/Vaishub (patilvaishub@gmail.com / Lavanya@21) - Request changes
    # CMS Step 3: Super Admin - Reject the requested changes
    # Mobile: Sadhak user - Verify rejection reflected in app
    # All credentials from: Roles & Rights Module
    Generate Center Name for Dhyankendra
    # --- Step 1: Mobile Registration by Sadhak ---
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Handle DhyanKendra Location
    Click on the Register Now for Dhyankendra
    Enter Center Name
    Select Premise Type
    Select Ownership
    Enter Sitting Capacity
    Select Morning Timeslot
    Select Evening Timeslot
    Click on the Next Button for Dhyankendra
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
    Select Sanchalak And Submit With Validation Loop
    Close Gurutattva App

    # --- Step 2: Super Admin Approval ---
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Click on the Edit Button in CMS
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Approve Button from Edit Request
    Verify the Edit Dhyankendra Success Message
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Verify the Approved Status in CMS
    Close Web Browser

    # --- Step 3: Sanchalak Request Changes ---
    Open Web Browser
    Login in with Sanchalak credentials
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Click on the Edit Button in CMS
    Change the Address of the Dhyankendra
    Select Community Hall Premise Type
    Click on the Submit Button for Web
    Verify the Edit Request Message
    Click on the Audio Menu
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Verify the Review Status as Pending
    Close Web Browser

    # --- Step 4: Super Admin REJECTS Changes ---
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Verify the Review Status as Pending
    Click on the Edit Button in CMS
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Reject Button from Edit Request
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Verify the Review Status as Rejected
    Close Web Browser

    # --- Step 5: Mobile Validation - Verify Rejection ---
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Validate the fields after rejection in the mobile app
    Close Gurutattva App

Verify Sadhak registration, Sanchalak approval, DhyanKendra activation/deactivation by Super Admin, update approval, and CMS login access
    [Tags]    Dhyankendra
    # Mobile: Sadhak user (OTP-based) - Register Dhyankendra
    # CMS Step 1: Super Admin (sushrut.nistane@rysun.com / Sharu@051220) - Initial approval
    # CMS Step 2: Sanchalak - Vaishali/Vaishub (patilvaishub@gmail.com / Lavanya@21) - Request changes
    # CMS Step 3: Super Admin - Approve the requested changes
    # CMS Step 4: Super Admin - Toggle INACTIVE (with Change Request approval)
    # CMS Step 5: Super Admin - Toggle ACTIVE (with Change Request approval)
    # Mobile: Sadhak user - Verify status at each stage
    # All credentials from: Roles & Rights Module
    Generate Center Name for Dhyankendra
    # --- Step 1: Mobile Registration by Sadhak ---
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Handle DhyanKendra Location
    Click on the Register Now for Dhyankendra
    Enter Center Name
    Select Premise Type
    Select Ownership
    Enter Sitting Capacity
    Select Morning Timeslot
    Select Evening Timeslot
    Click on the Next Button for Dhyankendra
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
    Select Sanchalak And Submit With Validation Loop
    Close Gurutattva App

    # --- Step 2: Super Admin Approval ---
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Click on the Edit Button in CMS
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Approve Button from Edit Request
    Verify the Edit Dhyankendra Success Message
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Verify the Approved Status in CMS
    Close Web Browser

    # --- Step 3: Mobile Validation - Verify Approval ---
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Validate the fields after approval in the mobile app
    Close Gurutattva App

    # --- Step 4: Sanchalak Request Changes ---
    Open Web Browser
    Login in with Sanchalak credentials
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Click on the Edit Button in CMS
    Change the Address of the Dhyankendra
    Select Community Hall Premise Type
    Click on the Submit Button for Web
    Verify the Edit Request Message
    Click on the Audio Menu
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Verify the Review Status as Pending
    Close Web Browser

    # --- Step 5: Super Admin APPROVES Changes ---
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Verify the Review Status as Pending
    Click on the Edit Button in CMS
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Approve Button from Edit Request
    Verify the Edit Dhyankendra Success Message
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Verify the Review Status as Approved
    Close Web Browser

    # --- Step 6: Mobile Validation - Verify Edit Approval ---
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Validate the fields after approval in the mobile app
    Close Gurutattva App

    # --- Step 7: Super Admin DEACTIVATES (INACTIVE) via Change Request ---
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Click on the Edit Button in CMS
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the User Status Checkbox
    Click on the User Inactive Button
    Verify the Edit Dhyankendra Success Message
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Verify the Active Inactive Status in CMS
    Close Web Browser

    # --- Step 8: Mobile Validation - Verify INACTIVE Status ---
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Validate the fields after rejection in the mobile app
    Close Gurutattva App

    # --- Step 9: Super Admin REACTIVATES (ACTIVE) via Change Request ---
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Click on the Edit Button in CMS
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the User Status Checkbox
    Click on the User Active Button
    Verify the Edit Dhyankendra Success Message
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Verify the Active Inactive Status in CMS
    Close Web Browser

    # --- Step 10: Mobile Validation - Verify ACTIVE Status ---
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Validate the fields after approval in the mobile app
    Close Gurutattva App

