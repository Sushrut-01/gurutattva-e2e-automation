*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    DateTime
Library    String
Library    Collections

*** Variables ***
${DEBUG_FOLDER}    ${EXECDIR}/results/debug_logs
${STEP_COUNTER}    ${0}

*** Keywords ***
Initialize Debug Folder For Test
    [Documentation]    Creates debug folder structure with test case name and timestamp
    [Arguments]    ${test_case_name}=TC_Unknown
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${safe_test_name}=    Replace String    ${test_case_name}    ${SPACE}    _
    ${safe_test_name}=    Evaluate    "${safe_test_name}"[:50]    # Limit length
    ${test_debug_folder}=    Set Variable    ${DEBUG_FOLDER}/${safe_test_name}_${timestamp}

    # Create folder structure
    Create Directory    ${test_debug_folder}
    Create Directory    ${test_debug_folder}/page_sources
    Create Directory    ${test_debug_folder}/screenshots
    Create Directory    ${test_debug_folder}/element_hierarchy

    # Reset step counter
    Set Suite Variable    ${STEP_COUNTER}    ${0}
    Set Suite Variable    ${CURRENT_DEBUG_FOLDER}    ${test_debug_folder}
    Set Suite Variable    ${CURRENT_TEST_NAME}    ${safe_test_name}

    # Create index file
    ${index_content}=    Set Variable    === DEBUG LOG INDEX ===\nTest Case: ${test_case_name}\nStarted: ${timestamp}\nFolder: ${test_debug_folder}\n\n=== STEPS ===\n
    Create File    ${test_debug_folder}/index.txt    ${index_content}

    Log To Console    \n📁 ========================================
    Log To Console    📁 DEBUG FOLDER INITIALIZED
    Log To Console    📁 Test: ${test_case_name}
    Log To Console    📁 Path: ${test_debug_folder}
    Log To Console    📁 ========================================\n
    RETURN    ${test_debug_folder}

Capture Debug Info With Hierarchy
    [Documentation]    Captures complete debug info including element hierarchy
    [Arguments]    ${action_name}    ${target_locator}=${EMPTY}

    # Increment step counter
    ${STEP_COUNTER}=    Evaluate    ${STEP_COUNTER} + 1
    Set Suite Variable    ${STEP_COUNTER}
    ${step_num}=    Evaluate    str(${STEP_COUNTER}).zfill(3)

    ${timestamp}=    Get Current Date    result_format=%H%M%S
    ${safe_name}=    Replace String    ${action_name}    ${SPACE}    _
    ${safe_name}=    Replace String    ${safe_name}    /    _
    ${file_prefix}=    Set Variable    step${step_num}_${timestamp}_${safe_name}

    Log To Console    \n🔍 ========== STEP ${step_num}: ${action_name} ==========

    # 1. Capture full page source
    TRY
        ${page_source}=    AppiumLibrary.Get Source
        ${source_file}=    Set Variable    ${CURRENT_DEBUG_FOLDER}/page_sources/${file_prefix}.xml
        Create File    ${source_file}    ${page_source}
        Log To Console    📋 Page source: ${file_prefix}.xml
    EXCEPT    AS    ${error}
        Log To Console    ⚠️ Page source error: ${error}
        ${page_source}=    Set Variable    ${EMPTY}
    END

    # 2. Capture screenshot
    TRY
        ${screenshot_file}=    Set Variable    ${CURRENT_DEBUG_FOLDER}/screenshots/${file_prefix}.png
        AppiumLibrary.Capture Page Screenshot    ${screenshot_file}
        Log To Console    📸 Screenshot: ${file_prefix}.png
    EXCEPT    AS    ${error}
        Log To Console    ⚠️ Screenshot error: ${error}
    END

    # 3. If target locator provided, capture element details
    IF    $target_locator != $EMPTY
        TRY
            ${element_info}=    Get Element Full Details    ${target_locator}    ${page_source}
            ${hierarchy_file}=    Set Variable    ${CURRENT_DEBUG_FOLDER}/element_hierarchy/${file_prefix}_element.txt
            Create File    ${hierarchy_file}    ${element_info}
            Log To Console    🔗 Element info: ${file_prefix}_element.txt
        EXCEPT    AS    ${error}
            Log To Console    ⚠️ Element details error: ${error}
        END
    END

    # 4. Update index file
    ${index_entry}=    Set Variable    Step ${step_num} [${timestamp}]: ${action_name}\n  - Page source: page_sources/${file_prefix}.xml\n  - Screenshot: screenshots/${file_prefix}.png\n\n
    Append To File    ${CURRENT_DEBUG_FOLDER}/index.txt    ${index_entry}

    Log To Console    🔍 ================================================\n

