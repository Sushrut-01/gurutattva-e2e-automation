*** Settings ***
Resource            ../resources/libraries.robot
Resource            ../resources/keywords.robot
Resource            ../resources/web_keywords.robot
Resource            ../resources/test_setup_teardown.robot
Resource            ../pages/E2EAudioPage.robot
Resource            ../pages/CRM_AudioPage.robot

Test Setup          Test Setup
Test Teardown       Test Teardown
Suite Teardown      Suite Teardown


*** Test Cases ***
# Just testing for android app is opening or not
#    [Documentation]    Just testing for android app is opening or not
#    [Tags]    E2E    Smoke    TC00

#    Open Gurutattva App
#    Handle First Time Setup
#    Launch Mobile App And Login
#    Close Gurutattva App

End-to-End Integration Create and Publish Music Track in Web CRM and Verify Playback in Mobile App
    [Documentation]    End-to-end test: Create a music track in Web CRM, publish it, and verify playback in the mobile app.
    [Tags]    e2e    audio    tc01

    # --- Generate Unique Test Data ---
    Generate E2E Test Data

    # --- Web CRM: Create and Publish Music Track ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Music Category
    Create New Music SubCategory
    Add a new Author for Music
    Create New Audio Track
    Publish Music Track
    Close Web Browser

    # --- Mobile App: Verify Track Playback ---
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login
    Verify Track & Category On Home Page In Audio Of The Day Section
    Verify Track On Audio Page In Recently Added Section
    Verify Track within the newly created category and subcategory
    Search And Select Newly Created Track
    Close Gurutattva App

Unpublish Music Track And Validate In Mobile App
    [Documentation]    Unpublish the created music track from CRM using the toggle button and validate that it is not visible in the mobile app.
    [Tags]    e2e    audio    unpublish    tc03

    # --- Web CRM: Unpublish Music Track ---
    Open Web Browser
    Login in with valid credentials
    Click on the Audio Menu
    Click on the Music Submenu
    Unpublish Music Track From Edit Page And Validate In Mobile App

End-to-End Integration Create and Publish Podcast in Web CRM and Verify Playback in Mobile App
    [Documentation]    End-to-end test: Create a podcast in Web CRM, publish it, and verify playback in the mobile app.
    [Tags]    e2e    podcast    tc02

    # --- Generate Unique Test Data ---
    Generate E2E Test Data for Podcast

    # --- Web CRM: Create and Publish Podcast ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Podcast Category
    Create New Podcast SubCategory
    Add a new Speaker for Podcast
    Create New Podcast Track
    Publish Podcast Track
    Close Web Browser

    # --- Mobile App: Verify Podcast Playback ---
    Open Gurutattva App
    Handle First Time Setup
    Verify Podcast track is displayed on audio of the day section
    Verify Podcast Track is displayed on Home Screen
    Navigate To Podcast Section In Mobile
    Verify Podcast displayed in Recently Added section.
    Search And Select Newly Created Podcast Track
    Verify Podcast Track Appears In Mobile Search Results
    Play The Podcast Track
    Click on the Back Button from Search Track

    # Verify Podcast Subcategory
    Click on the Podcast Tab
    Verify Podcast Subcategory is displayed in the list
    Verify Podcast Details
    Click on the back button from Podcast Details
    Close Gurutattva App

Validate that the mobile app does not display unpublished podcast track
    [Documentation]    Validates that the mobile app does not display unpublished podcast tracks.
    [Tags]    e2e    podcast    unpublish    tc04

    # --- Web CRM: Unpublish Podcast ---
    Open Web Browser
    Login in with valid credentials
    Click on the Audio Menu
    Click on the Podcast Submenu
    Unpublish Podcast Track From Edit Page And Validate In Mobile App

Validate mobile app does not show deleted Podcast tracks
    [Documentation]    Validates that the mobile app does not display deleted podcast tracks.
    [Tags]    e2e    podcast    deletepodcast    tc06

    # --- Generate Unique Test Data ---
    Generate E2E Test Data for Podcast

    # --- Web CRM: Create and Publish Podcast ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Podcast Category
    Create New Podcast SubCategory
    Add a new Speaker for Podcast
    Create New Podcast Track
    Publish Podcast Track

    # --- Web CRM: Delete Podcast ---
    Delete Podcast Track
    Close Web Browser

    # --- Mobile App: Verify Podcast is Deleted ---
    Open Gurutattva App
    Handle First Time Setup
    Verify Podcast track is displayed on audio of the day section
    Verify Podcast Track is displayed on Home Screen
    Navigate To Podcast Section In Mobile
    Verify Podcast displayed in Recently Added section.
    Search the Deleted Podcast Track
    Verify Podcast Track is not Appears In Mobile Search Results

