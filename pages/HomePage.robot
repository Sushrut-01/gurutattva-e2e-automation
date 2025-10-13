*** Settings ***
Library    AppiumLibrary
Resource    ../resources/keywords.robot
Resource    ../pages/eventsPage.robot


*** Variables ***

${Global_News}                 xpath=//android.view.View[@content-desc="Global News"]
${Global_Events}               xpath=//android.view.View[@content-desc="Global Events"]
${BACK_BUTTON}                 xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView
${EXPLORER_TAB}                xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[3]
${Bookmark}                    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[2]
${Bookmark_Valiadation}        xpath=//android.view.View[@content-desc="Added to bookmarks"]
${local_Events_CH}             xpath=//android.view.View[@content-desc="Local Events"]
${AASHRAM_INSIGHTS_CARD}       xpath=//android.view.View[contains(@content-desc, 'Aashram Insights')]//android.widget.ImageView[1]
${COMMUNITY_HIGHLIGHTS_CARD}   xpath=//android.view.View[contains(@content-desc, 'Community Highlights')]//android.view.View[contains(@content-desc, '2025') or contains(@content-desc, 'to')]
${dhyakendra}                  xpath=//android.widget.ImageView[@content-desc="Dhyankendra"]
${Audio_of_the_day}            xpath=//android.view.View[contains(@content-desc,'Audio of the Day')]      
${Music}                       xpath=//android.widget.ImageView[@content-desc="Music"]
${GURUKARYA_TITLE}             xpath=//android.widget.ImageView[3]
${GURUKARYA_DETAILS}           xpath=(//android.view.View[@content-desc])[6]
${Recommended_for_you}         xpath=//android.view.View[contains(@content-desc,'Recommended')]
${COMMUNITY_HEADER}            xpath=//android.view.View[contains(@content-desc,'Community')]
${ASHRAM_VIEW_ALL_BUTTON}      xpath=//android.view.View[contains(@content-desc,'Insights')]/following-sibling::android.view.View[@content-desc='View All']
${COMMUNITY_VIEW_ALL_BUTTON}   xpath=//android.view.View[contains(@content-desc,'Community')]/following-sibling::android.view.View[@content-desc='View All']
${AUDIO_VIEW_ALL_BUTTON}       xpath=//android.view.View[contains(@content-desc,'Audio')]/following-sibling::android.view.View[@content-desc='View All']
${RECOMMENDED_VIEW_ALL_BUTTON}     xpath=//android.view.View[contains(@content-desc,'Recommended for you')]/following-sibling::android.view.View[@content-desc='View All']
${AASHRAM_INSIGHTS_HEADER}     xpath=//android.view.View[contains(@content-desc, 'Insights')]
${NO_NOTIFICATION_FOUND}       xpath=//android.view.View[@content-desc="NO NOTIFICATION FOUND"]
${NOTIFICATION_TAB}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[1]/android.view.View/android.widget.ImageView[2]

*** Keywords ***

click on view all of aashramInsights
    Swipe Until Element Visible                 ${AASHRAM_INSIGHTS_CARD}  
    Sleep    5s 
    # AppiumLibrary.Click Element    ${ashram_insights}

Verify Global News is Selected By Default    
    Mobile Wait Until Element Is Visible               ${Global_News}    10s
    ${is_selected}=    Mobile Get Element Attribute    ${Global_News}    selected
    Should Be Equal As Strings                  ${is_selected}    false          Global News is not Selected By Default
    Log To Console                              ${is_selected}    

click on view all of communityHighlights
    # Swipe 
    Sleep  10s
    Mobile Wait Until Element Is Visible    ${COMMUNITY_HIGHLIGHTS_CARD}    10s
    Mobile Click Element    ${COMMUNITY_HIGHLIGHTS_CARD}
    Log    Clicked on view all of communityHighlights.
    Mobile Wait Until Element Is Visible    ${Global_Events}    10s
    ${is_selected}=    Mobile Get Element Attribute    ${Global_Events}    selected
    Should Be Equal As Strings    ${is_selected}    false   Global Events is not Selected By Default     
    Log    ${is_selected}

Verify the First Available Card in Ashram Insights Section
    Swipe Until Element Visible                   ${AASHRAM_INSIGHTS_CARD}
    Mobile Wait Until Element Is Visible                 ${AASHRAM_INSIGHTS_CARD}    10s
    ${aashram_text}=    Mobile Get Element Attribute     ${AASHRAM_INSIGHTS_CARD}    content-desc
    Log To Console      First Available Card in Ashram Insights Section: ${aashram_text}
    
Verify the First Available Card in Community Highlights Section
    Swipe Until Element Visible                   ${COMMUNITY_HEADER}
    Mobile Wait Until Element Is Visible                 ${COMMUNITY_HIGHLIGHTS_CARD}    10s
    ${Community_text}=    Mobile Get Element Attribute   ${COMMUNITY_HIGHLIGHTS_CARD}    content-desc
    Log To Console    First Available Card in Community Highlights Section: ${Community_text}

# Verify Home Screen is displayed
#     Wait Until Element Is Visible    ${Audio_of_the_day}    10s
#     Element Should Be Visible        ${Audio_of_the_day}
#     ${news_title}=    Get Element Attribute    ${Audio_of_the_day}    content-desc
#     Should Contain    ${news_title}    Audio of the Day
#     Log To Console    Element is visible and text contains: ${news_title}

Click on the Notifications Tab
    Mobile Click Element        ${NOTIFICATION_TAB}
    Log To Console    Clicked on Notifications Tab.

    
Verify Notification Screen is displayed
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="NO NOTIFICATION FOUND"]    10s
    Mobile Element Should Be Visible        xpath=//android.view.View[@content-desc="NO NOTIFICATION FOUND"]
    ${Notification_Content}=    Mobile Get Element Attribute    xpath=//android.view.View[@content-desc="NO NOTIFICATION FOUND"]    content-desc
    Should Contain    ${Notification_Content}    NO NOTIFICATION FOUND
    Log To Console    News Title: ${Notification_Content}
        
