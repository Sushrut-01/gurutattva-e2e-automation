*** Settings ***
Resource            ../resources/libraries.robot
Resource            ../resources/keywords.robot
Resource            ../resources/web_keywords.robot
Resource            ../resources/test_setup_teardown.robot
Resource            ../pages/E2EAudioPage.robot
Resource            ../pages/CRM_AudioPage.robot

Test Setup          Cleanup Test Setup
Test Teardown       Cleanup Test Teardown


*** Variables ***
${DELETE_OPTION}    xpath=//li[contains(text(),'Delete')]
${DELETE_BUTTON}    xpath=//button[contains(text(),'Delete') and @type='button']
${DELETE_CONFIRMATION_TITLE}    xpath=//h2[contains(text(),'Delete Confirmation')]
${DATA_GRID_ROWS}   xpath=//div[@role='row' and contains(@class,'MuiDataGrid-row') and @aria-rowindex and number(@aria-rowindex) > 1]

*** Test Cases ***
Clean Up All E2E Test Data
    [Documentation]    Comprehensive cleanup of all E2E test data in proper order
    [Tags]    cleanup    e2e    data_cleanup

    # --- Open Web Browser and Login ---
    Open Web Browser
    Login in with valid credentials
    
    # --- Step 1: Delete All E2E Audio Tracks ---
    Log To Console    🧹 Step 1: Cleaning up E2E Audio Tracks...
    Clean Up E2E Audio Tracks
    
    # --- Step 2: Delete All E2E Podcast Tracks ---
    Log To Console    🧹 Step 2: Cleaning up E2E Podcast Tracks...
    Clean Up E2E Podcast Tracks
    
    # --- Step 3: Delete All E2E Contributors (Authors & Speakers) ---
    Log To Console    🧹 Step 3: Cleaning up E2E Contributors...
    Clean Up E2E Contributors
    
    # --- Step 4: Delete All E2E SubCategories ---
    Log To Console    🧹 Step 4: Cleaning up E2E SubCategories...
    Clean Up E2E SubCategories
    
    # --- Step 5: Delete All E2E Categories ---
    Log To Console    🧹 Step 5: Cleaning up E2E Categories...
    Clean Up E2E Categories
    
    Log To Console    ✅ All E2E test data cleanup completed successfully!
    Close Web Browser

*** Keywords ***
Click on the Manage Audio Contributors Submenu
    [Documentation]    Clicks on the Manage Audio Contributors submenu under Master Management
    Web Wait Until Page Contains Element    xpath=//span[contains(text(),'Manage Audio Contributors')]    10s
    Web Click Element    xpath=//span[contains(text(),'Manage Audio Contributors')]
    Sleep    2s

Click on the Manage Audio SubCategories Submenu
    [Documentation]    Clicks on the Manage Audio SubCategories submenu under Master Management
    Web Wait Until Page Contains Element    xpath=//span[contains(text(),'Manage Audio SubCategories')]    10s
    Web Click Element    xpath=//span[contains(text(),'Manage Audio SubCategories')]
    Sleep    2s

Clean Up E2E Audio Tracks
    [Documentation]    Deletes all E2E audio tracks from Music management page
    Click on the Audio Menu
    Click on the Music Submenu
    
    # Search for E2E tracks with retry
    Wait Until Keyword Succeeds    3x    2s    Enter Search Text For Cleanup    E2E
    Sleep    3s
    
    # Delete all E2E tracks found
    ${track_count}=    Get E2E Track Count
    Log To Console    📊 Found ${track_count} E2E audio tracks to delete
    
    WHILE    ${track_count} > 0
        Wait Until Keyword Succeeds    2x    3s    Delete First E2E Audio Track
        Sleep    2s
        ${track_count}=    Get E2E Track Count
        Log To Console    📊 Remaining E2E audio tracks: ${track_count}
    END
    
    Log To Console    ✅ E2E audio tracks cleanup completed

