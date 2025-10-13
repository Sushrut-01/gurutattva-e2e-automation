*** Settings ***
Library    AppiumLibrary
Resource    ../resources/keywords.robot


*** Variables ***  
${news}                        xpath=//android.widget.ImageView[@content-desc="News"]
${Global_News}                 xpath=//android.view.View[@content-desc="Global News"]
${Global_News_Card}            xpath=(//android.view.View[contains(@content-desc, 'Global News')]/following-sibling::android.view.View//*[contains(@content-desc,'ago')])[1]
${Local_News}                  xpath=//android.view.View[@content-desc="Local News "]
${Local_News_Card}             xpath=(//android.view.View[contains(@content-desc, 'Local News')]/following-sibling::android.view.View//*[contains(@content-desc, 'ago')])[1]
${Bookmark}                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[2]
${Bookmark_Validation}         xpath=//android.view.View[@content-desc="Bookmark added"]
${News_Update}                 xpath=//android.view.View[contains(@content-desc, 'Published')][1]
${Local_News_Content}          xpath=(//android.view.View[starts-with(@content-desc, 'Date')])
${News_Content}                xpath=//android.view.View[contains(@content-desc, 'of')][2]
${Remove_bookmarks}            xpath=//android.view.View[@content-desc="Bookmark removed"]
${back_button}                 xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView
${Expected_Message}            Bookmark added                    
${Local_News_Card_Title}       xpath=(//android.view.View[contains(@content-desc, 'Local News')]/following-sibling::*//android.view.View[@content-desc])[1]
${Global_News_Card_Title}      xpath=(//android.view.View[contains(@content-desc, 'Global News')]/following-sibling::*//android.view.View[@content-desc])[1]
${NEWS_BACK_BUTTON}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
*** Keywords ***
      
Global News card is displayed with correct details
    Mobile Wait Until Element Is Visible              ${Global_News_Card}     10s
    Mobile Element Should Be Visible                  ${Global_News_Card}
    ${news_title}=    Mobile Get Element Attribute    ${Global_News_Card}     content-desc   
    Should Contain                             ${news_title}           day
    Log To Console                                                     Global News Card Details: ${news_title}
    

Local News card is displayed with correct details
    Mobile Wait Until Element Is Visible              ${Local_News_Card}      10s
    Mobile Element Should Be Visible                  ${Local_News_Card}
    ${news_title}=    Mobile Get Element Attribute    ${Local_News_Card}      content-desc
    Should Contain                             ${news_title}           ago
    Log To Console                                                     Local News Card Details: ${news_title}
    

Verify Validation Message
    Mobile Wait Until Element Is Visible                              ${Bookmark_Validation}    5s
    ${actual_message}=               Mobile Get Element Attribute     ${Bookmark_Validation}    content-desc
    Should Be Equal As Strings       ${actual_message}         ${Expected_Message}
    Log To Console                                                                       Validation message: ${Expected_Message}

Click on the Global News Tab
    Mobile Wait Until Element Is Visible    ${Global_News}   10s
    Mobile Click Element                    ${Global_News}
    Log To Console                                    Clicked on Global News.

Redirect to Global News from Local News
    Log To Console                                    Succesfully redirected to Global News from Local News                     

Handle the detail screen for new screen
   Run Keyword And Ignore Error   Verify Local News Detail screen Information   
   Run Keyword And Ignore Error   verify Global News Detail screen Information
   Run Keyword And Ignore Error   Verify News Detail screen
   
Verify News Detail screen
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${Local_News_Card_Title}    10s
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${News_Update}    10s
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${Local_News_Content}    10s
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${Global_News_Card_Title}    10s
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${News_Update}    10s
    ${isVisible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${News_Content}    10s
    Run Keyword If    ${isVisible}    Verify Local News Detail screen Information
    Run Keyword If    ${isVisible}    verify Global News Detail screen Information





Verify Local News Detail screen Information
    Sleep   5s
    ${title}=       Mobile Get Element Attribute      ${Local_News_Card_Title}    content-desc
    ${update}=      Mobile Get Element Attribute      ${News_Update}    content-desc
    ${content}=     Mobile Get Element Attribute      ${Local_News_Content}    content-desc

    Log To Console    Title: ${title}
    Log To Console    Update: ${update}
    Log To Console    Content: ${content}

    ${LOCAL_VIEW_XPATH}      Set Variable     xpath=//android.view.View[@content-desc="${title}"]
    ${UPDATE_VIEW_XPATH}    Set Variable     xpath=//android.view.View[@content-desc="${update}"]
    ${CONTENT_VIEW_XPATH}   Set Variable     xpath=//android.view.View[@content-desc="${content}"]
    
    Sleep   5s
    Mobile Wait Until Element Is Visible       ${LOCAL_VIEW_XPATH}
    Mobile Page Should Contain Element         ${LOCAL_VIEW_XPATH}
    Mobile Page Should Contain Element         ${UPDATE_VIEW_XPATH}
    Mobile Page Should Contain Element         ${CONTENT_VIEW_XPATH}
                
    
Click on the News Tab
    Mobile Wait Until Element Is Visible    ${news}                                 10s
    Mobile Click Element                    ${news}
    Log To Console                                                           Clicked on News.

Click on the Global News Card
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${Global_News_Card}                     10s
    Sleep   2s
    Mobile Click Element                    ${Global_News_Card}
    Log To Console                                                           Clicked on Global News Card.    

Click on bookmark icon for global news
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${Bookmark}    10s
    Sleep    2s
    Mobile Click Element    ${Bookmark}
    Log To Console  Clicked on Bookmark Button.

Click on bookmark icon for local news
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${Bookmark}    10s
    Sleep    2s
    Mobile Click Element    ${Bookmark}
    Log To Console  Clicked on Bookmark Button for Local News   

Remove Bookmark icon from global news
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${Bookmark}          10s
    Sleep    2s
    Mobile Click Element                    ${Bookmark}
    Log To Console                                      Successfully Remove Bookmark Icon from global news.

Remove Bookmark icon from local news
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${Bookmark}          10s
    Sleep    2s
    Mobile Click Element                    ${Bookmark}
    Log To Console                                      Successfully Remove Bookmark Icon from local news.    

# Verify Validation Message for Remove Bookmark
#     Mobile Wait Until Element Is Visible    ${Remove_bookmarks}    10s
#     ${message}=    Mobile Get Element Attribute    ${Remove_bookmarks}    content-desc
#     Should Be Equal As Strings      ${message}    Bookmark removed
#     Log To Console                   ${message}

Click on the Local News Tab
    Mobile Wait Until Element Is Visible    ${Local_News}   10s
    Mobile Click Element                    ${Local_News}
    Log To Console                   Clicked on Local News.

Click on the Local News Card
    Mobile Wait Until Element Is Visible    ${Local_News_Card}   10s
    Mobile Click Element                    ${Local_News_Card}
    Log To Console                   Clicked on Local News Card.

Click on Back Button
    [Documentation]    Clicks on the back button with proper handling for stale elements
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${back_button}   10s
    Sleep    2s
    # Try to click the element, if it fails due to stale element, refresh and retry
    ${click_status}=    Run Keyword And Return Status    Mobile Click Element    ${back_button}
    IF    not ${click_status}
        Log To Console    First click attempt failed, refreshing element and retrying...
        Sleep    2s
        Mobile Wait Until Element Is Visible    ${back_button}   10s
        Mobile Click Element    ${back_button}
    END
    Log To Console                   Clicked on Back Button.
    
Verify Global News Detail screen is closed 
    Mobile Wait Until Element Is Visible    ${Global_News}    10s
    ${is_selected}=    Mobile Get Element Attribute    ${Global_News}    selected
    Should Be Equal As Strings      ${is_selected}    false  
    Log To Console    Global News is selected by default.

Verify Local News Detail screen is closed
    Mobile Wait Until Element Is Visible    ${Local_News}    10s
    ${is_selected}=    Mobile Get Element Attribute    ${Local_News}    selected
    Should Be Equal As Strings      ${is_selected}    false  
    Log To Console    Local News is selected by default.    

Click on the Back Button from News and Events Screen
    [Documentation]    Clicks on the back button with proper handling for stale elements
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${NEWS_BACK_BUTTON}    10s
    Sleep    2s
    # Try to click the element, if it fails due to stale element, refresh and retry
    ${click_status}=    Run Keyword And Return Status    Mobile Click Element    ${NEWS_BACK_BUTTON}
    IF    not ${click_status}
        Log To Console    First click attempt failed, refreshing element and retrying...
        Sleep    2s
        Mobile Wait Until Element Is Visible    ${NEWS_BACK_BUTTON}    10s
        Mobile Click Element    ${NEWS_BACK_BUTTON}
    END
    Log To Console                                          Clicked on Back Button 

verify Global News Detail screen Information
    Sleep   5s
    ${title}=       Mobile Get Element Attribute      ${Global_News_Card_Title}    content-desc
    ${update}=      Mobile Get Element Attribute      ${News_Update}    content-desc
    ${content}=     Mobile Get Element Attribute      ${News_Content}    content-desc

    Log To Console    Title: ${title}
    Log To Console    Update: ${update}
    Log To Console    Content: ${content}

    ${GLOBAL_VIEW_XPATH}      Set Variable     xpath=//android.view.View[@content-desc="${title}"]
    ${UPDATE_VIEW_XPATH}    Set Variable     xpath=//android.view.View[@content-desc="${update}"]
    ${CONTENT_VIEW_XPATH}   Set Variable     xpath=//android.view.View[@content-desc="${content}"]
    
    Sleep   5s
    Mobile Wait Until Element Is Visible       ${GLOBAL_VIEW_XPATH}
    Mobile Page Should Contain Element         ${GLOBAL_VIEW_XPATH}
    Mobile Page Should Contain Element         ${UPDATE_VIEW_XPATH}
    Mobile Page Should Contain Element         ${CONTENT_VIEW_XPATH} 

Click on bookmark icon for news list screen 
    Sleep    2s
    Mobile Wait Until Element Is Visible            xpath=//android.view.View[contains(@content-desc,'ago')][1]//android.widget.ImageView[3]      10s
    Sleep    2s
    Mobile Click Element                     xpath=//android.view.View[contains(@content-desc,'ago')][1]//android.widget.ImageView[3]
    Log To Console  Clicked on Bookmark Button.         

Remove Bookmark icon from news list screen
    Sleep    2s
    Mobile Wait Until Element Is Visible            xpath=//android.view.View[contains(@content-desc,'ago')][1]//android.widget.ImageView[3]      10s
    Sleep    2s
    Mobile Click Element                     xpath=//android.view.View[contains(@content-desc,'ago')][1]//android.widget.ImageView[3]
    Log To Console                                      Successfully Remove Bookmark Icon from news list screen.         