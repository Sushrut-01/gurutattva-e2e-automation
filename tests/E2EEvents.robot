*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    ../pages/eventsPage.robot
Resource    ../pages/HomePage.robot
Resource    ../pages/E2EEventsPage.robot
Resource    ../pages/loginPage.robot
Resource    ../pages/CRM_AudioPage.robot
Resource    ../resources/web_keywords.robot
Resource    ../pages/profilePage.robot
Resource    ../pages/DhyankendraPage.robot
Resource    ../pages/E2EPrayerPage.robot

Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***
Verify the image upload validation in CMS for Events
    [Tags]    TC41    E2EEvents    Validation    E2E

    # --- Web CMS: Test Image Upload Validation ---
    Open Web Browser
    Login in with valid credentials
    Navigate To Global Events In CMS
    Click Add Events Button
    # Try to upload invalid image (large size)
    Upload Event Large Thumbnail Image    
    Upload Event Large Image 
    # Verify image upload validation error
    Verify Thumbnail and Image Upload Validation Error
    Close Web Browser

Verify that user is not able to publish event when publish date is selected after the event dates
    [Tags]    TC42    E2EEvents    PublishValidation    E2E

    # Generate unique test data for this test run
    Generate E2E Events Test Data For English

    # --- Web CMS: Create English News ---
    Open Web Browser
    Login in with valid credentials
    Navigate To Global Events In CMS
    Click Add Events Button
    Select English Language Tab
    Enter English Events Title    ${E2E_EVENTS_TITLE_EN}
    Enter English Events Description    ${E2E_EVENTS_DESCRIPTION_EN}
    Enter English Events Content    ${E2E_EVENTS_CONTENT_EN}
    Select Event from Date
    Select Event to Date
    Enter Events Venue
    Select Event Publish from Date for Next Day
    Select Event Publish to Date for Next Day
    Select Event Publish Status  
    Select Event Category 
    Upload Event English Thumbnail Image  
    Upload Event English Image  
    Click Submit Button
    Verify Validation Message of Publish From Date      
Verify that the user is able to add a English event, publish it in the CMS, and verify the english event details on the mobile app
    [Tags]    TC39    E2EEvents   English    E2E
    
    # Generate unique test data for this test run
    Generate E2E Events Test Data For English

    # --- Web CMS: Create English News ---
    Open Web Browser
    Login in with valid credentials
    Navigate To Global Events In CMS
    Click Add Events Button
    Select English Language Tab
    Enter English Events Title    ${E2E_EVENTS_TITLE_EN}
    Enter English Events Description    ${E2E_EVENTS_DESCRIPTION_EN}
    Enter English Events Content    ${E2E_EVENTS_CONTENT_EN}
    Select Event from Date
    Select Event to Date
    Enter Events Venue
    Select Event Publish from Date
    Select Event Publish to Date
    Select Event Publish Status  
    Select Event Category 
    Upload Event English Thumbnail Image  
    Upload Event English Image
    Click Submit Button
    Verify Events Created Successfully
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify Events In List    ${E2E_EVENTS_TITLE_EN}
    Verify Events Publish Status    ${E2E_EVENTS_TITLE_EN}    Publish
    Log To Console    🎉 English Events Created Successfully in CMS!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Title: ${E2E_EVENTS_TITLE_EN}
    Log To Console    🎉 Description: ${E2E_EVENTS_DESCRIPTION_EN}
    Log To Console    🎉 Content: ${E2E_EVENTS_CONTENT_EN}
    Close Web Browser

    # --- Mobile App: Verify English Events Details ---
    Open Gurutattva App
    Handle First Time Setup
    Clear App Cache And Reopen
    Handle First Time Setup
    Click on the Events Tab
    Verify Mobile Events Details    ${E2E_EVENTS_TITLE_EN}
    Close Gurutattva App
    