Clean Up E2E Podcast Tracks
    [Documentation]    Deletes all E2E podcast tracks from Podcast management page
    Click on the Audio Menu
    Click on the Podcast Submenu
    
    # Search for E2E tracks with retry
    Wait Until Keyword Succeeds    3x    2s    Enter Search Text For Cleanup    E2E
    Sleep    3s
    
    # Delete all E2E tracks found
    ${track_count}=    Get E2E Track Count
    Log To Console    📊 Found ${track_count} E2E podcast tracks to delete
    
    WHILE    ${track_count} > 0
        Wait Until Keyword Succeeds    2x    3s    Delete First E2E Podcast Track
        Sleep    2s
        ${track_count}=    Get E2E Track Count
        Log To Console    📊 Remaining E2E podcast tracks: ${track_count}
    END
    
    Log To Console    ✅ E2E podcast tracks cleanup completed

Clean Up E2E Contributors
    [Documentation]    Deletes all E2E contributors (authors and speakers)
    
    # Clean up Authors
    Click on the Master Management Menu
    Click on the Manage Audio Contributors Submenu
    Enter Search Text For Cleanup    E2E
    Sleep    3s
    
    ${author_count}=    Get E2E Contributor Count
    Log To Console    📊 Found ${author_count} E2E authors to delete
    
    WHILE    ${author_count} > 0
        Delete First E2E Contributor
        Sleep    2s
        ${author_count}=    Get E2E Contributor Count
        Log To Console    📊 Remaining E2E authors: ${author_count}
    END
    
    Log To Console    ✅ E2E contributors cleanup completed

Clean Up E2E SubCategories
    [Documentation]    Deletes all E2E subcategories
    Click on the Master Management Menu
    Click on the Manage Audio SubCategories Submenu
    Enter Search Text For Cleanup    E2E
    Sleep    3s
    
    ${subcategory_count}=    Get E2E SubCategory Count
    Log To Console    📊 Found ${subcategory_count} E2E subcategories to delete
    
    WHILE    ${subcategory_count} > 0
        Delete First E2E SubCategory
        Sleep    2s
        ${subcategory_count}=    Get E2E SubCategory Count
        Log To Console    📊 Remaining E2E subcategories: ${subcategory_count}
    END
    
    Log To Console    ✅ E2E subcategories cleanup completed

Clean Up E2E Categories
    [Documentation]    Deletes all E2E categories
    Click on the Master Management Menu
    Click on the Manage Audio Categories Submenu
    Enter Search Text For Cleanup    E2E
    Sleep    3s
    
    ${category_count}=    Get E2E Category Count
    Log To Console    📊 Found ${category_count} E2E categories to delete
    
    WHILE    ${category_count} > 0
        Delete First E2E Category
        Sleep    2s
        ${category_count}=    Get E2E Category Count
        Log To Console    📊 Remaining E2E categories: ${category_count}
    END
    
    Log To Console    ✅ E2E categories cleanup completed

Enter Search Text For Cleanup
    [Arguments]    ${search_text}
    [Documentation]    Enters search text in the search field for cleanup
    TRY
        Web.Wait Until Page Contains Element    xpath=//input[@type='search' and @placeholder='Search…']    10s
        Web.Click Element    xpath=//input[@type='search' and @placeholder='Search…']
        Sleep    2s
        Web.Input Text    xpath=//input[@type='search' and @placeholder='Search…']    ${search_text}
        Sleep    3s
        Log To Console    🔍 Searching for: ${search_text}
    EXCEPT    AS    ${error}
        Log To Console    ⚠️ Search failed, retrying: ${error}
        Sleep    2s
        # Retry with fresh element reference
        Web.Wait Until Page Contains Element    xpath=//input[@type='search' and @placeholder='Search…']    10s
        Web.Click Element    xpath=//input[@type='search' and @placeholder='Search…']
        Sleep    2s
        Web.Input Text    xpath=//input[@type='search' and @placeholder='Search…']    ${search_text}
        Sleep    3s
        Log To Console    🔍 Searching for: ${search_text} (retry successful)
    END