Click on the Back Button from Notifications Screen
    Mobile Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]

Click on the Ashram Insights Card
    Swipe Until Element Visible    ${AASHRAM_INSIGHTS_CARD}
    Mobile Click Element    ${AASHRAM_INSIGHTS_CARD}
    Log To Console    Clicked on Ashram Insights Card.

Bookmark Global News via Ashram Insights card
    Sleep    2s
    Mobile Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.widget.ImageView[2]    10s
    Sleep    2s
    Mobile Click Element    xpath=//android.widget.ScrollView/android.widget.ImageView[2]
    Log To Console  Clicked on Bookmark Button.

Remove Bookmark Global News via Ashram Insights card
    Sleep    2s
    Mobile Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.widget.ImageView[2]    10s
    Sleep    2s
    Mobile Click Element    xpath=//android.widget.ScrollView/android.widget.ImageView[2]
    Log To Console  Clicked on Remove Bookmark Button.

click on view all of Audio of the Day
   Sleep    5s
#    AppiumLibrary.Click Element      xpath=//android.view.View[contains(@content-desc,'View All')]

Verify Music is Selected By Default
   Mobile Wait Until Element Is Visible               ${Music}    10s
   ${is_selected}=    Mobile Get Element Attribute    ${Music}    selected
   Should Be Equal As Strings                  ${is_selected}    false          Music is not Selected By Default
   Log To Console                              ${is_selected}   ${Music}

click on Audio of the Day Card
   Swipe Right Until Element Visible           ${Audio_of_the_day}    xpath=//android.view.View[contains(@content-desc,'Dhun')]
   Swipe Until Element Visible                 xpath=//android.view.View[contains(@content-desc,'Aashram')]
   Sleep   2s    
   Mobile Click Element                               xpath=//android.view.View[contains(@content-desc, 'Audio')]//android.widget.ImageView[1]

verify Play Music and Music Information
   Sleep    5s
   Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Music')]    10s
   Mobile Element Should Be Visible        xpath=//android.view.View[contains(@content-desc,'Music')]
   ${play_music}=    Mobile Get Element Attribute    xpath=//android.view.View[contains(@content-desc,'Music')]    content-desc
   Should Contain    ${play_music}    Music
   Log To Console    Play Music Button is visible and information: ${play_music}
   
Close Music Player
    Sleep    5s
    Mobile Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[9]
    Log To Console    Closed Music Player.
    Sleep    2s  

