*** Settings ***
Resource            ../resources/libraries.robot
Resource            ../resources/keywords.robot
Resource            ../resources/web_keywords.robot
Resource            ../resources/test_setup_teardown.robot
Resource            ../pages/E2ERoleRightPage.robot

Test Setup          Test Setup
Test Teardown       Test Teardown

*** Test Cases ***
Test Prayer Coordinator Role Access
    [Documentation]    Login as Prayer Coordinator and validate menu access as per role and rights
    [Tags]    role_rights    prayer_coordinator    tc01    milestone2
    
    Test User Role Access    Prayer Coordinator

Test Global Event Coordinator Role Access
    [Documentation]    Login as Global Event Coordinator and validate menu access as per role and rights
    [Tags]    role_rights    global_event_coordinator    tc02    milestone2
    
    Test User Role Access    Global Event Coordinator

Test Acharya Role Access
    [Documentation]    Login as Acharya and validate menu access as per role and rights
    [Tags]    role_rights    acharya    tc03    milestone2
    
    Test User Role Access    Acharya

Test Maha Acharya Role Access
    [Documentation]    Login as Maha Acharya and validate menu access as per role and rights
    [Tags]    role_rights    maha_acharya    tc04    milestone2
    
    Test User Role Access    Maha Acharya

Test Namkaran Coordinator Role Access
    [Documentation]    Login as Namkaran Coordinator and validate menu access as per role and rights
    [Tags]    role_rights    namkaran_coordinator    tc05    milestone2
    
    Test User Role Access    Namkaran Coordinator

# Test All User Roles Access - Comprehensive
#     [Documentation]    Test all user roles in a single comprehensive test case
#     [Tags]    role_rights    comprehensive    all_roles    tc06
    
#     @{user_roles}=    Create List    Prayer Coordinator    Global Event Coordinator    Acharya    Maha Acharya    Namkaran Coordinator
    
#     FOR    ${user_role}    IN    @{user_roles}
#         Log To Console    🔄 Testing role: ${user_role}
#         Test User Role Access    ${user_role}
#         Log To Console    ✅ Completed testing for: ${user_role}
#     END
    
#     Log To Console    🎉 All user role access tests completed successfully