Verify that the user is able to add a Hindi event, publish it in the CMS, and verify the hindi event details on the mobile app
    [Tags]    TC40    E2EEvents    Hindi    E2E
    [Teardown]    Revert App Language To English And Close

    # Generate unique test data for this test run
    Generate E2E Events Test Data For Hindi

    # --- Web CMS: Create Hindi Events ---
    Open Web Browser
    Login in with valid credentials
    Navigate To Global Events In CMS
    Click Add Events Button
    Select Hindi Language Tab
    Enter Hindi Events Title    ${E2E_EVENTS_TITLE_HI}
    Enter Hindi Events Description    ${E2E_EVENTS_DESCRIPTION_HI}
    Enter Hindi Events Content    ${E2E_EVENTS_CONTENT_HI}
    Select Event from Date
    Select Event to Date
    Enter Events Hindi Venue
    Select Event Publish from Date
    Select Event Publish to Date
    Select Event Publish Status
    Select Event Category
    Upload Event Hindi Thumbnail Image
    Upload Event Hindi Image
    Click Submit Button
    Verify Events Created Successfully
    Search Events By Title    ${E2E_EVENTS_TITLE_HI}
    Verify Events In List    ${E2E_EVENTS_TITLE_HI}
    Verify Events Publish Status    ${E2E_EVENTS_TITLE_HI}    Publish
    Log To Console    🎉 Hindi Events Created Successfully in CMS!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Title: ${E2E_EVENTS_TITLE_HI}
    Log To Console    🎉 Description: ${E2E_EVENTS_DESCRIPTION_HI}
    Log To Console    🎉 Content: ${E2E_EVENTS_CONTENT_HI}
    Log To Console    🎉 Venue: ${E2E_EVENTS_HINDI_VENUE}
    Log To Console    🎉 Publish Status: ${E2E_EVENTS_PUBLISH_STATUS}
    Close Web Browser

    # --- Mobile App: Verify Hindi Events Details ---
    Open Gurutattva App
    Handle First Time Setup
    Clear App Cache And Reopen
    Handle First Time Setup
    Click on the Profile Tab
    Click on the Language Tab
    Select Hindi from the Language Selection
    Click on the Save Button from Language Selection
    Click on the Back Button from Profile Screen
    Click on the Hindi Events Tab
    Verify Mobile Events Hindi Details    ${E2E_EVENTS_TITLE_HI}
    Log To Console    🎉 Hindi Events Verified Successfully!
    Log To Console    🎉 E2E Hindi Events Test Completed Successfully!
    # Note: Language revert handled by [Teardown] - will run even if test fails

Test Add Event Category from CMS and Add Events under that Category
    [Tags]    TC43    E2EEvents    Category    E2E    milestone2
    [Documentation]    Add Event Category from CMS, Add Events under that category, and verify categories in Mobile app
    
    # Generate unique test data for this test run
    Generate E2E Event Category Test Data
    
    # --- Web CMS: Create Event Category ---
    Open Web Browser
    Login in with valid credentials
    Navigate To Master Management Menu
    Click On Manage Event Categories Submenu
    Click On Add Event Category Button
    Fill Event Category Details
    Click On Add Event Category Submit Button
    Verify Event Category Created Successfully
    Search Event Category By Name    ${E2E_EVENT_CATEGORY_NAME}
    Verify Event Category In List    ${E2E_EVENT_CATEGORY_NAME}
    Log To Console    🎉 Event Category Created Successfully in CMS!
    Log To Console    🎉 Category Name: ${E2E_EVENT_CATEGORY_NAME}
    Log To Console    🎉 Category Description: ${E2E_EVENT_CATEGORY_DESCRIPTION}
    
    # --- Web CMS: Add Events under the created category ---
    Navigate To Global Events In CMS
    Click Add Events Button
    Select English Language Tab
    Enter English Events Title    ${E2E_EVENTS_TITLE_EN}
    Enter English Events Description    ${E2E_EVENTS_DESCRIPTION_EN}
    Enter English Events Content    ${E2E_EVENTS_CONTENT_EN}
    Select Event from Date
    Select Event to Date
    Enter Events Venue
    Select Event Publish from Date
    Select Event Publish to Date
    Select Event Publish Status
    Select Created Event Category
    Upload Event English Thumbnail Image
    Upload Event English Image
    Click Submit Button
    Verify Events Created Successfully
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify Events In List    ${E2E_EVENTS_TITLE_EN}
    Verify Events Publish Status    ${E2E_EVENTS_TITLE_EN}    Publish
    Log To Console    🎉 Events Created Successfully under Category: ${E2E_EVENT_CATEGORY_NAME}
    Close Web Browser

    # --- Mobile App: Verify Categories in Mobile app ---
    Open Gurutattva App With Retry
    Handle First Time Setup With Retry
    Wait For App To Be Ready
    Click on the Events Tab With Retry
    Verify Event Category In Mobile App    ${E2E_EVENT_CATEGORY_NAME}
    Close Gurutattva App
    Log To Console    🎉 E2E Event Category Test Completed Successfully!