Get Element Full Details
    [Documentation]    Gets complete element details including hierarchy and all attributes
    [Arguments]    ${locator}    ${page_source}=${EMPTY}

    ${details}=    Set Variable    === ELEMENT DETAILS ===\n
    ${details}=    Set Variable    ${details}Locator: ${locator}\n\n

    # Basic element info
    TRY
        ${location}=    AppiumLibrary.Get Element Location    ${locator}
        ${size}=    AppiumLibrary.Get Element Size    ${locator}
        ${visible}=    Run Keyword And Return Status    AppiumLibrary.Element Should Be Visible    ${locator}
        ${enabled}=    Run Keyword And Return Status    AppiumLibrary.Element Should Be Enabled    ${locator}

        ${center_x}=    Evaluate    int(${location}['x'] + ${size}['width'] / 2)
        ${center_y}=    Evaluate    int(${location}['y'] + ${size}['height'] / 2)

        ${details}=    Set Variable    ${details}=== LOCATION & SIZE ===\n
        ${details}=    Set Variable    ${details}Position: x=${location}[x], y=${location}[y]\n
        ${details}=    Set Variable    ${details}Size: width=${size}[width], height=${size}[height]\n
        ${details}=    Set Variable    ${details}Center Point: (${center_x}, ${center_y})\n
        ${details}=    Set Variable    ${details}Visible: ${visible}\n
        ${details}=    Set Variable    ${details}Enabled: ${enabled}\n\n

        # Get element attributes
        ${details}=    Set Variable    ${details}=== ATTRIBUTES ===\n
        TRY
            ${text}=    AppiumLibrary.Get Element Attribute    ${locator}    text
            ${details}=    Set Variable    ${details}text: ${text}\n
        EXCEPT
            ${details}=    Set Variable    ${details}text: (not available)\n
        END

        TRY
            ${content_desc}=    AppiumLibrary.Get Element Attribute    ${locator}    content-desc
            ${details}=    Set Variable    ${details}content-desc: ${content_desc}\n
        EXCEPT
            ${details}=    Set Variable    ${details}content-desc: (not available)\n
        END

        TRY
            ${class}=    AppiumLibrary.Get Element Attribute    ${locator}    class
            ${details}=    Set Variable    ${details}class: ${class}\n
        EXCEPT
            ${details}=    Set Variable    ${details}class: (not available)\n
        END

        TRY
            ${resource_id}=    AppiumLibrary.Get Element Attribute    ${locator}    resource-id
            ${details}=    Set Variable    ${details}resource-id: ${resource_id}\n
        EXCEPT
            ${details}=    Set Variable    ${details}resource-id: (not available)\n
        END

        TRY
            ${clickable}=    AppiumLibrary.Get Element Attribute    ${locator}    clickable
            ${details}=    Set Variable    ${details}clickable: ${clickable}\n
        EXCEPT
            ${details}=    Set Variable    ${details}clickable: (not available)\n
        END

        TRY
            ${bounds}=    AppiumLibrary.Get Element Attribute    ${locator}    bounds
            ${details}=    Set Variable    ${details}bounds: ${bounds}\n
        EXCEPT
            ${details}=    Set Variable    ${details}bounds: (not available)\n
        END

        TRY
            ${index}=    AppiumLibrary.Get Element Attribute    ${locator}    index
            ${details}=    Set Variable    ${details}index: ${index}\n
        EXCEPT
            ${details}=    Set Variable    ${details}index: (not available)\n
        END

        TRY
            ${package}=    AppiumLibrary.Get Element Attribute    ${locator}    package
            ${details}=    Set Variable    ${details}package: ${package}\n
        EXCEPT
            ${details}=    Set Variable    ${details}package: (not available)\n
        END

    EXCEPT    AS    ${error}
        ${details}=    Set Variable    ${details}ERROR getting element details: ${error}\n
    END

    # Window info
    ${details}=    Set Variable    ${details}\n=== WINDOW INFO ===\n
    TRY
        ${window_size}=    AppiumLibrary.Get Window Size
        ${details}=    Set Variable    ${details}Window Size: ${window_size}[width] x ${window_size}[height]\n
    EXCEPT
        ${details}=    Set Variable    ${details}Window Size: (not available)\n
    END

    ${details}=    Set Variable    ${details}\n=== RECOMMENDED XPATHS ===\n
    ${details}=    Set Variable    ${details}Original: ${locator}\n

    RETURN    ${details}

