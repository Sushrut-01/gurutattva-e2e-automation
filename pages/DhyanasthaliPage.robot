*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot

*** Variables ***
${Dhyansthali_Tab}             xpath=//android.widget.ImageView[@content-desc="Dhyansthali"]
${Back_Button}                 xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView
${Dhyansthali_Card}            xpath=(//android.view.View[contains(@content-desc, 'Dhyansthali')]/following-sibling::android.view.View//*[contains(@content-desc,'Dhyan')])[1]
${Mobile_Number_Card}          xpath=(//android.view.View[contains(@content-desc, 'Dhyansthali')]/following-sibling::android.view.View//*[contains(@content-desc,'+')])[1]
${Dhyansthali_Card_Title}      xpath=//android.view.View[@content-desc="Dhyansthali"]
${Address_Text}                xpath=//android.view.View[contains(@content-desc, 'Dhyansthali')][2]
${Mobile_Number_Text}          xpath=//android.view.View[contains(@content-desc,'+')]
${Email_text}                  xpath=//android.view.View[contains(@content-desc,'@')]
${MAP_ELEMENT}                 xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[10]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout[2]
${Explore_assertion_text}      xpath=//android.view.View[@content-desc="Discover ways to participate."]

*** Keywords ***
Click on the Dhyansthali Tab
    Mobile Click Element    ${Dhyansthali_Tab}    
    Log To Console    Clicked on Dhyansthali Tab

Click on the Back Button
    Mobile Wait Until Element Is Visible    ${Back_Button}    10s
    Mobile Click Element    ${Back_Button}
    Log To Console    Clicked on Back Button

Verify Explore Screen is displayed
    Mobile Wait Until Element Is Visible    ${Explore_assertion_text}    10s
    Mobile Element Should Be Visible        ${Explore_assertion_text}
    ${news_title}=    Mobile Get Element Attribute    ${Explore_assertion_text}    content-desc
    Should Contain    ${news_title}    Discover ways to participate.   
    Log To Console    Element is visible and text contains: ${news_title}    

Verify card information is displayed with correct details
   # --- Dhyanasthali Card Verification ---
    Mobile Wait Until Element Is Visible    ${Dhyansthali_Card}    10s
    Mobile Element Should Be Visible        ${Dhyansthali_Card}
    ${dhyansthali_text}=            Mobile Get Element Attribute    ${Dhyansthali_Card}    content-desc
    Should Contain                   ${dhyansthali_text}     Dhyan
    Log To Console                   Dhyansthali Card Text: ${dhyansthali_text}

    # --- Mobile Number Card Verification ---
    Mobile Wait Until Element Is Visible    ${Mobile_Number_Card}    10s
    Mobile Element Should Be Visible        ${Mobile_Number_Card}
    ${mobile_text}=                  Mobile Get Element Attribute    ${Mobile_Number_Card}    content-desc
    Should Contain                   ${mobile_text}           +
    Log To Console                   Mobile Number Card Text: ${mobile_text}

Click on the Dhyansthali Card
    Mobile Wait Until Element Is Visible    ${Dhyansthali_Card}    10s
    Mobile Click Element                    ${Dhyansthali_Card}
    Log To Console                   Clicked on Dhyanasthali Card

Verify detail screen information is displayed with correct details
    # --- Address Verification ---
    Mobile Wait Until Element Is Visible    ${Address_Text}    10s
    Mobile Element Should Be Visible        ${Address_Text}
    ${text}=            Mobile Get Element Attribute    ${Address_Text}    content-desc
    Should Contain                   ${text}     Dhyansthali
    Log To Console                   Addresstext: ${text}

    # --- Office No. Verification ---
    Mobile Wait Until Element Is Visible    ${Mobile_Number_Text}   10s
    Mobile Element Should Be Visible     ${Mobile_Number_Text}
    ${text}=            Mobile Get Element Attribute    ${Mobile_Number_Text}    content-desc
    Should Contain                   ${text}     +
    Log To Console                   Officeno.text: ${text}

    # --- Email ID Verification ---
    Mobile Wait Until Element Is Visible    ${Email_text}    10s
    Mobile Element Should Be Visible        ${Email_text}
    ${text}=            Mobile Get Element Attribute    ${Email_text}    content-desc
    Should Contain                   ${text}     @
    Log To Console                   Emailtext: ${text}

    # --- Map visibility verification ---
    Mobile Wait Until Element Is Visible    ${MAP_ELEMENT}    10s
    Mobile Element Should Be Visible        ${MAP_ELEMENT}
    Log To Console                   Map is visible on screen.