Validate mobile app does not show deleted Music tracks
    [Documentation]    Validates that the mobile app does not display deleted music tracks.
    [Tags]    e2e    audio    deletemusic    tc05

    # --- Generate Unique Test Data ---
    Generate E2E Test Data

    # --- Web CRM: Create and Publish Music Track ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Music Category
    Create New Music SubCategory
    Add a new Author for Music
    Create New Audio Track
    Publish Music Track
    # --- Web CRM: Delete Music ---
    Delete Music Track
    Close Web Browser

    # --- Mobile App: Verify Track Playback ---
    Open Gurutattva App
    Handle First Time Setup
    Verify Track & Category On Home Page In Audio Of The Day Section is not visible
    Verify Track On Audio Page In Recently Added Section is not visible
    Verify Track within the newly created category and subcategory is not visible
    Search the Deleted Music Track
    Verify Music Track is not Appears In Mobile Search Results

Validate Editing and Publishing of Music Track in Web CMS and Verify in Mobile App
    [Documentation]    Edit an existing music track in Web CMS, publish it, and verify the changes in the mobile app.
    [Tags]    e2e    audio    editpublish    tc50     milestone2

    # --- Generate Unique Test Data ---
    Generate E2E Test Data

    # --- Define Edited Variables ---
    Set Test Variable    ${EDITED_TITLE}    ${E2E_AUDIO_TRACK_TITLE}_Edited
    Set Test Variable    ${EDITED_DESCRIPTION}    Edited description for ${E2E_AUDIO_TRACK_TITLE}
    Set Test Variable    ${EDITED_THUMBNAIL}    ${ENGLISH_THUMBNAIL_FILE}
    Set Test Variable    ${EDITED_AUDIO_FILE}    ${ENGLISH_AUDIO_FILE}
    Set Test Variable    ${EDITED_TAGS}    E2E,Test,Integration,Edited

    # --- Web CRM: Create and Publish Music Track ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Music Category
    Create New Music SubCategory
    Add a new Author for Music
    Create New Audio Track
    Publish Music Track

    # --- Web CRM: Edit Music Track ---
    Search Category In List    ${E2E_CATEGORY_NAME}
    Click Edit Icon For Created Track
    Scroll To Bottom Of Edit Music Page
    Edit Music Track Fields And Set Updated Variables
    ...    ${EDITED_TITLE}
    ...    ${EDITED_DESCRIPTION}
    ...    ${EDITED_THUMBNAIL}
    ...    ${EDITED_AUDIO_FILE}
    Click Update Button
    Click Upload Button

    # --- Web CRM: Close Browser ---
    Close Web Browser

    # --- Mobile App: Verify Edited Track ---
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login
    Verify Edited Track & Category On Home Page In Audio Of The Day Section    ${EDITED_TITLE}
    Verify Edited Track On Audio Page In Recently Added Section    ${EDITED_TITLE}
    Verify Edited Track within the newly created category and subcategory
    Search And Select Edited Track    ${EDITED_TITLE}
    Verify Edited Track Details In Mobile App    ${EDITED_TITLE}
    Close Gurutattva App