Test Unpublish Event from CMS and Verify in Mobile App
    [Tags]    TC44    E2EEvents    Unpublish    E2E    milestone2
    [Documentation]    Unpublish Event from CMS app and check reflection in Mobile app
    
    # Generate unique test data for this test run
    Generate E2E Event Category Test Data
    
    # --- Web CMS: Create Event Category ---
    Open Web Browser
    Login in with valid credentials
    Navigate To Master Management Menu
    Click On Manage Event Categories Submenu
    Click On Add Event Category Button
    Fill Event Category Details
    Click On Add Event Category Submit Button
    Verify Event Category Created Successfully
    Search Event Category By Name    ${E2E_EVENT_CATEGORY_NAME}
    Verify Event Category In List    ${E2E_EVENT_CATEGORY_NAME}
    Log To Console    🎉 Event Category Created Successfully in CMS!
    Log To Console    🎉 Category Name: ${E2E_EVENT_CATEGORY_NAME}
    Log To Console    🎉 Category Description: ${E2E_EVENT_CATEGORY_DESCRIPTION}
    
    # --- Web CMS: Add Events under the created category ---
    Navigate To Global Events In CMS
    Click Add Events Button
    Select English Language Tab
    Enter English Events Title    ${E2E_EVENTS_TITLE_EN}
    Enter English Events Description    ${E2E_EVENTS_DESCRIPTION_EN}
    Enter English Events Content    ${E2E_EVENTS_CONTENT_EN}
    Select Event from Date
    Select Event to Date
    Enter Events Venue
    Select Event Publish from Date
    Select Event Publish to Date
    Select Event Publish Status
    Select Created Event Category
    Upload Event English Thumbnail Image
    Upload Event English Image
    Click Submit Button
    Verify Events Created Successfully
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify Events In List    ${E2E_EVENTS_TITLE_EN}
    Verify Events Publish Status    ${E2E_EVENTS_TITLE_EN}    Publish
    Log To Console    🎉 Events Created Successfully under Category: ${E2E_EVENT_CATEGORY_NAME}
    
    # --- Web CMS: Unpublish the Event and Approve ---
    Click On Event Actions Menu
    Click On Edit Event Option
    Change Event Publish Status To Unpublish
    Click Submit Button
    Verify Event Unpublished Successfully
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify Events In List    ${E2E_EVENTS_TITLE_EN}
    Verify the Review Status as Pending for Global Events
    Click on the Edit Button from Global Events
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Approve Button from Edit Request
    Verify the Edit Event Request Approved Success Message
    Click on the Events Menu
    Navigate To Global Events In CMS
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify Events Publish Status    ${E2E_EVENTS_TITLE_EN}    Unpublish
    Log To Console    🎉 Event Unpublish Request Approved - Status: Unpublish
    Close Web Browser

    # --- Mobile App: Verify Event is NOT visible ---
    Open Gurutattva App With Retry
    Handle First Time Setup With Retry
    Wait For App To Be Ready
    Click on the Events Tab With Retry
    Verify Event Category Is Not Visible In Mobile App    ${E2E_EVENT_CATEGORY_NAME}
    Close Gurutattva App
    Log To Console    🎉 E2E Event Unpublish Test Completed Successfully!

Test Event Category Tab In Mobile App
    [Tags]    TC45    E2EEvents    Mobile    Category    E2E    milestone2
    [Documentation]    In Mobile app, check for Category tab, it should list all the Event (Local+ global) of that category
    
    # --- Mobile App: Open app and navigate to Events ---
    Open Gurutattva App With Retry
    Handle First Time Setup With Retry
    Click on the Events Tab With Retry
    Log To Console    ✅ Step 1: Clicked on Events Tab
    
    # --- Mobile App: Click on Category Icon ---
    Click on the Category Icon
    Log To Console    ✅ Step 2: Clicked on Category Icon
    
    # --- Mobile App: Fetch all category names ---
    ${all_categories}=    Fetch All Event Category Names
    Log To Console    ✅ Step 3: Fetched all category names: ${all_categories}
    
    # --- Mobile App: Click on a specific category and verify events ---
    # Let's click on the first available category
    ${first_category}=    Get From List    ${all_categories}    0
    Click on Specific Event Category    ${first_category}
    Log To Console    ✅ Step 4: Clicked on specific category: ${first_category}
    
    # --- Mobile App: Verify all events in the selected category ---
    Verify All Events In Category    ${first_category}
    Log To Console    ✅ Step 5: Verified all events in category: ${first_category}
    
    Close Gurutattva App
    Log To Console    🎉 E2E Event Category Tab Test Completed Successfully!

