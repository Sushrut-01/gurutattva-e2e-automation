*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot
Resource    ../resources/web_keywords.robot
Resource    ../resources/test_setup_teardown.robot
Resource    ../pages/E2EPrayerPage.robot
Resource    ../pages/E2EAudioPage.robot

Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***
End-to-End Integration: Verify that user is able to add Prayer with Self Option on the mobile app and verify it in CMS
    [Documentation]    End-to-end test: Verify that user is able to add Prayer with Self Option on the mobile app and verify it in CMS
    [Tags]    E2E    Integration    SelfPrayer   TC15
    
    # --- Generate Unique Test Data ---
    Generate E2E Test Data for Prayer
    
    # --- Mobile App: Add Prayer with Self Option ---
    Open Gurutattva App
	Handle First Time Setup
    Sleep    3s
    Launch Mobile App And Login
	Click on the Explore Tab
    Click on the Prayer Card
    Click on Add Prayer Button
    Close the tooltip info from prayer screen
    Enter Place/Area for Prayer
    Select Prayer Category
    Enter Generated Second Name for Prayer
    Enter Second Place/Area for Prayer
    Enter Generated Address for Prayer
    Select DOB for Prayer
    Enter Generated Description for Prayer
    Click on Submit Prayer Button
    Verify Prayer Submission Success
    Close the success message
    Verify Prayer add screen
    Close Gurutattva App
	 
	# --- Web CRM: Verify Self Prayer in CMS ---
	Open Web Browser
    Login in with valid credentials
	Click on the Prayer Menu
	Search for the created prayer
	Verify the Newly added Self Prayer is displayed in the CMS
    Close Web Browser

End-to-End Integration:Verify that user is able to add Prayer with Other Option on the mobile app and verify it in CMS
    [Documentation]    End-to-end test: Verify that user is able to add Prayer with Other Option on the mobile app and verify it in CMS
    [Tags]    E2E    Integration    OtherPrayer    TC16
    
    # --- Generate Unique Test Data ---
    Generate E2E Test Data for selected other prayer
    
    # --- Mobile App: Add Prayer with Other Option ---
    Open Gurutattva App
	Handle First Time Setup
    Sleep    3s
    Launch Mobile App And Login
	Click on the Explore Tab
    Click on the Prayer Card
    Click on Add Prayer Button
    Close the tooltip info from prayer screen
    Click on Other Prayer Option
    Enter Generated Name for Prayer
    Enter Place/Area for Prayer
    Enter Email for Prayer
    Select Prayer Category        
    Enter Second Name for Other Prayer
    Enter Second Place/Area for Prayer
    Enter Full Address for Other Prayer
    Select DOB for Prayer
    Enter Generated Description for Prayer
    Click on Submit Prayer Button
    Verify Prayer Submission Success
    Close the success message
    Verify Prayer add screen
    Close Gurutattva App

    # --- Web CRM: Verify Other Prayer in CMS ---
    Open Web Browser
    Login in with valid credentials
	Click on the Prayer Menu
	Search for the created other prayer
	Verify the Newly added Other Prayer is displayed in the CMS
    Close Web Browser

Verify that user is able to export the Prayer in CMS
    [Documentation]    End-to-end test: Verify that user is able to export the Prayer in CMS
    [Tags]    E2E    Integration    ExportPrayer    TC17
    
     # --- Generate Unique Test Data ---
    Generate E2E Test Data for Prayer
    
    # --- Mobile App: Add Prayer with Self Option ---
    Open Gurutattva App
    Handle First Time Setup
    Launch Mobile App And Login
    Click on the Explore Tab
    Click on the Prayer Card
    Click on Add Prayer Button
    Close the tooltip info from prayer screen
    Enter Place/Area for Prayer
    Select Prayer Category
    Enter Generated Second Name for Prayer
    Enter Second Place/Area for Prayer
    Enter Generated Address for Prayer
    Select DOB for Prayer
    Enter Generated Description for Prayer
    Click on Submit Prayer Button
    Verify Prayer Submission Success
    Close the success message
    Verify Prayer add screen
    Close Gurutattva App

    # --- Web CRM: Export Prayer in CMS ---
	Open Web Browser
    Login in with valid credentials
	Click on the Prayer Menu
	Search for the created prayer
    Select the created prayer
    Export Prayer And Validate Download