Debug Click Element
    [Documentation]    Clicks element with full debug capture before and after
    [Arguments]    ${locator}    ${element_name}

    # Capture before click
    Capture Debug Info With Hierarchy    before_click_${element_name}    ${locator}

    # Attempt click
    TRY
        Mobile Click Element    ${locator}
        Log To Console    ✅ CLICKED: ${element_name}
        ${click_success}=    Set Variable    ${TRUE}
    EXCEPT    AS    ${error}
        Log To Console    ❌ CLICK FAILED: ${element_name} - ${error}
        ${click_success}=    Set Variable    ${FALSE}
    END

    Sleep    1s

    # Capture after click
    Capture Debug Info With Hierarchy    after_click_${element_name}    ${EMPTY}

    RETURN    ${click_success}

Search Element In Page
    [Documentation]    Searches for element by content-desc or text in current page
    [Arguments]    ${search_text}

    ${page_source}=    AppiumLibrary.Get Source
    ${found}=    Run Keyword And Return Status    Should Contain    ${page_source}    ${search_text}

    Log To Console    🔍 Searching for: "${search_text}"
    IF    ${found}
        Log To Console    ✅ FOUND in page source
    ELSE
        Log To Console    ❌ NOT FOUND in page source
    END

    RETURN    ${found}

List Bottom Navigation Elements
    [Documentation]    Lists all bottom navigation elements (ImageView with content-desc)

    ${page_source}=    AppiumLibrary.Get Source
    Log To Console    \n📱 === BOTTOM NAVIGATION ELEMENTS ===

    # Common bottom nav elements
    @{nav_items}=    Create List    Home    News    Explore    Events    Audio    होम    घटनाएं    ऑडियो

    FOR    ${item}    IN    @{nav_items}
        ${found}=    Run Keyword And Return Status    Should Contain    ${page_source}    content-desc="${item}"
        IF    ${found}
            Log To Console    ✅ ${item}: FOUND
        ELSE
            Log To Console    ❌ ${item}: NOT FOUND
        END
    END
    Log To Console    📱 =====================================\n

Log Element Details
    [Documentation]    Logs detailed info about an element to console
    [Arguments]    ${locator}
    Log To Console    \n📍 === ELEMENT DETAILS ===
    Log To Console    📍 Locator: ${locator}
    TRY
        ${location}=    AppiumLibrary.Get Element Location    ${locator}
        ${size}=    AppiumLibrary.Get Element Size    ${locator}
        ${center_x}=    Evaluate    int(${location}['x'] + ${size}['width'] / 2)
        ${center_y}=    Evaluate    int(${location}['y'] + ${size}['height'] / 2)
        Log To Console    📍 Position: x=${location}[x], y=${location}[y]
        Log To Console    📍 Size: width=${size}[width], height=${size}[height]
        Log To Console    📍 Center: (${center_x}, ${center_y})

        TRY
            ${bounds}=    AppiumLibrary.Get Element Attribute    ${locator}    bounds
            Log To Console    📍 Bounds: ${bounds}
        EXCEPT
            Log To Console    📍 Bounds: (not available)
        END

        TRY
            ${clickable}=    AppiumLibrary.Get Element Attribute    ${locator}    clickable
            Log To Console    📍 Clickable: ${clickable}
        EXCEPT
            Log To Console    📍 Clickable: (not available)
        END

        # Check if element is at screen edge
        ${window_size}=    AppiumLibrary.Get Window Size
        ${screen_height}=    Set Variable    ${window_size}[height]
        ${element_bottom}=    Evaluate    ${location}['y'] + ${size}['height']
        ${at_edge}=    Evaluate    ${element_bottom} >= ${screen_height} - 20
        IF    ${at_edge}
            Log To Console    ⚠️ WARNING: Element is at SCREEN EDGE! Click may not work.
            Log To Console    ⚠️ Screen height: ${screen_height}, Element bottom: ${element_bottom}
        END
    EXCEPT    AS    ${error}
        Log To Console    ⚠️ Could not get element details: ${error}
    END
    Log To Console    📍 ========================\n

