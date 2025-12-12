*** Settings ***
Resource            ../resources/libraries.robot
Resource            ../resources/keywords.robot
Resource            ../resources/web_keywords.robot
Resource            ../resources/test_setup_teardown.robot

*** Variables ***
# Login Page Elements
${LOGIN_EMAIL_FIELD}               xpath=//input[@type='email' or @name='email']
${LOGIN_PASSWORD_FIELD}            xpath=//input[@type='password' or @name='password']
${LOGIN_BUTTON}                    xpath=//button[@type='submit' or contains(text(),'Login')]
${DASHBOARD_TEXT}                  Dashboard
${LOGIN_URL}                       https://gurutattvacmsnewdev.rysun.in:9090/           

# User Credentials Mapping - Updated 2025-12-09
${PRAYER_COORDINATOR_EMAIL}        surajsaini520@gmail.com
${PRAYER_COORDINATOR_PASSWORD}     Suraj@123

${GLOBAL_EVENT_COORDINATOR_EMAIL}  amit.jadhav@rysun.com
${GLOBAL_EVENT_COORDINATOR_PASSWORD}   Admin@123

${ACHARYA_EMAIL}                   payment.gateway@rysun.com
${ACHARYA_PASSWORD}                Admin@123

${MAHA_ACHARYA_EMAIL}              payment.gateway@rysun.com
${MAHA_ACHARYA_PASSWORD}           Admin@123

${NAMKARAN_COORDINATOR_EMAIL}      adesh.pawar@rysun.com
${NAMKARAN_COORDINATOR_PASSWORD}   Admin@123

# Menu Items by Role
${PRAYER_COORDINATOR_MENUS}        Prayer
${GLOBAL_EVENT_COORDINATOR_MENUS}  Events - Global,Events - Local,Dhyansthali Management - Dhyansthali
${ACHARYA_MENUS}                   Dhyansthali Management - Dhyansthali,Dhyankendra,News - Local,Events - Local,User Management
${MAHA_ACHARYA_MENUS}              Dhyansthali Management - Dhyansthali,Dhyankendra,News - Local,Events - Local,User Management
${NAMKARAN_COORDINATOR_MENUS}      Namkaran

# Common Menu Locators (using href attributes for better reliability)
${MASTER_MANAGEMENT_MENU}          xpath=//a[@href='/master-management']
${AUDIO_MENU}                      xpath=//a[@href='/audio']
${EVENTS_MENU}                     xpath=//a[@href='/events']
${NEWS_MENU}                       xpath=//a[@href='/news']
${PRAYER_MENU}                     xpath=//span[contains(text(),'Prayer')]
${NAMKARAN_MENU}                   xpath=//span[contains(text(),'Namkaran')]
${USER_MANAGEMENT_MENU}            xpath=//span[contains(text(),'User Management')]
${DHYANSTHALI_MENU}                xpath=//a[@href='/dhyansthali']
${DHYANKENDRA_MENU}                xpath=//span[contains(text(),'Dhyankendra')]

*** Keywords ***
Login With User Role
    [Documentation]    Common login keyword that accepts user type and logs in with appropriate credentials
    [Arguments]    ${user_role}
    
    Log To Console    🔐 Logging in as: ${user_role}
    
    # Get credentials based on user role
    ${email}=    Get User Email By Role    ${user_role}
    ${password}=    Get User Password By Role    ${user_role}
    
    # Validate credentials are available
    IF    '${email}' == 'None' or '${email}' == '${EMPTY}'
        Fail    ❌ Email not configured for user role: ${user_role}
    END
    
    # Perform login
    Web Input Text    ${LOGIN_EMAIL_FIELD}    ${email}
    Web Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}
    Web Click Element    ${LOGIN_BUTTON}

    # Wait for login to complete - verify role-specific landing page
    Sleep    5s
    Validate Role Based Login Success    ${user_role}
    Log To Console    ✅ Successfully logged in as: ${user_role}