Validate Editing and Publishing of Podcast Track in Web CMS and Verify in Mobile App
    [Documentation]    Edit an existing podcast track in Web CMS, publish it, and verify the changes in the mobile app.
    [Tags]    e2e    podcast    editpublish    tc51    milestone2

    # --- Generate Unique Test Data ---
    Generate E2E Test Data for Podcast

    # --- Define Edited Variables ---
    Set Test Variable    ${EDITED_PODCAST_TITLE}    ${E2E_AUDIO_TRACK_TITLE_PODCAST}_Edited
    Set Test Variable    ${EDITED_PODCAST_DESCRIPTION}    Edited description for ${E2E_AUDIO_TRACK_TITLE_PODCAST}
    Set Test Variable    ${EDITED_PODCAST_THUMBNAIL}    ${ENGLISH_THUMBNAIL_FILE}
    Set Test Variable    ${EDITED_PODCAST_AUDIO_FILE}    ${ENGLISH_AUDIO_FILE}

    # --- Web CRM: Create and Publish Podcast Track ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Podcast Category
    Create New Podcast SubCategory
    Add a new Speaker for Podcast
    Create New Podcast Track
    Publish Podcast Track

    # --- Web CRM: Edit Podcast Track ---
    Search Category In List    ${E2E_CATEGORY_NAME_PODCAST}
    Click Edit Icon For Created Track
    Scroll To Bottom Of Edit Music Page
    Update Podcast Track Fields
    ...    ${EDITED_PODCAST_TITLE}
    ...    ${EDITED_PODCAST_DESCRIPTION}
    ...    ${EDITED_PODCAST_THUMBNAIL}
    ...    ${EDITED_PODCAST_AUDIO_FILE}
    Click Update Button
    Click Upload Button

    # --- Web CRM: Close Browser ---
    Close Web Browser

    # --- Mobile App: Verify Edited Podcast Track ---
    Open Gurutattva App
    Handle First Time Setup
    # Launch Mobile App And Login as Community User
    # Verify Edited Podcast Track & Category On Home Page In Audio Of The Day Section    ${EDITED_PODCAST_TITLE}
    Verify Edited Podcast Track On Audio Page In Recently Added Section    ${EDITED_PODCAST_TITLE}
    Verify Edited Podcast Track within the newly created category and subcategory
    Search And Select Edited Podcast Track    ${EDITED_PODCAST_TITLE}
    Verify Edited Podcast Track Details In Mobile App    ${EDITED_PODCAST_TITLE}
    Close Gurutattva App

Delete Music Track And Verify Removal From Mobile App
    [Documentation]    Delete a music track from Web CRM and verify it's removed from mobile app
    [Tags]    e2e    audio    delete    tc52    milestone2

    # --- Generate Unique Test Data ---
    Generate E2E Test Data

    # --- Web CRM: Create and Publish Music Track ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Music Category
    Create New Music SubCategory
    Add a new Author for Music
    Create New Audio Track
    Publish Music Track

    # --- Web CRM: Delete Music Track ---
    Click on the Audio Menu
    Click on the Music Submenu
    Delete Music Track From List    ${E2E_CATEGORY_NAME}
    Close Web Browser

    # --- Mobile App: Verify Track is Deleted ---
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login

    # Verify track is not visible in Audio of the Day section
    Verify Deleted Music Track Is Not Visible In Audio Of The Day Section    ${E2E_AUDIO_TRACK_TITLE}

    # Verify track is not visible in Recently Added section
    Verify Deleted Music Track Is Not Visible In Recently Added Section    ${E2E_AUDIO_TRACK_TITLE}

    # Verify track is not visible in its category section
    Verify Deleted Music Track Is Not Visible In Category Section    ${E2E_AUDIO_TRACK_TITLE}    ${E2E_CATEGORY_NAME}

    # Search for the deleted track and verify it's not found
    # Search Deleted Music Track In Mobile App    ${E2E_AUDIO_TRACK_TITLE}
    # Verify Deleted Music Track Not Found In Search Results    ${E2E_AUDIO_TRACK_TITLE}

    Close Gurutattva App

Delete Podcast Track And Verify Removal From Mobile App
    [Documentation]    Delete a podcast track from Web CRM and verify it's removed from mobile app
    [Tags]    e2e    podcast    delete    tc53    milestone2

    # --- Generate Unique Test Data ---
    Generate E2E Test Data for Podcast

    # --- Web CRM: Create and Publish Podcast Track ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Podcast Category
    Create New Podcast SubCategory
    Add a new Speaker for Podcast
    Create New Podcast Track
    Publish Podcast Track

    # --- Web CRM: Delete Podcast Track ---
    Click on the Audio Menu
    Click on the Podcast Submenu
    Delete Podcast Track From List    ${E2E_CATEGORY_NAME_PODCAST}
    Close Web Browser

    # --- Mobile App: Verify Podcast Track is Deleted ---
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login

    # Verify podcast track is not visible in Audio of the Day section
    Verify Deleted Podcast Track Is Not Visible In Audio Of The Day Section    ${E2E_AUDIO_TRACK_TITLE_PODCAST}

    # Verify podcast track is not visible in Recently Added section
    Verify Deleted Podcast Track Is Not Visible In Recently Added Section    ${E2E_AUDIO_TRACK_TITLE_PODCAST}

    # Verify podcast track is not visible in its category section
    Verify Deleted Podcast Track Is Not Visible In Category Section
    ...    ${E2E_AUDIO_TRACK_TITLE_PODCAST}
    ...    ${E2E_CATEGORY_NAME_PODCAST}

    # Search for the deleted podcast track and verify it's not found
    # Search Deleted Podcast Track In Mobile App    ${E2E_AUDIO_TRACK_TITLE_PODCAST}
    # Verify Deleted Podcast Track Not Found In Search Results    ${E2E_AUDIO_TRACK_TITLE_PODCAST}

    Close Gurutattva App

