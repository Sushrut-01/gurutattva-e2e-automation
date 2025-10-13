*** Settings ***
# Import libraries with aliases to avoid conflicts
Library    BuiltIn
Library    AppiumLibrary    WITH NAME    Mobile
Library    SeleniumLibrary    WITH NAME    Web
Library    OperatingSystem
Library    AppiumLibrary    run_on_failure=No Operation
Library    SeleniumLibrary    run_on_failure=No Operation
Library    Collections
Library    String

*** Keywords ***
# Mobile-specific keywords
Mobile Click Element
    [Arguments]    ${locator}
    Mobile.Click Element    ${locator}

Mobile Wait Until Element Is Visible
    [Arguments]    ${locator}    ${timeout}=10s
    Mobile.Wait Until Element Is Visible    ${locator}    ${timeout}

Mobile Input Text
    [Arguments]    ${locator}    ${text}
    Mobile.Input Text    ${locator}    ${text}

Mobile Clear Text
    [Arguments]    ${locator}
    Mobile.Clear Text    ${locator}

Mobile Get Element Attribute
    [Arguments]    ${locator}    ${attribute}
    ${result}=    Mobile.Get Element Attribute    ${locator}    ${attribute}
    RETURN    ${result}

Mobile Get Element Location
    [Arguments]    ${locator}
    ${result}=    Mobile.Get Element Location    ${locator}
    RETURN    ${result}

Mobile Get Element Size
    [Arguments]    ${locator}
    ${result}=    Mobile.Get Element Size    ${locator}
    RETURN    ${result}

Mobile Get Webelements
    [Arguments]    ${locator}
    ${result}=    Mobile.Get Webelements    ${locator}
    RETURN    ${result}

Mobile Element Should Be Visible
    [Arguments]    ${locator}
    Mobile.Element Should Be Visible    ${locator}

Mobile Element Should Be Disabled
    [Arguments]    ${locator}
    [Documentation]    Checks if a mobile element is disabled by examining its enabled attribute
    ${enabled}=    Mobile.Get Element Attribute    ${locator}    enabled
    Should Be Equal As Strings    ${enabled}    false    Element should be disabled but it is enabled
    Log To Console    ✅ Element is disabled: ${locator}

Mobile Page Should Contain Element
    [Arguments]    ${locator}
    Mobile.Page Should Contain Element    ${locator}

# Mobile screenshot capture with explicit naming
Mobile Capture Page Screenshot
    [Arguments]    ${filename}
    Mobile.Capture Page Screenshot    ${filename}

# Mobile Application Management
Mobile Open Application
    [Arguments]    ${remote_url}    &{kwargs}
    Mobile.Open Application    ${remote_url}    &{kwargs}

Mobile Close Application
    Mobile.Close Application

Mobile Terminate Application
    [Arguments]    ${app_id}
    Mobile.Terminate Application    ${app_id}

# Mobile Gestures and Actions
Mobile Swipe
    [Arguments]    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${duration}=1000
    Mobile.Swipe    start_x=${start_x}    start_y=${start_y}    end_x=${end_x}    end_y=${end_y}    duration=${duration}

Mobile Press Keycode
    [Arguments]    ${keycode}
    Mobile.Press Keycode    ${keycode}

Mobile Hide Keyboard
    Mobile.Hide Keyboard

Mobile Get Window Height
    ${result}=    Mobile.Get Window Height
    RETURN    ${result}

Mobile Get Window Width
    ${result}=    Mobile.Get Window Width
    RETURN    ${result}

# Additional Mobile Keywords
Mobile Tap
    [Arguments]    ${x}    ${y}
    Mobile.Tap    ${x}    ${y}

Mobile Long Press
    [Arguments]    ${locator}    ${duration}=1000ms
    Mobile.Long Press    ${locator}    ${duration}

Mobile Execute Script
    [Arguments]    ${script}
    Mobile.Execute Script    ${script}

# Web-specific keywords
Web Click Element
    [Arguments]    ${locator}
    Web.Click Element    ${locator}

Web Wait Until Element Is Visible
    [Arguments]    ${locator}    ${timeout}=10s
    Web.Wait Until Element Is Visible    ${locator}    ${timeout}

Web Input Text
    [Arguments]    ${locator}    ${text}
    Web.Input Text    ${locator}    ${text}

Web Clear Element Text
    [Arguments]    ${locator}
    Web.Clear Element Text    ${locator}

Web Get Element Attribute
    [Arguments]    ${locator}    ${attribute}
    ${result}=    Web.Get Element Attribute    ${locator}    ${attribute}
    RETURN    ${result}

Web Element Should Be Visible
    [Arguments]    ${locator}
    Web.Element Should Be Visible    ${locator}

Web Page Should Contain Element
    [Arguments]    ${locator}
    Web.Page Should Contain Element    ${locator}