Get User Email By Role
    [Documentation]    Returns email address based on user role
    [Arguments]    ${user_role}
    
    IF    '${user_role}' == 'Prayer Coordinator'
        ${email}=    Set Variable    ${PRAYER_COORDINATOR_EMAIL}
    ELSE IF    '${user_role}' == 'Global Event Coordinator'
        ${email}=    Set Variable    ${GLOBAL_EVENT_COORDINATOR_EMAIL}
    ELSE IF    '${user_role}' == 'Acharya'
        ${email}=    Set Variable    ${ACHARYA_EMAIL}
    ELSE IF    '${user_role}' == 'Namkaran Coordinator'
        ${email}=    Set Variable    ${NAMKARAN_COORDINATOR_EMAIL}
    ELSE IF    '${user_role}' == 'Maha Acharya'
        ${email}=    Set Variable    ${MAHA_ACHARYA_EMAIL}
    ELSE
        ${email}=    Set Variable    None
    END
    [Return]    ${email}

Get User Password By Role
    [Documentation]    Returns password based on user role
    [Arguments]    ${user_role}
    
    IF    '${user_role}' == 'Prayer Coordinator'
        ${password}=    Set Variable    ${PRAYER_COORDINATOR_PASSWORD}
    ELSE IF    '${user_role}' == 'Global Event Coordinator'
        ${password}=    Set Variable    ${GLOBAL_EVENT_COORDINATOR_PASSWORD}
    ELSE IF    '${user_role}' == 'Acharya'
        ${password}=    Set Variable    ${ACHARYA_PASSWORD}
    ELSE IF    '${user_role}' == 'Maha Acharya'
        ${password}=    Set Variable    ${MAHA_ACHARYA_PASSWORD}
    ELSE IF    '${user_role}' == 'Namkaran Coordinator'
        ${password}=    Set Variable    ${NAMKARAN_COORDINATOR_PASSWORD}
    ELSE
        ${password}=    Set Variable    None
    END
    [Return]    ${password}

Validate Role Based Login Success
    [Documentation]    Validates successful login by checking for role-specific landing page content
    [Arguments]    ${user_role}

    Log To Console    🔍 Validating login success for role: ${user_role}

    # Check for role-specific page content based on where each role lands after login
    IF    '${user_role}' == 'Prayer Coordinator'
        # Prayer Coordinator lands on Prayer Management page
        ${login_success}=    Run Keyword And Return Status    Web Wait Until Page Contains    Prayer Management    20s
        IF    ${login_success} == False
            # Fallback: check for Prayer menu or Requests text
            Web Wait Until Page Contains Element    xpath=//span[contains(text(),'Prayer')]    20s
        END
        Log To Console    ✅ Prayer Coordinator logged in successfully - Prayer Management page visible
    ELSE IF    '${user_role}' == 'Global Event Coordinator'
        # Global Event Coordinator may land on Events page or see Events menu
        ${login_success}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    xpath=//span[contains(text(),'Events')]    20s
        IF    ${login_success} == False
            # Fallback: check for any successful page load indicator
            Web Wait Until Page Contains Element    xpath=//span[contains(text(),'Event') or contains(text(),'Management')]    20s
        END
        Log To Console    ✅ Global Event Coordinator logged in successfully
    ELSE IF    '${user_role}' == 'Acharya'
        # Acharya has access to multiple modules - check for User Management or News menu
        ${login_success}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    xpath=//span[contains(text(),'User Management') or contains(text(),'News') or contains(text(),'Dhyankendra')]    20s
        IF    ${login_success} == False
            # Fallback: check for Management text
            Web Wait Until Page Contains    Management    20s
        END
        Log To Console    ✅ Acharya logged in successfully
    ELSE IF    '${user_role}' == 'Maha Acharya'
        # Maha Acharya has similar access to Acharya
        ${login_success}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    xpath=//span[contains(text(),'User Management') or contains(text(),'News') or contains(text(),'Dhyankendra')]    20s
        IF    ${login_success} == False
            # Fallback: check for Management text
            Web Wait Until Page Contains    Management    20s
        END
        Log To Console    ✅ Maha Acharya logged in successfully
    ELSE IF    '${user_role}' == 'Namkaran Coordinator'
        # Namkaran Coordinator lands on Namkaran page
        ${login_success}=    Run Keyword And Return Status    Web Wait Until Page Contains    Namkaran    20s
        IF    ${login_success} == False
            # Fallback: check for Namkaran menu
            Web Wait Until Page Contains Element    xpath=//span[contains(text(),'Namkaran')]    20s
        END
        Log To Console    ✅ Namkaran Coordinator logged in successfully
    ELSE
        # Generic validation - just check that we're not on login page anymore
        Sleep    3s
        ${on_login_page}=    Run Keyword And Return Status    Web Page Should Contain Element    ${LOGIN_EMAIL_FIELD}
        IF    ${on_login_page}
            Fail    ❌ Login failed - still on login page
        END
        Log To Console    ✅ User logged in successfully
    END