Add Music Track With Same Track And Thumbnail For Both Languages
    [Documentation]    Add a music track with checkbox enabled to use same track and thumbnail for both languages
    [Tags]    e2e    audio    checkbox    tc54    milestone2

    # --- Generate Unique Test Data ---
    Generate E2E Test Data

    # --- Web CRM: Create and Publish Music Track with Checkbox ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Music Category
    Create New Music SubCategory
    Add a new Author for Music
    Create New Audio Track With Checkbox
    Publish Music Track
    Close Web Browser

    # --- Mobile App: Verify Track Playback ---
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login
    Verify Track & Category On Home Page In Audio Of The Day Section
    Verify Track On Audio Page In Recently Added Section
    Verify Track within the newly created category and subcategory
    Search And Select Newly Created Track
    Close Gurutattva App

Add Podcast Track With Same Track And Thumbnail For Both Languages
    [Documentation]    Add a podcast track with checkbox enabled to use same track and thumbnail for both languages
    [Tags]    e2e    podcast    checkbox    tc55    milestone2

    # --- Generate Unique Test Data ---
    Generate E2E Test Data for Podcast

    # --- Web CRM: Create and Publish Podcast Track with Checkbox ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Podcast Category
    Create New Podcast SubCategory
    Add a new Speaker for Podcast
    Create New Podcast Track With Checkbox
    Publish Podcast Track
    Close Web Browser

    # --- Mobile App: Verify Podcast Track Playback ---
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login

    # Verify podcast track is visible in Audio of the Day section
    Verify Podcast track is displayed on audio of the day section
    Verify Podcast Track is displayed on Home Screen
    Navigate To Podcast Section In Mobile
    Verify Podcast displayed in Recently Added section.
    Search And Select Newly Created Podcast Track
    Verify Podcast Track Appears In Mobile Search Results
    Close Gurutattva App

Add Music Track Without Author
    [Documentation]    Add a music track without selecting an author to verify author is not mandatory
    [Tags]    e2e    music    no-author    tc56    milestone2

    # --- Generate Unique Test Data ---
    Generate E2E Test Data

    # --- Web CRM: Create and Publish Music Track without Author ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Music Category
    Create New Music SubCategory
    # Note: Skipping author creation as it's not needed for this test
    Create New Audio Track Without Author
    Publish Music Track
    Close Web Browser

    # --- Mobile App: Verify Music Track Playback ---
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login

    # Verify music track is visible in Audio of the Day section
    Verify Track & Category On Home Page In Audio Of The Day Section
    Verify Track On Audio Page In Recently Added Section
    Verify Track within the newly created category and subcategory
    Search And Select Newly Created Track
    Close Gurutattva App

Add Podcast Track Without Speaker Should not be allowed
    [Documentation]    Attempt to add a podcast track without selecting a speaker to verify speaker is mandatory
    [Tags]    e2e    podcast    no-speaker    validation    tc57    milestone2

    # --- Generate Unique Test Data ---
    Generate E2E Test Data for Podcast

    # --- Web CRM: Attempt to Create Podcast Track without Speaker ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Podcast Category
    Create New Podcast SubCategory
    # Note: Skipping speaker creation as we want to test mandatory validation
    Create New Podcast Track Without Speaker
    Verify Speaker Validation Error
    Close Web Browser

