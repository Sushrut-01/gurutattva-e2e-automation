*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    ../pages/NewsPage.robot
Resource    ../pages/HomePage.robot
Resource    ../pages/E2ENewsPage.robot
Resource    ../pages/E2EHindiPage.robot
Resource    ../pages/loginPage.robot
Resource    ../pages/CRM_AudioPage.robot
Resource    ../resources/web_keywords.robot
Resource    ../pages/E2EAudioPage.robot

Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***
Verify the image upload validation in CMS
    [Tags]    TC03    E2ENews    Gurutattva    E2E    Validation
    # Open Gurutattva App
    # Handle First Time Setup

    # Generate unique test data for this test run
    Generate E2E News Test Data For English

    # --- Web CMS: Test Image Upload Validation ---
    Open Web Browser
    Login in with valid credentials

    # Navigate to Global News section
    Navigate To Global News In CMS

    # Click Add News button
    Click Add News Button

    # Select English language tab
    Select English Language Tab From News

    # Enter English news details
    Enter English News Title    ${E2E_NEWS_TITLE_EN}
    Enter English News Description    ${E2E_NEWS_DESCRIPTION_EN}
    Enter English News Content    ${E2E_NEWS_CONTENT_EN}

    # Set publishing details
    Select Publish Status
    Set Publish Date To Today
    Select Category

    # Try to upload invalid image (small size)
    Upload News Large Thumbnail Image    
    Upload News Large Main Image    

    # Verify image upload validation error
    Verify Image Upload Validation Error

    Log To Console    🎉 Image Upload Validation Test Completed Successfully!
    Log To Console    🎉 Test Data Used:
    Log To Console    🎉 Title: ${E2E_NEWS_TITLE_EN}
    Log To Console    🎉 Description: ${E2E_NEWS_DESCRIPTION_EN}
    Log To Console    🎉 Content: ${E2E_NEWS_CONTENT_EN}
    Log To Console    🎉 Invalid Image: large_image.jpg

    Close Web Browser
    # Close Gurutattva App
Verify that the user is able to add a English news, publish it in the CMS, and verify the english news details on the mobile app
    [Tags]    TC01    E2ENews    Gurutattva    E2E    English
    Generate E2E News Test Data For English
    Open Web Browser
    Login in with valid credentials
    Navigate To Global News In CMS
    Click Add News Button
    Select English Language Tab From News
    Enter English News Title    ${E2E_NEWS_TITLE_EN}
    Enter English News Description    ${E2E_NEWS_DESCRIPTION_EN}
    Enter English News Content    ${E2E_NEWS_CONTENT_EN}
    Select Publish Status
    Set Publish Date To Today
    Select Category
    Web Choose File    ${ENGLISH_THUMBNAIL_UPLOAD}    ${ENGLISH_THUMBNAIL_FILE}
    Web Choose File    ${ENGLISH_IMAGE_UPLOAD}    ${ENGLISH_IMAGE_FILE}
    Click Submit Button From News
    Verify News Created Successfully
    Search News By Title    ${E2E_NEWS_TITLE_EN}
    Verify News In List    ${E2E_NEWS_TITLE_EN}
    Verify News Publish Status    ${E2E_NEWS_TITLE_EN}    Publish
    Close Web Browser
    Open Gurutattva App
    Handle First Time Setup
    Click on the News Tab
    Verify Mobile News Details 
    Close Gurutattva App