Pause Music Player
    Sleep    5s
    Mobile Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[7]
    Log To Console    Paused Music Player.

click on view all of Recommended for you
    Swipe Until Element Visible                 ${Recommended_for_you}
    Sleep    5s
    # AppiumLibrary.Click Element    xpath=//android.view.View[contains(@content-desc,'View All')][2]   

Click on the Cancel Button from Become a Member Popup
   Sleep    5s
   Mobile Click Element    xpath=//android.view.View[@content-desc="Cancel"]
   Log To Console    Clicked on Cancel Button from Become a Member Popup.

Click on the Become a Member Button   
   Sleep    5s
   Mobile Click Element    xpath=//android.view.View[@content-desc="Become a Member"]
   Log To Console    Clicked on Become a Member Button.

Navigate to Recommended for you Section
    Swipe Until Element Visible                 xpath=//android.view.View[contains(@content-desc,'Bhajan')]
    Sleep    5s

Verify Recommended for you Cards are Displayed
   Mobile Wait Until Element Is Visible                 xpath=//android.view.View[contains(@content-desc,'Gurukarya')]    10s
   ${Recommend_second_card}=    Mobile Get Element Attribute     xpath=//android.view.View[contains(@content-desc,'Gurukarya')]     content-desc
   Log To Console     Recommended for you Second Card Details: ${Recommend_second_card} 

Click on Recommended for you Second Card
   Sleep    5s
   Mobile Click Element    xpath=//android.view.View[contains(@content-desc,'Gurukarya')]
   Log To Console    Clicked on Recommended for you Second Card.

Verify Gurukarya Screen is Displayed
   Sleep    5s
   Mobile Wait Until Element Is Visible                 ${GURUKARYA_TITLE}    10s
   ${gurukarya_title}=    Mobile Get Element Attribute     ${GURUKARYA_TITLE}     content-desc
   Should Contain Any   ${gurukarya_title}    Chaitanya    Satya   
   Log To Console    Gurukarya Title: ${gurukarya_title}
   Mobile Wait Until Element Is Visible                 ${GURUKARYA_DETAILS}    10s
   ${gurukarya_details}=    Mobile Get Element Attribute     ${GURUKARYA_DETAILS}     content-desc
   Should Contain Any    ${gurukarya_details}    Chaitanya     Dharma  
   Log To Console    Gurukarya Details: ${gurukarya_details}

Click on the Back Button from Gurukarya Screen
   Sleep    5s
   Mobile Click Element        xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[2]
   Log To Console       Clicked on Back Button from Gurukarya Screen.

Verify Recommended for you Title is Displayed in Home Screen
   Mobile Wait Until Element Is Visible                 ${Recommended_for_you}    10s
   ${recommended_title}=    Mobile Get Element Attribute     ${Recommended_for_you}     content-desc
   Should Contain    ${recommended_title}    Recommended 
   Log To Console    Title is Displayed in Home Screen: ${recommended_title}

Click on the Dropdown Button
    Sleep    5s
    Mobile Click Element    ${GURUKARYA_TITLE}
    Log To Console    Clicked on Dropdown Button.

Click on the Option from Dropdown
    Sleep    5s
    Mobile Click Element    xpath=//android.view.View[contains(@content-desc,'Satya')]
    Log To Console    Clicked on Option from Dropdown.

Click on the Community Highlights Card
    Swipe Until Element Visible    ${COMMUNITY_HIGHLIGHTS_CARD}
    Mobile Click Element    ${COMMUNITY_HIGHLIGHTS_CARD}
    Log To Console    Clicked on Community Highlights Card.

Bookmark Global Event via Community Highlights card
    Sleep    2s
    Mobile Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.widget.ImageView[4]    10s
    Sleep    2s
    Mobile Click Element    xpath=//android.widget.ScrollView/android.widget.ImageView[4]
    Log To Console  Clicked on Bookmark Button.

Remove Bookmark Global Event via Community Highlights card
    Sleep    2s
    Mobile Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.widget.ImageView[4]    10s
    Sleep    2s
    Mobile Click Element    xpath=//android.widget.ScrollView/android.widget.ImageView[4]
    Log To Console  Clicked on Remove Bookmark Button.