Validate Menu Items For User Role
    [Documentation]    Validates that only the expected menu items are visible for the given user role
    [Arguments]    ${user_role}
    
    Log To Console    🔍 Validating menu items for: ${user_role}
    
    # Get expected menu items for the role
    ${expected_menus}=    Get Expected Menu Items By Role    ${user_role}
    ${expected_menu_list}=    Split String    ${expected_menus}    ,
    
    # Track which main menus have been clicked to avoid re-clicking
    @{clicked_main_menus}=    Create List
    
    # Validate each expected menu is visible and clickable
    FOR    ${menu_item}    IN    @{expected_menu_list}
        ${menu_item}=    Strip String    ${menu_item}
        Validate And Click Menu Item With Tracking    ${menu_item}    ${clicked_main_menus}
    END
    
    # Validate that unexpected menus are NOT visible
    Validate Unexpected Menus Are Hidden    ${user_role}
    
    Log To Console    ✅ Menu validation completed for: ${user_role}

Validate Unexpected Menus Are Hidden
    [Documentation]    Validates that unexpected menu items are NOT visible for the given user role
    [Arguments]    ${user_role}
    
    Log To Console    🔍 Validating that unexpected menus are hidden for: ${user_role}
    
    # Get expected menu items for the role
    ${expected_menus}=    Get Expected Menu Items By Role    ${user_role}
    ${expected_menu_list}=    Split String    ${expected_menus}    ,
    
    # Define all possible menu items that could appear in the system (excluding Dashboard as it's visible for all users)
    @{all_possible_menus}=    Create List    Banners    News    Events    Dhyansthali Management    Audio    Dhyankendra    Namkaran    Prayer    Feedback    Master Management    Configuration Management    User Management
    
    # Check each possible menu item
    FOR    ${menu_item}    IN    @{all_possible_menus}
        ${is_expected}=    Run Keyword And Return Status    List Should Contain Value    ${expected_menu_list}    ${menu_item}
        
        # Check if this menu is expected as a submenu (e.g., "News - Local" means "News" main menu is also expected)
        ${is_expected_as_submenu}=    Check If Menu Is Expected As Submenu    ${menu_item}    ${expected_menu_list}
        
        IF    ${is_expected} == False and ${is_expected_as_submenu} == False
            # This menu should NOT be visible
            ${menu_locator}=    Get Menu Locator For Validation    ${menu_item}
            ${is_visible}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${menu_locator}    2s
            
            IF    ${is_visible} == True
                Log To Console    ❌ Unexpected menu is visible: ${menu_item}
                Fail    Unexpected menu item '${menu_item}' is visible for role '${user_role}' but should be hidden
            ELSE
                Log To Console    ✅ Menu correctly hidden: ${menu_item}
            END
        ELSE
            Log To Console    ✅ Menu is expected (directly or as parent): ${menu_item}
        END
    END
    
    Log To Console    ✅ All unexpected menus are properly hidden for: ${user_role}

Check If Menu Is Expected As Submenu
    [Documentation]    Checks if a main menu is expected because one of its submenus is in the expected list
    [Arguments]    ${menu_item}    ${expected_menu_list}
    
    ${result}=    Set Variable    False
    
    # Check if any expected menu item contains this menu as a parent (e.g., "News - Local" means "News" is expected)
    FOR    ${expected_item}    IN    @{expected_menu_list}
        ${expected_item}=    Strip String    ${expected_item}
        ${contains_dash}=    Run Keyword And Return Status    Should Contain    ${expected_item}    -
        
        IF    ${contains_dash} == True
            # Extract the main menu part (before the dash)
            ${main_menu_part}=    Split String    ${expected_item}    -    1
            ${main_menu_part}=    Strip String    ${main_menu_part}[0]
            
            IF    '${main_menu_part}' == '${menu_item}'
                Log To Console    ✅ Menu '${menu_item}' is expected as parent of '${expected_item}'
                ${result}=    Set Variable    True
                Exit For Loop
            END
        END
    END
    
    [Return]    ${result}