Test Music Different Filter Functionality
    [Documentation]    Test different filter combinations on Music page
    [Tags]    e2e    music    filter    tc58    milestone2

    # --- Web CRM: Test Filter Functionality ---
    Open Web Browser
    Login in with valid credentials
    Click on the Audio Menu
    Click on the Music Submenu

    # Test Filter 1: Category Filter with "is" operator
    Log To Console    🔍 Testing Filter 1: Category = "Bhajan"
    Click Filter Button
    Apply Filter Combination    categoryName    is    Bhajan
    Verify Filter Results    categoryName    is    Bhajan
    Clear All Filters

    # Test Filter 2: Status Filter with "is" operator
    Log To Console    🔍 Testing Filter 2: Status = "Publish"
    Click Filter Button
    Apply Status Filter    Publish
    Verify Status Filter Results    Publish
    Clear All Filters

    # Test Filter 3: Track Count Filter with "is" operator
    Log To Console    🔍 Testing Filter 3: Track Count = "1"
    Click Filter Button
    Apply Track Count Filter    1
    Verify Track Count Filter Results    1
    Clear All Filters

    # Test Filter 4: Category Filter with "is not" operator
    Log To Console    🔍 Testing Filter 4: Category is not "Bhajan"
    Click Filter Button
    Apply Filter Combination    categoryName    not    Bhajan
    Verify Filter Results    categoryName    not    Bhajan
    Clear All Filters

    # Test Filter 5: Status Filter for "Unpublish"
    Log To Console    🔍 Testing Filter 5: Status = "Unpublish"
    Click Filter Button
    Apply Status Filter    Unpublish
    Verify Status Filter Results    Unpublish
    Clear All Filters

    # Test Filter 6: Published Date Filter for "Today"
    Log To Console    🔍 Testing Filter 6: Published Date = "Today"
    Click Filter Button
    Apply Published Date Filter    Today
    Verify Published Date Filter Results    Today
    Clear All Filters

    Log To Console    ✅ All filter tests completed successfully
    Close Web Browser

Test Podcast Different Filter Functionality
    [Documentation]    Test different filter combinations on Podcast page
    [Tags]    e2e    podcast    filter    tc58_01    milestone2

    # --- Web CRM: Test Filter Functionality ---
    Open Web Browser
    Login in with valid credentials
    Click on the Audio Menu
    Click on the Podcast Submenu

    # Test Filter 1: Category Filter with "is" operator
    Log To Console    🔍 Testing Filter 1: Category = "Pravachan"
    Click Filter Button
    Apply Filter Combination    categoryName    is    Pravachan
    Verify Filter Results    categoryName    is    Pravachan
    Clear All Filters

    # Test Filter 2: Status Filter with "is" operator
    Log To Console    🔍 Testing Filter 2: Status = "Publish"
    Click Filter Button
    Apply Status Filter    Publish
    Verify Status Filter Results    Publish
    Clear All Filters

    # Test Filter 3: Track Count Filter with "is" operator
    Log To Console    🔍 Testing Filter 3: Track Count = "1"
    Click Filter Button
    Apply Track Count Filter    1
    Verify Track Count Filter Results    1
    Clear All Filters

    # Test Filter 4: Category Filter with "is not" operator
    Log To Console    🔍 Testing Filter 4: Category is not "Pravachan"
    Click Filter Button
    Apply Filter Combination    categoryName    not    Pravachan
    Verify Filter Results    categoryName    not    Pravachan
    Clear All Filters

    # Test Filter 5: Status Filter for "Unpublish"
    Log To Console    🔍 Testing Filter 5: Status = "Unpublish"
    Click Filter Button
    Apply Status Filter    Unpublish
    Verify Status Filter Results    Unpublish
    Clear All Filters

    # Test Filter 6: Published Date Filter for "Today"
    Log To Console    🔍 Testing Filter 6: Published Date = "Today"
    Click Filter Button
    Apply Published Date Filter    Today
    Verify Published Date Filter Results    Today
    Clear All Filters

    Log To Console    ✅ All podcast filter tests completed successfully
    Close Web Browser