Verify that the user is able to add a Hindi news, publish it in the CMS, and verify the hindi news details on the mobile app
    [Tags]    TC02    E2ENews    Gurutattva    E2E    Hindi
    Generate E2E News Test Data For Hindi
    Open Web Browser
    Login in with valid credentials
    Navigate To Global News In CMS
    Click Add News Button
    Select Hindi Language Tab From News
    Enter Hindi News Title    ${E2E_NEWS_TITLE_HI}
    Enter Hindi News Description    ${E2E_NEWS_DESCRIPTION_HI}
    Enter Hindi News Content    ${E2E_NEWS_CONTENT_HI}
    Select Publish Status
    Set Publish Date To Today
    Select Category
    Upload Thumbnail Image    ${EXECDIR}/test_data/Hindi_thumbnail.jpg
    Upload Main Image    ${EXECDIR}/test_data/Hindi_thumbnail.jpg
    Click Submit Button From News
    Verify News Created Successfully
    Search News By Title    ${E2E_NEWS_TITLE_HI}
    Verify News In List    ${E2E_NEWS_TITLE_HI}
    Verify News Publish Status    ${E2E_NEWS_TITLE_HI}    Publish
    Close Web Browser
    Open Gurutattva App

    # Handle first time setup with error handling (app may restart)
    TRY
        Handle First Time Setup
    EXCEPT
        Log To Console    ⚠️ First time setup caused app restart - waiting for app to stabilize
        Sleep    5s
    END

    # Verify app is responsive before proceeding
    ${home_visible}=    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    xpath=//android.widget.ImageView[@content-desc="Home"]    10s
    IF    ${home_visible}
        Log To Console    ✅ App is ready for testing
    ELSE
        Log To Console    ⚠️ Home element not immediately visible, proceeding anyway...
        Sleep    5s
    END

    # Step 1: Change language to Hindi to view Hindi news
    Log To Console    📱 Step 1: Changing language to Hindi to view Hindi news
    Change Language To Hindi
    Wait For Language Change    5s

    # Step 2: Navigate to News and verify Hindi news details
    Log To Console    📱 Step 2: Verifying Hindi news in mobile app
    Verify Mobile Hindi News Details

    # Step 3: Revert language back to English for other tests
    Log To Console    📱 Step 3: Reverting language back to English
    Run Keyword And Ignore Error    Revert Language To English
    Run Keyword And Ignore Error    Wait For Language Change    5s

    Close Gurutattva App

Test Unpublish News from CMS and Verify in Mobile App
    [Tags]    TC04    E2ENews    Unpublish    E2E    milestone2
    [Documentation]    Unpublish News from CMS app and check reflection in Mobile app
    
    # Generate unique test data for this test run
    Generate E2E News Test Data For English
    
    # --- Web CMS: Add News ---
    Open Web Browser
    Login in with valid credentials
    Navigate To Global News In CMS
    Click Add News Button
    Select English Language Tab From News
    Enter English News Title    ${E2E_NEWS_TITLE_EN}
    Enter English News Description    ${E2E_NEWS_DESCRIPTION_EN}
    Enter English News Content    ${E2E_NEWS_CONTENT_EN}
    Select Publish Status
    Set Publish Date To Today
    Select Category
    Web Choose File    ${ENGLISH_THUMBNAIL_UPLOAD}    ${ENGLISH_THUMBNAIL_FILE}
    Web Choose File    ${ENGLISH_IMAGE_UPLOAD}    ${ENGLISH_IMAGE_FILE}
    Click Submit Button From News
    Verify News Created Successfully
    Search News By Title    ${E2E_NEWS_TITLE_EN}
    Verify News In List    ${E2E_NEWS_TITLE_EN}
    Verify News Publish Status    ${E2E_NEWS_TITLE_EN}    Publish
    Log To Console    🎉 News Created Successfully: ${E2E_NEWS_TITLE_EN}
    
    # --- Web CMS: Unpublish the News ---
    Click On News Actions Menu
    Click On Edit News Option
    Change News Publish Status To Unpublish
    Click Submit Button From News
    Verify News Unpublished Successfully
    Log To Console    🎉 News Unpublished Successfully: ${E2E_NEWS_TITLE_EN}
    Close Web Browser

    # --- Mobile App: Verify News is NOT visible ---
    Open Gurutattva App With Retry
    Handle First Time Setup With Retry
    Wait For App To Be Ready
    Click on the News Tab With Retry
    Verify News Is Not Visible In Mobile App    ${E2E_NEWS_TITLE_EN}
    Close Gurutattva App
    Log To Console    🎉 E2E News Unpublish Test Completed Successfully!