Get Menu Locator For Validation
    [Documentation]    Returns locator for menu item validation (handles both expandable and simple menus)
    [Arguments]    ${menu_name}
    
    # Check if it's an expandable menu
    ${is_expandable}=    Run Keyword And Return Status    Should Be True    '${menu_name}' in ['News', 'Events', 'Dhyansthali Management', 'Audio', 'Master Management', 'Configuration Management']
    
    IF    ${is_expandable} == True
        # Use div with aria-label for expandable menus
        ${locator}=    Set Variable    xpath=//div[@aria-label='${menu_name}']
    ELSE
        # Use href-based locator for simple menus
        ${locator}=    Get Simple Menu Locator    ${menu_name}
    END
    [Return]    ${locator}

Get Simple Menu Locator
    [Documentation]    Returns locator for simple menu items
    [Arguments]    ${menu_name}

    IF    '${menu_name}' == 'Dashboard'
        ${locator}=    Set Variable    xpath=//a[@href='/dashboard']
    ELSE IF    '${menu_name}' == 'Banners'
        ${locator}=    Set Variable    xpath=//a[@href='/banners']
    ELSE IF    '${menu_name}' == 'Dhyankendra'
        ${locator}=    Set Variable    xpath=//span[contains(text(),'Dhyankendra')] | xpath=//a[@href='/dhyankendra']
    ELSE IF    '${menu_name}' == 'Namkaran'
        ${locator}=    Set Variable    xpath=//span[contains(text(),'Namkaran')] | xpath=//a[@href='/namkaran']
    ELSE IF    '${menu_name}' == 'Prayer'
        ${locator}=    Set Variable    xpath=//span[contains(text(),'Prayer')]
    ELSE IF    '${menu_name}' == 'Feedback'
        ${locator}=    Set Variable    xpath=//a[@href='/feedback']
    ELSE IF    '${menu_name}' == 'User Management'
        ${locator}=    Set Variable    xpath=//span[contains(text(),'User Management')] | xpath=//a[@href='/user']
    ELSE
        # Fallback to text-based locator
        ${locator}=    Set Variable    xpath=//span[contains(text(),'${menu_name}')] | xpath=//a[contains(text(),'${menu_name}')]
    END
    [Return]    ${locator}

Get Expected Menu Items By Role
    [Documentation]    Returns expected menu items based on user role
    [Arguments]    ${user_role}
    
    IF    '${user_role}' == 'Prayer Coordinator'
        ${menus}=    Set Variable    ${PRAYER_COORDINATOR_MENUS}
    ELSE IF    '${user_role}' == 'Global Event Coordinator'
        ${menus}=    Set Variable    ${GLOBAL_EVENT_COORDINATOR_MENUS}
    ELSE IF    '${user_role}' == 'Acharya'
        ${menus}=    Set Variable    ${ACHARYA_MENUS}
    ELSE IF    '${user_role}' == 'Maha Acharya'
        ${menus}=    Set Variable    ${MAHA_ACHARYA_MENUS}
    ELSE IF    '${user_role}' == 'Namkaran Coordinator'
        ${menus}=    Set Variable    ${NAMKARAN_COORDINATOR_MENUS}
    ELSE
        ${menus}=    Set Variable    ${EMPTY}
    END
    [Return]    ${menus}

Validate And Click Menu Item With Tracking
    [Documentation]    Validates that a specific menu item is visible and clicks on it (handles hierarchical menus with tracking)
    [Arguments]    ${menu_item}    ${clicked_main_menus}
    
    Log To Console    🔍 Checking and clicking menu: ${menu_item}
    
    # Check if this is a submenu item that requires clicking main menu first
    ${is_submenu}=    Run Keyword And Return Status    Should Contain    ${menu_item}    -
    
    IF    ${is_submenu} == True
        # Handle submenu items (e.g., "Events - Local", "News - Local")
        Handle Submenu Item With Tracking    ${menu_item}    ${clicked_main_menus}
    ELSE
        # Handle main menu items - check if it's an expandable menu or simple menu
        ${is_expandable_menu}=    Run Keyword And Return Status    Should Be True    '${menu_item}' in ['Events', 'News', 'Dhyansthali Management']
        
        IF    ${is_expandable_menu} == True
            # Handle expandable main menu items (e.g., "Events", "News", "Dhyansthali Management")
            Handle Expandable Main Menu Item    ${menu_item}
        ELSE
            # Handle simple main menu items (e.g., "Prayer", "Namkaran")
            Handle Main Menu Item    ${menu_item}
        END
    END

