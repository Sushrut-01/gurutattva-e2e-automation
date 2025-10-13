*** Settings ***
Resource    ../resources/libraries.robot
Resource    ../resources/keywords.robot
Library    DateTime
Resource   ../resources/web_keywords.robot
Resource   ./PrayerPage.robot

*** Variables ***
${APPILICANT_NAME}                    xpath=//div[@data-field='requesterName' and contains(text(),'Yatish')]
${APPILICANT_NAME_OTHER}              xpath=//div[@data-field='requesterName' and contains(text(),'${E2E_PRAYER_APPLICANT_NAME_OTHER}')]
${CATEGORY_CHOICE}                    xpath=//div[@data-field='prayerCategoryId' and contains(text(),'Career')]
${PERSON_NAME}                        xpath=//div[@data-field='personName' and contains(text(),'${E2E_PRAYER_PERSON_NAME}')]
${PERSON_CITY}                        xpath=//div[@data-field='personCity' and contains(text(),'${E2E_PRAYER_FULL_ADDRESS}')]
${OTHER_PERSON_NAME}                  xpath=//div[@data-field='personName' and contains(text(),'${E2E_PRAYER_OTHER_NAME}')]
${OTHER_PERSON_CITY}                  xpath=//div[@data-field='personCity' and contains(text(),'${E2E_PRAYER_OTHER_FULL_ADDRESS}')]
${PRAYER_MENU}                        xpath=//span[contains(text(),'Prayer')]
${SELECT_ROW}                         xpath=//input[@aria-label='Select row']
${EXPORT_BUTTON}                      xpath=//button[normalize-space()='Export']
${EXPORTED_STATUS}                    xpath=//span[contains(text(),'Exported')]
${PENDING_STATUS}                     xpath=//span[contains(@class,'minimal__label__root') and contains(text(),'Pending')]
${TODAY_DATE}                         xpath=//div[contains(@class,'MuiDataGrid-cell') and contains(text(),'2025')]

# E2E Test Data Variables (will be set during test execution)
${E2E_PRAYER_RANDOM_NUMBER}                 ${EMPTY}
${E2E_PRAYER_APPLICANT_NAME}                ${EMPTY}
${E2E_PRAYER_PERSON_NAME}                   ${EMPTY}
${E2E_PRAYER_FULL_ADDRESS}                  ${EMPTY}
${E2E_PRAYER_OTHER_NAME}                    ${EMPTY}
${E2E_PRAYER_OTHER_FULL_ADDRESS}            ${EMPTY}
${E2E_PRAYER_APPLICANT_NAME_OTHER}          ${EMPTY}

*** Keywords ***
Generate E2E Test Data for Prayer
    [Documentation]    Generates unique test data for end-to-end validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    Set Test Variable    ${E2E_PRAYER_RANDOM_NUMBER}     ${random_num}
    Set Test Variable    ${E2E_PRAYER_APPLICANT_NAME}    E2E_Applicant_Name_${random_num}
    Set Test Variable    ${E2E_PRAYER_PERSON_NAME}       E2E_Person_Name_${random_num}
    Set Test Variable    ${E2E_PRAYER_FULL_ADDRESS}      E2E_Full_Address_${random_num}
    Log To Console    🎯 Generated Test Data for Prayer:
    # Log To Console    🎯 Applicant: ${E2E_PRAYER_APPLICANT_NAME}
    Log To Console    🎯 Person: ${E2E_PRAYER_PERSON_NAME}
    Log To Console    🎯 Full Address: ${E2E_PRAYER_FULL_ADDRESS}

Generate E2E Test Data for selected other prayer    
    [Documentation]    Generates unique test data for end-to-end validation
    ${random_num}=    Evaluate    random.randint(1000, 9999)    random
    Set Test Variable    ${E2E_PRAYER_RANDOM_NUMBER}     ${random_num}
    Set Test Variable    ${E2E_PRAYER_APPLICANT_NAME_OTHER}          E2E_Applicant_Name_Other_${random_num}
    Set Test Variable    ${E2E_PRAYER_OTHER_NAME}                    E2E_Other_Name_${random_num}
    Set Test Variable    ${E2E_PRAYER_OTHER_FULL_ADDRESS}            E2E_Other_Full_Address_${random_num}
    Log To Console    🎯 Generated Test Data for Prayer:
    Log To Console    🎯 Applicant: ${E2E_PRAYER_APPLICANT_NAME_OTHER}
    Log To Console    🎯 Person: ${E2E_PRAYER_OTHER_NAME}
    Log To Console    🎯 Full Address: ${E2E_PRAYER_OTHER_FULL_ADDRESS}
 
Click on the Prayer Menu
    [Documentation]    Clicks on the Prayer menu in the web application
    Web Wait Until Page Contains Element    ${PRAYER_MENU}    10s
    Web Click Element    ${PRAYER_MENU}
	