Click on View ALL Button From Ashram Insights Section
    Mobile Wait Until Element Is Visible    ${ASHRAM_VIEW_ALL_BUTTON}    10s
    Mobile Click Element    ${ASHRAM_VIEW_ALL_BUTTON}
    Log To Console    Clicked on View All Button From Ashram Insights Section.

Click on View ALL Button From Community Highlights Section
    Mobile Wait Until Element Is Visible    ${COMMUNITY_VIEW_ALL_BUTTON}    10s
    Mobile Click Element    ${COMMUNITY_VIEW_ALL_BUTTON}
    Log To Console    Clicked on View All Button From Community Highlights Section.

Swipe to Ashram Insights Section
    Swipe Until Element Visible    ${AASHRAM_INSIGHTS_HEADER}
    
Swipe to Community Highlights Section
    Scroll Until Element Visible    ${COMMUNITY_HEADER}

Swipe to Audio of the Day Section
    Swipe Until Element Visible         xpath=//android.widget.ScrollView/android.widget.ImageView    

Swipe to Recommended for you Section
    Swipe Until Element Visible    ${RECOMMENDED_VIEW_ALL_BUTTON}

Verify Global Event is Selected By Default
    Mobile Wait Until Element Is Visible    ${Global_Events}    10s
    ${is_selected}=    Mobile Get Element Attribute    ${Global_Events}    content-desc
    Should Contain    ${is_selected}    Global Event
    Log To Console    By default selected: ${is_selected}

# Verify Home Screen is displayed
#     Mobile Wait Until Element Is Visible    ${Audio_of_the_day}    10s
#     Mobile Element Should Be Visible        ${Audio_of_the_day}
#     ${news_title}=    Mobile Get Element Attribute    ${Audio_of_the_day}    content-desc
#     Should Contain    ${news_title}    Audio of the Day
#     Log To Console    Element is visible and text contains: ${news_title}

Click on View ALL Button From Audio of the Day Section
    Mobile Wait Until Element Is Visible    ${AUDIO_VIEW_ALL_BUTTON}    10s
    Mobile Click Element                    ${AUDIO_VIEW_ALL_BUTTON}
    Log To Console                   Clicked on View ALL Button From Audio of the Day Section.

Click on View ALL Button From Recommended for you Section
    Mobile Wait Until Element Is Visible    ${RECOMMENDED_VIEW_ALL_BUTTON}    10s
    Mobile Click Element                    ${RECOMMENDED_VIEW_ALL_BUTTON}
    Log To Console                   Clicked on View ALL Button From Recommended for you Section.

Handle the detail screen for new screen
    Sleep    5s
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Global News')]    10s
    ${detail_content}=    Mobile Get Element Attribute    xpath=//android.view.View[contains(@content-desc,'Global News')]    content-desc
    Should Contain    ${detail_content}    Global News
    Log To Console    Detail screen content: ${detail_content}

# Verify Validation Message
#     Mobile Wait Until Element Is Visible    ${Bookmark_Valiadation}    5s
#     ${validation_msg}=    Mobile Get Element Attribute    ${Bookmark_Valiadation}    content-desc
#     Should Contain    ${validation_msg}    Added to bookmarks
#     Log To Console    Validation message: ${validation_msg}

Verify Validation Message for Remove Bookmark
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Removed from bookmarks"]    5s
    ${validation_msg}=    Mobile Get Element Attribute    xpath=//android.view.View[@content-desc="Removed from bookmarks"]    content-desc
    Should Contain    ${validation_msg}    Removed from bookmarks
    Log To Console    Validation message: ${validation_msg}

Verify Community Member Content is Displayed
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'Community Member')]    10s
    ${content}=    Mobile Get Element Attribute    xpath=//android.view.View[contains(@content-desc,'Community Member')]    content-desc
    Should Contain    ${content}    Community Member
    Log To Console    Community Member content: ${content}
    
Verify Home Screen is displayed with correct details
    Mobile Wait Until Element Is Visible    ${Audio_of_the_day}    10s
    Mobile Element Should Be Visible        ${Audio_of_the_day}
    ${news_title}=    Mobile Get Element Attribute    ${Audio_of_the_day}    content-desc
    Should Contain    ${news_title}    Audio of the Day
    Log To Console    Element is visible and text contains: ${news_title}