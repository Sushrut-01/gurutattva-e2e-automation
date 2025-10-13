*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot
Library    DateTime
Resource   ../resources/web_keywords.robot
Resource   ../pages/loginPage.robot


*** Variables ***
${User_Management_MENU}                 xpath=//span[contains(text(),'User Management')]
${User_SearchBox}                       xpath=//input[@type='search' and @placeholder='Search…']
${User_Status_Checkbox}                 xpath=//span[contains(@class,'MuiSwitch-switchBase')]
${User_Inactive_Button}                 xpath=//button[contains(text(),'Inactive')]
${User_Status_Updated_Successfully}     xpath=//li[contains(@class,'minimal__snackbar__success')]//div[contains(@class,'minimal__snackbar__title') and contains(text(),'User status updated successfully')]
${User_Active_Button}                  xpath=//button[contains(text(),'Active')]




*** Keywords ***
Click on the User Management Menu From CMS
    [Documentation]    Clicks on the User Management Menu
    Web Wait Until Element Is Visible    ${User_Management_MENU}    10s
    Sleep   2s
    Web Click Element    ${User_Management_MENU}
    Log To Console    ✅ Clicked on the User Management Menu

Click on the User Search Box
    [Documentation]    Clicks on the User Search Box
    Web Wait Until Element Is Visible    ${User_SearchBox}    10s
    Sleep   2s
    Web Click Element    ${User_SearchBox}
    Log To Console    ✅ Clicked on the User Search Box

Enter the User Registration Email
    [Documentation]    Enters the User Registration Email
    Web Input Text    ${User_SearchBox}    yatishd.actowiz@gmail.com

Click on the User Status Checkbox
    [Documentation]    Clicks on the User Status Checkbox
    Web Wait Until Element Is Visible    ${User_Status_Checkbox}    10s
    Sleep   2s
    Web Click Element    ${User_Status_Checkbox}
    Log To Console    ✅ Clicked on the User Status Checkbox
    Sleep   2s 

Click on the User Inactive Button
    [Documentation]    Clicks on the User Inactive Button
    Web Wait Until Element Is Visible    ${User_Inactive_Button}    10s
    Sleep   2s
    Web Click Element    ${User_Inactive_Button}
    Log To Console    ✅ Clicked on the User Inactive Button

Verify User Status Updated Successfully
    [Documentation]    Verifies that the user status is updated successfully
    Sleep   2s
    Web Page Should Contain Element    ${User_Status_Updated_Successfully}
    Web Element Should Be Visible    ${User_Status_Updated_Successfully}
    Log To Console    ✅ User status updated successfully

Verify User is not able to login on the mobile app
    [Documentation]    Verifies that the user is not able to login on the mobile app
    Click on the input field
    Enter the Mobile Number
    Click on the Login Button
    Verify Validation Message For unexist User
    # Verify OTP Screen is Not Displayed
    Enter the validate and exist email address
    Click on the Login Button
    Verify Validation Message For unexist User
    # Verify OTP Screen is Not Displayed
    Close Gurutattva App

Enter the Mobile Number
    [Documentation]    Enters the Mobile Number
    Mobile Input Text    ${LOGIN_EMAIL}    9824903467

Click on the User Active Button
    [Documentation]    Clicks on the User Active Button
    Web Wait Until Element Is Visible    ${User_Active_Button}    10s
    Sleep   2s
    Web Click Element    ${User_Active_Button}
    Log To Console    ✅ Clicked on the User Active Button

Verify OTP Screen is Not Displayed
    [Documentation]    Verifies that the OTP screen is not displayed
    ${element_exists}=    Run Keyword And Return Status    Mobile Page Should Contain Element    ${Verify_OTP_SCREEN}
    Should Not Be True    ${element_exists}    OTP screen should not be displayed
    Log To Console    ✅ OTP screen is not displayed