Test News Category Tab In Mobile App
    [Tags]    TC05    E2ENews    E2E    milestone2
    [Documentation]    In Mobile app, check for Category tab, it should list all the News (Local+ global) of that category
    
    # --- Mobile App: Open and Navigate to News Categories ---
    Open Gurutattva App With Retry
    Handle First Time Setup With Retry
    Wait For App To Be Ready
    
    # Step 1: Click on News tab
    Click on the News Tab With Retry
    Log To Console    ✅ Step 1: Clicked on News tab
    
    # Step 2: Click on the Category icon
    Click on the Category Icon
    Log To Console    ✅ Step 2: Clicked on Category icon
    
    # Step 3: Fetch all the Categories name
    ${category_list}=    Fetch All Category Names
    Log To Console    ✅ Step 3: Fetched all category names: ${category_list}

    # Step 4: Click on a specific category (NOTE: Always take a category which appear in the bottom of the list)
    ${last_category}=    Get From List    ${category_list}    -1
    Log To Console    📋 Using last category from list: ${last_category}
    Click on Specific Category    ${last_category}
    Log To Console    ✅ Step 4: Clicked on ${last_category} category

    # Step 5: Validate all news items in that category (Local + Global)
    Verify All News In Category    ${last_category}
    Log To Console    ✅ Step 5: Validated all news items in ${last_category} category
    
    Close Gurutattva App
    Log To Console    🎉 News Category Tab Test Completed Successfully!

Test Check Local News Filter Functionality
    [Tags]    e2e    TC46    E2ENews    Mobile    Filter    milestone2
    [Documentation]    Check Local News Filter functionality with all dropdown in Mobile
    
    # --- Mobile App: Open app and navigate to News ---
    Open Gurutattva App With Retry
    Handle First Time Setup With Retry
    Click on the News Tab With Retry
    Switch to Local News Tab
    Log To Console    ✅ Step 1: Clicked on News Tab
    
    # --- Mobile App: Click on Filter Icon ---
    Click on the Filter Icon
    Log To Console    ✅ Step 2: Clicked on Filter Icon
    
    # --- Mobile App: Select Country (India) ---
    Select Country in Filter    India
    Log To Console    ✅ Step 3: Selected India in Country dropdown
    
    # --- Mobile App: Select State (Gujarat) ---
    Select State in Filter    Gujarat
    Log To Console    ✅ Step 4: Selected Gujarat in State dropdown
    
    # --- Mobile App: Select District (Ahmedabad) ---
    Select District in Filter    Ahmadabad
    Log To Console    ✅ Step 5: Selected Ahmedabad in District dropdown
    
    # --- Mobile App: Apply Filter ---
    Click Apply Filter Button
    Log To Console    ✅ Step 6: Applied filter with all selections
    
    # --- Mobile App: Verify Local News Filter Results ---
    Verify Local News Filter Results
    Log To Console    ✅ Step 7: Verified Local News filter results
    
    Close Gurutattva App
    Log To Console    🎉 Local News Filter Test Completed Successfully!

