*** Settings ***
Resource   libraries.robot
Resource   variables.robot

*** Variables ***
${SKIP_INTRO_GUIDE}               xpath=//android.widget.Button[@content-desc="Skip"]
${Audio_of_the_day}    xpath=//android.view.View[contains(@content-desc,'Audio of the Day')]

*** Keywords ***
Swipe Audio Of The Day Section To Find Track
    [Arguments]    ${track_title}    ${random_number}
    [Documentation]    Common keyword to swipe Audio of the Day section to find a specific track
    Log To Console    🔍 Looking for track in Audio of the Day: ${track_title}
    
    # First swipe up once to ensure Audio of the Day section is fully visible
    Mobile Swipe    500    1000    500    400    1s
    Sleep    2s
    Log To Console    📱 Swiped up to reveal Audio of the Day section
    
    # Check if track is already visible
    ${element_exists}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'${track_title}')]    2s
    IF    ${element_exists} == True
        Log To Console    ✅ Track ${track_title} is already visible
        RETURN
    END
    
    # If track not visible, try to find a visible track to swipe from
    ${visible_track_found}=    Set Variable    False
    ${visible_track_xpath}=    Set Variable    ${EMPTY}
    
    # Try to find Track 3 or Track 2 (which are visible by default)
    FOR    ${track_num}    IN RANGE    3    1    -1
        ${track_pattern}=    Set Variable    E2E_Track_${random_number}_${track_num}
        ${track_exists}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'${track_pattern}')]    2s
        IF    ${track_exists} == True
            ${visible_track_found}=    Set Variable    True
            ${visible_track_xpath}=    Set Variable    xpath=//android.view.View[contains(@content-desc,'${track_pattern}')]
            Log To Console    📍 Found visible track ${track_pattern} to swipe from
            BREAK
        END
    END
    
    IF    ${visible_track_found} == False
        Log To Console    ❌ No visible tracks found to swipe from
        Fail    No visible tracks found in Audio of the Day section
    END
    
    # Get the coordinates of the visible track
    ${element_location}=    Mobile Get Element Location    ${visible_track_xpath}
    ${element_size}=    Mobile Get Element Size    ${visible_track_xpath}
    
    # Calculate swipe coordinates (swipe from center of visible track to the left to reveal Track 1)
    ${start_x}=    Evaluate    ${element_location['x']} + (${element_size['width']} / 2)
    ${start_y}=    Evaluate    ${element_location['y']} + (${element_size['height']} / 2)
    ${end_x}=    Evaluate    ${start_x} - 500
    ${end_y}=    Set Variable    ${start_y}
    
    Log To Console    📍 Swipe coordinates: (${start_x}, ${start_y}) → (${end_x}, ${end_y})
    
    # Swipe left multiple times to find the track
    ${max_swipes}=    Set Variable    5
    ${swipe_count}=    Set Variable    0
    ${track_found}=    Set Variable    False
    
    WHILE    ${swipe_count} < ${max_swipes} and ${track_found} == False
        ${swipe_count}=    Evaluate    ${swipe_count} + 1
        Log To Console    🔄 Swiping left attempt ${swipe_count}/${max_swipes}
        
        # Perform swipe from visible track to the left
        Mobile Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    1s
        Sleep    2s
        
        # Check if target track is visible
        ${element_exists}=    Run Keyword And Return Status    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'${track_title}')]    2s
        IF    ${element_exists} == True
            ${track_found}=    Set Variable    True
            Log To Console    ✅ Track ${track_title} found after ${swipe_count} swipe(s)
        END
    END

Open Gurutattva App
    Mobile Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${AUTOMATION_NAME}
    ...    noReset=${NO_RESET}
    ...    skipServerInstallation=${SKIP_SERVER_INSTALLATION}
    Sleep    5s

Close Gurutattva App
    Mobile Terminate Application    ${APP_PACKAGE}     
    Sleep    2s
    Mobile Press Keycode    187    # Opens recent apps
    Sleep    2s
    # Example: Swipe to remove (coordinates depend on device)
    Mobile Swipe    500    1200    500    200    500
    Mobile Close Application

Scroll Until Element Visible
    [Arguments]    ${locator}
    ${height}=      Mobile Get Window Height
    ${width}=       Mobile Get Window Width
    ${start_x}=     Evaluate    int(${width} * 0.5)
    ${start_y}=     Evaluate    int(${height} * 0.6)
    ${offset_x}=    Set Variable    0
    ${offset_y}=    Evaluate    int(-1 * ${height} * 0.4)
 

    FOR    ${i}    IN RANGE    0    5
        ${visible}=    Run Keyword And Return Status    Mobile Page Should Contain Element    ${locator}
        Exit For Loop If    ${visible}
        Mobile Swipe    ${start_x}    ${start_y}    ${offset_x}    ${offset_y}    800ms
    END

Scroll Up Until Element Visible
    [Arguments]    ${locator}
    ${height}=      Mobile Get Window Height
    ${width}=       Mobile Get Window Width
    ${start_x}=     Evaluate    int(${width} * 0.5)
    ${start_y}=     Evaluate    int(${height} * 0.4)
    ${end_x}=       Set Variable    ${start_x}
    ${end_y}=       Evaluate    int(${height} * 0.8)    # Swipe from 40% to 80% (upwards)
 
    FOR    ${i}    IN RANGE    0    5
        ${visible}=    Run Keyword And Return Status    Mobile Page Should Contain Element    ${locator}
        Exit For Loop If    ${visible}
        Mobile Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    800ms
    END