Test Check Local Event Filter Functionality
    [Tags]    TC46    E2EEvents    Mobile    Filter    E2E    milestone2
    [Documentation]    E2E test: Create Local Event in CMS with location (India/Gujarat/Ahmadabad), approve it, then verify Location filter in Mobile app

    # Generate unique test data for this test run
    Generate E2E Events Test Data For English

    # --- Web CMS: Sanchalak Creates Local Event with Location ---
    Open Web Browser
    Login in with Sanchalak credentials
    Navigate To Local Events In CMS
    Click Add Events Button
    Select English Language Tab
    Select Location Radio Button for Event
    Enter English Events Title    ${E2E_EVENTS_TITLE_EN}
    Enter English Events Description    ${E2E_EVENTS_DESCRIPTION_EN}
    Enter English Events Content    ${E2E_EVENTS_CONTENT_EN}
    Select Event from Date
    Select Event to Date
    Enter Events Venue
    Select Event Publish from Date
    Select Event Publish to Date
    Select Event Publish Status
    Select Event Category
    # Store location values for use in mobile filter
    ${country}=    Set Variable    India
    ${state}=    Set Variable    Gujarat
    ${district}=    Set Variable    Ahmedabad
    Set Test Variable    ${country}
    Set Test Variable    ${state}
    Set Test Variable    ${district}
    Select Event Country in CMS    ${country}
    Select Event State in CMS    ${state}
    Select Event District in CMS    ${district}
    Select Event Taluka in CMS    Ahmedabad City
    Select Event Village in CMS    CG Road
    Upload Event English Thumbnail Image
    Upload Event English Image
    Click Submit Button
    Verify Events Created Successfully
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify Events In List    ${E2E_EVENTS_TITLE_EN}
    Verify Events Publish Status    ${E2E_EVENTS_TITLE_EN}    Pending
    Log To Console    🎉 Local Event Created with Location: ${country}/${state}/${district}
    Close Web Browser

    # --- Web CMS: Admin Approves Local Event ---
    Open Web Browser
    Login in with valid credentials
    Navigate To Local Events In CMS
    Verify Events In List    ${E2E_EVENTS_TITLE_EN}
    Verify the Review Status as Pending for Local Events
    Click on the Edit Button from Local Events
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Approve Button from Edit Request
    Verify the Edit Event Request Approved Success Message
    Click on the Events Menu
    Navigate To Local Events In CMS
    Verify the Review Status as Approved for Local Events
    Log To Console    🎉 Local Event Approved Successfully
    Close Web Browser

    # --- Mobile App: Test Location Filter ---
    Open Gurutattva App With Retry
    Handle First Time Setup With Retry
    Click on the Events Tab With Retry

    # Click on Local Events Tab
    Click on Local Events Tab

    # Click on Filter Icon
    Click on the Event Filter Icon

    # Select Location Filters (using captured CMS values)
    Log To Console    🔍 Applying location filter: ${country}/${state}/${district}
    Select Event Country in Filter    ${country}
    Select Event State in Filter    ${state}
    Select Event District in Filter    ${district}

    # Apply Filter
    Click Apply Event Filter Button

    # Verify Filter Results
    Verify Local Event Filter Results

    Close Gurutattva App
    Log To Console    🎉 E2E Local Event Filter Test Completed Successfully!

