*** Settings ***
Library   Process

*** Test Cases ***
Cleanup UiAutomator2 Server
    [Documentation]    Uninstalls corrupted UiAutomator2 server APKs from emulator

    Log To Console    ${\n}===== Starting UiAutomator2 Server Cleanup =====

    # Uninstall UiAutomator2 server
    Log To Console    Uninstalling io.appium.uiautomator2.server...
    ${result1}=    Run Process    adb    uninstall    io.appium.uiautomator2.server    shell=True
    Log To Console    Result: ${result1.stdout}

    Sleep    2s

    # Uninstall UiAutomator2 server test
    Log To Console    Uninstalling io.appium.uiautomator2.server.test...
    ${result2}=    Run Process    adb    uninstall    io.appium.uiautomator2.server.test    shell=True
    Log To Console    Result: ${result2.stdout}

    Sleep    2s

    Log To Console    ${\n}===== UiAutomator2 Server Cleanup Completed =====
    Log To Console    ${\n}Please restart your Appium Server and then run your tests again.