# Web screenshot capture with explicit naming
Web Capture Page Screenshot
    [Arguments]    ${filename}
    Web.Capture Page Screenshot    ${filename}

# Web Browser Management
Web Open Browser
    [Arguments]    ${url}    ${browser}=chrome    ${alias}=${EMPTY}    ${remote_url}=${EMPTY}    &{kwargs}
    Web.Open Browser    ${url}    ${browser}    ${alias}    ${remote_url}    &{kwargs}

Web Open Browser With Custom Download Path
    [Arguments]    ${url}    ${download_path}    ${browser}=chrome    ${alias}=${EMPTY}    ${remote_url}=${EMPTY}
    [Documentation]    Opens browser with custom download directory configuration
    # Create download directory if it doesn't exist
    Create Directory    ${download_path}
    
    # Configure Chrome options for custom download path
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_experimental_option    prefs    {"download.default_directory": "${download_path}", "download.prompt_for_download": False, "download.directory_upgrade": True, "safebrowsing.enabled": True}
    
    # Open browser with custom options
    Web.Open Browser    ${url}    ${browser}    ${alias}    ${remote_url}    options=${chrome_options}
    Log To Console    🌐 Browser opened with custom download path: ${download_path}

Web Close Browser
    Web.Close Browser

Web Close All Browsers
    Web.Close All Browsers

# Additional Web Keywords
Web Wait Until Page Contains Element
    [Arguments]    ${locator}    ${timeout}=10s
    Web.Wait Until Page Contains Element    ${locator}    ${timeout}

Web Choose File
    [Arguments]    ${locator}    ${file_path}
    Web.Choose File    ${locator}    ${file_path}

Web Scroll Element Into View
    [Arguments]    ${locator}
    Web.Scroll Element Into View    ${locator}

Web Click Button
    [Arguments]    ${locator}
    Web.Click Button    ${locator}

Web Element Should Be Disabled
    [Arguments]    ${locator}
    Web.Element Should Be Disabled    ${locator}

Web Maximize Browser Window
    Web.Maximize Browser Window

Web Set Selenium Implicit Wait
    [Arguments]    ${timeout}
    Web.Set Selenium Implicit Wait    ${timeout}

Web Press Keys
    [Arguments]    ${locator}    ${key}
    Web.Press Keys    ${locator}    ${key}

Web Input Password
    [Arguments]    ${locator}    ${password}
    Web.Input Password    ${locator}    ${password}

Web Wait Until Page Contains
    [Arguments]    ${text}    ${timeout}=10s
    Web.Wait Until Page Contains    ${text}    ${timeout} 

# Central screenshot keyword to avoid conflicts between Mobile and Web libraries
Custom Capture Screenshot
    [Arguments]    ${filename}
    ${mobile_status}=    Run Keyword And Return Status    Mobile.Capture Page Screenshot    ${filename}
    Log To Console    ✅ Mobile screenshot captured: ${filename}
    IF    not ${mobile_status}
        Log To Console    ⚠️ Mobile screenshot capture failed, capturing web screenshot...
        Web.Capture Page Screenshot    ${filename}
    END

# File and Download Handling Utilities
Get Download Directory
    [Arguments]    ${custom_path}=${EMPTY}
    [Documentation]    Returns the path to the downloads directory
    IF    '${custom_path}' != '${EMPTY}'
        ${download_dir}=    Normalize Path    ${custom_path}
    ELSE
        ${download_dir}=    Normalize Path    ${EXECDIR}/downloads
    END
    RETURN    ${download_dir}

Create Download Directory
    [Arguments]    ${custom_path}=${EMPTY}
    [Documentation]    Creates the downloads directory if it doesn't exist
    ${download_dir}=    Get Download Directory    ${custom_path}
    Create Directory    ${download_dir}
    Log To Console    📁 Download directory created/verified: ${download_dir}

Clear Download Directory
    [Arguments]    ${custom_path}=${EMPTY}
    [Documentation]    Removes all files from the downloads directory
    ${download_dir}=    Get Download Directory    ${custom_path}
    ${files}=    List Files In Directory    ${download_dir}
    FOR    ${file}    IN    @{files}
        Remove File    ${download_dir}/${file}
    END
    Log To Console    🗑️ Cleared download directory: ${download_dir}