Sanchalak adds local Event, once Acharya/Super Admin Approves it then only that Event is reflected in Mobile app uncer Local Event section.
    [Tags]    TC76   E2EEvents    LocalEvent    E2E    milestone2
    [Documentation]    E2E test: Sanchalak creates Local Event with specific Dhyankendra location, Admin approves it, verify in Mobile with location details

    # Generate test data
    Generate E2E Events Test Data For English

    # --- Web CMS: Sanchalak Creates Local Event ---
    Open Web Browser
    Login in with Sanchalak credentials
    Navigate To Local Events In CMS
    Click Add Events Button
    Select English Language Tab
    Enter English Events Title    ${E2E_EVENTS_TITLE_EN}
    Enter English Events Description    ${E2E_EVENTS_DESCRIPTION_EN}
    Enter English Events Content    ${E2E_EVENTS_CONTENT_EN}
    Select Event from Date
    Select Event to Date
    Enter Events Venue
    Select Event Publish from Date
    Select Event Publish to Date
    Select Event Publish Status
    Select Event Category
    # Select any Dhyankendra from dropdown (first option) and capture its name
    ${dhyankendra_name}=    Select Event Dhyankendra
    Set Test Variable    ${dhyankendra_name}
    Upload Event English Thumbnail Image
    Upload Event English Image
    Click Submit Button
    Verify Events Created Successfully
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify Events In List    ${E2E_EVENTS_TITLE_EN}
    Verify Events Publish Status    ${E2E_EVENTS_TITLE_EN}    Pending
    Log To Console    🎉 Local Event Created with Dhyankendra: ${dhyankendra_name}
    Close Web Browser

    # --- Web CMS: Admin Approves Local Event ---
    Open Web Browser
    Login in with valid credentials
    Navigate To Local Events In CMS
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify Events In List    ${E2E_EVENTS_TITLE_EN}
    Verify the Review Status as Pending for Local Events
    Click on the Edit Button from Local Events
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Approve Button from Edit Request
    Verify the Edit Event Request Approved Success Message
    Click on the Events Menu
    Navigate To Local Events In CMS
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify the Review Status as Approved for Local Events
    Log To Console    🎉 Local Event Approved Successfully

    # --- Web CMS: Get Dhyankendra Location Details ---
    Navigate To Dhyankendra Management
    Search Dhyankendra By Name    ${dhyankendra_name}
    ${country}    ${state}    ${district}=    Get Dhyankendra Location Details From Table    ${dhyankendra_name}
    Set Test Variable    ${country}
    Set Test Variable    ${state}
    Set Test Variable    ${district}
    Log To Console    🎉 Dhyankendra Location Details Retrieved
    Close Web Browser

    # --- Mobile App: Verify Approved Event in Local Events ---
    Open Gurutattva App
    Handle First Time Setup
    Click on the Events Tab
    # Click on Local Events Tab
    Click on Local Events Tab
    Sleep    5s

    # Apply location filter with dhyankendra location details
    Log To Console    🔍 Applying location filter: ${country}/${state}/${district}
    Click on the Event Filter Icon
    Select Event Country in Filter    ${country}
    Select Event State in Filter    ${state}
    Select Event District in Filter    ${district}
    Click Apply Event Filter Button

    # Verify the event is visible after filter
    Log To Console    🔍 Verifying event: ${E2E_EVENTS_TITLE_EN}
    # Verify event card exists
    Mobile.Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'${E2E_EVENTS_TITLE_EN}')]    10s
    Log To Console    ✅ Event found in Local Events section: ${E2E_EVENTS_TITLE_EN}
    Close Gurutattva App
    Log To Console    🎉 TC76 Completed Successfully!

Sanchalak adds local event and Acharya/Super Admin Rejects that event.
    [Tags]    TC77   E2EEvents    LocalEvent    E2E    milestone2
    Generate E2E Events Test Data For English
    Open Web Browser
    Login in with Sanchalak credentials
    Navigate To Local Events In CMS
    Click Add Events Button
    Select English Language Tab
    Enter English Events Title    ${E2E_EVENTS_TITLE_EN}
    Enter English Events Description    ${E2E_EVENTS_DESCRIPTION_EN}
    Enter English Events Content    ${E2E_EVENTS_CONTENT_EN}
    Select Event from Date
    Select Event to Date
    Enter Events Venue
    Select Event Publish from Date
    Select Event Publish to Date
    Select Event Publish Status
    Select Event Category
    Select Event Dhyankendra
    Upload Event English Thumbnail Image  
    Upload Event English Image
    Click Submit Button
    Verify Events Created Successfully
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify Events In List    ${E2E_EVENTS_TITLE_EN}
    Verify Events Publish Status    ${E2E_EVENTS_TITLE_EN}    Pending
    Close Web Browser
    Open Web Browser
    Login in with valid credentials
    Navigate To Local Events In CMS
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify Events In List    ${E2E_EVENTS_TITLE_EN}
    Verify the Review Status as Pending for Local Events
    Click on the Edit Button from Local Events
    Click on the Change Request Button for Web
    Enter Remark for Edit Request
    Click on the Reject Button from Edit Request
    # Verify the Edit Event Request Approved Success Message
    Click on the Events Menu
    Navigate To Local Events In CMS
    Search Events By Title    ${E2E_EVENTS_TITLE_EN}
    Verify the Review Status as Rejected for Local Events
    Close Web Browser
    Open Gurutattva App
    Handle First Time Setup
    Click on the Events Tab
    Validate the rejected event should not display in the mobile app
    Close Gurutattva App


