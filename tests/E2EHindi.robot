*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    ../pages/E2EHindiPage.robot

Test Setup    Test Setup
Test Teardown    Hindi Test Teardown

*** Keywords ***
Hindi Test Teardown
    [Documentation]    Custom teardown that reverts language to English before standard teardown
    # Revert language to English (handles both pass and fail scenarios)
    Run Keyword And Ignore Error    Revert Language To English
    Run Keyword And Ignore Error    Wait For Language Change    5s
    # Run standard teardown
    Test Teardown

*** Test Cases ***

Test Mobile Language Change To Hindi
    [Documentation]    Test case to change mobile app language to Hindi, validate content, and revert back to English
    [Tags]    mobile    hindi    language    tc62

    Open Gurutattva App

    # --- Mobile App: Test Language Change to Hindi ---
    Log To Console    🚀 Starting Mobile Language Change Test
    
    # Step 1: Go to Profile page and change language to Hindi
    Log To Console    📱 Step 1: Going to Profile page and changing language to Hindi
    Change Language To Hindi
    Wait For Language Change    5s
    
    # Step 2: Validate Hindi content in the app
    Log To Console    📱 Step 2: Validating Hindi content in the app
    Validate Complete Hindi Content
    
    # Step 3: Go to Profile page and change language back to English
    Log To Console    📱 Step 3: Going to Profile page and changing language back to English
    Revert Language To English
    Wait For Language Change    5s
    
    Log To Console    ✅ Mobile Language Change Test completed successfully
    Log To Console    📱 Language changed to Hindi, validated, and reverted to English