Get E2E Track Count
    [Documentation]    Returns count of E2E tracks found in the current page
    TRY
        ${row_count}=    SeleniumLibrary.Get Element Count    ${DATA_GRID_ROWS}
        ${e2e_count}=    Set Variable    0
        
        FOR    ${i}    IN RANGE    1    ${row_count + 1}
            ${title_text}=    Get Text From Track Row    ${i}
            IF    'E2E' in '${title_text}'
                ${e2e_count}=    Evaluate    ${e2e_count} + 1
            END
        END
        
        ${result}=    Set Variable    ${e2e_count}
    EXCEPT    AS    ${error}
        Log To Console    ⚠️ Error getting track count: ${error}
        ${result}=    Set Variable    0
    END
    [Return]    ${result}

Get E2E Contributor Count
    [Documentation]    Returns count of E2E contributors found in the current page
    TRY
        ${row_count}=    SeleniumLibrary.Get Element Count    ${DATA_GRID_ROWS}
        ${e2e_count}=    Set Variable    0
        
        FOR    ${i}    IN RANGE    1    ${row_count + 1}
            ${name_text}=    Get Text From Contributor Row    ${i}
            IF    'E2E' in '${name_text}'
                ${e2e_count}=    Evaluate    ${e2e_count} + 1
            END
        END
        
        ${result}=    Set Variable    ${e2e_count}
    EXCEPT    AS    ${error}
        Log To Console    ⚠️ Error getting contributor count: ${error}
        ${result}=    Set Variable    0
    END
    [Return]    ${result}

Get E2E SubCategory Count
    [Documentation]    Returns count of E2E subcategories found in the current page
    TRY
        ${row_count}=    SeleniumLibrary.Get Element Count    ${DATA_GRID_ROWS}
        ${e2e_count}=    Set Variable    0
        
        FOR    ${i}    IN RANGE    1    ${row_count + 1}
            ${name_text}=    Get Text From SubCategory Row    ${i}
            IF    'E2E' in '${name_text}'
                ${e2e_count}=    Evaluate    ${e2e_count} + 1
            END
        END
        
        ${result}=    Set Variable    ${e2e_count}
    EXCEPT    AS    ${error}
        Log To Console    ⚠️ Error getting subcategory count: ${error}
        ${result}=    Set Variable    0
    END
    [Return]    ${result}

Get E2E Category Count
    [Documentation]    Returns count of E2E categories found in the current page
    TRY
        ${row_count}=    SeleniumLibrary.Get Element Count    ${DATA_GRID_ROWS}
        ${e2e_count}=    Set Variable    0
        
        FOR    ${i}    IN RANGE    1    ${row_count + 1}
            ${name_text}=    Get Text From Category Row    ${i}
            IF    'E2E' in '${name_text}'
                ${e2e_count}=    Evaluate    ${e2e_count} + 1
            END
        END
        
        ${result}=    Set Variable    ${e2e_count}
    EXCEPT    AS    ${error}
        Log To Console    ⚠️ Error getting category count: ${error}
        ${result}=    Set Variable    0
    END
    [Return]    ${result}

Get Text From Track Row
    [Arguments]    ${row_index}
    [Documentation]    Gets text from track title cell in the specified row
    ${title_cell}=    Set Variable    (${DATA_GRID_ROWS})[${row_index}]//div[@data-field='title']
    ${title_text}=    Web.Get Text    ${title_cell}
    [Return]    ${title_text}

Get Text From Contributor Row
    [Arguments]    ${row_index}
    [Documentation]    Gets text from contributor name cell in the specified row
    ${name_cell}=    Set Variable    (${DATA_GRID_ROWS})[${row_index}]//div[@data-field='name']
    ${name_text}=    Web.Get Text    ${name_cell}
    [Return]    ${name_text}

Get Text From SubCategory Row
    [Arguments]    ${row_index}
    [Documentation]    Gets text from subcategory name cell in the specified row
    ${name_cell}=    Set Variable    (${DATA_GRID_ROWS})[${row_index}]//div[@data-field='name']
    ${name_text}=    Web.Get Text    ${name_cell}
    [Return]    ${name_text}

