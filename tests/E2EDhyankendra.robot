*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    ../pages/E2EAudioPage.robot
Resource    ../pages/CRM_AudioPage.robot

Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***

Test Dhyankendra Different Filter Functionality
    [Documentation]    Test different filter combinations on Dhyankendra page
    [Tags]    e2e    dhyankendra    filter    tc58_02

    # --- Web CRM: Test Filter Functionality ---
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu

    # Test Filter 1: Center Name Filter with "is" operator
    Log To Console    🔍 Testing Filter 1: Center Name = "Ahmedabad"
    Click Filter Button
    Apply Center Name Filter    Ahmedabad
    Verify Center Name Filter Results    Ahmedabad
    Clear All Filters

    # Test Filter 2: Status Filter with "is" operator
    Log To Console    🔍 Testing Filter 2: Status = "Pending"
    Click Filter Button
    Apply Status Filter    Pending
    Verify Status Filter Results    Pending
    Clear All Filters

    # Test Filter 3: Approval Status Filter with "is" operator
    Log To Console    🔍 Testing Filter 3: Approval Status = "Not Applicable"
    Click Filter Button
    Apply Approval Status Filter    Not Applicable
    Verify Approval Status Filter Results    Not Applicable
    Clear All Filters

    # Test Filter 4: Is Active Filter with "is" operator
    Log To Console    🔍 Testing Filter 4: Is Active = "Active"
    Click Filter Button
    Apply Is Active Filter    Active
    Verify Is Active Filter Results    Active
    Clear All Filters

    # Test Filter 5: Status Filter for "Approved"
    Log To Console    🔍 Testing Filter 5: Status = "Approved"
    Click Filter Button
    Apply Status Filter    Approved
    Verify Status Filter Results    Approved
    Clear All Filters

    # Test Filter 6: Center Name Filter with "is not" operator
    Log To Console    🔍 Testing Filter 6: Center Name is not "Ahmedabad"
    Click Filter Button
    Apply Center Name Filter Not    Ahmedabad
    Verify Center Name Filter Not Results    Ahmedabad
    Clear All Filters

    Log To Console    ✅ All Dhyankendra filter tests completed successfully
    Close Web Browser

Test Dhyankendra Management Refresh Button Functionality
    [Documentation]    Test refresh button maintains pagination count for Dhyankendra
    [Tags]    e2e    dhyankendra    refresh    TC61

    # --- Web CRM: Test Refresh Button for Dhyankendra ---
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