Find Element At Coordinates
    [Documentation]    Finds and logs elements at given x,y coordinates from page source
    [Arguments]    ${x}    ${y}

    Log To Console    \n🎯 === FINDING ELEMENTS AT (${x}, ${y}) ===
    ${page_source}=    AppiumLibrary.Get Source

    # Parse bounds and find matching elements
    # Bounds format: [x1,y1][x2,y2]
    ${elements_found}=    Set Variable    ${0}

    # Check common bottom nav elements by their known positions
    @{nav_elements}=    Create List
    ...    Home|65|172|2128|2138
    ...    News|266|369|2128|2138
    ...    Events|693|816|2128|2138
    ...    Audio|910|1015|2128|2138

    FOR    ${element_info}    IN    @{nav_elements}
        ${parts}=    Evaluate    "${element_info}".split("|")
        ${name}=    Set Variable    ${parts}[0]
        ${x1}=    Evaluate    int(${parts}[1])
        ${x2}=    Evaluate    int(${parts}[2])
        ${y1}=    Evaluate    int(${parts}[3])
        ${y2}=    Evaluate    int(${parts}[4])

        # Check if coordinates are within element bounds (with 100px tolerance above for y)
        ${x_match}=    Evaluate    ${x1} <= ${x} <= ${x2}
        ${y_match}=    Evaluate    ${y1} - 100 <= ${y} <= ${y2}

        IF    ${x_match} and ${y_match}
            Log To Console    ✅ MATCH: ${name} at bounds [${x1},${y1}][${x2},${y2}]
            Log To Console    📍 Dynamic XPath: xpath=//android.widget.ImageView[@content-desc="${name}"]
            ${elements_found}=    Evaluate    ${elements_found} + 1
        END
    END

    IF    ${elements_found} == 0
        Log To Console    ⚠️ No known nav element found at (${x}, ${y})
        Log To Console    📋 Check page source XML for element with matching bounds
    END

    Log To Console    🎯 =====================================\n
    RETURN    ${elements_found}

Log Tap With Element Detection
    [Documentation]    Taps at coordinates and logs which element was likely tapped
    [Arguments]    ${x}    ${y}    ${action_name}=Tap

    # Log element at coordinates before tap
    Find Element At Coordinates    ${x}    ${y}

    # Perform tap
    Log To Console    📍 Tapping at (${x}, ${y}) for: ${action_name}
    AppiumLibrary.Tap    ${None}    ${x}    ${y}

    # Capture debug info after tap
    Sleep    1s
    Run Keyword And Ignore Error    Capture Debug Info With Hierarchy    after_${action_name}    ${EMPTY}

Finalize Debug Log
    [Documentation]    Finalizes debug log with summary
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${summary}=    Set Variable    \n=== TEST COMPLETED ===\nEnd Time: ${timestamp}\nTotal Steps: ${STEP_COUNTER}\n
    Append To File    ${CURRENT_DEBUG_FOLDER}/index.txt    ${summary}
    Log To Console    \n📁 ========================================
    Log To Console    📁 DEBUG LOG FINALIZED
    Log To Console    📁 Total Steps: ${STEP_COUNTER}
    Log To Console    📁 Folder: ${CURRENT_DEBUG_FOLDER}
    Log To Console    📁 ========================================\n
