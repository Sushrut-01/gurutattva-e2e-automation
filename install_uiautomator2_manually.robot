*** Settings ***
Library   Process
Library   OperatingSystem

*** Test Cases ***
Manual Install UiAutomator2 Server
    [Documentation]    Manually installs UiAutomator2 server APKs from Appium installation

    Log To Console    ${\n}===== Manual UiAutomator2 Server Installation =====

    # Find the APKs in Appium Server GUI installation
    ${appium_base}=    Set Variable    C:\\Program Files\\Appium Server GUI\\resources\\app\\node_modules

    # Try to find the UiAutomator2 server APKs
    @{possible_paths}=    Create List
    ...    ${appium_base}\\appium-uiautomator2-server\\apks
    ...    ${appium_base}\\appium\\node_modules\\appium-uiautomator2-server\\apks
    ...    ${appium_base}\\appium\\node_modules\\appium-uiautomator2-driver\\node_modules\\appium-uiautomator2-server\\apks

    ${server_apk}=    Set Variable    ${EMPTY}
    ${test_apk}=    Set Variable    ${EMPTY}

    FOR    ${path}    IN    @{possible_paths}
        ${exists}=    Run Keyword And Return Status    Directory Should Exist    ${path}
        IF    ${exists}
            Log To Console    Found APK directory: ${path}
            ${server_found}=    Run Keyword And Return Status    File Should Exist    ${path}\\appium-uiautomator2-server-v*.apk
            ${test_found}=    Run Keyword And Return Status    File Should Exist    ${path}\\appium-uiautomator2-server-debug-androidTest.apk

            IF    ${server_found} and ${test_found}
                # List files in the directory
                @{files}=    List Files In Directory    ${path}    appium-uiautomator2-server-v*.apk
                ${server_apk}=    Set Variable    ${path}\\${files[0]}
                ${test_apk}=    Set Variable    ${path}\\appium-uiautomator2-server-debug-androidTest.apk
                Log To Console    Server APK: ${server_apk}
                Log To Console    Test APK: ${test_apk}
                BREAK
            END
        END
    END

    IF    '${server_apk}' == '${EMPTY}'
        Log To Console    ERROR: Could not find UiAutomator2 server APKs in Appium installation
        Fail    UiAutomator2 server APKs not found
    END

    # Install the server APK
    Log To Console    ${\n}Installing UiAutomator2 server APK...
    ${result1}=    Run Process    adb    install    -r    -g    ${server_apk}    shell=True
    Log To Console    ${result1.stdout}
    Log To Console    ${result1.stderr}

    Sleep    2s

    # Install the test APK
    Log To Console    ${\n}Installing UiAutomator2 test APK...
    ${result2}=    Run Process    adb    install    -r    -g    ${test_apk}    shell=True
    Log To Console    ${result2.stdout}
    Log To Console    ${result2.stderr}

    Sleep    2s

    Log To Console    ${\n}===== UiAutomator2 Server Installation Completed =====
    Log To Console    Now you can set skipServerInstallation=true and run your tests.
