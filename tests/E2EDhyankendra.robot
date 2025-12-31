*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/web_keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    ../pages/E2EAudioPage.robot
Resource    ../pages/DhyankendraPage.robot
Resource    ../pages/CRM_AudioPage.robot
Resource    ../pages/E2EPrayerPage.robot

Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***

Test Dhyankendra Different Filter Functionality
    [Documentation]    Test different filter combinations on Dhyankendra page
    [Tags]    e2e    dhyankendra    filter    tc58_02    milestone2

    # --- Web CRM: Test Filter Function
    # Role: Super Admin (sushrut.nistane@rysun.com / Sharu@051220)
    # Reason: Needs full access to all filters and records
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu

    # ===== TEXT INPUT FILTERS =====
    #Test Filter 1: Center Name Filter with "equals" operator
    Log To Console    🔍 Testing Filter 1: Center Name equals "Ahmedabad"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Center Name Filter    equals    Ahmedabad
    DhyankendraPage.Verify Center Name Filter Results    Ahmedabad
    E2EAudioPage.Clear All Filters

    # Test Filter 2: Center Name Filter with "contains" operator
    Log To Console    🔍 Testing Filter 2: Center Name contains "E2E"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Center Name Filter    contains    E2E
    DhyankendraPage.Verify Center Name Filter Results    E2E
    E2EAudioPage.Clear All Filters

    # Test Filter 3: Address Filter with "starts with" operator
    Log To Console    🔍 Testing Filter 3: Address starts with "Test"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Address Filter    starts with    Test
    DhyankendraPage.Verify Address Filter Results    Test
    E2EAudioPage.Clear All Filters

    # Test Filter 4: Primary Sanchalak Filter with "contains" operator
    Log To Console    🔍 Testing Filter 4: Primary Sanchalak contains "yatish"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Primary Sanchalak Filter    contains    yatish
    DhyankendraPage.Verify Primary Sanchalak Filter Results    yatish
    E2EAudioPage.Clear All Filters

    # Test Filter 5: Phone Number Filter with "contains" operator
    Log To Console    🔍 Testing Filter 5: Phone No. contains "918877"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Phone Number Filter    contains    918877
    DhyankendraPage.Verify Phone Number Filter Results    918877
    E2EAudioPage.Clear All Filters

    # Test Filter 6: Email Filter with "ends with" operator
    Log To Console    🔍 Testing Filter 6: Email ends with "@test.com"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Email Filter    ends with    @test.com
    DhyankendraPage.Verify Email Filter Results    @test.com
    E2EAudioPage.Clear All Filters

    # ===== DROPDOWN SELECTION FILTERS =====
    # Test Filter 7: Premise Type Filter with "is" operator
    Log To Console    🔍 Testing Filter 7: Premise Type is "Temple"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Premise Type Filter    is    Temple
    DhyankendraPage.Verify Premise Type Filter Results    Temple
    E2EAudioPage.Clear All Filters

    # Test Filter 8: Premise Type Filter with "is any of" operator
    Log To Console    🔍 Testing Filter 8: Premise Type is any of "Temple, Community Hall"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Premise Type Filter    is any of    Temple, Community Hall
    DhyankendraPage.Verify Premise Type Filter Results    Temple
    E2EAudioPage.Clear All Filters

    # Test Filter 9: Status Filter with "is" operator
    Log To Console    🔍 Testing Filter 9: Status is "Approved"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Status Filter Dhyankendra    is    Approved
    DhyankendraPage.Verify Status Filter Results for Dhyankendra    is    Approved
    E2EAudioPage.Clear All Filters

    # Test Filter 10: Status Filter with "is not" operator
    Log To Console    🔍 Testing Filter 10: Status is not "Rejected"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Status Filter Dhyankendra    is not    Rejected
    DhyankendraPage.Verify Status Filter Results for Dhyankendra    is not    Rejected
    E2EAudioPage.Clear All Filters

    # Test Filter 11: Status Filter with "is any of" operator
    # Log To Console    🔍 Testing Filter 11: Status is any of "Approved, Pending"
    # E2EAudioPage.Click Filter Button
    # DhyankendraPage.Apply Status Filter Dhyankendra    is any of    Approved, Pending
    # DhyankendraPage.Verify Status Filter Results for Dhyankendra    is any of    Approved, Pending
    # E2EAudioPage.Clear All Filters

    # Test Filter 12: Active/Inactive Filter with "is" operator
    Log To Console    🔍 Testing Filter 12: Active/Inactive is "Active"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Active Inactive Filter    is    Active
    DhyankendraPage.Verify Active Inactive Filter Results    Active
    E2EAudioPage.Clear All Filters

    # Test Filter 13: Review Status Filter with "is" operator
    Log To Console    🔍 Testing Filter 13: Review Status is "Not Applicable"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Review Status Filter    is    Not Applicable
    DhyankendraPage.Verify Review Status Filter Results    Not Applicable
    E2EAudioPage.Clear All Filters

    # Test Filter 14: Review Status Filter with "is not" operator
    Log To Console    🔍 Testing Filter 14: Review Status is not "Rejected"
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Review Status Filter    is not    Rejected
    DhyankendraPage.Verify Review Status Filter Results    Rejected
    E2EAudioPage.Clear All Filters

    # ===== EDGE CASES (SKIPPED - operators not available in CMS) =====
    # Filter 15 & 16 commented out - "is empty" and "is not empty" operators
    # are not available in the CMS filter dropdown
    # Log To Console    🔍 Testing Filter 15: Center Name is empty
    # E2EAudioPage.Click Filter Button
    # DhyankendraPage.Apply Center Name Filter    is empty    ${EMPTY}
    # DhyankendraPage.Verify Center Name Filter Results    ${EMPTY}
    # E2EAudioPage.Clear All Filters
    # Log To Console    🔍 Testing Filter 16: Email is not empty
    # E2EAudioPage.Click Filter Button
    # DhyankendraPage.Apply Email Filter    is not empty    ${EMPTY}
    # DhyankendraPage.Verify Email Filter Results    ${EMPTY}
    # E2EAudioPage.Clear All Filters

    Log To Console    ✅ All Dhyankendra filter tests completed successfully
    Close Web Browser