Swipe Until Element Visible
    [Arguments]    ${locator}
    ${height}=      Mobile Get Window Height
    ${width}=       Mobile Get Window Width
    ${start_x}=     Evaluate    int(${width} * 0.5)
    ${start_y}=     Evaluate    int(${height} * 0.8)
    ${end_y}=       Evaluate    int(${height} * 0.2)

    FOR    ${i}    IN RANGE    0    25
        ${visible}=    Run Keyword And Return Status    Mobile Page Should Contain Element    ${locator}
        Exit For Loop If    ${visible}
        Mobile Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    800ms
    END


Clear Name Field
    [Arguments]    ${field_locator}
    Mobile Wait Until Element Is Visible    ${field_locator}    10s
    Mobile Click Element                    ${field_locator}
    Mobile Clear Text                       ${field_locator}
 
Swipe Right Until Element Visible
    [Arguments]    ${Audio_of_the_day}    ${locator}
    Mobile Wait Until Element Is Visible    ${Audio_of_the_day}    10s
    ${location}=    Mobile Get Element Location    ${Audio_of_the_day}
    ${size}=        Mobile Get Element Size        ${Audio_of_the_day}

    # Swipe from left to right to reveal more content in horizontal scrollable section
    ${start_x}=     Evaluate    int(${location['x']} + int(${size['width']} * 0.1))  # Start from left side
    ${end_x}=       Evaluate    int(${location['x']} + int(${size['width']} * 0.9))  # End at right side
    ${y}=           Evaluate    int(${location['y']} + int(${size['height']} / 2))

    FOR    ${i}    IN RANGE    0    7
        ${visible}=    Run Keyword And Return Status    Mobile Page Should Contain Element    ${locator}
        Exit For Loop If    ${visible}
        Mobile Swipe    ${start_x}    ${y}    ${end_x}    ${y}    800ms
    END

Take Mobile Screenshot
    [Documentation]    Takes a screenshot for mobile tests and saves it to results/Screenshot directory
    [Arguments]    ${filename}
    
    # Create screenshot directory if it doesn't exist
    Create Directory    ${EXECDIR}/results/Screenshot
    
    # Take screenshot using the proper Mobile prefix
    Mobile Capture Page Screenshot    ${EXECDIR}/results/Screenshot/${filename}
    Log To Console    📸 Mobile screenshot saved to: ${EXECDIR}/results/Screenshot/${filename}

Capture Screenshot On Failure
    [Arguments]    ${test_name}
    ${timestamp}=    Get Time    epoch
    ${mobile_file}=    Set Variable    ${EXECDIR}/results/Screenshot/${test_name}_${timestamp}_mobile.png
    ${web_file}=    Set Variable    ${EXECDIR}/results/Screenshot/${test_name}_${timestamp}_web.png
    Create Directory    ${EXECDIR}/results/Screenshot
    ${mobile_status}=    Run Keyword And Ignore Error    Mobile.Capture Page Screenshot    ${mobile_file}
    IF    '${mobile_status[0]}' == 'PASS'
        Log To Console    ✅ Mobile screenshot captured for test: ${test_name}
        Log    Mobile screenshot: ${mobile_file}
    ELSE
        Log To Console    ⚠️ Mobile screenshot capture failed, capturing web screenshot...
        Web.Capture Page Screenshot    ${web_file}
        Log    Web screenshot: ${web_file}
    END

Skip introductory guide on initial application launch
    [Documentation]    Skips the introductory guide if it appears on the first app launch.
    Mobile Wait Until Element Is Visible    ${SKIP_INTRO_GUIDE}    10s
    Mobile Click Element    ${SKIP_INTRO_GUIDE}
    Sleep    2s

Scroll Until Element Found
    [Arguments]    ${locator}    ${max_scrolls}=7
    ${height}=      Mobile Get Window Height
    ${width}=       Mobile Get Window Width
    ${start_x}=     Evaluate    int(${width} * 0.5)
    ${start_y}=     Evaluate    int(${height} * 0.7)
    ${end_x}=       Set Variable    ${start_x}
    ${end_y}=       Evaluate    int(${height} * 0.3)

    FOR    ${i}    IN RANGE    ${max_scrolls}
        ${visible}=    Run Keyword And Return Status    Mobile Page Should Contain Element    ${locator}
        Exit For Loop If    ${visible}
        Mobile Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    800ms
    END

    IF    not ${visible}
        Fail    Element '${locator}' not found after ${max_scrolls} scrolls
    END

Swipe Until Banner Visible
    [Arguments]    ${locator}
    ${height}=      Mobile Get Window Height
    ${width}=       Mobile Get Window Width

    # Y axis fix karenge center me
    ${y}=           Evaluate    int(${height} * 0.5)

    # Right → Left swipe coordinates
    ${start_x}=     Evaluate    int(${width} * 0.9)
    ${end_x}=       Evaluate    int(${width} * 0.1)

    FOR    ${i}    IN RANGE    0    5
        ${visible}=    Run Keyword And Return Status    Mobile Page Should Contain Element    ${locator}
        Exit For Loop If    ${visible}
        Mobile Swipe    ${start_x}    ${y}    ${end_x}    ${y}    800ms
    END   

Get Keycode For Character
    [Arguments]    ${char}
    ${mapping}=    Create Dictionary
    ...    a=29    b=30    c=31    d=32    e=33    f=34    g=35    h=36    i=37    j=38
    ...    k=39    l=40    m=41    n=42    o=43    p=44    q=45    r=46    s=47    t=48
    ...    u=49    v=50    w=51    x=52    y=53    z=54
    ...    0=7     1=8     2=9     3=10    4=11    5=12    6=13    7=14    8=15    9=16
    ${char_lower}=    Convert To Lowercase    ${char}
    ${keycode}=    Get From Dictionary    ${mapping}    ${char_lower}    default=None
    Return From Keyword    ${keycode}     