Test Sanchalak Adds Local News And Super Admin Approves It
    [Tags]    TC47    E2ENews    Sanchalak    Approval    E2E    milestone2
    [Documentation]    Sanchalak adds local news, once Acharya/Super Admin Approves it then only that news is reflected in Mobile app under local news section
    
    # Generate unique test data for this test run
    Generate E2E News Test Data For English
    
    # --- Step 1: Login as Sanchalak & add a new local news ---
    Log To Console    🎯 Step 1: Login as Sanchalak & add a new local news
    Open Web Browser
    # Login in with valid credentials
    Login in with Sanchalak credentials
    
    # Navigate to Local News section
    Navigate To Local News In CMS
    
    # Click Add News button
    Click Add News Button
    Select English Language Tab From News
    
    # Enter English news details
    Enter English News Title    ${E2E_NEWS_TITLE_EN}
    Enter English News Description    ${E2E_NEWS_DESCRIPTION_EN}
    Enter English News Content    ${E2E_NEWS_CONTENT_EN}
    
    # Set publishing details
    Select Publish Status
    Set Publish Date To Today
    Select Category
    Select News Dhyankendra

    # Upload images
    Web Choose File    ${ENGLISH_THUMBNAIL_UPLOAD}    ${ENGLISH_THUMBNAIL_FILE}
    Web Choose File    ${ENGLISH_IMAGE_UPLOAD}    ${ENGLISH_IMAGE_FILE}
    
    # Submit the news
    Click Submit Button From News
    Verify News Created Successfully
    
    # Search and verify the news was created
    Search News By Title In Local News    ${E2E_NEWS_TITLE_EN}
    Verify News In List    ${E2E_NEWS_TITLE_EN}
    # Verify News Publish Status    ${E2E_NEWS_TITLE_EN}    Publish
    
    Log To Console    ✅ Step 1 Completed: Sanchalak created local news: ${E2E_NEWS_TITLE_EN}
    Logout from the CMS
    # --- Step 2: Login as Super Admin/Acharya & approve that news ---
    Log To Console    🎯 Step 2: Login as Super Admin/Acharya & approve that news
    
    Login in with valid credentials

    Search News By Title In Local News    ${E2E_NEWS_TITLE_EN}
    # Click on the news actions menu
    Click On News Actions Menu In Local News
    
    # Click on Edit option
    Click On Edit News Option In Local News
    
    # Click on Change Request button
    Click On Change Request Button
    
    # Enter remark for approval
    Enter Remark For Approval    good news
    
    # Click on Approve button
    Click On Approve Button
    
    # Verify news was approved successfully
    Verify News Approved Successfully
    
    Log To Console    ✅ Step 2 Completed: Super Admin approved local news: ${E2E_NEWS_TITLE_EN}
    
    # Close web browser
    Close Web Browser
    
    # --- Step 3: Validate the approved news in the mobile app under local news section ---
    Log To Console    🎯 Step 3: Validate the approved news in the mobile app under local news section
    
    # Open mobile app
    Open Gurutattva App With Retry
    
    # Click on News tab
    Click on the News Tab With Retry
    Switch to Local News Tab

    # Apply filter to narrow down local news by location
    Click on the Filter Icon
    Sleep    1s
    Select Country in Filter    India
    Sleep    1s
    Select State in Filter    Gujarat
    Sleep    1s
    Select District in Filter    Ahmadabad
    Sleep    1s
    Click Apply Filter Button
    Sleep    2s
    Log To Console    ✅ Applied filter: India > Gujarat > Ahmadabad

    # Verify approved news in mobile app with scrolling
    Verify Approved News In Mobile App With Scrolling    ${E2E_NEWS_TITLE_EN}
    
    # Close mobile app
    Close Gurutattva App
    
    Log To Console    ✅ Step 3 Completed: Validated approved news in mobile app: ${E2E_NEWS_TITLE_EN}
    Log To Console    🎉 Sanchalak Local News Approval Test Completed Successfully!