Test Music Management Refresh Button Functionality
    [Documentation]    Test refresh button maintains pagination count
    [Tags]    e2e    music    refresh    TC59    milestone2

    # --- Web CRM: Test Refresh Button ---
    Open Web Browser
    Login in with valid credentials
    Click on the Audio Menu
    Click on the Music Submenu
    
    # Wait for page to load and get initial pagination count
    Sleep    5s
    ${initial_count}=    Get Total Record Count From Pagination
    Log To Console    📊 Initial pagination count: ${initial_count}
    
    # If count is 0, wait a bit more for data to load
    IF    ${initial_count} == 0
        Log To Console    ⚠️ Initial count is 0, waiting for data to load...
        Sleep    5s
        ${initial_count}=    Get Total Record Count From Pagination
        Log To Console    📊 Initial pagination count (after wait): ${initial_count}
    END
    
    # Click refresh button
    Click Refresh Button
    Sleep    3s
    
    # Get refreshed pagination count
    ${refreshed_count}=    Get Total Record Count From Pagination
    Log To Console    📊 Refreshed pagination count: ${refreshed_count}
    
    # Verify counts match
    Should Be Equal    ${refreshed_count}    ${initial_count}
    Log To Console    ✅ Refresh button test completed successfully
    Close Web Browser

Test Podcast Management Refresh Button Functionality
    [Documentation]    Test refresh button maintains pagination count for Podcast
    [Tags]    e2e    podcast    refresh    TC60    milestone2

    # --- Web CRM: Test Refresh Button for Podcast ---
    Open Web Browser
    Login in with valid credentials
    Click on the Audio Menu
    Click on the Podcast Submenu
    
    # Wait for page to load and get initial pagination count
    Sleep    5s
    ${initial_count}=    Get Total Record Count From Pagination
    Log To Console    📊 Initial pagination count: ${initial_count}
    
    # If count is 0, wait a bit more for data to load
    IF    ${initial_count} == 0
        Log To Console    ⚠️ Initial count is 0, waiting for data to load...
        Sleep    5s
        ${initial_count}=    Get Total Record Count From Pagination
        Log To Console    📊 Initial pagination count (after wait): ${initial_count}
    END
    
    # Click refresh button
    Click Refresh Button
    Sleep    3s
    
    # Get refreshed pagination count
    ${refreshed_count}=    Get Total Record Count From Pagination
    Log To Console    📊 Refreshed pagination count: ${refreshed_count}
    
    # Verify counts match
    Should Be Equal    ${refreshed_count}    ${initial_count}
    Log To Console    ✅ Podcast refresh button test completed successfully
    Close Web Browser



Test Multiple Music Tracks Same Category Same Subcategory
    [Documentation]    Add 4-5 music tracks under same category and subcategory, verify in mobile app
    [Tags]    e2e    music    multiple_tracks    tc62    milestone2

    # --- Generate Unique Test Data ---
    Generate E2E Test Data

    # --- Web CRM: Create Category, SubCategory, and Multiple Authors ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Music Category
    Create New Music SubCategory
    
    # Create multiple authors for more diverse test data
    Create Multiple Authors For Testing    3

    # --- Navigate to Music Management and Add Multiple Tracks ---
    Click on the Audio Menu
    Click on the Music Submenu
    Add Multiple Music Tracks Same Subcategory With Multiple Authors    3

    Close Web Browser

    # --- Mobile App: Verify All Tracks ---
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login
    
    # Generate track titles for verification
    @{track_titles}=    Generate Track Titles For Verification    3
    
    Verify Multiple Tracks In Mobile App    ${track_titles}    ${E2E_CATEGORY_NAME}
    Close Gurutattva App

Test Multiple Podcast Tracks Same Category Same Subcategory
    [Documentation]    Add 4-5 podcast tracks under same category and subcategory, verify in mobile app
    [Tags]    e2e    podcast    multiple_tracks    tc64    milestone2

    # --- Generate Unique Test Data ---
    Generate E2E Test Data for Podcast

    # --- Web CRM: Create Category, SubCategory, and Multiple Speakers ---
    Open Web Browser
    Login in with valid credentials
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Create New Podcast Category
    Create New Podcast SubCategory
    
    # Create multiple speakers for more diverse test data
    Create Multiple Speakers For Testing    3

    # --- Navigate to Podcast Management and Add Multiple Tracks ---
    Click on the Audio Menu
    Click on the Podcast Submenu
    Add Multiple Podcast Tracks Same Subcategory With Multiple Speakers    3

    Close Web Browser

    # --- Mobile App: Verify All Tracks ---
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login
    
    # Generate track titles for verification
    @{track_titles}=    Generate Track Titles For Verification Podcast    3
    
    Verify Multiple Podcast Tracks In Mobile App    ${track_titles}    ${E2E_CATEGORY_NAME_PODCAST}
    Close Gurutattva App


    