Get Text From Category Row
    [Arguments]    ${row_index}
    [Documentation]    Gets text from category name cell in the specified row
    ${name_cell}=    Set Variable    (${DATA_GRID_ROWS})[${row_index}]//div[@data-field='name']
    ${name_text}=    Web.Get Text    ${name_cell}
    [Return]    ${name_text}

Delete First E2E Audio Track
    [Documentation]    Deletes the first E2E audio track found
    TRY
        ${row_count}=    SeleniumLibrary.Get Element Count    ${DATA_GRID_ROWS}
        
        FOR    ${i}    IN RANGE    1    ${row_count + 1}
            ${title_text}=    Get Text From Track Row    ${i}
            IF    'E2E' in '${title_text}'
                Log To Console    🗑️ Deleting audio track: ${title_text}
                
                # Click on the three-dot menu for this row (using existing pattern)
                Web.Wait Until Page Contains Element    xpath=//button[@role="menuitem"]    10s
                Web.Click Element    xpath=//button[@role="menuitem"]
                Sleep    2s
                
                # Click on Delete option
                Web.Wait Until Page Contains Element    ${DELETE_OPTION}    5s
                Web.Click Element    ${DELETE_OPTION}
                Sleep    2s
                
                # Verify delete confirmation dialog appears
                Web.Wait Until Page Contains Element    ${DELETE_CONFIRMATION_TITLE}    5s
                
                # Click Delete button to confirm deletion
                Web.Wait Until Page Contains Element    ${DELETE_BUTTON}    5s
                Web.Click Element    ${DELETE_BUTTON}
                Sleep    3s
                
                Log To Console    ✅ Successfully deleted audio track: ${title_text}
                BREAK
            END
        END
    EXCEPT    AS    ${error}
        Log To Console    ⚠️ Error deleting audio track: ${error}
        # Refresh page and retry once
        Web.Reload Page
        Sleep    3s
        Log To Console    🔄 Page refreshed, retrying delete operation
    END

Delete First E2E Podcast Track
    [Documentation]    Deletes the first E2E podcast track found
    ${row_count}=    SeleniumLibrary.Get Element Count    ${DATA_GRID_ROWS}
    
    FOR    ${i}    IN RANGE    1    ${row_count + 1}
        ${title_text}=    Get Text From Track Row    ${i}
        IF    'E2E' in '${title_text}'
            Log To Console    🗑️ Deleting podcast track: ${title_text}
            
            # Click on the three-dot menu for this row (using existing pattern)
            Web.Wait Until Page Contains Element    xpath=//button[@role="menuitem"]    10s
            Web.Click Element    xpath=//button[@role="menuitem"]
            Sleep    2s
            
            # Click on Delete option
            Web.Wait Until Page Contains Element    ${DELETE_OPTION}    5s
            Web.Click Element    ${DELETE_OPTION}
            Sleep    2s
            
            # Verify delete confirmation dialog appears
            Web.Wait Until Page Contains Element    ${DELETE_CONFIRMATION_TITLE}    5s
            
            # Click Delete button to confirm deletion
            Web.Wait Until Page Contains Element    ${DELETE_BUTTON}    5s
            Web.Click Element    ${DELETE_BUTTON}
            Sleep    3s
            
            Log To Console    ✅ Successfully deleted podcast track: ${title_text}
            BREAK
        END
    END