Test Dhyankendra Management Refresh Button Functionality
    [Documentation]    Test refresh button maintains pagination count for Dhyankendra
    [Tags]    e2e    dhyankendra    refresh    TC61    milestone2

    # --- Web CRM: Test Refresh Button for Dhyankendra ---
    # Role: Super Admin (sushrut.nistane@rysun.com / Sharu@051220)
    # Reason: Needs full access to see all pagination records
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    
    # Wait for page to load and get initial pagination count
    Sleep    5s
    ${initial_count}=    Get Total Record Count From Pagination
    Log To Console    📊 Initial pagination count: ${initial_count}
    
    # If count is 0, wait a bit more for data to load
    IF    ${initial_count} == 0
        Log To Console    ⚠️ Initial count is 0, waiting for data to load...
        Sleep    5s
        ${initial_count}=    Get Total Record Count From Pagination
        Log To Console    📊 Initial pagination count (after wait): ${initial_count}
    END
    
    # Click refresh button
    Click Refresh Button
    Sleep    3s
    
    # Get refreshed pagination count
    ${refreshed_count}=    Get Total Record Count From Pagination
    Log To Console    📊 Refreshed pagination count: ${refreshed_count}
    
    # Verify counts match
    Should Be Equal    ${refreshed_count}    ${initial_count}
    Log To Console    ✅ Dhyankendra refresh button test completed successfully
    Close Web Browser

Sanchalak login to CMS application and as per the role and rights it should have access to left menu. News, Event, Dhyankendra added by own, Dhyansthali
    [Tags]  E2E  TC65  Dhyankendra   milestone2
    # Role: Sanchalak (patilvaishub@gmail.com / Lavanya@21) - Vaishali/Vaishub
    # From: Roles & Rights Module - CRM_AudioPage.robot
    # Reason: Test role-based menu access - verify Sanchalak sees only permitted menus
    Open Web Browser
    Login in with Sanchalak credentials
    Verify the left menu access
    Close Web Browser

