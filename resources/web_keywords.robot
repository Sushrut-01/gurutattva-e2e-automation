*** Settings ***
Resource   libraries.robot
Resource   ../pages/loginPage.robot

*** Variables ***
# Web Application Configuration
${WEB_BASE_URL}              https://gurutattvacmsnewdev.rysun.in:9090/
${WEB_BROWSER}               chrome
${WEB_IMPLICIT_WAIT}         10s 
${EMAIL_FIELD}                    name=email
${PASSWORD_FIELD}                 name=password
${LOGIN_BUTTON}                   id=:r4:
${DASHBOARD_TEXT}                 Dashboard

*** Keywords ***
Open Web Browser
    [Documentation]    Opens web browser and navigates to Gurutattva website
    Log To Console    🌐 Opening web browser: ${WEB_BROWSER}
    Log To Console    🔗 Navigating to: ${WEB_BASE_URL}
    Web Open Browser    ${WEB_BASE_URL}    ${WEB_BROWSER}
    Web Maximize Browser Window
    Web Set Selenium Implicit Wait    ${WEB_IMPLICIT_WAIT}
    Log To Console    ✅ Web browser opened successfully

    # Handle SSL Certificate Warning (if present)
    ${ssl_warning_present}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    id=details-button    3s
    IF    ${ssl_warning_present}
        Log To Console    ⚠️ SSL Certificate warning detected, clicking Advanced...
        Web Click Element    id=details-button
        Sleep    1s
        Web Click Element    id=proceed-link
        Sleep    2s
        Log To Console    ✅ Proceeded past SSL warning
    END
    
     # Clear cookies and cache
    # Delete All Cookies
    # Execute Javascript    window.localStorage.clear();

Login in with valid credentials
    [Documentation]    Logs in to web application with valid credentials
    Web Wait Until Page Contains Element    ${EMAIL_FIELD}    10s
    Web Input Text    ${EMAIL_FIELD}    sushrut.nistane@rysun.com
    Web Input Password    ${PASSWORD_FIELD}    Sharu@051220
    Web Click Button    ${LOGIN_BUTTON}
    Sleep    5s
    Web Wait Until Page Contains    ${DASHBOARD_TEXT}    20s

Close Web Browser
    [Documentation]    Closes web browser
    Web Close All Browsers