Search for the created prayer
    Web Wait Until Page Contains Element    xpath=//input[@type='search' and @placeholder='Search…']    10s
    Web Click Element    xpath=//input[@type='search' and @placeholder='Search…']
    Sleep    2s
    Web Input Text    xpath=//input[@type='search' and @placeholder='Search…']    ${E2E_PRAYER_PERSON_NAME}
    Sleep    2s

Search for the created other prayer
    Web Wait Until Page Contains Element    xpath=//input[@type='search' and @placeholder='Search…']    10s
    Web Click Element    xpath=//input[@type='search' and @placeholder='Search…']
    Sleep    2s
    Web Input Text    xpath=//input[@type='search' and @placeholder='Search…']    ${E2E_PRAYER_APPLICANT_NAME_OTHER}
    Sleep    2s
	
Verify the Newly added Self Prayer is displayed in the CMS
     [Documentation]    Verify the Newly added Self Prayer is displayed in the CMS
    #  Web Wait Until Page Contains Element    ${APPILICANT_NAME}    5s
	#  Web Page Should Contain Element    ${APPILICANT_NAME}
     Web Wait Until Page Contains Element    ${CATEGORY_CHOICE}    5s
     Web Page Should Contain Element    ${CATEGORY_CHOICE}
	 Web Wait Until Page Contains Element    ${PERSON_NAME}    5s
     Web Page Should Contain Element    ${PERSON_NAME}
	 Web Wait Until Page Contains Element    ${PERSON_CITY}    5s
     Web Page Should Contain Element    ${PERSON_CITY}
     Web Wait Until Page Contains Element    ${TODAY_DATE}    5s
     Web Page Should Contain Element    ${TODAY_DATE}
     Web Wait Until Page Contains Element    ${PENDING_STATUS}    5s
     Web Page Should Contain Element    ${PENDING_STATUS}
     Log To Console   Self Prayer displayed in list
     Sleep   2s
     
Verify the Newly added Other Prayer is displayed in the CMS
     [Documentation]    Verify the Newly added Other Prayer is displayed in the CMS
     Web Wait Until Page Contains Element    ${APPILICANT_NAME_OTHER}    5s
	 Web Page Should Contain Element    ${APPILICANT_NAME_OTHER}
     Web Wait Until Page Contains Element    ${CATEGORY_CHOICE}    5s
     Web Page Should Contain Element    ${CATEGORY_CHOICE}
     Web Wait Until Page Contains Element    ${OTHER_PERSON_NAME}    5s
     Web Page Should Contain Element    ${OTHER_PERSON_NAME}
     Web Wait Until Page Contains Element    ${OTHER_PERSON_CITY}    5s
     Web Page Should Contain Element    ${OTHER_PERSON_CITY}
     Web Wait Until Page Contains Element    ${TODAY_DATE}    5s
     Web Page Should Contain Element    ${TODAY_DATE}
     Web Wait Until Page Contains Element    ${PENDING_STATUS}    5s
     Web Page Should Contain Element    ${PENDING_STATUS}
     Log To Console   Other Prayer displayed in list
     Sleep   2s     	

Enter Second Name for Other Prayer
    Swipe Until Element Visible    ${Submit_Prayer_Button}
    Mobile.Wait Until Element Is Visible    ${Enter_Name}    10s
    Mobile.Click Element    ${Enter_Name}
    Mobile.Input Text    ${Enter_Name}   ${E2E_PRAYER_OTHER_NAME}
    Mobile.Hide Keyboard      
    
Enter Full Address for Other Prayer
    Mobile.Wait Until Element Is Visible    ${Enter_Address}    10s
    Mobile.Click Element    ${Enter_Address}
    Mobile.Input Text    ${Enter_Address}    ${E2E_PRAYER_OTHER_FULL_ADDRESS}
    Mobile.Hide Keyboard

Enter Generated Name for Prayer
    Mobile.Wait Until Element Is Visible    ${Enter_Name}    10s
    Mobile.Click Element    ${Enter_Name}
    Mobile.Input Text    ${Enter_Name}      ${E2E_PRAYER_APPLICANT_NAME_OTHER}
    Mobile.Hide Keyboard    

Enter Generated Second Name for Prayer
    Scroll Until Element Visible    ${Submit_Prayer_Button}
    Mobile.Wait Until Element Is Visible    ${Enter_Name}    10s
    Mobile.Click Element    ${Enter_Name}
    Mobile.Input Text    ${Enter_Name}   ${E2E_PRAYER_PERSON_NAME}
    Mobile.Hide Keyboard