Delete First E2E Contributor
    [Documentation]    Deletes the first E2E contributor found
    ${row_count}=    SeleniumLibrary.Get Element Count    ${DATA_GRID_ROWS}
    
    FOR    ${i}    IN RANGE    1    ${row_count + 1}
        ${name_text}=    Get Text From Contributor Row    ${i}
        IF    'E2E' in '${name_text}'
            Log To Console    🗑️ Deleting contributor: ${name_text}
            
            # Click on the three-dot menu for this row (using existing pattern)
            Web.Wait Until Page Contains Element    xpath=//button[@role="menuitem"]    10s
            Web.Click Element    xpath=//button[@role="menuitem"]
            Sleep    2s
            
            # Click on Delete option
            Web.Wait Until Page Contains Element    ${DELETE_OPTION}    5s
            Web.Click Element    ${DELETE_OPTION}
            Sleep    2s
            
            # Verify delete confirmation dialog appears
            Web.Wait Until Page Contains Element    ${DELETE_CONFIRMATION_TITLE}    5s
            
            # Click Delete button to confirm deletion
            Web.Wait Until Page Contains Element    ${DELETE_BUTTON}    5s
            Web.Click Element    ${DELETE_BUTTON}
            Sleep    3s
            
            Log To Console    ✅ Successfully deleted contributor: ${name_text}
            BREAK
        END
    END

Delete First E2E SubCategory
    [Documentation]    Deletes the first E2E subcategory found
    ${row_count}=    SeleniumLibrary.Get Element Count    ${DATA_GRID_ROWS}
    
    FOR    ${i}    IN RANGE    1    ${row_count + 1}
        ${name_text}=    Get Text From SubCategory Row    ${i}
        IF    'E2E' in '${name_text}'
            Log To Console    🗑️ Deleting subcategory: ${name_text}
            
            # Click on the three-dot menu for this row (using existing pattern)
            Web.Wait Until Page Contains Element    xpath=//button[@role="menuitem"]    10s
            Web.Click Element    xpath=//button[@role="menuitem"]
            Sleep    2s
            
            # Click on Delete option
            Web.Wait Until Page Contains Element    ${DELETE_OPTION}    5s
            Web.Click Element    ${DELETE_OPTION}
            Sleep    2s
            
            # Verify delete confirmation dialog appears
            Web.Wait Until Page Contains Element    ${DELETE_CONFIRMATION_TITLE}    5s
            
            # Click Delete button to confirm deletion
            Web.Wait Until Page Contains Element    ${DELETE_BUTTON}    5s
            Web.Click Element    ${DELETE_BUTTON}
            Sleep    3s
            
            Log To Console    ✅ Successfully deleted subcategory: ${name_text}
            BREAK
        END
    END

Delete First E2E Category
    [Documentation]    Deletes the first E2E category found
    ${row_count}=    SeleniumLibrary.Get Element Count    ${DATA_GRID_ROWS}
    
    FOR    ${i}    IN RANGE    1    ${row_count + 1}
        ${name_text}=    Get Text From Category Row    ${i}
        IF    'E2E' in '${name_text}'
            Log To Console    🗑️ Deleting category: ${name_text}
            
            # Click on the three-dot menu for this row (using existing pattern)
            Web.Wait Until Page Contains Element    xpath=//button[@role="menuitem"]    10s
            Web.Click Element    xpath=//button[@role="menuitem"]
            Sleep    2s
            
            # Click on Delete option
            Web.Wait Until Page Contains Element    ${DELETE_OPTION}    5s
            Web.Click Element    ${DELETE_OPTION}
            Sleep    2s
            
            # Verify delete confirmation dialog appears
            Web.Wait Until Page Contains Element    ${DELETE_CONFIRMATION_TITLE}    5s
            
            # Click Delete button to confirm deletion
            Web.Wait Until Page Contains Element    ${DELETE_BUTTON}    5s
            Web.Click Element    ${DELETE_BUTTON}
            Sleep    3s
            
            Log To Console    ✅ Successfully deleted category: ${name_text}
            BREAK
        END
    END

Cleanup Test Setup
    [Documentation]    Custom setup for cleanup tests - web only, no mobile app
    Log To Console    ===== Starting Cleanup Test Setup =====
    Web.Register Keyword To Run On Failure    No Operation
    Log To Console    ===== Cleanup Test Setup Completed =====

Cleanup Test Teardown
    [Documentation]    Custom teardown for cleanup tests - only close web browser
    Log To Console    ===== Starting Cleanup Test Teardown =====
    Run Keyword And Ignore Error    Web.Close All Browsers
    Log To Console    ===== Cleanup Test Teardown Completed =====