Login from Mobile as Sadhak and register for Dhyankendra. Compare all the fields of Mobile with CMS.
    [Tags]  E2E  TC64  Dhyankendra
    # Mobile: Sadhak user (OTP-based authentication)
    # CMS: Super Admin (sushrut.nistane@rysun.com / Sharu@051220) - to validate registered data
    # Reason: Mobile uses app-based OTP auth, CMS needs Super Admin to view all submissions
    Generate Center Name for Dhyankendra
    Open Gurutattva App
    Handle First Time Setup
    # Login as Sadhak user (9835625646) to access Dhyankendra tab
    Login As Dhyankendra Sadhak
    Click on the Explore Button
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
    # Dynamic Sanchalak selection with validation loop
    # Enters Email/Mobile once, then tries Sanchalaks by index until one is not already registered
    Select Sanchalak And Submit With Validation Loop
    Close Gurutattva App
    # --- CMS Validation by Super Admin ---
    Validate the filled value on that sadak user on the CMS side

Sanchalak edits any field of Dhyankendra. Super Admin/ Acharya Rejectes the changes requeted. check reflection in mobile app.
    [Tags]  E2E  TC67  Dhyankendra
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
    # Login as Sadhak user (9835625646) to access Dhyankendra tab
    Login As Dhyankendra Sadhak
    Click on the Explore Button
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
    # Already on Dhyankendra listing page after submit, no need to navigate away
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

Sanchalak edits any field of Dhyankendra. Super Admin/ Acharya approves the changes requeted. Check refleciton in Mobile app.
    [Tags]  E2E  TC66  Dhyankendra
    # Mobile: Sadhak user (OTP-based) - Register Dhyankendra
    # CMS Step 1: Super Admin (sushrut.nistane@rysun.com / Sharu@051220) - Initial approval
    # CMS Step 2: Sanchalak - Vaishali/Vaishub (patilvaishub@gmail.com / Lavanya@21) - Request changes
    # CMS Step 3: Super Admin - Approve the requested changes
    # Mobile: Sadhak user - Verify approval reflected in app
    # All credentials from: Roles & Rights Module
    Generate Center Name for Dhyankendra
    # --- Step 1: Mobile Registration by Sadhak ---
    Open Gurutattva App
    Handle First Time Setup
    # Login as Sadhak user (9835625646) to access Dhyankendra tab
    Login As Dhyankendra Sadhak
    Click on the Explore Button
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
    # Already on Dhyankendra listing page after submit, no need to navigate away
    Click on the Search Button
    Verify the Review Status as Pending
    Close Web Browser

    # --- Step 4: Super Admin APPROVES Changes ---
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

    # --- Step 5: Mobile Validation - Verify Approval ---
    Open Gurutattva App
    Handle First Time Setup
    Click on the DhyanKendra Tab
    Validate the fields after approval in the mobile app
    Close Gurutattva App

Change the Primary Sanchalak from Dhyankendra and add other sanchalak
    [Tags]    E2E    Web    Dhyankendra    TC68
    # Role: Super Admin (sushrut.nistane@rysun.com / Sharu@051220)
    # Reason: Only Super Admin can modify Sanchalak assignments for Dhyankendra centers
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Open Dhyankendra Management And Show Approved Records
    Open Edit For First Approved Dhyankendra
    Handle Pending Change Request If Present
    # After rejecting, page navigates back to listing. Now search by center name (status is now Rejected)
    Log To Console    After rejecting, searching for the same record by center name...
    Search Dhyankendra By Center Name    ${E2E_DHYANKENDRA_NAME}
    Sleep    2s
    # Open edit for the record found by center name
    ${row_more}=    Set Variable    xpath=//div[@role='row']//button[@aria-label='more']
    Web Wait Until Element Is Visible    ${row_more}    10s
    Web Scroll Element Into View         ${row_more}
    Web Click Element    ${row_more}
    Sleep    2s
    Web Wait Until Element Is Visible    ${DHYANKENDRA_EDIT_BUTTON}    10s
    Web Click Element    ${DHYANKENDRA_EDIT_BUTTON}
    Sleep    5s
    # Now edit the Primary Sanchalak (no Change Request button this time)
    Go To Sanchalak Details Section
    Change Primary Sanchalak To Available One
    Verify Sanchalak Update Outcome
    Close Web Browser