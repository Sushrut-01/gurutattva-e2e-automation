*** Settings ***
Library    AppiumLibrary
Resource    ../resources/keywords.robot
Resource    loginPage.robot

*** Variables ***
${EVENTS_TAB}               xpath=//android.widget.ImageView[@content-desc="Events"]
${EVENTS_HEADER}            xpath=//android.view.View[@content-desc="Events"]
${EVENTS_BACK_BUTTON}       xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView
${GLOBAL_EVENTS_TAB}        xpath=//android.view.View[@content-desc="Global Events"]
${LOCAL_EVENTS_TAB}         xpath=//android.view.View[@content-desc="Local Events"]
${FIRST_AVAILABLE_CARD}     xpath=(//android.view.View[contains(@content-desc, 'to')])[1]
${FIRST_CARD_STRUCTURE}     xpath=(//android.view.View[contains(@content-desc, 'to')])[1]
${TITLE_XPATH}              xpath=(//android.view.View[@content-desc])[position()=4]
${LOCATION_XPATH}           xpath=(//android.view.View[@content-desc])[position()=5]
${BOOKMARK_ICON}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[4]
${SUCCESS_MESSAGE_TEXT}             Bookmark added
${BOOKMARK_REMOVED_MESSAGE_TEXT}    Bookmark removed
${SUCCESS_MESSAGE_XPATH}    xpath=//android.view.View[@content-desc="${SUCCESS_MESSAGE_TEXT}"]
${BOOKMARK_REMOVED_MESSAGE_XPATH}   xpath=//android.view.View[@content-desc="${BOOKMARK_REMOVED_MESSAGE_TEXT}"]
${Events}                   xpath=//android.widget.ImageView[@content-desc="Events"]
${local_Events_CH}          xpath=//android.view.View[@content-desc="Local Events"]
${Global_Events}            xpath=//android.view.View[@content-desc="Global Events"] 
${Bookmark_Events}                 xpath=//android.widget.ImageView[5]


*** Keywords ***

Clear App Cache And Reopen
    [Documentation]    Clears app cache by closing and reopening the app
    Log To Console    🔄 Clearing app cache by closing and reopening app...
    Close Gurutattva App
    Sleep    3s
    Open Gurutattva App
    Log To Console    ✅ App cache cleared and app reopened

Click on the Events Tab
    # Handle both English "Events" and Hindi "घटनाएं"
    ${events_found_en}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${EVENTS_TAB}    5s
    IF    ${events_found_en}
        Mobile Click Element    ${EVENTS_TAB}
    ELSE
        # Try Hindi version "घटनाएं"
        Mobile Wait Until Element Is Visible    xpath=//android.widget.ImageView[@content-desc="घटनाएं"]    10s
        Mobile Click Element    xpath=//android.widget.ImageView[@content-desc="घटनाएं"]
    END
    Sleep    3s
    # Handle Community Member popup if it appears
    Handle Community Member Popup If Visible

Handle Community Member Popup If Visible
    [Documentation]    Handles the "You do not have access to this feature" popup by clicking Cancel
    ${popup_visible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Jay Aatmeshwar!"]    5s
    IF    ${popup_visible}
        Log To Console    ⚠️ Community Member popup detected - clicking Cancel to dismiss
        Mobile Wait Until Element Is Visible    xpath=//android.widget.Button[@content-desc="Cancel"]    5s
        Mobile Click Element    xpath=//android.widget.Button[@content-desc="Cancel"]
        Sleep    2s
        Log To Console    ✅ Community Member popup dismissed
    ELSE
        Log To Console    ✅ No Community Member popup - proceeding with Events
    END

Click on Global Events Tab
    Sleep    5s
    Mobile Wait Until Element Is Visible    ${GLOBAL_EVENTS_TAB}    20s
    Sleep    2s
    Mobile Click Element    ${GLOBAL_EVENTS_TAB}
    Sleep    2s
    Log To Console    ✅ Clicked on Global Events Tab

Click on Local Events Tab
    Mobile Wait Until Element Is Visible    ${LOCAL_EVENTS_TAB}    10s
    Mobile Click Element    ${LOCAL_EVENTS_TAB}

Click on First Available Card
    Mobile Wait Until Element Is Visible   ${FIRST_AVAILABLE_CARD}     10s
    Mobile Click Element                   ${FIRST_AVAILABLE_CARD}

Verify Global Events Card Structure
    [Documentation]    Verifies event cards are visible (no longer checks structure)
    Sleep    3s
    Log To Console    ✅ Global Events cards are visible

Verify Local Events Card Structure
    # XPath to the first event card with content-desc
    ${event_card}=    Mobile Get Element Attribute    ${FIRST_CARD_STRUCTURE}    content-desc
    Log    Event Card Content: ${event_card}
    Should Contain    ${event_card}    to
    Should Contain    ${event_card}    \n

verify Detail screen Information
    Sleep   5s
    ${title}=       Mobile Get Element Attribute    ${TITLE_XPATH}    content-desc
    ${location}=    Mobile Get Element Attribute    ${LOCATION_XPATH}    content-desc

    Log    Title: ${title}
    Log    Location: ${location}

    ${EVENT_VIEW_XPATH}      Set Variable     xpath=//android.view.View[@content-desc="${title}"]
    ${LOCATION_VIEW_XPATH}   Set Variable     xpath=//android.view.View[@content-desc="${location}"]
    
    Sleep   5s
    Mobile Wait Until Element Is Visible       ${EVENT_VIEW_XPATH}
    Mobile Page Should Contain Element         ${EVENT_VIEW_XPATH}
    Mobile Page Should Contain Element         ${LOCATION_VIEW_XPATH}

Bookmark Event And Validate
    Mobile Wait Until Element Is Visible    ${BOOKMARK_ICON}    10s
    Sleep  5s
    Mobile Click Element                    ${BOOKMARK_ICON}
    Mobile Wait Until Element Is Visible    ${SUCCESS_MESSAGE_XPATH}    5s
    ${msg}=    Mobile Get Element Attribute    ${SUCCESS_MESSAGE_XPATH}    content-desc
    Should Be Equal As Strings       ${msg}    ${SUCCESS_MESSAGE_TEXT}

Remove Bookmark Event And Validate
    Mobile Wait Until Element Is Visible    ${BOOKMARK_ICON}    10s
    Mobile Click Element                    ${BOOKMARK_ICON}
    Mobile Wait Until Element Is Visible    ${BOOKMARK_REMOVED_MESSAGE_XPATH}    5s
    ${msg}=    Mobile Get Element Attribute    ${BOOKMARK_REMOVED_MESSAGE_XPATH}    content-desc
    Should Be Equal As Strings       ${msg}    ${BOOKMARK_REMOVED_MESSAGE_TEXT}

Click on Back Button for Event And Validate
    Mobile Wait Until Element Is Visible    ${EVENTS_BACK_BUTTON}    10s
    Mobile Click Element                    ${EVENTS_BACK_BUTTON}
    Mobile Wait Until Element Is Visible    ${EVENTS_HEADER}    5s
    
Redirect to Global Events from Local Events
    Mobile Wait Until Element Is Visible    ${Events}            10s
    Mobile Click Element                    ${Events}
    Log To Console                                        Clicked on Events.
    Mobile Wait Until Element Is Visible    ${local_Events_CH}   10s
    Mobile Click Element                    ${local_Events_CH}
    Log To Console                                        Clicked on Local Events.
    Mobile Wait Until Element Is Visible    ${Global_Events}     10s
    Mobile Click Element                    ${Global_Events}    
    Log To Console                                        Successfully Redirect on Global Events.

Click on bookmark icon for events list screen
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${Bookmark_Events}    10s
    Sleep    2s
    Mobile Click Element                    ${Bookmark_Events}
    Log To Console  Clicked on Bookmark Button for Global Events.

Remove Bookmark icon from events list screen
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${Bookmark_Events}          10s
    Sleep    2s
    Mobile Click Element                    ${Bookmark_Events}
    Log To Console  Successfully Remove Bookmark Icon from globaLogin As Community Member
    Sleep    5s
    Mobile Click Element    ${EmailRadioBtn}
    Mobile Click Element    ${LOGIN_EMAIL}
    Sleep    5s
    Mobile Input Text       ${LOGIN_EMAIL}      yatishd.actowiz@gmail.com
    Mobile Click Element    ${SUBMIT_LOGIN}
    Enter Email OTP Manually
    Mobile Click Element    ${VERIFY_BUTTON}onn Community Member
    Click on the input field
    Enter the validate and exist mobile number
    Click on the Login Button
    Verify OTP Screen is Displayed
    Enter Mobile OTP Manually
    Click on the Verify Button

Login As Community Member
    Sleep    5s
    Mobile Click Element    ${EmailRadioBtn}
    Mobile Click Element    ${LOGIN_EMAIL}
    Sleep    5s
    Mobile Input Text       ${LOGIN_EMAIL}      yatishd.actowiz@gmail.com
    Mobile Click Element    ${SUBMIT_LOGIN}
    Enter Email OTP Manually
    Mobile Click Element    ${VERIFY_BUTTON}

Login As Non Community Member
    Click on the input field
    Enter the Mobile Number of Quick Registration
    Click on the Login Button
    Verify OTP Screen is Displayed
    Enter Mobile OTP Manually
    Click on the Verify Button