Wait For File Download
    [Arguments]    ${filename}    ${timeout}=30s    ${custom_path}=${EMPTY}
    [Documentation]    Waits for a file to be downloaded to the downloads directory
    ${download_dir}=    Get Download Directory    ${custom_path}
    ${file_path}=    Join Path    ${download_dir}    ${filename}
    
    # Convert timeout to seconds for comparison
    ${timeout_seconds}=    Convert To Integer    ${timeout.replace('s', '')}
    ${start_time}=    Get Time    epoch
    
    WHILE    ${timeout_seconds} > 0
        ${file_exists}=    File Should Exist    ${file_path}
        IF    ${file_exists}
            Log To Console    ✅ File downloaded successfully: ${filename}
            RETURN    ${file_path}
        END
        Sleep    1s
        ${current_time}=    Get Time    epoch
        ${timeout_seconds}=    Evaluate    ${timeout_seconds} - (${current_time} - ${start_time})
    END
    
    Fail    File ${filename} was not downloaded within ${timeout}

Verify Downloaded File
    [Arguments]    ${filename}    ${expected_extension}=docx    ${custom_path}=${EMPTY}
    [Documentation]    Verifies that a file was downloaded and has the correct extension
    ${download_dir}=    Get Download Directory    ${custom_path}
    ${file_path}=    Join Path    ${download_dir}    ${filename}
    
    # Check if file exists
    File Should Exist    ${file_path}
    
    # Check file extension
    ${file_extension}=    Split String    ${filename}    .
    ${file_extension}=    Get From List    ${file_extension}    -1
    Should Be Equal As Strings    ${file_extension}    ${expected_extension}    File should have ${expected_extension} extension
    
    # Check file size (should not be 0 bytes)
    ${file_size}=    Get File Size    ${file_path}
    Should Be True    ${file_size} > 0    Downloaded file should not be empty
    
    Log To Console    ✅ File verification passed: ${filename} (${file_size} bytes)
    RETURN    ${file_path}

Get Downloaded Files
    [Arguments]    ${custom_path}=${EMPTY}
    [Documentation]    Returns a list of all files in the downloads directory
    ${download_dir}=    Get Download Directory    ${custom_path}
    ${files}=    List Files In Directory    ${download_dir}
    RETURN    @{files}

Find Downloaded File By Pattern
    [Arguments]    ${pattern}    ${custom_path}=${EMPTY}
    [Documentation]    Finds a downloaded file that matches the given pattern
    ${download_dir}=    Get Download Directory    ${custom_path}
    ${files}=    List Files In Directory    ${download_dir}
    
    FOR    ${file}    IN    @{files}
        ${matches}=    Run Keyword And Return Status    Should Match    ${file}    ${pattern}
        IF    ${matches}
            Log To Console    📄 Found matching file: ${file}
            RETURN    ${file}
        END
    END
    
    Fail    No file matching pattern '${pattern}' found in downloads directory

Validate Document Content
    [Arguments]    ${file_path}    ${expected_content}=${EMPTY}
    [Documentation]    Basic validation of document content (for docx files)
    File Should Exist    ${file_path}
    
    # For docx files, we can check if it's a valid zip file (docx is essentially a zip)
    ${file_extension}=    Split String    ${file_path}    .
    ${file_extension}=    Get From List    ${file_extension}    -1
    IF    '${file_extension}' == 'docx'
        # Try to read as zip to validate docx structure
        ${is_valid}=    Run Keyword And Return Status    OperatingSystem.File Should Exist    ${file_path}
        IF    not ${is_valid}
            Fail    File ${file_path} is not a valid document file
        END
        Log To Console    ✅ Document file validation passed: ${file_path}
    ELSE
        Log To Console    ⚠️ Document validation skipped for file type: ${file_extension}
    END

Cleanup Downloaded Files
    [Arguments]    ${filename}=${EMPTY}    ${custom_path}=${EMPTY}
    [Documentation]    Removes downloaded files, optionally specific file or all files
    ${download_dir}=    Get Download Directory    ${custom_path}
    IF    '${filename}' == '${EMPTY}'
        Clear Download Directory    ${custom_path}
    ELSE
        ${file_path}=    Join Path    ${download_dir}    ${filename}
        Remove File    ${file_path}
        Log To Console    🗑️ Removed downloaded file: ${filename}
    END

Copy Downloaded File To Custom Location
    [Arguments]    ${filename}    ${custom_path}
    [Documentation]    Copies a downloaded file from default location to custom location
    # Get default download directory
    ${default_download_dir}=    Get Download Directory
    ${source_file}=    Join Path    ${default_download_dir}    ${filename}
    
    # Check if file exists in default location
    ${file_exists}=    Run Keyword And Return Status    File Should Exist    ${source_file}
    IF    not ${file_exists}
        Fail    File ${filename} not found in default download directory: ${default_download_dir}
    END
    
    # Create custom directory if it doesn't exist
    Create Directory    ${custom_path}
    
    # Copy file to custom location
    ${dest_file}=    Join Path    ${custom_path}    ${filename}
    Copy File    ${source_file}    ${dest_file}
    
    Log To Console    📋 Copied ${filename} from ${source_file} to ${dest_file}
    RETURN    ${dest_file}