Validate And Click Menu Item
    [Documentation]    Validates that a specific menu item is visible and clicks on it (handles hierarchical menus)
    [Arguments]    ${menu_item}
    
    Log To Console    🔍 Checking and clicking menu: ${menu_item}
    
    # Check if this is a submenu item that requires clicking main menu first
    ${is_submenu}=    Run Keyword And Return Status    Should Contain    ${menu_item}    -
    
    IF    ${is_submenu} == True
        # Handle submenu items (e.g., "Events - Local", "News - Local")
        Handle Submenu Item    ${menu_item}
    ELSE
        # Handle main menu items (e.g., "Prayer", "Namkaran")
        Handle Main Menu Item    ${menu_item}
    END

Handle Expandable Main Menu Item
    [Documentation]    Handles clicking on expandable main menu items (using div with aria-label)
    [Arguments]    ${menu_item}
    
    ${menu_locator}=    Get Main Menu Locator    ${menu_item}
    
    # Check if menu is visible
    ${is_visible}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${menu_locator}    5s
    
    IF    ${is_visible} == True
        Log To Console    ✅ Expandable main menu item is visible: ${menu_item}
        Web Click Element    ${menu_locator}
        Sleep    2s
        Log To Console    ✅ Clicked on expandable main menu item: ${menu_item}
    ELSE
        Log To Console    ❌ Expandable main menu item is NOT visible: ${menu_item}
        Fail    Expected expandable main menu item '${menu_item}' is not visible
    END