Test Sanchalak Adds Local News And Super Admin Rejects It
    [Tags]    TC48    E2ENews    Sanchalak    Rejection    E2E    milestone2
    [Documentation]    Sanchalak adds local news, once Acharya/Super Admin Rejects it then that news should not be reflected in Mobile app under local news section
    
    # Generate unique test data for this test run
    Generate E2E News Test Data For English
    
    # --- Step 1: Login as Sanchalak & add a new local news ---
    Log To Console    🎯 Step 1: Login as Sanchalak & add a new local news
    Open Web Browser
    # Login in with valid credentials
    Login in with Sanchalak credentials
    
    # Navigate to Local News section
    Navigate To Local News In CMS
    
    # Click Add News button
    Click Add News Button
    Select English Language Tab From News
     
    # Enter English news details
    Enter English News Title    ${E2E_NEWS_TITLE_EN}
    Enter English News Description    ${E2E_NEWS_DESCRIPTION_EN}
    Enter English News Content    ${E2E_NEWS_CONTENT_EN}
    
    # Set publishing details
    Select Publish Status
    Set Publish Date To Today
    Select Category
    Select News Dhyankendra

    # Upload images
    Web Choose File    ${ENGLISH_THUMBNAIL_UPLOAD}    ${ENGLISH_THUMBNAIL_FILE}
    Web Choose File    ${ENGLISH_IMAGE_UPLOAD}    ${ENGLISH_IMAGE_FILE}
    
    # Submit the news
    Click Submit Button From News
    Verify News Created Successfully
    
    # Search and verify the news was created
    Search News By Title In Local News    ${E2E_NEWS_TITLE_EN}
    Verify News In List    ${E2E_NEWS_TITLE_EN}
    # Verify News Publish Status    ${E2E_NEWS_TITLE_EN}    Publish
    
    Log To Console    ✅ Step 1 Completed: Sanchalak created local news: ${E2E_NEWS_TITLE_EN}
    Logout from the CMS
    
    # --- Step 2: Login as Super Admin/Acharya & reject that news ---
    Log To Console    🎯 Step 2: Login as Super Admin/Acharya & reject that news
    
    Login in with valid credentials

    Search News By Title In Local News    ${E2E_NEWS_TITLE_EN}
    # Click on the news actions menu
    Click On News Actions Menu In Local News
    Click On Edit News Option In Local News
    Click On Change Request Button
    
    # Enter remark for rejection
    Enter Remark For Approval    news needs improvement
    Click On Reject Button
    
    # Verify news was rejected successfully
    Verify News Rejected Successfully
    
    Log To Console    ✅ Step 2 Completed: Super Admin rejected local news: ${E2E_NEWS_TITLE_EN}
    
    # Close web browser
    Close Web Browser
    
    # --- Step 3: Validate that rejected news is NOT visible in the mobile app under local news section ---
    Log To Console    🎯 Step 3: Validate that rejected news is NOT visible in the mobile app under local news section
    
    # Open mobile app
    Open Gurutattva App With Retry
    Handle First Time Setup With Retry
    Wait For App To Be Ready
    
    # Click on News tab
    Click on the News Tab With Retry
    Switch to Local News Tab
    
    # Verify rejected news is NOT visible in mobile app with scrolling
    Verify Rejected News Is Not Visible In Mobile App With Scrolling    ${E2E_NEWS_TITLE_EN}
    
    # Close mobile app
    Close Gurutattva App
    
    Log To Console    ✅ Step 3 Completed: Validated rejected news is NOT visible in mobile app: ${E2E_NEWS_TITLE_EN}
    Log To Console    🎉 Sanchalak Local News Rejection Test Completed Successfully!

Add News Category from CMS. Add News uder that category. check list of all categories in the Mobile app under Category tab.
    [Tags]    e2e    TC78    E2ENews    Gurutattva    milestone2
    Generate News Category for Test Data
    Open Web Browser
    Login in with valid credentials
    Add news category from the CMS
    Add news within that created news category
    Generate E2E News Test Data For English
    Navigate To Global News In CMS
    Click Add News Button
    Select English Language Tab From News
    Enter English News Title    ${E2E_NEWS_TITLE_EN}
    Enter English News Description    ${E2E_NEWS_DESCRIPTION_EN}
    Enter English News Content    ${E2E_NEWS_CONTENT_EN}
    Select Publish Status
    Set Publish Date To Today
    Select Newly added News Category
    Upload Thumbnail Image    ${EXECDIR}/test_data/English_thumbnail.jpg
    Upload Main Image    ${EXECDIR}/test_data/English_thumbnail.jpg   
    Click Submit Button From News
    Verify News Created Successfully
    Close Web Browser
    Open Gurutattva App
    Handle First Time Setup
    Click on the News Tab
    Click on the Mobile News Category Tab
    Verify Mobile News Category Details
    Verify Global E2ENews Card Structure
    Click on the Global E2ENews Card
    verify Global E2ENews Detail screen
    Log To Console    Verified Mobile News Details for: ${E2E_NEWS_TITLE_EN}
    Close Gurutattva App