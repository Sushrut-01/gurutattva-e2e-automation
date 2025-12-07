*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot

*** Variables ***
${EXPLORER_TAB}                xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
${participate_elements}        xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View/android.widget.ImageView
${EXPLORE_BACK_BUTTON}         xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
${AUDIO_EXPLORER_TAB}          xpath=(//android.widget.ImageView[@content-desc="Audio"])[1]
${AUDIO_CONTENT}               xpath=//android.widget.ImageView[contains(@content-desc,'Recently Added')]
${AUDIO_BACK_BUTTON}           xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.widget.ImageView[2]

*** Keywords ***
Click on the Explore Tab
    Mobile Click Element    ${EXPLORER_TAB}
    Sleep    2s

Print All Participate Names
    ${participate_elements}=    Mobile Get Webelements    ${participate_elements}
    FOR    ${element}    IN    @{participate_elements}
        ${name}=    Mobile Get Element Attribute    ${element}    content-desc
        Log To Console    ${name}
    END

Click on the Back Button from Explore Screen
    Mobile Click Element     ${EXPLORE_BACK_BUTTON} 
  
Click on the Audio Tab From Explore Screen
    Mobile Wait Until Element Is Visible    ${AUDIO_EXPLORER_TAB}    10s
    Mobile Click Element    ${AUDIO_EXPLORER_TAB}
    Log To Console    Clicked on Audio Tab From Explore Screen

Verify Audio Screen is displayed From Explore Screen
    Mobile Wait Until Element Is Visible                   ${AUDIO_CONTENT}         10s
     ${AUDIO_DISPLAYED}=    Mobile Get Element Attribute    ${AUDIO_CONTENT}         content-desc
     Should Contain    ${AUDIO_DISPLAYED}                                     Recently Added
     Log To Console            Audio Screen Content: ${AUDIO_DISPLAYED}

Click on the Back Button from Audio Screen
    Mobile Wait Until Element Is Visible    ${AUDIO_BACK_BUTTON}    10s
    Mobile Click Element    ${AUDIO_BACK_BUTTON}
    Log To Console    Clicked on Back Button from Audio Screen