Handle Main Menu Item
    [Documentation]    Handles clicking on simple main menu items (using href attributes)
    [Arguments]    ${menu_item}

    ${menu_locator}=    Get Menu Locator By Name    ${menu_item}

    # First try to scroll element into view if it exists in DOM
    Run Keyword And Ignore Error    Execute JavaScript    document.evaluate("${menu_locator.replace('xpath=', '')}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue?.scrollIntoView({block: 'center'})
    Sleep    1s

    # Now check visibility after scroll
    ${is_visible}=    Run Keyword And Return Status    Web Wait Until Element Is Visible    ${menu_locator}    10s

    IF    ${is_visible} == True
        Log To Console    ✅ Simple main menu item is visible: ${menu_item}
        Web Click Element    ${menu_locator}
        Sleep    2s
        Log To Console    ✅ Clicked on simple main menu item: ${menu_item}
    ELSE
        Log To Console    ❌ Simple main menu item is NOT visible: ${menu_item}
        Fail    Expected simple main menu item '${menu_item}' is not visible
    END

Handle Submenu Item With Tracking
    [Documentation]    Handles clicking on submenu items by first clicking main menu (with tracking to avoid re-clicking)
    [Arguments]    ${menu_item}    ${clicked_main_menus}

    # Extract main menu and submenu names
    ${menu_parts}=    Split String    ${menu_item}    -
    ${main_menu}=    Strip String    ${menu_parts}[0]
    ${submenu}=    Strip String    ${menu_parts}[1]

    Log To Console    🔍 Handling submenu: ${main_menu} → ${submenu}

    # Check if main menu has already been clicked
    ${main_menu_clicked}=    Run Keyword And Return Status    List Should Contain Value    ${clicked_main_menus}    ${main_menu}
    
    IF    ${main_menu_clicked} == False
        # First, click on the main menu to expand it
        ${main_menu_locator}=    Get Main Menu Locator    ${main_menu}
        ${main_menu_visible}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${main_menu_locator}    5s
        
        IF    ${main_menu_visible} == True
            Log To Console    ✅ Main menu is visible: ${main_menu}
            Web Click Element    ${main_menu_locator}
            Sleep    2s
            Log To Console    ✅ Clicked on main menu to expand: ${main_menu}
            
            # Add to clicked main menus list
            Append To List    ${clicked_main_menus}    ${main_menu}
        ELSE
            Log To Console    ❌ Main menu is NOT visible: ${main_menu}
            Fail    Expected main menu '${main_menu}' is not visible
        END
    ELSE
        Log To Console    ✅ Main menu already expanded: ${main_menu} (skipping click)
    END
    
    # Now find and click the submenu
    ${submenu_locator}=    Get Submenu Locator    ${main_menu}    ${submenu}
    ${submenu_visible}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${submenu_locator}    5s

    IF    ${submenu_visible} == True
        Log To Console    ✅ Submenu is visible: ${submenu}
        Web Click Element    ${submenu_locator}
        Sleep    2s
        Log To Console    ✅ Clicked on submenu: ${submenu}
    ELSE
        # Submenu link not visible - check if user has access via Add button (functionality check)
        Log To Console    ⚠️ Submenu link not found: ${submenu} - Checking for access via functional button
        ${has_access}=    Validate Submenu Access Via Button    ${main_menu}    ${submenu}
        IF    ${has_access} == True
            Log To Console    ✅ User has access to ${submenu} (verified via Add button)
        ELSE
            Log To Console    ❌ Submenu is NOT visible and no functional access: ${submenu}
            Fail    Expected submenu '${submenu}' is not visible under '${main_menu}'
        END
    END

Handle Submenu Item
    [Documentation]    Handles clicking on submenu items by first clicking main menu
    [Arguments]    ${menu_item}
    
    # Extract main menu and submenu names
    ${menu_parts}=    Split String    ${menu_item}    -
    ${main_menu}=    Strip String    ${menu_parts}[0]
    ${submenu}=    Strip String    ${menu_parts}[1]
    
    Log To Console    🔍 Handling submenu: ${main_menu} → ${submenu}
    
    # First, click on the main menu to expand it
    ${main_menu_locator}=    Get Main Menu Locator    ${main_menu}
    ${main_menu_visible}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    ${main_menu_locator}    5s
    
    IF    ${main_menu_visible} == True
        Log To Console    ✅ Main menu is visible: ${main_menu}
        Web Click Element    ${main_menu_locator}
        Sleep    2s
        Log To Console    ✅ Clicked on main menu to expand: ${main_menu}
        
        # Now find and click the submenu
        ${submenu_locator}=    Get Submenu Locator    ${main_menu}    ${submenu}
        ${submenu_visible}=    Run Keyword And Return Status    Web Wait Until Element Is Visible    ${submenu_locator}    10s
        
        IF    ${submenu_visible} == True
            Log To Console    ✅ Submenu is visible: ${submenu}
            Web Click Element    ${submenu_locator}
            Sleep    2s
            Log To Console    ✅ Clicked on submenu: ${submenu}
        ELSE
            Log To Console    ❌ Submenu is NOT visible: ${submenu}
            Fail    Expected submenu '${submenu}' is not visible under '${main_menu}'
        END
    ELSE
        Log To Console    ❌ Main menu is NOT visible: ${main_menu}
        Fail    Expected main menu '${main_menu}' is not visible
    END

Get Main Menu Locator
    [Documentation]    Returns locator for main menu items (using div with aria-label for expandable menus)
    [Arguments]    ${main_menu}
    
    IF    '${main_menu}' == 'Events'
        ${locator}=    Set Variable    xpath=//div[@aria-label='Events']
    ELSE IF    '${main_menu}' == 'News'
        ${locator}=    Set Variable    xpath=//div[@aria-label='News']
    ELSE IF    '${main_menu}' == 'Dhyansthali Management'
        ${locator}=    Set Variable    xpath=//div[@aria-label='Dhyansthali Management']
    ELSE
        # Fallback for non-expandable menus (like Prayer, Namkaran)
        ${locator}=    Set Variable    xpath=//a[contains(text(),'${main_menu}')]
    END
    [Return]    ${locator}

Get Submenu Locator
    [Documentation]    Returns locator for submenu items (using href attributes or text)
    [Arguments]    ${main_menu}    ${submenu}

    IF    '${main_menu}' == 'Events'
        IF    '${submenu}' == 'Global'
            ${locator}=    Set Variable    xpath=//a[@href='/events/global']
        ELSE IF    '${submenu}' == 'Local'
            ${locator}=    Set Variable    xpath=//a[@href='/events/local']
        ELSE
            ${locator}=    Set Variable    xpath=//a[@href='/events/${submenu.lower()}']
        END
    ELSE IF    '${main_menu}' == 'News'
        IF    '${submenu}' == 'Local'
            ${locator}=    Set Variable    xpath=//a[@href='/news/local']
        ELSE IF    '${submenu}' == 'Global'
            ${locator}=    Set Variable    xpath=//a[@href='/news/global']
        ELSE
            ${locator}=    Set Variable    xpath=//a[@href='/news/${submenu.lower()}']
        END
    ELSE IF    '${main_menu}' == 'Dhyansthali Management'
        IF    '${submenu}' == 'Dhyansthali'
            ${locator}=    Set Variable    xpath=//a[@aria-label='Dhyansthali']
        ELSE
            ${locator}=    Set Variable    xpath=//a[@aria-label='${submenu}']
        END
    ELSE
        # Fallback to href-based locator
        ${locator}=    Set Variable    xpath=//a[@href='/${main_menu.lower()}/${submenu.lower()}']
    END
    [Return]    ${locator}

Get Menu Locator By Name
    [Documentation]    Returns locator for menu item based on name (handles hierarchical menus)
    [Arguments]    ${menu_name}
    
    IF    '${menu_name}' == 'Prayer'
        ${locator}=    Set Variable    ${PRAYER_MENU}
    ELSE IF    '${menu_name}' == 'Events - Global'
        # First click on Events main menu, then find Global submenu
        ${locator}=    Set Variable    xpath=//a[contains(text(),'Events')]/following-sibling::ul//a[contains(text(),'Global')]
    ELSE IF    '${menu_name}' == 'Events - Local'
        # First click on Events main menu, then find Local submenu
        ${locator}=    Set Variable    xpath=//a[contains(text(),'Events')]/following-sibling::ul//a[contains(text(),'Local')]
    ELSE IF    '${menu_name}' == 'Dhyansthali Management'
        # Main menu item
        ${locator}=    Set Variable    xpath=//a[contains(text(),'Dhyansthali Management')]
    ELSE IF    '${menu_name}' == 'Dhyankendra'
        ${locator}=    Set Variable    ${DHYANKENDRA_MENU}
    ELSE IF    '${menu_name}' == 'News - Local'
        # First click on News main menu, then find Local submenu
        ${locator}=    Set Variable    xpath=//a[contains(text(),'News')]/following-sibling::ul//a[contains(text(),'Local')]
    ELSE IF    '${menu_name}' == 'User Management'
        # Simple menu item (not expandable) - use span or href
        ${locator}=    Set Variable    ${USER_MANAGEMENT_MENU}
    ELSE IF    '${menu_name}' == 'Namkaran'
        ${locator}=    Set Variable    ${NAMKARAN_MENU}
    ELSE
        # Fallback to text-based locator for unknown menu items
        ${locator}=    Set Variable    xpath=//a[contains(text(),'${menu_name}')]
    END
    [Return]    ${locator}


Test User Role Access
    [Documentation]    Complete test for user role access validation
    [Arguments]    ${user_role}
    
    Log To Console    🧪 Testing role access for: ${user_role}
    
    # Open browser and navigate to login page
    Open Web Browser
    Navigate To Login Page
    
    # Login with user role
    Login With User Role    ${user_role}
    
    # Validate menu items
    Validate Menu Items For User Role    ${user_role}
    
    # Close browser
    Close Web Browser
    
    Log To Console    ✅ Role access test completed for: ${user_role}

Navigate To Login Page
    [Documentation]    Navigates to the login page
    Web.Go To    ${LOGIN_URL}
    Web Wait Until Page Contains Element    ${LOGIN_EMAIL_FIELD}    10s
    Log To Console    📱 Navigated to login page

Validate Submenu Access Via Button
    [Documentation]    Validates submenu access by checking for functional Add button
    [Arguments]    ${main_menu}    ${submenu}

    Log To Console    ?? Validating ${submenu} access via Add button for ${main_menu}

    # Check for Add button based on submenu type
    IF    '${main_menu}' == 'Events'
        # Check for Add Event button
        ${has_button}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    xpath=//a[contains(., 'Add Event')]    3s
        RETURN    ${has_button}
    ELSE IF    '${main_menu}' == 'News'
        # Check for Add News button
        ${has_button}=    Run Keyword And Return Status    Web Wait Until Page Contains Element    xpath=//a[contains(text(),'Add News')]    3s
        RETURN    ${has_button}
    ELSE
        # No button validation available for this module
        RETURN    False
    END
