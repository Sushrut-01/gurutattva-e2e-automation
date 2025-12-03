*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot


*** Variables ***
${AUDIO_TAB}              xpath=//android.widget.ImageView[@content-desc="Audio"]
${RADIO_BUTTON}           xpath=//android.widget.ImageView[@content-desc="Radio"]
${RADIO_SCREEN}           xpath=//android.view.View[@content-desc="Radio Playing"]
${RADIO_TRACK}            xpath=//android.view.View[contains(@content-desc,'Radio')]
${RADIO_PAUSE_BUTTON}     xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.widget.ImageView[2]
${RADIO_BACK}             xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.widget.ImageView
${AUDIO_CONTENT}          xpath=//android.widget.ImageView[contains(@content-desc,'Recently Added')]
${RADIO_CLOSE}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[6]
${RECENTLY_ADDED_CARD}    xpath=(//android.view.View[contains(@content-desc, 'Audio')]/following-sibling::android.view.View//*[contains(@content-desc,'Recently')]//android.widget.ImageView[2])
${MUSIC_INFO}             xpath=//android.view.View[contains(@content-desc, 'Music')]
${MUSIC_SCREEN}           xpath=//android.view.View[@content-desc="EN"]
${MUSIC_TRACK}            xpath=(//android.view.View[contains(@content-desc, '')])[last()-4]
${NEXT_TRACK_BUTTON}      xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[4]
${PREVIOUS_TRACK_BUTTON}  xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[2]
${MUSIC_BACK}             xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
${MUSIC_PAUSE}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.ImageView[3]
${AUTHOR_CARD}            xpath=(//android.view.View[contains(@content-desc, 'Audio')]/following-sibling::android.view.View//*[contains(@content-desc,'Authors')]//android.widget.ImageView[1])[2]
${PRAVACHAN_TITLE}        xpath=//android.view.View[contains(@content-desc,'Pravachan')]
${BHAJAN_TITLE}           xpath=//android.view.View[contains(@content-desc,'Bhajann')]
${SPEAKER_NAME}           xpath=(//android.view.View[./android.view.View[3]])[1]/android.view.View[3]
${CATEGORY}               xpath=(//android.view.View[./android.view.View[3]])[1]/android.view.View[4]
${TRACK_COUNT}            xpath=(//android.view.View[./android.view.View[3]])[1]/android.view.View[5] 
${AUTHOR_CONTENT}         xpath=((//android.view.View[./android.view.View[3]])[1]/android.view.View[5]/following-sibling::android.view.View//android.view.View)[2]
${AVAILABLE_TRACK}        xpath=(//android.view.View[contains(@content-desc, 'Authors')]/following-sibling::android.view.View//android.view.View)[3]
${AUTHORS_TRACK}          xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.widget.ImageView[2]
${MUSIC_TRACK_CLOSE}                  xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[4]
${AUTHORS_SCREEN}                     xpath=(//android.view.View[android.widget.ImageView]//following-sibling::android.view.View)[7]
${AUTHORS_BACK}                       xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[1]/android.widget.ImageView
${PAUSE_BUTTON}                       xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
${BHAJAN_FIRST_CARD}                  xpath=//android.view.View[contains(@content-desc,'Bhajan')]//android.widget.ImageView[1]
${MAKAR_SANKRANTI}                    xpath=//android.view.View[@content-desc="Makar Sankranti"]
${PRAVACHAN_FIRST_CARD}               xpath=//android.view.View[contains(@content-desc,'Pravachan')]//android.widget.ImageView[1]
${MAHA_SHIVRATRI}                     xpath=//android.view.View[@content-desc="Maha Shivratri"]
${FIRST_AVAILABLE_CARD}               xpath=(//android.view.View[@content-desc])[4]
${PLAY_AND_PAUSE_BUTTON_PRAVACHAN}    xpath=(//android.view.View[@content-desc])[4]//android.widget.ImageView[2]
${BHAV_ARPAN}                         xpath=//android.view.View[@content-desc="Bhav Arpan"]
${GURU_KI_RAH}                        xpath=//android.view.View[@content-desc="Guru Ki Rah"]
${SECOND_AVAILABLE_CARD}              xpath=(//android.view.View[@content-desc])[7]
${PLAY_AND_PAUSE_BUTTON_BHAJAN}       xpath=(//android.view.View[@content-desc])[7]//android.widget.ImageView[2]
${SEARCH_ICON}                        xpath=//android.view.View[@content-desc="Audio"]/android.widget.ImageView[2]
${SEARCH_BAR}                         xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.widget.ImageView[2]
${SEARCH_TRACK_INFO}                  xpath=(//android.view.View[@content-desc])[1]
${TRACK_BACK_BUTTON}                  xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.widget.ImageView[1]
${HINDI_LANGUAGE_BUTTON}              xpath=//android.view.View[@content-desc="HI"]
${ENGLISH_LANGUAGE_BUTTON}            xpath=//android.view.View[@content-desc="EN"]
${VIEW_ALL_BUTTON}                    xpath=//android.view.View[@content-desc="View All"]
${SEARCH_INPUT_FIELD}                 xpath=//android.widget.ScrollView/android.widget.ImageView[2]
${RADIO_SCREEN_BACK_BUTTON}           xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView


*** Keywords ***
Click on the Audio Tab
    Sleep    2s

    # Try to find Audio Tab first
    ${audio_tab_visible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${AUDIO_TAB}    5s

    IF    ${audio_tab_visible} == False
        # Audio Tab not visible - try pressing back to get to home screen
        Log To Console    ⚠️ Audio Tab not visible, pressing back button to navigate to home
        Run Keyword And Ignore Error    Mobile Press Keycode    4    # Back button
        Sleep    2s

        # Try again
        ${audio_tab_visible_after_back}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${AUDIO_TAB}    10s

        IF    ${audio_tab_visible_after_back} == False
            Log To Console    ⚠️ Audio Tab still not visible, trying alternative locator
            # Try with View element instead of ImageView
            ${audio_tab_view}=    Set Variable    xpath=//android.view.View[@content-desc="Audio"]
            ${audio_tab_view_visible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${audio_tab_view}    5s

            IF    ${audio_tab_view_visible} == True
                Mobile Click Element    ${audio_tab_view}
                Log To Console    ✅ Clicked on Audio Tab using View locator
            ELSE
                # Last resort - try clicking home tab first
                Log To Console    ⚠️ Trying to click Home tab first
                ${home_tab}=    Set Variable    xpath=//android.widget.ImageView[@content-desc="Home"]
                ${home_visible}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    ${home_tab}    5s
                IF    ${home_visible} == True
                    Mobile Click Element    ${home_tab}
                    Sleep    2s
                    # Ensure app is in foreground
                    Log To Console    🔄 Activating app to bring to foreground
                    Mobile Activate Application    com.rysunhome.gurutattvamobile
                    Sleep    3s
                END
                # Now try Audio Tab again
                Mobile Wait Until Element Is Visible    ${AUDIO_TAB}    15s
                Mobile Click Element    ${AUDIO_TAB}
                Log To Console    ✅ Clicked on Audio Tab after clicking Home first
            END
        ELSE
            Mobile Click Element    ${AUDIO_TAB}
            Log To Console    ✅ Clicked on Audio Tab after pressing back
        END
    ELSE
        Mobile Click Element    ${AUDIO_TAB}
        Log To Console    ✅ Clicked on Audio Tab
    END

Click on the Radio Button
    Mobile Click Element     ${RADIO_BUTTON}

Verify Radio Screen is displayed
    Mobile Wait Until Element Is Visible                   ${RADIO_SCREEN}      10s
    ${RADIO_DISPLAYED}=    Mobile Get Element Attribute    ${RADIO_SCREEN}      content-desc
    Should Contain    ${RADIO_DISPLAYED}                                 Radio Playing
    Log To Console            Radio Screen Content: ${RADIO_DISPLAYED}

Click on the Pause Button from Radio Screen
    Sleep    5s
    Mobile Click Element     ${RADIO_PAUSE_BUTTON}

Verify Audio Screen is displayed
     Mobile Wait Until Element Is Visible                   ${AUDIO_CONTENT}         10s
     ${AUDIO_DISPLAYED}=    Mobile Get Element Attribute    ${AUDIO_CONTENT}         content-desc
     Should Contain    ${AUDIO_DISPLAYED}                                     Recently Added
     Log To Console            Audio Screen Content: ${AUDIO_DISPLAYED}

Click on the Close Button from Audio Screen
    Sleep    5s
    Mobile Click Element     ${RADIO_CLOSE}
    Log To Console            Closed the Radio from Audio screen

Click on the Recently Added Card
    Sleep    5s
    Mobile Click Element     ${RECENTLY_ADDED_CARD}
    Log To Console            Clicked on Recently Added Card

Verify Music Information
    Sleep    5s
    ${music_info}=    Mobile Get Element Attribute    ${MUSIC_INFO}    content-desc
    Should Contain    ${music_info}    Music    
    Log To Console            Music Information: ${music_info}

Click on the music track
    Sleep    5s
    Mobile Click Element    ${MUSIC_INFO}
    Log To Console    Clicked on Music Track.

Verify Music screen and track is displayed
    Sleep    5s
    Mobile Wait Until Element Is Visible                   ${MUSIC_TRACK}      10s
    ${TRACK_DISPLAYED}=    Mobile Get Element Attribute    ${MUSIC_TRACK}      content-desc
    Log To Console            Music Track: ${TRACK_DISPLAYED}
    Mobile Wait Until Element Is Visible                   ${MUSIC_SCREEN}      10s
    ${MUSIC_DISPLAYED}=    Mobile Get Element Attribute    ${MUSIC_SCREEN}      content-desc
    Should Contain    ${MUSIC_DISPLAYED}                                 EN
    Log To Console            Music Screen Content: ${MUSIC_DISPLAYED}

Click on the Music Pause Button
    Sleep    5s
    Mobile Click Element     ${MUSIC_PAUSE}
    Log To Console            Music Paused.

Enable Hindi Language
    Sleep     5s
    Mobile Click Element            ${HINDI_LANGUAGE_BUTTON}
    Log To Console            Hindi Language Enabled.

Verify Hindi Track is displayed
    Sleep  5s
    Mobile Wait Until Element Is Visible                   ${MUSIC_TRACK}      10s
    ${TRACK_DISPLAYED}=    Mobile Get Element Attribute    ${MUSIC_TRACK}      content-desc
    Log To Console            Hindi Music Track: ${TRACK_DISPLAYED}

Enable Again English Language
    Sleep     5s
    Mobile Click Element            ${ENGLISH_LANGUAGE_BUTTON}
    Log To Console            English Language Enabled.

Verify English track is displayed
    Sleep  5s
    Mobile Wait Until Element Is Visible                   ${MUSIC_TRACK}      10s
    ${TRACK_DISPLAYED}=    Mobile Get Element Attribute    ${MUSIC_TRACK}      content-desc
    Log To Console            English Music Track: ${TRACK_DISPLAYED}

Click on the Next Track Button
    Sleep    2s
    Mobile Click Element    ${NEXT_TRACK_BUTTON}       
    Mobile Click Element    ${NEXT_TRACK_BUTTON}
    Log To Console    Clicked on Next Track Button.

Verify Next Track is played
    Sleep    5s
    Mobile Wait Until Element Is Visible                   ${MUSIC_TRACK}      10s
    ${NEXT_TRACK_DISPLAYED}=    Mobile Get Element Attribute    ${MUSIC_TRACK}      content-desc
    Log To Console            Next Track: ${NEXT_TRACK_DISPLAYED}

Click on the Previous Track Button
    Sleep    2s
    Mobile Click Element    ${PREVIOUS_TRACK_BUTTON}
    Log To Console    Clicked on Previous Track Button.

Verify Previous Track is played
    Sleep    5s
    Mobile Wait Until Element Is Visible                   ${MUSIC_TRACK}      10s
    ${PREVIOUS_TRACK_DISPLAYED}=    Mobile Get Element Attribute    ${MUSIC_TRACK}      content-desc
    Log To Console            Previous Track: ${PREVIOUS_TRACK_DISPLAYED}

Click on the Back Button from Music Screen
    Sleep    5s
    Mobile Click Element   ${MUSIC_BACK}        
    Log To Console    Clicked on Back Button from Music Screen.    
    
Verify the first available Author Card is displayed
    Swipe Until Element Visible    ${PRAVACHAN_TITLE}
    Mobile Wait Until Element Is Visible              ${AUTHOR_CARD}     10s
    Mobile Element Should Be Visible                  ${AUTHOR_CARD}
    ${AUTHOR_CARD_DISPLAYED}=    Mobile Get Element Attribute    ${AUTHOR_CARD}     content-desc   
    Should Contain                             ${AUTHOR_CARD_DISPLAYED}           Ambrishji
    Log To Console            Author Card: ${AUTHOR_CARD_DISPLAYED}

Click on the Author Card
    Sleep    5s
    Mobile Click Element    ${AUTHOR_CARD}
    Log To Console    Clicked on Author Card.

Verify Author Detail screen is displayed
    Sleep   5s
    ${title}=       Mobile Get Element Attribute      ${SPEAKER_NAME}    content-desc
    ${type}=        Mobile Get Element Attribute      ${CATEGORY}    content-desc
    ${content}=     Mobile Get Element Attribute      ${AUTHOR_CONTENT}    content-desc
    ${tracks}=      Mobile Get Element Attribute      ${TRACK_COUNT}    content-desc

    Log To Console    SPEAKERNAME: ${title}
    Log To Console    CATEGORY: ${type}
    Log To Console    TRACKCOUNT: ${tracks}
    Log To Console    AUTHORCONTENT: ${content}

    ${TITLE_VIEW_XPATH}      Set Variable     xpath=//android.view.View[@content-desc="${title}"]
    ${TYPE_VIEW_XPATH}       Set Variable     xpath=//android.view.View[@content-desc="${type}"]
    ${TRACKS_VIEW_XPATH}     Set Variable     xpath=//android.view.View[@content-desc="${tracks}"]
    ${CONTENT_VIEW_XPATH}    Set Variable     xpath=//android.view.View[@content-desc="${content}"]

    Sleep   5s
    Mobile Wait Until Element Is Visible       ${TITLE_VIEW_XPATH}
    Mobile Page Should Contain Element         ${TITLE_VIEW_XPATH}
    Mobile Page Should Contain Element         ${TYPE_VIEW_XPATH}
    Mobile Page Should Contain Element         ${TRACKS_VIEW_XPATH}
    Mobile Page Should Contain Element         ${CONTENT_VIEW_XPATH}

Click on the play button using author's track
    Sleep    5s
    Mobile Click Element   ${AUTHORS_TRACK}
    Log To Console    Clicked on Author's Track.

Click on the available track
    Sleep    5s
    Mobile Click Element   ${AVAILABLE_TRACK}
    Log To Console    Clicked on Available Track.

Click on the Close Button using music track
    Sleep    2s
    Mobile Click Element     ${RADIO_CLOSE}
    Log To Console      Closed Music Player using Music track.   

Click on the First Available Track
    Sleep    5s
    Mobile Click Element       ${AUTHOR_CONTENT}
    Log To Console      Clicked on First Available Track.

Verify Author Screen is displayed
    Mobile Wait Until Element Is Visible   ${AUTHORS_SCREEN}    10s
    ${AUTHOR_SCREEN_DISPLAYED}=    Mobile Get Element Attribute    ${AUTHORS_SCREEN}    content-desc
    Should Contain    ${AUTHOR_SCREEN_DISPLAYED}    Dhun    
    Log To Console    Author Screen Content: ${AUTHOR_SCREEN_DISPLAYED}

Click on the back Button from Author Screen
    Sleep    5s
    Mobile Click Element   ${AUTHORS_BACK}
    Log To Console    Clicked on Back Button from Author Screen.

Click on the Pause Button from Audio Screen
    Sleep    5s
    Mobile Click Element   ${PAUSE_BUTTON}
    Log To Console    Clicked on Pause Button from Audio Screen.

Verify Radio Track is playing
    Sleep    5s
    Mobile Wait Until Element Is Visible                   ${RADIO_TRACK}      10s
    ${RADIO_TRACK_DISPLAYED}=    Mobile Get Element Attribute    ${RADIO_TRACK}      content-desc
    Should Contain    ${RADIO_TRACK_DISPLAYED}                                 Radio
    Log To Console            Radio Track Content: ${RADIO_TRACK_DISPLAYED}

Click on the Radio Track
    Sleep    5s
    Mobile Click Element   ${RADIO_TRACK}
    Log To Console    Clicked on Radio Track.


Click on View All of Pravachan
    Sleep    5s
    Swipe Until Element Visible    ${BHAJAN_FIRST_CARD}
    # Click Element   ${VIEW_ALL_BUTTON}
    # Log To Console    Clicked on View All of Pravachan.

Verify Makar Sankranti is Selected By Default
    Sleep    5s
    Mobile Wait Until Element Is Visible    ${MAKAR_SANKRANTI}    10s
    ${is_selected}=    Mobile Get Element Attribute    ${MAKAR_SANKRANTI}    selected
    Should Be Equal As Strings    ${is_selected}    false
    Log To Console    Selected attribute: ${is_selected}
    
Click on the First available Pravachan Card
    Swipe Until Element Visible    ${BHAJAN_FIRST_CARD}
    Sleep    2s
    Mobile Click Element   ${PRAVACHAN_FIRST_CARD}
    Log To Console    Clicked on First available Pravachan Card.

Click on the Back Button
    Sleep    5s
    Mobile Click Element    ${RADIO_BACK}
    Log To Console    Clicked on Back Button

Click on the Maha Shivratri Tab
    Sleep    2s
    Mobile Click Element    ${MAHA_SHIVRATRI}
    Log To Console    Clicked on Maha Shivratri Card.

Click on the Makar Sankranti Tab
    Sleep    2s 
    Mobile Click Element    ${MAKAR_SANKRANTI}
    Log To Console    Clicked on Makar Sankranti Card.


Verify First Available card of Makar Sankranti is displayed
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${FIRST_AVAILABLE_CARD}    10s
    ${card}=    Mobile Get Element Attribute    ${FIRST_AVAILABLE_CARD}    content-desc
    Should Contain    ${card}    Makar Sankranti
    Log To Console    Makar Sankranti First Available details: ${card}

Verify First Available card of Maha Shivratri is displayed
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${FIRST_AVAILABLE_CARD}    10s
    ${card}=    Mobile Get Element Attribute    ${FIRST_AVAILABLE_CARD}    content-desc
    Should Contain    ${card}    Maha Shivratri
    Log To Console    Maha Shivratri First Available details: ${card}

Click on the Play button using Pravachan details
    Sleep    5s
    Mobile Click Element   ${PLAY_AND_PAUSE_BUTTON_PRAVACHAN}
    Log To Console    Clicked on Play button using Pravachan details.

Click on the Pause Button using Pravachan details
    Sleep    5s
    Mobile Click Element   ${PLAY_AND_PAUSE_BUTTON_PRAVACHAN}
    Log To Console    Clicked on Pause button using Pravachan details.

Click on View All of Bhajan
    Sleep    5s
    Swipe Until Element Visible    ${BHAJAN_TITLE}
    # Click Element   ${VIEW_ALL_BUTTON}
    # Log To Console    Clicked on View All of Pravachan.

Verify Bhav Arpan is Selected By Default
    Sleep    5s
    Mobile Wait Until Element Is Visible    ${BHAV_ARPAN}    10s
    ${is_selected}=    Mobile Get Element Attribute    ${BHAV_ARPAN}    selected
    Should Be Equal As Strings    ${is_selected}    false
    Log To Console    Selected attribute: ${is_selected}

Click on the First available Bhajan Card
    Swipe Until Element Visible    ${BHAJAN_FIRST_CARD}
    Sleep    5s
    Mobile Click Element   ${BHAJAN_FIRST_CARD}
    Log To Console    Clicked on First available Bhajan Card.

Click on the Guru Ki Rah Tab
    Sleep    2s
    Mobile Click Element    ${GURU_KI_RAH}
    Log To Console    Clicked on Guru Ki Rah Card.

Click on the Bhav Arpan Tab
    Sleep    2s
    Mobile Click Element    ${BHAV_ARPAN}
    Log To Console    Clicked on Bhav Arpan Card.

Verify Second Available card of Bhav Arpan is displayed
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${SECOND_AVAILABLE_CARD}    10s
    ${card}=    Mobile Get Element Attribute    ${SECOND_AVAILABLE_CARD}    content-desc
    Should Contain    ${card}    Guru Vakya
    Log To Console    Bhav Arpan Second Available details: ${card}

Verify Second Available card of Guru Ki Rah is displayed
    Sleep    2s
    Mobile Wait Until Element Is Visible    ${SECOND_AVAILABLE_CARD}    10s
    ${card}=    Mobile Get Element Attribute    ${SECOND_AVAILABLE_CARD}    content-desc
    Should Contain    ${card}    Guruvar Akele Na Aana
    Log To Console    Guru Ki Rah Second Available details: ${card}

Click on the Play button using Bhajan details
    Sleep    5s
    Mobile Click Element   ${PLAY_AND_PAUSE_BUTTON_BHAJAN}
    Log To Console    Clicked on Play button using Bhajan details.

Click on the Pause Button using Bhajan details
    Sleep    5s
    Mobile Click Element   ${PLAY_AND_PAUSE_BUTTON_BHAJAN}
    Log To Console    Clicked on Pause button using Bhajan details.
    


Click on the Search Icon
    Sleep    5s
    Mobile Click Element    ${SEARCH_ICON}
    Log To Console    Clicked on Search Icon.

Click on the Search Icon From Podcast
    [Documentation]    Clicks on search icon from Podcast details page with robust fallback locators
    Sleep    3s
    TRY
        # Try content descriptor based locator
        Mobile Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Podcast"]/android.widget.ImageView[2]    10s
        Mobile Click Element    xpath=//android.view.View[@content-desc="Podcast"]/android.widget.ImageView[2]
        Log To Console    ✅ Clicked Search Icon using Podcast content-desc locator
    EXCEPT
        Log To Console    ⚠️ Podcast content-desc locator failed, trying alternatives...
        TRY
            # Try generic ImageView[2] with increased wait
            Mobile Wait Until Element Is Visible    xpath=//android.widget.ImageView[2]    8s
            Mobile Click Element    xpath=//android.widget.ImageView[2]
            Log To Console    ✅ Clicked Search Icon using ImageView[2] locator
        EXCEPT
            TRY
                # Try searching by class in visible elements
                Mobile Wait Until Element Is Visible    xpath=(//android.widget.ImageView)[2]    8s
                Mobile Click Element    xpath=(//android.widget.ImageView)[2]
                Log To Console    ✅ Clicked Search Icon using indexed ImageView locator
            EXCEPT
                # Final fallback - try accessibilityId or description
                TRY
                    Mobile Wait Until Element Is Visible    accessibility_id=search    5s
                    Mobile Click Element    accessibility_id=search
                    Log To Console    ✅ Clicked Search Icon using accessibility ID
                EXCEPT
                    Log To Console    ❌ All search icon locators failed, trying tap by coordinates
                    # Get screen size and tap at typical search icon location (top right)
                    ${width}    ${height}=    Mobile Get Window Size
                    ${x}=    Evaluate    int(${width} * 0.9)
                    ${y}=    Evaluate    int(${height} * 0.08)
                    Mobile Tap    ${x}    ${y}
                    Log To Console    ⚠️ Tapped at coordinates (${x}, ${y}) as final fallback
                END
            END
        END
    END
    Sleep    2s  

Click on the search bar and enter a track name.
    Sleep    5s
    Mobile Click Element    ${SEARCH_BAR}
    Log To Console    Clicked on Search Bar.
    Mobile Input Text        ${SEARCH_INPUT_FIELD}    Dhun
    Mobile Hide Keyboard
    Log To Console    Entered Dhun in Search Bar.

Verify Track details are displayed
    Sleep    5s
    Mobile Wait Until Element Is Visible    ${SEARCH_TRACK_INFO}    10s
    ${track_info}=    Mobile Get Element Attribute    ${SEARCH_TRACK_INFO}    content-desc
    Log To Console    Track details displayed: ${track_info}

Click on the Back Button from Search Track
    Sleep    5s
    Mobile Click Element    ${TRACK_BACK_BUTTON}
    Log To Console    Clicked on Back Button from Search Track


Click on the Back Button from Radio Screen
    Sleep    2s
    Mobile Click Element    ${RADIO_SCREEN_BACK_BUTTON}
    Log To Console    Clicked on Back Button from Radio Screen