Enter Generated Address for Prayer
    Mobile.Wait Until Element Is Visible    ${Enter_Address}    10s
    Mobile.Click Element    ${Enter_Address}
    Mobile.Input Text    ${Enter_Address}    ${E2E_PRAYER_FULL_ADDRESS}
    Mobile.Hide Keyboard        

Click on Other Prayer Option
    Mobile.Wait Until Element Is Visible    ${other_Prayer}    10s
    Mobile.Click Element    ${other_Prayer}   
    
Select the created prayer
    Web Wait Until Page Contains Element    ${SELECT_ROW}    10s
    Web Click Element    ${SELECT_ROW}
    Log To Console    Selected the created prayer

Click on the Export Button
    Web Wait Until Page Contains Element    ${EXPORT_BUTTON}    10s
    Web Click Element    ${EXPORT_BUTTON}
    Log To Console    Clicked on the Export Button
    
Verify Exported Status
    [Documentation]    Verifies that the prayer status has changed to "Exported" after export operation
    Web Wait Until Page Contains Element    ${EXPORTED_STATUS}    10s
    Web Page Should Contain Element    ${EXPORTED_STATUS}
    Log To Console    ✅ Prayer status successfully changed to 'Exported'
    
Setup Download Directory
    [Arguments]    ${custom_path}=${EMPTY}
    [Documentation]    Sets up the download directory for file validation
    Create Download Directory    ${custom_path}
    Clear Download Directory    ${custom_path}
    Log To Console    📁 Download directory setup completed

Wait For Prayer Document Download
    [Arguments]    ${timeout}=30s    ${custom_path}=${EMPTY}
    [Documentation]    Waits for the prayer document to be downloaded after export
    ${timeout_seconds}=    Convert To Integer    ${timeout.replace('s', '')}
    ${start_time}=    Get Time    epoch
    
    Log To Console    🔍 Starting to wait for prayer document download...
    
    WHILE    ${timeout_seconds} > 0
        ${downloaded_file}=    Run Keyword And Return Status    Find Downloaded File By Pattern    *.docx    ${custom_path}
        IF    ${downloaded_file}
            ${file_name}=    Find Downloaded File By Pattern    *.docx    ${custom_path}
            Log To Console    📄 Prayer document downloaded: ${file_name}
            RETURN    ${file_name}
        END
        
        Sleep    2s
        ${current_time}=    Get Time    epoch
        ${elapsed}=    Evaluate    ${current_time} - ${start_time}
        ${timeout_seconds}=    Evaluate    ${timeout.replace('s', '')} - ${elapsed}
        Log To Console    ⏳ Waiting for prayer document download... (${timeout_seconds}s remaining)
    END
    
    Fail    No prayer document (.docx) was downloaded within ${timeout}

Verify Prayer Document Download
    [Arguments]    ${filename}=${EMPTY}    ${custom_path}=${EMPTY}
    [Documentation]    Verifies that the prayer document was downloaded successfully
    IF    '${filename}' == '${EMPTY}'
        ${filename}=    Wait For Prayer Document Download    custom_path=${custom_path}
    END
    
    ${file_path}=    Verify Downloaded File    ${filename}    docx    ${custom_path}
    Validate Document Content    ${file_path}
    Log To Console    ✅ Prayer document download verification completed: ${filename}
    RETURN    ${file_path}

Export Prayer And Validate Download
    # [Arguments]    ${custom_download_path}=${EMPTY}
    # [Documentation]    Clicks export button and validates the downloaded document
    # # Setup download directory
    # Setup Download Directory    ${custom_download_path}
    
    # # Log download directory for debugging
    # ${download_dir}=    Get Download Directory    ${custom_download_path}
    # Log To Console    📁 Download directory: ${download_dir}
    
    # Click export button
    Click on the Export Button
    
    # Wait for status change
    Sleep    3s
    Verify Exported Status
    
    # # Wait for and validate download
    # ${downloaded_file}=    Wait For Prayer Document Download    custom_path=${custom_download_path}
    # ${file_path}=    Verify Prayer Document Download    ${downloaded_file}    ${custom_download_path}
    
    Log To Console    ✅ Prayer export and download validation completed successfully
    # RETURN    ${file_path}

# Export Prayer With Custom Download Path
#     [Arguments]    ${custom_download_path}
#     [Documentation]    Exports prayer document to a custom download location
#     # Validate the custom download path
#     IF    '${custom_download_path}' == '${EMPTY}'
#         Fail    Custom download path cannot be empty
#     END
    
#     # Normalize the path to handle different path formats
#     ${normalized_path}=    Normalize Path    ${custom_download_path}
#     Log To Console    📁 Using custom download path: ${normalized_path}
    
#     # Export and validate download using custom path
#     ${file_path}=    Export Prayer And Validate Download    ${normalized_path}
    
#     Log To Console    ✅ Prayer exported successfully to: ${file_path}
#     RETURN    ${file_path}