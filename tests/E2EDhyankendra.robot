*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    ../pages/E2EAudioPage.robot
Resource    ../pages/DhyankendraPage.robot
Resource    ../pages/CRM_AudioPage.robot

Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***

Test Dhyankendra Different Filter Functionality
    [Documentation]    Test different filter combinations on Dhyankendra page
    [Tags]    e2e    dhyankendra    filter    tc58_02    milestone2

    # --- Web CRM: Test Filter Function
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

    # ===== EDGE CASES =====
    # Test Filter 15: Center Name Filter with "is empty" operator
    Log To Console    🔍 Testing Filter 15: Center Name is empty
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Center Name Filter    is empty    ${EMPTY}
    DhyankendraPage.Verify Center Name Filter Results    ${EMPTY}
    E2EAudioPage.Clear All Filters

    # Test Filter 16: Email Filter with "is not empty" operator
    Log To Console    🔍 Testing Filter 16: Email is not empty
    E2EAudioPage.Click Filter Button
    DhyankendraPage.Apply Email Filter    is not empty    ${EMPTY}
    DhyankendraPage.Verify Email Filter Results    ${EMPTY}
    E2EAudioPage.Clear All Filters

    Log To Console    ✅ All Dhyankendra filter tests completed successfully
    Close Web Browser

Test Dhyankendra Management Refresh Button Functionality
    [Documentation]    Test refresh button maintains pagination count for Dhyankendra
    [Tags]    e2e    dhyankendra    refresh    TC61    milestone2

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