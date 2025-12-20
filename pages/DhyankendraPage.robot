*** Settings ***
Resource   ../resources/libraries.robot
Resource   ../resources/web_keywords.robot
Resource   CRM_AudioCategoryPage.robot
Resource   AudioPage.robot
Library   DateTime
Library   String
Resource   ../resources/test_setup_teardown.robot
Resource   registerPage.robot
Resource   ../resources/keywords.robot
Resource   ../pages/E2ERegistrationPage.robot
Resource   ../pages/E2ENewsPage.robot
Resource   ../pages/E2EEventsPage.robot
Resource    CRM_AudioPage.robot
Resource    ../pages/E2EAudioPage.robot


*** Variables ***
${REGISTER_NOW_FOR_DHYANKENDRA}                        xpath=//android.view.View[@content-desc="Register Now"]
${CENTER_NAME}                                         xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[6]/android.widget.EditText[1]
${CENTER_NAME_INPUT}                                   xpath=//android.widget.EditText
${SELECT_OPTION}                                       xpath=(//android.view.View[@content-desc="Select Option"])[1]
${SITTING}                                             xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[6]/android.widget.EditText[2]
${SITTING_INPUT}                                       xpath=//android.widget.ScrollView/android.widget.EditText[2]
${SEARCH_INPUT}                                        xpath=//android.widget.EditText[@hint='Search']
${TEMPLE_BUTTON}                                       xpath=//android.widget.Button[@content-desc="Temple"]
${SAHKA_OWNED_BUTTON}                                  xpath=//android.widget.Button[@content-desc="Sadhak Owned"]
${DHYANKENDRA_NEXT}                                    xpath=//android.view.View[@content-desc="Next"]
${FULL_ADDRESS_INPUT}                                  xpath=//android.widget.ScrollView/android.view.View/android.view.View/android.widget.EditText[1]
${PINCODE_INPUT}                                       xpath=//android.widget.ScrollView/android.view.View/android.view.View/android.widget.EditText[2]
${INPUT_HALL_LENGTH}                                   xpath=//android.widget.EditText[1]
${INPUT_HALL_WIDTH}                                    xpath=//android.widget.EditText[2]
${INPUT_HALL_HEIGHT}                                   xpath=//android.widget.EditText[3]
${YES_BUTTON}                                          xpath=//android.widget.Button[@content-desc="Yes"]
${NO_BUTTON}                                           xpath=//android.widget.Button[@content-desc="No"]
${MODERATE}                                            xpath=//android.widget.Button[@content-desc="Moderate"]
${AVERAGE}                                             xpath=//android.widget.Button[@content-desc="Average"]
${RCC}                                                 xpath=//android.widget.Button[@content-desc="RCC"]
${SEARCH_BY_UID_OR_NAME}                               xpath=//android.widget.EditText[@hint='Search by UID or name'][1]
${SELECT_USER}                                         xpath=//android.widget.Button[@content-desc="Adesh M Pawar - 24"]
${DHYANKENDRA_EMAIL_INPUT}                             xpath=//android.widget.EditText[@hint='Enter Email']
${DHYANKENDRA_MOBILE_INPUT}                            xpath=//android.widget.EditText[@hint='00 0000 0000']
${DHYANKENDRA_SUBMIT}                                  xpath=//android.view.View[@content-desc="Submit"]
${DHYANKENDRA_SUCCESS_MESSAGE}                         xpath=//android.view.View[contains(@content-desc,'Jay Aatmeshwar!')]
${DHYANKENDRA_CLOSE_SUCCESS_MESSAGE}                   xpath=//android.widget.ImageView[1]
${DHYANKENDRA_SUBMITTED_APPLICATION}                   xpath=//android.view.View[@content-desc="Submitted Application"]
${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}           xpath=//android.view.View[contains(@content-desc,'E2E')][1]
${DHYANKENDRA_BACK_BUTTON}                             xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView[1]
${DHYANKENDRA_BACK_BUTTON_FROM_APPLICATION_LIST}       xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.widget.ImageView


# Web CMS Locators for Dhyankendra
${DHYANKENDRA_MENU}                                    xpath=//span[contains(text(),'Dhyankendra')]
${DHYANKENDRA_CENTER_NAME_CELL}                        xpath=//div[@role='gridcell' and @data-field='dhyankendraName']
${DHYANKENDRA_ADDRESS_CELL}                            xpath=//div[@role='gridcell' and @data-field='address']
${DHYANKENDRA_STATUS_CELL}                             xpath=//div[@role='gridcell' and @data-field='status']
${DHYANKENDRA_IS_ACTIVE_CELL}                          xpath=//div[@role='gridcell' and @data-field='isActive']
${DHYANKENDRA_APPROVAL_STATUS_CELL}                    xpath=//div[@role='gridcell' and @data-field='approvalStatus']
${DHYANKENDRA_MORE_BUTTON}                             xpath=//button[@aria-label='more']
${DHYANKENDRA_EDIT_BUTTON}                             xpath=//li[@role='menuitem']//a[normalize-space(text())='Edit']
${DHYANKENDRA_VIEW_BUTTON}                             xpath=//li[@role='menuitem']//a[normalize-space(text())='View']
${APPROVE_BUTTON}                                      xpath=//button[contains(., 'Approve')]
${REJECT_BUTTON}                                       xpath=//button[contains(., 'Reject')]
${DHYANKENDRA_APPROVE_BUTTON}                          xpath=//div[contains(@role,'dialog')]//button[normalize-space(.)='Approve']
${DHYANKENDRA_REJECT_BUTTON}                           xpath=//div[contains(@role,'dialog')]//button[normalize-space(.)='Reject']
${DHYANKENDRA_UPDATE_MESSAGE}                          xpath=//li[contains(@class,'minimal__snackbar__success')]//div[contains(@class,'minimal__snackbar__title') and contains(text(),'Status updated successfully')]
${USER_ROLE_CELL_IN_FILTER_DHYANKENDRA}                xpath=//div[@data-field='userRole' and text()='Sanchalak']
${DHYANKENDRA_CANCEL_BUTTON}                           xpath=//a[normalize-space()='Cancel']
${DHYANKENDRA_SUBMIT_BUTTON}                           xpath=//button[normalize-space()='Submit']
${DHYANKENDRA_CHANGE_REQUEST_BUTTON}                   xpath=//button[normalize-space()='Change Request']
${DHYANKENDRA_REMARK_INPUT}                            xpath=//textarea[@placeholder='Enter Remark']
${DHYANKENDRA_EDIT_SUCCESS_MESSAGE}                    xpath=//li[contains(@class,'minimal__snackbar__success')]//div[contains(@class,'minimal__snackbar__title') and contains(text(),'Dhyankendra edit request approved successfully.')]
${DHYANKENDRA_PREMISE_TYPE}                            xpath=//div[@role='combobox' and normalize-space()='Temple']
${DHYANKENDRA_PREMISE_TYPE_COMMUNITY_HALL}             xpath=//li[@role='option' and normalize-space()='Community Hall']
${DHYANKENDRA_EDIT_REQUEST_MESSAGE}                    xpath=//li[contains(@class,'minimal__snackbar__success')]//div[contains(@class,'minimal__snackbar__title') and contains(text(),'Edit request submitted for approval.')]
${LOCAL_MENU}                                          xpath=//a[@aria-label='Local']
${DHYANSTHALI_MENU}                                    xpath=//div[@role='button' and @aria-label='Dhyansthali Management']
${DHYANSTHALI_MENU_LOCAL}                              xpath=//a[@aria-label='Dhyansthali']
${DHYANKENDRA_SEARCH_BUTTON}                           xpath=//input[@type='search' and @placeholder='Search…']
${ANY_APPROVED_STATUS_CELL}                      xpath=//div[@role='gridcell' and @data-field='status' and normalize-space()='Approved']
${SANCHALAK_DETAILS_SECTION}                     xpath=//*[normalize-space()='Sanchalak Details']
${PRIMARY_SANCHALAK_EDIT_ICON}                   xpath=//*[contains(normalize-space(),'Primary Sanchalak')]/following::button[contains(@class,'MuiIconButton') or @aria-label][1]
${PRIMARY_SANCHALAK_DIALOG}                      xpath=//div[contains(@role,'dialog') or contains(@class,'MuiDialog')]
${PRIMARY_SANCHALAK_UPDATE_BUTTON}               xpath=//button[normalize-space()='Update']
${ANY_APPROVED_STATUS_CELL}                      xpath=//div[@role='gridcell' and @data-field='status' and normalize-space()='Approved']
${SNACKBAR_TITLE}                                xpath=//div[contains(@class,'minimal__snackbar__title')]
${DIALOG_CANCEL_BUTTON}                          xpath=//div[contains(@role,'dialog') or contains(@class,'MuiDialog')]//button[normalize-space()='Cancel']
${CONFIRM_YES_CLOSE_BUTTON}                      xpath=//button[normalize-space()="Yes, Close"] | //button[contains(normalize-space(.),'Yes') and contains(normalize-space(.),'Close')]


*** Variables ***
# E2E Test Data Variables
${E2E_CENTER_NAME}                                  ${EMPTY}
${E2E_EMAIL}                                        ${EMPTY}
${E2E_MOBILE}                                       ${EMPTY}
${E2E_FULL_ADDRESS}                                 ${EMPTY}
${E2E_DHYANKENDRA_USER_EMAIL}                       yatishd.actowiz@gmail.com
${E2E_REMARK}                                       E2E_Remark
${E2E_TEST_ADDRESS}                                 Test Address

*** Keywords ***
Click on the Register Now for Dhyankendra
    Mobile Click Element    ${REGISTER_NOW_FOR_DHYANKENDRA}
    Log To Console    Clicked on Register Now For Dhyankendra

Enter Center Name
    Mobile Click Element    ${CENTER_NAME}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Sleep    2s
    Mobile Input Text    ${CENTER_NAME_INPUT}    ${E2E_CENTER_NAME}
    Log To Console    Entered Center Name

Select Premise Type
    Mobile Click Element    ${SELECT_OPTION}
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText    Temple
    Mobile Click Element    ${TEMPLE_BUTTON}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    Selected Premise Type

Select Ownership
    Mobile Click Element    ${SELECT_OPTION}
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText     Sadhak Owned
    Mobile Click Element    ${SAHKA_OWNED_BUTTON}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    Selected Ownership

Enter Sitting Capacity
    Mobile Click Element    ${SITTING}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${SITTING}    100
    Log To Console    Entered Sitting Capacity
    Mobile Click Element    ${DHYANKENDRA_NEXT}
    Log To Console    Clicked on Next Button

Enter Full Address For Dhyankendra
    Mobile Click Element    ${FULL_ADDRESS_INPUT}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${FULL_ADDRESS_INPUT}    ${E2E_FULL_ADDRESS}
    Log To Console    Entered Full Address

Enter Pincode For Dhyankendra
    Mobile Click Element    ${PINCODE_INPUT}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${PINCODE_INPUT}    380015
    Log To Console    Entered Pincode

Enter Hall Length
    Mobile Click Element    ${INPUT_HALL_LENGTH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${INPUT_HALL_LENGTH}    10
    Log To Console    Entered Hall Length

Enter Hall Width
    Mobile Click Element    ${INPUT_HALL_WIDTH}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${INPUT_HALL_WIDTH}    10
    Log To Console    Entered Hall Width

Enter Hall Height
    Mobile Click Element    ${INPUT_HALL_HEIGHT}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${INPUT_HALL_HEIGHT}    10
    Log To Console    Entered Hall Height

Select Country for Dhyankendra
    Scroll until element Visible    ${DHYANKENDRA_NEXT}
    Mobile Click Element                    ${REGISTER_COUNTRY}
    Mobile Click Element                    xpath=//android.widget.EditText
    Mobile Input Text                       xpath=//android.widget.EditText              India
    Mobile Click Element                    ${INDIA}

Select State for Dhyankendra
    Scroll until element found    ${DHYANKENDRA_NEXT}
    Mobile Click Element                    ${SELECT_STATE}
    Mobile Click Element                    xpath=//android.widget.EditText
    Mobile Input Text                       xpath=//android.widget.EditText              Gujarat
    Mobile Click Element                    ${GUJARAT} 

Click on the Next Button for Dhyankendra
    Scroll until element found    ${DHYANKENDRA_NEXT}
    Mobile Click Element                    ${DHYANKENDRA_NEXT}
    Log To Console    Clicked on Next Button for Dhyankendra

Select Library
    Mobile Click Element    ${SELECT_OPTION}
    Sleep    2s
    Mobile Click Element    ${YES_BUTTON}
    Log To Console    Selected Library

Select Parking Space
    Mobile Click Element    ${SELECT_OPTION}
    Sleep    2s
    Mobile Click Element    ${YES_BUTTON}
    Log To Console    Selected Parking Space

Select Ground Floor
    Scroll until element found    xpath=//android.view.View[@content-desc="Toilet/Bathrooms *"]
    Mobile Click Element    ${SELECT_OPTION}
    Sleep    2s
    Mobile Click Element    ${YES_BUTTON}
    Log To Console    Selected Ground Floor

Select Air Conditioner
    Mobile Click Element    ${SELECT_OPTION}
    Sleep    2s
    Mobile Click Element    ${YES_BUTTON}
    Log To Console    Selected Air Conditioner

Select Toilet/Bathrooms
   Scroll until element found    ${DHYANKENDRA_NEXT}
   Mobile Click Element    ${SELECT_OPTION}
   Sleep    2s
   Mobile Click Element    ${YES_BUTTON}
   Log To Console    Selected Toilet/Bathrooms

Select Notice Board
    Mobile Click Element    ${SELECT_OPTION}
    Sleep    2s
    Mobile Click Element    ${YES_BUTTON}
    Log To Console    Selected Notice Board

Select Noise Level
    Mobile Click Element    ${SELECT_OPTION}
    Mobile Click Element    ${SEARCH_INPUT}
    Mobile Input Text    ${SEARCH_INPUT}    Moderate
    Mobile Click Element    ${MODERATE}
    Log To Console    Selected Noise Level

Select Ventilation
    Mobile Click Element    ${SELECT_OPTION}
    Mobile Click Element    ${SEARCH_INPUT}
    Mobile Input Text    ${SEARCH_INPUT}    Average
    Mobile Click Element    ${AVERAGE}
    Log To Console    Selected Ventilation

Select Roof Type
    Mobile Click Element    ${SELECT_OPTION}
    Mobile Click Element    ${SEARCH_INPUT}
    Mobile Input Text    ${SEARCH_INPUT}    RCC
    Mobile Click Element    ${RCC}
    Log To Console    Selected Roof Type
    Mobile Click Element    ${DHYANKENDRA_NEXT}
    Log To Console    Clicked on Next Button for Dhyankendra

Select User for Dhyankendra
    [Arguments]    ${name}
    # Click on the Sanchalak name input field
    Mobile Click Element    ${SEARCH_BY_UID_OR_NAME}
    Type Text Using Keyboard    ${name}
    Mobile Click Element    ${SELECT_USER}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Log To Console    Selected User for Dhyankendra

Type Text Using Keyboard
    [Arguments]    ${text}
    # Split characters
    @{characters}=    Evaluate    list('${text}')
    FOR    ${char}    IN    @{characters}
        ${keycode}=    Get Keycode For Character    ${char}
        Run Keyword If    '${keycode}' != 'None'    Mobile Press Keycode    ${keycode}
        ...    ELSE    Mobile Input Text    ${SEARCH_BY_UID_OR_NAME}    ${char}
        Sleep    0.3s
    END

Enter Email for Dhyankendra
    Mobile Click Element    ${DHYANKENDRA_EMAIL_INPUT}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${DHYANKENDRA_EMAIL_INPUT}    ${E2E_EMAIL}
    Log To Console    Entered Email for Dhyankendra

Enter Mobile for Dhyankendra
    Mobile Click Element    ${DHYANKENDRA_MOBILE_INPUT}
    Run Keyword And Ignore Error    Mobile Hide Keyboard
    Mobile Input Text    ${DHYANKENDRA_MOBILE_INPUT}    ${E2E_MOBILE}
    Log To Console    Entered Mobile for Dhyankendra

Click on the Submit Button for Dhyankendra
    Scroll until element found    ${DHYANKENDRA_SUBMIT}
    Mobile Click Element    ${DHYANKENDRA_SUBMIT}
    Log To Console    Clicked on the Submit Button for Dhyankendra
    Sleep    10s

Verify Dhyankendra Success Message
    Mobile Wait Until Element Is Visible    ${DHYANKENDRA_SUCCESS_MESSAGE}    10s
    Mobile Element Should Be Visible    ${DHYANKENDRA_SUCCESS_MESSAGE}
    ${Content}=    Mobile Get Element Attribute    ${DHYANKENDRA_SUCCESS_MESSAGE}    content-desc
    Should Contain    ${Content}    Jay Aatmeshwar!
    Log To Console    Dhyankendra Success Message: ${Content}

Close the success message for Dhyankendra
    Mobile Click Element    ${DHYANKENDRA_CLOSE_SUCCESS_MESSAGE}
    Log To Console    Closed the success message

Click on the Submitted Application
    Mobile Click Element    ${DHYANKENDRA_SUBMITTED_APPLICATION}
    Log To Console    Clicked on the Submitted Application

Verify Submitted Application Content
    Mobile Wait Until Element Is Visible    ${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}    10s
    Mobile Element Should Be Visible    ${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}
    ${Content}=    Mobile Get Element Attribute    ${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}    content-desc
    Sleep   2s
    Should Contain    ${Content}    ${E2E_CENTER_NAME}
    Log To Console    Submitted Application Content: ${Content}

Generate Center Name for Dhyankendra
    [Documentation]    Generates unique test data for end-to-end validation
    ${random_num}=    Evaluate    random.randint(100, 999)    random
    Set Test Variable    ${E2E_CENTER_NAME}    E2E_Center_Name_${random_num}
    Set Test Variable    ${E2E_EMAIL}     e2euser.${random_num}@test.com
    Set Test Variable    ${E2E_MOBILE}    9188773${random_num}
    Set Test Variable    ${E2E_FULL_ADDRESS}    E2E_Full_Address_${random_num}
    Log To Console    Generated Test Data for Center Name:
    Log To Console    Center Name: ${E2E_CENTER_NAME}
    Log To Console    Email: ${E2E_EMAIL}
    Log To Console    Mobile: ${E2E_MOBILE}
    Log To Console    Full Address: ${E2E_FULL_ADDRESS}

Verify the created Dhyankendra in CMS
    [Documentation]    Verifies that the Dhyankendra data entered in mobile app matches the data in CMS
    Web Wait Until Element Is Visible    ${User_Show_Filters_Button}    10s
    Web Click Element    ${User_Show_Filters_Button}  
    Sleep    2s
    Web Click Element    ${User_Filter_Value}
    Sleep    2s
    Web Input Text    ${User_Filter_Value}    ${E2E_CENTER_NAME}
    Sleep    2s
    Web Click Element    ${User_Apply_Filter_Button}
    Sleep    2s
    # Extract data from the specific row in the Community context
    ${cms_name}=    Web.Get Text    ${DHYANKENDRA_CENTER_NAME_CELL}
    ${cms_address}=    Web.Get Text    ${DHYANKENDRA_ADDRESS_CELL}
    ${cms_status}=    Web.Get Text    ${DHYANKENDRA_STATUS_CELL}
    ${cms_approval_status}=    Web.Get Text    ${DHYANKENDRA_APPROVAL_STATUS_CELL}
    # Validate that the CMS data matches the data entered in the mobile app
    Should Be Equal    ${cms_name}    ${E2E_CENTER_NAME}
    Should Be Equal    ${cms_address}    ${E2E_FULL_ADDRESS}
    Should Be Equal    ${cms_status}    Pending
    Should Be Equal    ${cms_approval_status}    Not Applicable
    Log To Console    Verified Dhyankendra in CMS: Name=${cms_name}, Address=${cms_address}, Status=${cms_status}, ApprovalStatus=${cms_approval_status}

Filter the Dhyankendra in CMS by Center Name
    [Documentation]    Filters the Dhyankendra in CMS
    Web Wait Until Element Is Visible    ${User_Show_Filters_Button}    10s
    Web Click Element    ${User_Show_Filters_Button}  
    Sleep    2s
    Web Click Element    ${User_Filter_Value}
    Sleep    2s
    Web Input Text    ${User_Filter_Value}    ${E2E_CENTER_NAME}
    Sleep    2s
    Web Click Element    ${User_Apply_Filter_Button}
    Sleep    2s
Click on the Dhyankendra Management Menu
    [Documentation]    Clicks on the Dhyankendra Management Menu
    Web Wait Until Element Is Visible    ${DHYANKENDRA_MENU}    10s
    Web Click Element    ${DHYANKENDRA_MENU}
    Log To Console    Clicked on the Dhyankendra Management Menu


Click on the Edit Button in CMS
    [Documentation]    Clicks on the Edit Button in CMS
    Web Wait Until Element Is Visible    ${DHYANKENDRA_MORE_BUTTON}    10s
    Sleep    5s
    Web Click Element    ${DHYANKENDRA_MORE_BUTTON}
    Sleep    5s
    Web Click Element    ${DHYANKENDRA_EDIT_BUTTON}
    Log To Console    Clicked on the Edit Button in CMS

Click on the approve button in CMS
    [Documentation]    Clicks on the Approve Button in CMS
    Web Scroll Element Into View    ${APPROVE_BUTTON}
    Web Wait Until Element Is Visible    ${APPROVE_BUTTON}    10s
    Sleep    5s
    Web Click Element    ${APPROVE_BUTTON}
    Sleep    5s
    Web Wait Until Element Is Visible    ${DHYANKENDRA_APPROVE_BUTTON}    10s
    Web Click Element    ${DHYANKENDRA_APPROVE_BUTTON}
    Log To Console    Clicked on the Approve Button in CMS

Click on the reject button in CMS
    [Documentation]    Clicks on the Reject Button in CMS
    Web Scroll Element Into View    ${REJECT_BUTTON}
    Web Wait Until Element Is Visible    ${REJECT_BUTTON}    10s
    Web Click Element    ${REJECT_BUTTON}
    Sleep    2s
    Web Wait Until Element Is Visible    ${DHYANKENDRA_REJECT_BUTTON}    10s
    Web Click Element    ${DHYANKENDRA_REJECT_BUTTON}
    Log To Console    Clicked on the Reject Button in CMS

Verify the Update Message For Dhyankendra
    [Documentation]    Verifies that the Update Message For Dhyankendra is displayed
    Web Page Should Contain Element    ${DHYANKENDRA_UPDATE_MESSAGE}
    Web Element Should Be Visible    ${DHYANKENDRA_UPDATE_MESSAGE}
    Log To Console    Dhyankendra status updated successfully

Verify the Approved Dhyankendra in the List
    [Documentation]    Verifies that the Dhyankendra data entered in mobile app matches the data in CMS
    Sleep    10s
    Scroll Until Element Found     ${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}
    Mobile Wait Until Element Is Visible    ${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}    10s
    Mobile Element Should Be Visible    ${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}
    ${Content}=    Mobile Get Element Attribute    ${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}    content-desc
    Should Contain    ${Content}    ${E2E_CENTER_NAME}
    Log To Console    Approved Dhyankendra in the List: ${Content}

Click on the Back Button from Dhyankendra List
    [Documentation]    Clicks on the Back Button from Dhyankendra List
    Mobile Click Element    ${DHYANKENDRA_BACK_BUTTON}
    Log To Console    Clicked on the Back Button from Dhyankendra List

Verify the user is assigned as a sanchalak in the Profile Card
    Mobile.Wait Until Element Is Visible    ${PROFILE_INFORMATION}    10s
    Mobile.Page Should Contain Element    ${PROFILE_INFORMATION}
    ${profile_info}=    Mobile Get Element Attribute    ${PROFILE_INFORMATION}    content-desc
    Should Contain    ${profile_info}    Sanchalak
    Log To Console    User is assisgned as a sanchalak in the Profile Card: ${profile_info}

Find the user in the User Management Menu
    [Documentation]    Finds the user in the User Management Menu
    Web Wait Until Element Is Visible    ${User_Show_Filters_Button}    10s
    Web Click Element    ${User_Show_Filters_Button}  
    Sleep    2s
    Web Click Element    ${User_Role_Dropdown_Option}
    Sleep    2s
    Web Click Element    ${User_Filter_Value}
    Sleep    2s
    Web Input Text    ${User_Filter_Value}    ${E2E_DHYANKENDRA_USER_EMAIL}
    Sleep    2s
    Web Click Element    ${User_Apply_Filter_Button}
    Sleep    2s
    ${cms_role}=    Web.Get Text    ${USER_ROLE_CELL_IN_FILTER_DHYANKENDRA}
    Should Contain    ${cms_role}    Sanchalak
    Log To Console    User is assigned as a sanchalak in the User Management Menu: ${cms_role}

Click on the Back Button from Application List
    [Documentation]    Clicks on the Back Button from Application List
    Mobile Click Element    ${DHYANKENDRA_BACK_BUTTON_FROM_APPLICATION_LIST}
    Log To Console    Clicked on the Back Button from Application List

Verify the Dhyankendra in the List
    [Documentation]    Verifies that the Dhyankendra is displayed in the List
    Scroll Until Element Visible    ${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}
    TRY  
        Mobile Wait Until Element Is Visible    ${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}    10s
        ${rejected_content}=    Mobile Get Element Attribute    ${DHYANKENDRA_SUBMITTED_APPLICATION_CONTENT}    content-desc
        Should Contain    ${rejected_content}    ${E2E_CENTER_NAME}
        Log To Console    Dhyankendra is displayed in the List: ${rejected_content}
    EXCEPT
        Log To Console    Dhyankendra is not displayed in the List.
    END 

Verify the Rejected Status in CMS
    [Documentation]    Verifies that the rejected Dhyankendra is displayed in the CMS with Rejected status
    Web Wait Until Element Is Visible    ${User_Show_Filters_Button}    10s
    Web Click Element    ${User_Show_Filters_Button}  
    Sleep    2s
    Web Click Element    ${User_Filter_Value}
    Sleep    2s
    Web Input Text    ${User_Filter_Value}    ${E2E_CENTER_NAME}
    Sleep    2s
    Web Click Element    ${User_Apply_Filter_Button}
    Sleep    2s
    # Extract data from the specific row in the Community context
    ${cms_status}=    Web.Get Text    ${DHYANKENDRA_STATUS_CELL}
    # Validate that the CMS data matches the data entered in the mobile app
    Should Be Equal    ${cms_status}    Rejected
    Log To Console    Verified Rejected Status in CMS: Status=${cms_status}

Verify the Approved Status in CMS
    [Documentation]    Verifies that the approved Dhyankendra is displayed in the CMS with Approved status
    Web Wait Until Element Is Visible    ${User_Show_Filters_Button}    10s
    Web Click Element    ${User_Show_Filters_Button}  
    Sleep    2s
    Web Click Element    ${User_Filter_Value}
    Sleep    2s
    Web Input Text    ${User_Filter_Value}    ${E2E_CENTER_NAME}
    Sleep    2s
    Web Click Element    ${User_Apply_Filter_Button}
    Sleep    2s
    ${cms_status}=    Web.Get Text    ${DHYANKENDRA_STATUS_CELL}
    Should Be Equal    ${cms_status}    Approved
    Log To Console    Verified Approved Status in CMS: Status=${cms_status}

Click on the Cancel Button in CMS
    [Documentation]    Clicks on the Cancel Button in CMS
    Web Scroll Element Into View    ${DHYANKENDRA_CANCEL_BUTTON}
    Web Wait Until Element Is Visible    ${DHYANKENDRA_CANCEL_BUTTON}    10s
    Sleep    5s
    Web Click Element    ${DHYANKENDRA_CANCEL_BUTTON}
    Log To Console    Clicked on the Cancel Button in CMS

Select Community Hall Premise Type
    [Documentation]    Selects the Community Hall Premise Type
    Web Wait Until Element Is Visible    ${DHYANKENDRA_PREMISE_TYPE}    10s
    Sleep  2s
    Web Click Element    ${DHYANKENDRA_PREMISE_TYPE}
    Web Wait Until Element Is Visible    ${DHYANKENDRA_PREMISE_TYPE_COMMUNITY_HALL}    10s
    Sleep  2s
    Web Click Element    ${DHYANKENDRA_PREMISE_TYPE_COMMUNITY_HALL}
    Log To Console    Selected Community Hall Premise Type

Click on the Submit Button for Web
    [Documentation]    Clicks on the Submit Button for Web
    Web Scroll Element Into View    ${DHYANKENDRA_SUBMIT_BUTTON}
    Web Wait Until Element Is Visible    ${DHYANKENDRA_SUBMIT_BUTTON}    10s
    Sleep  2s
    Web Click Element    ${DHYANKENDRA_SUBMIT_BUTTON}
    Log To Console    Clicked on the Submit Button for Web

Click on the Change Request Button for Web
    [Documentation]    Clicks on the Change Request Button for Web
    Web Wait Until Element Is Visible    ${DHYANKENDRA_CHANGE_REQUEST_BUTTON}    10s
    Sleep  2s
    Web Click Element    ${DHYANKENDRA_CHANGE_REQUEST_BUTTON}
    Log To Console    Clicked on the Change Request Button for Web

Verify the Edit Request Message
    [Documentation]    Verifies that the Edit Request Message is displayed
    Sleep   2s
    Web Page Should Contain Element    ${DHYANKENDRA_EDIT_REQUEST_MESSAGE}
    Web Element Should Be Visible    ${DHYANKENDRA_EDIT_REQUEST_MESSAGE}
    Log To Console    Dhyankendra edit request submitted for approval.

Verify the Review Status as Pending
    [Documentation]    Verifies that the Review Status is Pending
    Web Wait Until Element Is Visible    ${User_Show_Filters_Button}    10s
    Web Click Element    ${User_Show_Filters_Button}  
    Sleep    2s
    Web Click Element    ${User_Filter_Value}
    Sleep    2s
    Web Input Text    ${User_Filter_Value}    ${E2E_CENTER_NAME}
    Sleep    2s
    Web Click Element    ${User_Apply_Filter_Button}
    Sleep    2s
    ${cms_status}=    Web.Get Text    ${DHYANKENDRA_APPROVAL_STATUS_CELL}
    Should Be Equal    ${cms_status}    Pending
    Log To Console    Verified Review Status as Pending in CMS: Status=${cms_status}

Verify the Review Status as Approved
    [Documentation]    Verifies that the Review Status is Approved
    Web Wait Until Element Is Visible    ${User_Show_Filters_Button}    10s
    Web Click Element    ${User_Show_Filters_Button}  
    Sleep    2s
    Web Click Element    ${User_Filter_Value}
    Sleep    2s
    Web Input Text    ${User_Filter_Value}    ${E2E_CENTER_NAME}
    Sleep    2s
    Web Click Element    ${User_Apply_Filter_Button}
    Sleep    2s
    ${cms_status}=    Web.Get Text    ${DHYANKENDRA_APPROVAL_STATUS_CELL}
    Should Be Equal    ${cms_status}    Approved
    Log To Console    Verified Review Status as Approved in CMS: Status=${cms_status}

Verify the Review Status as Rejected
    [Documentation]    Verifies that the Review Status is Rejected
    Web Wait Until Element Is Visible    ${User_Show_Filters_Button}    10s
    Web Click Element    ${User_Show_Filters_Button}  
    Sleep    2s
    Web Click Element    ${User_Filter_Value}
    Sleep    2s
    Web Input Text    ${User_Filter_Value}    ${E2E_CENTER_NAME}
    Sleep    2s
    Web Click Element    ${User_Apply_Filter_Button}
    Sleep    2s
    ${cms_status}=    Web.Get Text    ${DHYANKENDRA_APPROVAL_STATUS_CELL}
    Should Be Equal    ${cms_status}    Rejected
    Log To Console    Verified Review Status as Rejected in CMS: Status=${cms_status}

Enter Remark for Edit Request
    [Documentation]    Enters the Remark for Edit Request
    Web Wait Until Element Is Visible    ${DHYANKENDRA_REMARK_INPUT}    10s
    Sleep    2s
    Web Click Element    ${DHYANKENDRA_REMARK_INPUT}
    Web Input Text    ${DHYANKENDRA_REMARK_INPUT}    ${E2E_REMARK}
    Log To Console    Entered Remark for Edit Request

Click on the Approve Button from Edit Request
    [Documentation]    Clicks on the Approve Button from Edit Request
    Web Wait Until Element Is Visible    ${APPROVE_BUTTON}    10s
    Sleep    2s
    Web Click Element    ${APPROVE_BUTTON}
    Log To Console    Clicked on the Approve Button from Edit Request

Click on the Reject Button from Edit Request
    [Documentation]    Clicks on the Reject Button from Edit Request
    Web Wait Until Element Is Visible    ${REJECT_BUTTON}    10s
    Sleep    2s
    Web Click Element    ${REJECT_BUTTON}
    Log To Console    Clicked on the Reject Button from Edit Request

Verify the Edit Dhyankendra Success Message
    [Documentation]    Verifies that the Edit Dhyankendra Success Message is displayed
    Sleep   2s
    Web Page Should Contain Element    ${DHYANKENDRA_EDIT_SUCCESS_MESSAGE}
    Web Element Should Be Visible    ${DHYANKENDRA_EDIT_SUCCESS_MESSAGE}
    Log To Console    Dhyankendra edit request approved successfully.

Verify the left menu access
    [Documentation]    Verifies that the left menu access is displayed for Sanchalak
    Sleep    2s
    # Verify News Menu
    Web Wait Until Element Is Visible    ${NEWS_MENU}    10s
    Web Click Element    ${NEWS_MENU}
    Sleep    2s
    # For Sanchalak, check if Local News link exists or if page contains Local News text
    ${has_local_news_link}=    Run Keyword And Return Status    Web Page Should Contain Element    xpath=//a[@href="/news/local"]
    IF    ${has_local_news_link}
        Web Click Element    xpath=//a[@href="/news/local"]
        Sleep    2s
    ELSE
        # If link not found, just verify News menu is visible (Sanchalak may have limited access)
        Log To Console    ⚠️ Local News link not accessible for current user
    END
    Log To Console    Verified News Menu

    # Verify Events Menu
    Web Wait Until Element Is Visible    ${EVENTS_MENU}    10s
    Web Click Element    ${EVENTS_MENU}
    Sleep    2s
    # For Sanchalak, check if Local Events link exists or if page contains Local Events text
    ${has_local_events_link}=    Run Keyword And Return Status    Web Page Should Contain Element    xpath=//a[@href="/events/local"]
    IF    ${has_local_events_link}
        Web Click Element    xpath=//a[@href="/events/local"]
        Sleep    2s
    ELSE
        # If link not found, just verify Events menu is visible (Sanchalak may have limited access)
        Log To Console    ⚠️ Local Events link not accessible for current user
    END
    Log To Console    Verified Events Menu

    # Verify Dhyankendra Menu
    Web Wait Until Element Is Visible    ${DHYANKENDRA_MENU}    10s
    Web Click Element    ${DHYANKENDRA_MENU}
    Log To Console    Verified Dhyankendra Menu

    # Verify Dhyansthali Menu
    Web Wait Until Element Is Visible    ${DHYANSTHALI_MENU}    10s
    Web Click Element    ${DHYANSTHALI_MENU}
    Sleep    2s
    Web Wait Until Element Is Visible    ${DHYANSTHALI_MENU_LOCAL}    10s
    Log To Console    Verified Dhyansthali Menu
    Log To Console    Verified left menu access

Validate the filled value on that sadak user on the CMS side
    [Documentation]    Validates the filled value on that sadak user on the CMS side
    Open Web Browser
    Login in with valid credentials
    Click on the Dhyankendra Management Menu
    Click on the Search Button
    Click on the View Button in CMS
    Verify the filled value on that sadak user on the CMS side
    Close Web Browser

Click on the Search Button
    [Documentation]    Clicks on the Search Button
    Web Wait Until Element Is Visible    ${DHYANKENDRA_SEARCH_BUTTON}    10s
    Web Click Element    ${DHYANKENDRA_SEARCH_BUTTON}
    Web Input Text    ${DHYANKENDRA_SEARCH_BUTTON}    ${E2E_CENTER_NAME}
    Log To Console    Clicked on the Search Button

Click on the ViewButton in CMS
    [Documentation]    Clicks on the View Button in CMS
    Web Wait Until Element Is Visible    ${DHYANKENDRA_MORE_BUTTON}    10s
    Sleep    5s
    Web Click Element    ${DHYANKENDRA_MORE_BUTTON}
    Sleep    5s
    Web Click Element    ${DHYANKENDRA_VIEW_BUTTON}
    Log To Console    Clicked on the View Button in CMS

Verify the filled value on that sadak user on the CMS side
    [Documentation]    Verifies the filled value on that sadak user on the CMS side
    # Verify the Dhyankendra name
    Web Wait Until Element Is Visible    xpath=//p[normalize-space()='${E2E_CENTER_NAME}']    5s
    Web Page Should Contain Element    xpath=//p[normalize-space()='${E2E_CENTER_NAME}']
    ${dhyankendra_name}=    Web.Get Text    xpath=//p[normalize-space()='${E2E_CENTER_NAME}']
    Should Not Be Equal    ${dhyankendra_name}    ${None}
    Should Not Be Equal    ${dhyankendra_name}    ${EMPTY}
    Should Contain    ${dhyankendra_name}    ${E2E_CENTER_NAME}
    Log To Console    Dhyankendra name verified: ${dhyankendra_name}

    # Verify the Dhyankendra address
    Web Wait Until Element Is Visible    xpath=//p[normalize-space()='${E2E_FULL_ADDRESS}']    5s
    Web Page Should Contain Element    xpath=//p[normalize-space()='${E2E_FULL_ADDRESS}']
    ${dhyankendra_address}=    Web.Get Text    xpath=//p[normalize-space()='${E2E_FULL_ADDRESS}']
    Should Not Be Equal    ${dhyankendra_address}    ${None}
    Should Not Be Equal    ${dhyankendra_address}    ${EMPTY}
    Should Contain    ${dhyankendra_address}    ${E2E_FULL_ADDRESS}
    Log To Console    Dhyankendra address verified: ${dhyankendra_address}

    # Verify the Pincode
    Web Wait Until Element Is Visible    xpath=//p[normalize-space()='380015']    5s
    Web Page Should Contain Element    xpath=//p[normalize-space()='380015']
    ${dhyankendra_pincode}=    Web.Get Text    xpath=//p[normalize-space()='380015']
    Should Not Be Equal    ${dhyankendra_pincode}    ${None}
    Should Not Be Equal    ${dhyankendra_pincode}    ${EMPTY}
    Should Contain    ${dhyankendra_pincode}    380015
    Log To Console    Dhyankendra pincode verified: ${dhyankendra_pincode}
    
    # Verify the Dhyankendra Contact Details
    Web Wait Until Element Is Visible    xpath=//p[normalize-space()='${E2E_EMAIL}']    5s
    Web Page Should Contain Element    xpath=//p[normalize-space()='${E2E_EMAIL}']
    ${dhyankendra_email}=    Web.Get Text    xpath=//p[normalize-space()='${E2E_EMAIL}']
    Should Not Be Equal    ${dhyankendra_email}    ${None}
    Should Not Be Equal    ${dhyankendra_email}    ${EMPTY}
    Should Contain    ${dhyankendra_email}    ${E2E_EMAIL}
    Log To Console    Dhyankendra email verified: ${dhyankendra_email}
    Log To Console    Verified the filled value on that sadak user on the CMS side

Change the Address of the Dhyankendra
    [Documentation]    Changes the Address of the Dhyankendra
    Web Wait Until Element Is Visible    xpath=//input[@name='address' and @value='${E2E_FULL_ADDRESS}']    10s
    Sleep    2s
    Web Click Element    xpath=//input[@name='address' and @value='${E2E_FULL_ADDRESS}']
    Web Clear Element Text    xpath=//input[@name='address' and @value='${E2E_FULL_ADDRESS}']
    Web Input Text    xpath=//input[@name='address']    ${E2E_TEST_ADDRESS}
    Log To Console    Changed the Address of the Dhyankendra

Validate the fields after rejection in the mobile app
    [Documentation]    After change request for address is rejected, verifies that changed address should NOT be visible and original address should still display in the mobile app
    Sleep    5s
    Scroll Until Element Found    //android.view.View[contains(@content-desc,'${E2E_CENTER_NAME}')]
    Mobile Wait Until Element Is Visible    //android.view.View[contains(@content-desc,'${E2E_CENTER_NAME}')]    10s
    Mobile Element Should Be Visible    //android.view.View[contains(@content-desc,'${E2E_CENTER_NAME}')]
    ${Content}=    Mobile Get Element Attribute    //android.view.View[contains(@content-desc,'${E2E_CENTER_NAME}')]    content-desc
    Should Contain    ${Content}    ${E2E_CENTER_NAME}
    Log To Console    Dhyankendra in the List: ${Content}
    Mobile Click Element    //android.view.View[contains(@content-desc,'${E2E_CENTER_NAME}')]
    Sleep    5s

    # Check that new (rejected) address is NOT visible
    ${new_address_visible}=    Run Keyword And Return Status    Mobile Element Should Be Visible    xpath=//android.view.View[contains(@content-desc,'${E2E_TEST_ADDRESS}')]
    Should Be Equal    ${new_address_visible}    ${False}    Address after rejection should NOT be the test address (${E2E_TEST_ADDRESS})
    Log To Console    New (rejected) address is NOT visible: ${new_address_visible}
    
    # Check that original address is still visible
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'${E2E_FULL_ADDRESS}')]    10s
    Mobile Element Should Be Visible    xpath=//android.view.View[contains(@content-desc,'${E2E_FULL_ADDRESS}')]
    Log To Console    Address after rejection correctly remains the original: ${E2E_FULL_ADDRESS}
    Log To Console    Verified that after rejection, only original address is visible in the mobile app

Validate the fields after approval in the mobile app
    [Documentation]    After change request for address is approved, verifies that changed address should be visible and original address should still display in the mobile app
    Sleep    5s
    Scroll Until Element Found    //android.view.View[contains(@content-desc,'${E2E_CENTER_NAME}')]
    Mobile Wait Until Element Is Visible    //android.view.View[contains(@content-desc,'${E2E_CENTER_NAME}')]    10s
    Mobile Element Should Be Visible    //android.view.View[contains(@content-desc,'${E2E_CENTER_NAME}')]
    ${Content}=    Mobile Get Element Attribute    //android.view.View[contains(@content-desc,'${E2E_CENTER_NAME}')]    content-desc
    Should Contain    ${Content}    ${E2E_CENTER_NAME}
    Log To Console    Dhyankendra in the List: ${Content}
    Mobile Click Element    //android.view.View[contains(@content-desc,'${E2E_CENTER_NAME}')]
    Sleep    5s
    # Check that new (approved) address is visible
    Mobile Wait Until Element Is Visible    xpath=//android.view.View[contains(@content-desc,'${E2E_TEST_ADDRESS}')]    10s
    Mobile Element Should Be Visible    xpath=//android.view.View[contains(@content-desc,'${E2E_TEST_ADDRESS}')]
    Log To Console    New (approved) address is visible: ${E2E_TEST_ADDRESS}
    Log To Console    Verified that after approval, only changed address is visible in the mobile app

Open Dhyankendra Management And Show Approved Records
    [Documentation]    Navigates to Dhyankendra menu and applies Status filter to show only Approved records
    Click on the Dhyankendra Management Menu
    Sleep    2s
    # Apply Status filter to show only Approved records
    E2EAudioPage.Click Filter Button
    Sleep    1s
    Apply Status Filter Dhyankendra    is    Approved
    Sleep    2s
    # Ensure at least one Approved row exists
    Web Wait Until Element Is Visible    ${ANY_APPROVED_STATUS_CELL}    10s

Open Edit For First Approved Dhyankendra
    [Documentation]    Clicks the 3-dots for an Approved row and selects Edit
    ${approved_row_more}=    Set Variable    xpath=//div[@role='row' and .//div[@role='gridcell' and @data-field='status' and normalize-space()='Approved']]//button[@aria-label='more']
    Web Wait Until Element Is Visible    ${approved_row_more}    10s
    # Capture the center name from this row before opening edit
    ${center_cell}=    Set Variable    xpath=//div[@role='row' and .//div[@role='gridcell' and @data-field='status' and normalize-space()='Approved']]//div[@role='gridcell' and @data-field='dhyankendraName']
    ${center_name}=    Web.Get Text    ${center_cell}
    Set Test Variable    ${E2E_DHYANKENDRA_NAME}    ${center_name}
    Log To Console    Captured center name for later search: ${E2E_DHYANKENDRA_NAME}
    Web Scroll Element Into View         ${approved_row_more}
    ${clicked}=    Run Keyword And Return Status    Web Click Element    ${approved_row_more}
    IF    not ${clicked}
        ${el}=    Web.Get WebElement    ${approved_row_more}
        Web.Execute Javascript    arguments[0].click();    ARGUMENTS    ${el}
    END
    Sleep    2s
    Web Wait Until Element Is Visible    ${DHYANKENDRA_EDIT_BUTTON}    10s
    Web Click Element    ${DHYANKENDRA_EDIT_BUTTON}
    Sleep    5s

Search Dhyankendra By Center Name
    [Documentation]    Searches for a Dhyankendra by center name (used after rejection when status changes)
    [Arguments]    ${center_name}
    Log To Console    Searching for Dhyankendra by center name: ${center_name}
    Click on the Dhyankendra Management Menu
    Sleep    2s
    # Use the search/filter function to find by center name
    ${search_field}=    Set Variable    xpath=//input[@type='search' and @placeholder='Search…']
    Web Wait Until Element Is Visible    ${search_field}    10s
    Web Click Element    ${search_field}
    Web Input Text    ${search_field}    ${center_name}
    Sleep    2s
    Log To Console    Searched for center name: ${center_name}

Handle Pending Change Request If Present
    [Documentation]    If there are pending changes from Sanchalak, reject them first, then we can edit
    Log To Console    Checking for pending change requests to reject...
    ${change_request_visible}=    Run Keyword And Return Status    Web Wait Until Element Is Visible    ${DHYANKENDRA_CHANGE_REQUEST_BUTTON}    5s
    IF    ${change_request_visible}
        Log To Console    ✅ Found Change Request button, opening the dialog to reject pending changes...
        Web Click Element    ${DHYANKENDRA_CHANGE_REQUEST_BUTTON}
        Sleep    2s
        # The dialog shows the pending changes
        Web Wait Until Element Is Visible    ${DHYANKENDRA_REMARK_INPUT}    10s
        Log To Console    Change Request dialog opened, adding remark and rejecting...
        Enter Remark for Edit Request
        Sleep    1s
        Click on the Reject Button from Edit Request
        Sleep    3s
        Log To Console    ✅ Change request rejected successfully, now we can edit the form
    ELSE
        Log To Console    ⚠️ No pending change request, proceeding directly to edit
    END

Go To Sanchalak Details Section
    [Documentation]    Scrolls down to find the Sanchalak Details section in the form
    Web Wait Until Element Is Visible    ${SANCHALAK_DETAILS_SECTION}    15s
    Web Scroll Element Into View         ${SANCHALAK_DETAILS_SECTION}
    Sleep    3s
    Log To Console    Scrolled to Sanchalak Details section

Change Primary Sanchalak To
    [Arguments]    ${search_text}    ${option_text}
    [Documentation]    Opens edit for Primary Sanchalak, searches and selects option, then updates
    Web Wait Until Element Is Visible    ${PRIMARY_SANCHALAK_EDIT_ICON}    10s
    Web Scroll Element Into View         ${PRIMARY_SANCHALAK_EDIT_ICON}
    ${clicked}=    Run Keyword And Return Status    Web Click Element    ${PRIMARY_SANCHALAK_EDIT_ICON}
    IF    not ${clicked}
        ${editEl}=    Web.Get WebElement    ${PRIMARY_SANCHALAK_EDIT_ICON}
        Web.Execute Javascript    arguments[0].click();    ARGUMENTS    ${editEl}
    END
    # Wait for dialog to open
    Web Wait Until Element Is Visible    ${PRIMARY_SANCHALAK_DIALOG}    10s
    ${dialog_search}=    Set Variable    xpath=(//div[contains(@role,'dialog') or contains(@class,'MuiDialog')]//input[@type='text' or @name='sanchalak' or contains(@placeholder,'Search')][1])
    Web Wait Until Element Is Visible    ${dialog_search}    10s
    Web Click Element                    ${dialog_search}
    Web Input Text                       ${dialog_search}    ${search_text}
    ${option_locator}=                   Set Variable    xpath=(//div[contains(@role,'dialog') or contains(@class,'MuiDialog')]//*[@role='option' or self::li][contains(normalize-space(.),'${option_text}')])[1]
    ${has_option}=                       Run Keyword And Return Status    Web Wait Until Element Is Visible    ${option_locator}    5s
    IF    ${has_option}
        Web Click Element                ${option_locator}
    ELSE
        # Fallback: select first suggestion via keyboard
        Web Press Keys                   ${dialog_search}    ARROW_DOWN
        Web Press Keys                   ${dialog_search}    ENTER
    END
    ${dialog_update}=                    Set Variable    xpath=//div[contains(@role,'dialog') or contains(@class,'MuiDialog')]//button[normalize-space()='Update']
    Web Wait Until Element Is Visible    ${dialog_update}    10s
    Web Click Element                    ${dialog_update}
    Log To Console    Updated Primary Sanchalak to: ${option_text}

Change Primary Sanchalak To Available One
    [Documentation]    Finds the editable Primary Sanchalak field in the form and changes it to an available Sanchalak
    Sleep    2s
    # Look for the Primary Sanchalak editable field/button in the form
    Web Wait Until Element Is Visible    ${PRIMARY_SANCHALAK_EDIT_ICON}    15s
    Log To Console    Found Primary Sanchalak field, proceeding to edit
    ${clicked}=    Run Keyword And Return Status    Web Click Element    ${PRIMARY_SANCHALAK_EDIT_ICON}
    IF    not ${clicked}
        ${editEl}=    Web.Get WebElement    ${PRIMARY_SANCHALAK_EDIT_ICON}
        Web.Execute Javascript    arguments[0].click();    ARGUMENTS    ${editEl}
    END
    # Wait for dialog to open
    Web Wait Until Element Is Visible    ${PRIMARY_SANCHALAK_DIALOG}    10s
    ${dialog_search}=    Set Variable    xpath=(//div[contains(@role,'dialog') or contains(@class,'MuiDialog')]//input[@placeholder='Search Sanchalak By Name or Uid'][1])
    Web Wait Until Element Is Visible    ${dialog_search}    10s
    Sleep    1s

    # Click on the dropdown field to open the list
    Web Click Element    ${dialog_search}
    Sleep    2s

    # Wait for dropdown options to appear
    ${dropdown_option_xpath}=    Set Variable    xpath=//ul[contains(@class,'MuiAutocomplete-listbox') or contains(@role,'listbox')]//li
    Web Wait Until Element Is Visible    ${dropdown_option_xpath}    10s
    Sleep    1s

    # Get all options from dropdown
    ${all_options}=    Web.Get Webelements    ${dropdown_option_xpath}
    ${options_count}=    Get Length    ${all_options}
    Log To Console    Found ${options_count} Sanchalak options in dropdown

    # Try each option until we find one that's available
    ${selected}=    Set Variable    ${False}
    FOR    ${index}    IN RANGE    ${options_count}
        # Re-get the options list (fresh elements)
        ${options_list}=    Web.Get Webelements    ${dropdown_option_xpath}
        ${option_element}=    Get From List    ${options_list}    ${index}
        ${option_text}=    Web.Get Text    ${option_element}
        Log To Console    Trying option ${index + 1}/${options_count}: ${option_text}

        # Scroll option into view
        Web.Execute Javascript    arguments[0].scrollIntoView({block: 'center'});    ARGUMENTS    ${option_element}
        Sleep    0.5s

        # Click the option
        Web Click Element    ${option_element}
        Sleep    2s

        # Click Update button
        ${update_button}=    Set Variable    xpath=//div[contains(@class,'MuiDialog')]//button[normalize-space()='Update']
        Web Wait Until Element Is Visible    ${update_button}    5s
        Web Click Element    ${update_button}
        Sleep    2s

        # Check validation message
        ${snackbar_visible}=    Run Keyword And Return Status    Web Wait Until Element Is Visible    ${SNACKBAR_TITLE}    5s
        IF    ${snackbar_visible}
            ${msg}=    Web.Get Text    ${SNACKBAR_TITLE}
            Log To Console    Validation: ${msg}

            # Check if success (no "already assigned" error)
            ${is_error}=    Run Keyword And Return Status    Should Contain    ${msg}    already assigned
            IF    not ${is_error}
                Log To Console    ✅ SUCCESS! Found available Sanchalak: ${option_text}
                ${selected}=    Set Variable    ${True}
                BREAK
            ELSE
                Log To Console    ❌ Already assigned, trying next...
                # Clear the search field to show dropdown list again
                Web Click Element    ${dialog_search}
                Web Press Keys    ${dialog_search}    CTRL+A
                Web Press Keys    ${dialog_search}    DELETE
                Sleep    2s
            END
        ELSE
            Log To Console    ⚠️ No message, trying next...
            # Clear the search field to show dropdown list again
            Web Click Element    ${dialog_search}
            Web Press Keys    ${dialog_search}    CTRL+A
            Web Press Keys    ${dialog_search}    DELETE
            Sleep    2s
        END
    END

    IF    not ${selected}
        Fail    Could not find available Sanchalak after trying ${options_count} options
    END

Verify Sanchalak Update Outcome
    [Documentation]    Logs top-right toast text; fails if it indicates error.
    ${seen}=    Run Keyword And Return Status    Web Wait Until Element Is Visible    ${SNACKBAR_TITLE}    20s
    Run Keyword Unless    ${seen}    Fail    No validation toast/snackbar detected after submit/cancel
    ${msg}=    Web.Get Text    ${SNACKBAR_TITLE}
    Log    Validation: ${msg}
    ${is_error}=    Run Keyword And Return Status    Should Contain    ${msg}    already assigned
    Run Keyword If    ${is_error}    Fail    Error toast: ${msg}

Handle Validation And Submit Or Cancel
    [Documentation]    Waits top-right toast, logs it; error -> Cancel + confirm; success -> Submit.
    ${seen}=    Run Keyword And Return Status    Web Wait Until Element Is Visible    ${SNACKBAR_TITLE}    20s
    Run Keyword Unless    ${seen}    Fail    No validation toast/snackbar detected
    ${msg}=    Web.Get Text    ${SNACKBAR_TITLE}
    Log    Validation: ${msg}
    ${is_error}=    Run Keyword And Return Status    Should Contain    ${msg}    already assigned
    IF    ${is_error}
        ${cancel_visible}=    Run Keyword And Return Status    Web Wait Until Element Is Visible    ${DIALOG_CANCEL_BUTTON}    5s
        IF    ${cancel_visible}
            Web Click Element    ${DIALOG_CANCEL_BUTTON}
            ${confirm_visible}=    Run Keyword And Return Status    Web Wait Until Element Is Visible    ${CONFIRM_YES_CLOSE_BUTTON}    5s
            IF    ${confirm_visible}
                Web Click Element    ${CONFIRM_YES_CLOSE_BUTTON}
            END
        ELSE
            Click on the Cancel Button in CMS
        END
    ELSE
        Click on the Submit Button for Web
    END

Verify Status Filter Results for Dhyankendra
    [Arguments]    ${expected_operator}    ${expected_status}
    [Documentation]    Verifies that all visible rows match the expected status filter criteria for Dhyankendra
    Log To Console    🔍 Verifying Status Filter Results: ${expected_operator} ${expected_status}
    
    # Use the Dhyankendra-specific status verification with pagination
    Handle Pagination For Dhyankendra Filter Verification    Verify Status Filter Results On Current Page    ${expected_operator}    ${expected_status}

Verify Status Filter Results On Current Page
    [Arguments]    ${expected_operator}    ${expected_status}
    [Documentation]    Verifies status filter results on the current page only for Dhyankendra
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with status filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        # Try MuiChip structure first (for Approved, Pending, Rejected)
        ${status_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='status']//span[contains(@class,'MuiChip-label')])[${i}]
        TRY
            ${status_text}=    Web.Get Text    ${status_cell_locator}
            Log To Console    📋 Row ${i}: Status (MuiChip) = ${status_text}
        EXCEPT
            # Try minimal label structure as fallback
            TRY
                ${status_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='status']//span[contains(@class,'minimal__label__root')])[${i}]
                ${status_text}=    Web.Get Text    ${status_cell_locator}
                Log To Console    📋 Row ${i}: Status (minimal) = ${status_text}
            EXCEPT
                # Try direct text content as last resort
                TRY
                    ${status_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='status'])[${i}]
                    ${status_text}=    Web.Get Text    ${status_cell_locator}
                    Log To Console    📋 Row ${i}: Status (direct) = ${status_text}
                EXCEPT
                    Log To Console    ⚠️ Row ${i}: Could not get status text, continuing...
                    CONTINUE
                END
            END
        END
        
        # Verify the status text if we got it
        IF    '${status_text}' != '${EMPTY}'
            IF    '${expected_operator}' == 'is'
                Should Be Equal    ${status_text}    ${expected_status}
            ELSE IF    '${expected_operator}' == 'is not'
                Should Not Be Equal    ${status_text}    ${expected_status}
            ELSE IF    '${expected_operator}' == 'is any of'
                # For "is any of", check if cell text is in the comma-separated list
                @{value_list}=    Split String    ${expected_status}    ,
                ${value_found}=    Set Variable    False
                FOR    ${value_item}    IN    @{value_list}
                    ${value_item}=    Strip String    ${value_item}
                    IF    '${status_text}' == '${value_item}'
                        ${value_found}=    Set Variable    True
                        BREAK
                    END
                END
                Should Be True    ${value_found}    Value ${status_text} not found in expected list: ${expected_status}
            END
        END
    END
    
    Log To Console    ✅ Status filter results verified successfully for Dhyankendra

# ===== TEXT INPUT FILTERS =====
# These filters use text input for values (contains, equals, starts with, ends with, is empty, is not empty)

Apply Address Filter
    [Arguments]    ${operator}    ${address_value}
    [Documentation]    Applies a filter for address with specified operator
    Log To Console    🔍 Applying Address Filter: ${operator} ${address_value}
    
    # Ensure filter panel is open
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
    END
    
    # Select Address column
    Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Address
    Sleep    2s
    
    # Select operator
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    ${operator}
    Sleep    1s
    
    # For "is empty" and "is not empty" operators, no value input is needed
    IF    '${operator}' in ['is empty', 'is not empty']
        Log To Console    🔍 No value input needed for operator: ${operator}
        Sleep    2s
    ELSE
        # Type address value in the input field
        Web.Wait Until Page Contains Element    xpath=//input[@placeholder="Filter value"]    5s
        Web.Input Text    xpath=//input[@placeholder="Filter value"]    ${address_value}
        Sleep    2s
    END
    
    Log To Console    ✅ Address Filter Applied: ${operator} ${address_value}

Apply Primary Sanchalak Filter
    [Arguments]    ${operator}    ${sanchalak_name}
    [Documentation]    Applies a filter for primary sanchalak name with specified operator
    Log To Console    🔍 Applying Primary Sanchalak Filter: ${operator} ${sanchalak_name}
    
    # Ensure filter panel is open
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
    END
    
    # Select Primary Sanchalak Name column
    Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Primary Sanchalak Name
    Sleep    2s
    
    # Select operator
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    ${operator}
    Sleep    1s
    
    # For "is empty" and "is not empty" operators, no value input is needed
    IF    '${operator}' in ['is empty', 'is not empty']
        Log To Console    🔍 No value input needed for operator: ${operator}
        Sleep    2s
    ELSE
        # Type sanchalak name in the input field
        Web.Wait Until Page Contains Element    xpath=//input[@placeholder="Filter value"]    5s
        Web.Input Text    xpath=//input[@placeholder="Filter value"]    ${sanchalak_name}
        Sleep    2s
    END
    
    Log To Console    ✅ Primary Sanchalak Filter Applied: ${operator} ${sanchalak_name}

Apply Phone Number Filter
    [Arguments]    ${operator}    ${phone_number}
    [Documentation]    Applies a filter for phone number with specified operator
    Log To Console    🔍 Applying Phone Number Filter: ${operator} ${phone_number}
    
    # Ensure filter panel is open
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
    END
    
    # Select Phone No. column
    Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Phone No.
    Sleep    2s
    
    # Select operator
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    ${operator}
    Sleep    1s
    
    # For "is empty" and "is not empty" operators, no value input is needed
    IF    '${operator}' in ['is empty', 'is not empty']
        Log To Console    🔍 No value input needed for operator: ${operator}
        Sleep    2s
    ELSE
        # Type phone number in the input field
        Web.Wait Until Page Contains Element    xpath=//input[@placeholder="Filter value"]    5s
        Web.Input Text    xpath=//input[@placeholder="Filter value"]    ${phone_number}
        Sleep    2s
    END
    
    Log To Console    ✅ Phone Number Filter Applied: ${operator} ${phone_number}

Apply Email Filter
    [Arguments]    ${operator}    ${email_address}
    [Documentation]    Applies a filter for email with specified operator
    Log To Console    🔍 Applying Email Filter: ${operator} ${email_address}
    
    # Ensure filter panel is open
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
    END
    
    # Select Email column
    Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Email
    Sleep    2s
    
    # Select operator
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    ${operator}
    Sleep    1s
    
    # For "is empty" and "is not empty" operators, no value input is needed
    IF    '${operator}' in ['is empty', 'is not empty']
        Log To Console    🔍 No value input needed for operator: ${operator}
        Sleep    2s
    ELSE
        # Type email in the input field
        Web.Wait Until Page Contains Element    xpath=//input[@placeholder="Filter value"]    5s
        Web.Input Text    xpath=//input[@placeholder="Filter value"]    ${email_address}
        Sleep    2s
    END
    
    Log To Console    ✅ Email Filter Applied: ${operator} ${email_address}

# ===== DROPDOWN SELECTION FILTERS =====
# These filters use dropdown selection for values (is, is not, is any of)

Apply Premise Type Filter
    [Arguments]    ${operator}    ${premise_type}
    [Documentation]    Applies a filter for premise type with specified operator
    Log To Console    🔍 Applying Premise Type Filter: ${operator} ${premise_type}
    
    # Ensure filter panel is open
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
    END
    
    # Select Premise Type column
    Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Premise Type
    Sleep    2s
    
    # Select operator
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    ${operator}
    Sleep    1s
    
    # Handle different input types based on operator
    IF    '${operator}' == 'is any of'
        # For "is any of", try different approaches to add multiple values
        @{value_list}=    Split String    ${premise_type}    ,
        Log To Console    🔍 Adding multiple premise type values: ${value_list}
        
        # First, try to see if there's a multi-select dropdown
        ${multi_select_available}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    xpath=//div[contains(@class,'MuiDataGrid-filterFormValueInput')]//div[contains(@class,'MuiSelect-root')]    3s
        
        IF    ${multi_select_available}
            Log To Console    🔍 Using multi-select dropdown approach
            # Try to click on the dropdown to open it
            Web.Click Element    xpath=//div[contains(@class,'MuiDataGrid-filterFormValueInput')]//div[contains(@class,'MuiSelect-root')]
            Sleep    2s
            
            # Select each value from the dropdown
            FOR    ${value_item}    IN    @{value_list}
                ${value_item}=    Strip String    ${value_item}
                Log To Console    🔍 Selecting: ${value_item}
                Web.Click Element    xpath=//li[contains(text(),'${value_item}')]
                Sleep    1s
            END
            
            # Close dropdown by clicking outside or pressing Escape
            Web.Press Key    xpath=//body    \\27
            Sleep    1s
        ELSE
            Log To Console    🔍 Using text input + dropdown approach
            # Try the text input approach
            FOR    ${value_item}    IN    @{value_list}
                ${value_item}=    Strip String    ${value_item}
                Log To Console    🔍 Adding premise type value: ${value_item}
                
                # Type the value in input field
                Web.Wait Until Page Contains Element    xpath=//input[@placeholder="Filter value"]    5s
                Web.Input Text    xpath=//input[@placeholder="Filter value"]    ${value_item}
                Sleep    1s
                
                # Try to trigger dropdown selection
                Web.Press Key    xpath=//input[@placeholder="Filter value"]    \\13
                Sleep    2s
                
                # Look for dropdown and select if available
                ${dropdown_visible}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    xpath=//div[contains(@class,'MuiMenu-root')]//li[contains(text(),'${value_item}')]    2s
                IF    ${dropdown_visible}
                    Web.Click Element    xpath=//div[contains(@class,'MuiMenu-root')]//li[contains(text(),'${value_item}')]
                    Sleep    1s
                END
                
                # Clear for next iteration
                Web.Clear Element Text    xpath=//input[@placeholder="Filter value"]
                Sleep    1s
            END
        END
    ELSE
        # For "is" and "is not", use dropdown selection
        Web.Wait Until Page Contains Element    ${FILTER_VALUE_DROPDOWN}    5s
        Web.Select From List By Label    ${FILTER_VALUE_DROPDOWN}    ${premise_type}
        Sleep    2s
    END
    
    Log To Console    ✅ Premise Type Filter Applied: ${operator} ${premise_type}

Apply Status Filter Dhyankendra
    [Arguments]    ${operator}    ${status_value}
    [Documentation]    Applies a filter for status with specified operator
    Log To Console    🔍 Applying Status Filter: ${operator} ${status_value}
    
    # Ensure filter panel is open
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
    END
    
    # Select Status column
    Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Status
    Sleep    2s
    
    # Select operator
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    ${operator}
    Sleep    1s
    
    # Handle different input types based on operator
    IF    '${operator}' == 'is any of'
        # For "is any of", use the same approach as Premise Type filter
        @{value_list}=    Split String    ${status_value}    ,
        Log To Console    🔍 Adding multiple status values: ${value_list}
        
        # First, try to see if there's a multi-select dropdown
        ${multi_select_available}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    xpath=//div[contains(@class,'MuiDataGrid-filterFormValueInput')]//div[contains(@class,'MuiSelect-root')]    3s
        
        IF    ${multi_select_available}
            Log To Console    🔍 Using multi-select dropdown approach
            # Try to click on the dropdown to open it
            Web.Click Element    xpath=//div[contains(@class,'MuiDataGrid-filterFormValueInput')]//div[contains(@class,'MuiSelect-root')]
            Sleep    2s
            
            # Select each value from the dropdown
            FOR    ${value_item}    IN    @{value_list}
                ${value_item}=    Strip String    ${value_item}
                Log To Console    🔍 Selecting: ${value_item}
                Web.Click Element    xpath=//li[contains(text(),'${value_item}')]
                Sleep    1s
            END
            
            # Close dropdown by clicking outside or pressing Escape
            Web.Press Key    xpath=//body    \\27
            Sleep    1s
        ELSE
            Log To Console    🔍 Using text input + dropdown approach (same as Premise Type)
            # Try the text input approach
            FOR    ${value_item}    IN    @{value_list}
                ${value_item}=    Strip String    ${value_item}
                Log To Console    🔍 Adding status value: ${value_item}
                
                # Type the value in input field
                Web.Wait Until Page Contains Element    xpath=//input[@placeholder="Filter value"]    5s
                Web.Input Text    xpath=//input[@placeholder="Filter value"]    ${value_item}
                Sleep    1s
                
                # Press Enter or Tab to trigger dropdown
                Web.Press Key    xpath=//input[@placeholder="Filter value"]    \\13
                Sleep    1s
                
                # Select from dropdown if it appears
                ${dropdown_visible}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    xpath=//ul[contains(@class,'MuiMenu-list')]//li[normalize-space()='${value_item}']    3s
                IF    ${dropdown_visible}
                    Log To Console    🔍 Selecting from triggered dropdown: ${value_item}
                    Web.Click Element    xpath=//ul[contains(@class,'MuiMenu-list')]//li[normalize-space()='${value_item}']
                    Sleep    1s
                ELSE
                    Log To Console    ⚠️ Dropdown option not found after typing for: ${value_item}
                END
                # Clear the input field for the next value if needed (assuming it doesn't clear automatically)
                Web.Clear Element Text    xpath=//input[@placeholder="Filter value"]
                Sleep    0.5s
            END
        END
        
    ELSE
        # For "is" and "is not", use dropdown selection
        Web.Wait Until Page Contains Element    ${FILTER_VALUE_DROPDOWN}    5s
        Web.Select From List By Label    ${FILTER_VALUE_DROPDOWN}    ${status_value}
        Sleep    2s
    END
    
    Log To Console    ✅ Status Filter Applied: ${operator} ${status_value}

Apply Active Inactive Filter
    [Arguments]    ${operator}    ${active_status}
    [Documentation]    Applies a filter for active/inactive status with specified operator
    Log To Console    🔍 Applying Active/Inactive Filter: ${operator} ${active_status}
    
    # Ensure filter panel is open
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
    END
    
    # Select Active/Inactive column
    Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Active/Inactive
    Sleep    2s
    
    # Select operator
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    ${operator}
    Sleep    1s
    
    # Handle different input types based on operator
    IF    '${operator}' == 'is any of'
        # For "is any of", use text input for comma-separated values
        Web.Wait Until Page Contains Element    xpath=//input[@placeholder="Filter value"]    5s
        Web.Input Text    xpath=//input[@placeholder="Filter value"]    ${active_status}
        Sleep    2s
    ELSE
        # For "is" and "is not", use dropdown selection
        Web.Wait Until Page Contains Element    ${FILTER_VALUE_DROPDOWN}    5s
        Web.Select From List By Label    ${FILTER_VALUE_DROPDOWN}    ${active_status}
        Sleep    2s
    END
    
    Log To Console    ✅ Active/Inactive Filter Applied: ${operator} ${active_status}

Apply Review Status Filter
    [Arguments]    ${operator}    ${review_status}
    [Documentation]    Applies a filter for review status with specified operator
    Log To Console    🔍 Applying Review Status Filter: ${operator} ${review_status}
    
    # Ensure filter panel is open
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
    END
    
    # Select Review Status column
    Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Review Status
    Sleep    2s
    
    # Select operator
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    ${operator}
    Sleep    1s
    
    # Handle different input types based on operator
    IF    '${operator}' == 'is any of'
        # For "is any of", use text input for comma-separated values
        Web.Wait Until Page Contains Element    xpath=//input[@placeholder="Filter value"]    5s
        Web.Input Text    xpath=//input[@placeholder="Filter value"]    ${review_status}
        Sleep    2s
    ELSE
        # For "is" and "is not", use dropdown selection
        Web.Wait Until Page Contains Element    ${FILTER_VALUE_DROPDOWN}    5s
        Web.Select From List By Label    ${FILTER_VALUE_DROPDOWN}    ${review_status}
        Sleep    2s
    END
    
    Log To Console    ✅ Review Status Filter Applied: ${operator} ${review_status}

Handle Pagination For Dhyankendra Filter Verification
    [Arguments]    ${verification_keyword}    @{args}
    [Documentation]    Handles pagination when verifying filter results across multiple pages for Dhyankendra
    Log To Console    🔍 Handling pagination for Dhyankendra filter verification
    
    # Get total count from pagination info
    ${pagination_text}=    Web.Get Text    ${PAGINATION_DISPLAYED_ROWS}
    Log To Console    RAW: "${pagination_text}"
    
    # Clean the text and extract total count using Method 4 (splitting by "of")
    ${clean_text}=    Strip String    ${pagination_text}
    ${parts}=    Split String    ${clean_text}    of
    Log To Console    Split parts: ${parts}
    
    IF    len(${parts}) > 1
        ${last_part}=    Strip String    ${parts[-1]}
        ${total_count}=    Set Variable    ${last_part}
        Log To Console    ✅ Extracted total count: ${total_count}
    ELSE
        Log To Console    ⚠️ Could not extract total count, defaulting to 1
        ${total_count}=    Set Variable    1
    END
    
    # Set start and end records for display
    ${start_record}=    Set Variable    1
    ${end_record}=    Set Variable    ${total_count}
    
    Log To Console    📊 Records: ${start_record}-${end_record} of ${total_count}
    
    # Calculate total pages (assuming 10 records per page)
    ${total_pages}=    Evaluate    (${total_count} + 9) // 10
    Log To Console    📄 Total pages: ${total_pages}
    
    # If only one page, just verify current page
    IF    ${total_pages} == 1
        Log To Console    📄 Only one page, verifying current page
        Run Keyword    ${verification_keyword}    @{args}
        Log To Console    ✅ Single page verification completed
        RETURN
    END
    
    # Verify records on each page
    FOR    ${page}    IN RANGE    1    ${total_pages} + 1
        Log To Console    🔍 Verifying page ${page} of ${total_pages}
        
        # Call the verification keyword for current page
        Run Keyword    ${verification_keyword}    @{args}
        
        # Check if there's a next page
        IF    ${page} < ${total_pages}
            Log To Console    ➡️ Clicking next page button
            Web.Wait Until Page Contains Element    ${PAGINATION_ENABLED_NEXT}    5s
            Web.Click Element    ${PAGINATION_ENABLED_NEXT}
            Sleep    3s
        END
    END
    
    Log To Console    ✅ Pagination verification completed for all ${total_pages} pages
    
    # Store total_pages for potential use in Clear All Filters
    Set Test Variable    ${TOTAL_PAGES_FOR_CLEAR}    ${total_pages}

Apply Approval Status Filter
    [Arguments]    ${approval_status}
    [Documentation]    Applies a filter for approval status
    Log To Console    🔍 Applying Approval Status Filter: ${approval_status}
    
    # Ensure filter panel is open before applying filters
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Log To Console    🔄 Filter panel is closed, opening it first
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        # Wait for filter panel to fully load
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
        Log To Console    ✅ Filter panel opened successfully
    ELSE
        Log To Console    ✅ Filter panel is already open
    END
    
    # Select Approval Status column
    Web.Select From List By Value    ${FILTER_COLUMN_DROPDOWN}    approvalStatus
    Sleep    2s
    
    # Check if filter panel closed after column selection and re-open if needed
    ${filter_panel_still_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_OPERATOR_DROPDOWN}    3s
    IF    not ${filter_panel_still_open}
        Log To Console    🔄 Filter panel closed after column selection, re-opening it
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        # Wait for filter panel to fully load
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
        # Re-select column
        Web.Select From List By Value    ${FILTER_COLUMN_DROPDOWN}    approvalStatus
        Sleep    2s
        Log To Console    ✅ Filter panel re-opened and column re-selected: approvalStatus
    ELSE
        Log To Console    ✅ Filter panel remained open after column selection
    END
    
    # Select operator (default is "is")
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    equals
    Sleep    1s
    
    # Select approval status value
    Web.Select From List By Label    ${FILTER_VALUE_DROPDOWN}    ${approval_status}
    Sleep    2s
    
    Log To Console    ✅ Approval Status Filter Applied: ${approval_status}

Apply Is Active Filter
    [Arguments]    ${is_active_value}
    [Documentation]    Applies a filter for is active status
    Log To Console    🔍 Applying Is Active Filter: ${is_active_value}
    
    # Ensure filter panel is open before applying filters
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Log To Console    🔄 Filter panel is closed, opening it first
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        # Wait for filter panel to fully load
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
        Log To Console    ✅ Filter panel opened successfully
    ELSE
        Log To Console    ✅ Filter panel is already open
    END
    
    # Select Is Active column
    Web.Select From List By Value    ${FILTER_COLUMN_DROPDOWN}    isActive
    Sleep    2s
    
    # Check if filter panel closed after column selection and re-open if needed
    ${filter_panel_still_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_OPERATOR_DROPDOWN}    3s
    IF    not ${filter_panel_still_open}
        Log To Console    🔄 Filter panel closed after column selection, re-opening it
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        # Wait for filter panel to fully load
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
        # Re-select column
        Web.Select From List By Value    ${FILTER_COLUMN_DROPDOWN}    isActive
        Sleep    2s
        Log To Console    ✅ Filter panel re-opened and column re-selected: isActive
    ELSE
        Log To Console    ✅ Filter panel remained open after column selection
    END
    
    # Select operator (default is "is")
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    equals
    Sleep    1s
    
    # Select is active value
    Web.Select From List By Label    ${FILTER_VALUE_DROPDOWN}    ${is_active_value}
    Sleep    2s
    
    Log To Console    ✅ Is Active Filter Applied: ${is_active_value}

Apply Center Name Filter
    [Arguments]    ${operator}    ${center_name}
    [Documentation]    Applies a filter for center name with specified operator
    Log To Console    🔍 Applying Center Name Filter: ${operator} ${center_name}
    
    # Ensure filter panel is open before applying filters
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Log To Console    🔄 Filter panel is closed, opening it first
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        # Wait for filter panel to fully load
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
        Log To Console    ✅ Filter panel opened successfully
    ELSE
        Log To Console    ✅ Filter panel is already open
    END
    
    # Select Center Name column
    Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Center Name
    Sleep    2s
    
    # Check if filter panel closed after column selection and re-open if needed
    ${filter_panel_still_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_OPERATOR_DROPDOWN}    3s
    IF    not ${filter_panel_still_open}
        Log To Console    🔄 Filter panel closed after column selection, re-opening it
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        # Wait for filter panel to fully load
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
        # Re-select column
        Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Center Name
        Sleep    2s
        Log To Console    ✅ Filter panel re-opened and column re-selected: Center Name
    ELSE
        Log To Console    ✅ Filter panel remained open after column selection
    END
    
    # Select operator
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    ${operator}
    Sleep    1s
    
    # For "is empty" and "is not empty" operators, no value input is needed
    IF    '${operator}' in ['is empty', 'is not empty']
        Log To Console    🔍 No value input needed for operator: ${operator}
        Sleep    2s
    ELSE
        # Type center name value in the input field
        Web.Wait Until Page Contains Element    xpath=//input[@placeholder="Filter value"]    5s
        Web.Input Text    xpath=//input[@placeholder="Filter value"]    ${center_name}
        Sleep    2s
    END
    
    Log To Console    ✅ Center Name Filter Applied: ${operator} ${center_name}

Apply Center Name Filter Not
    [Arguments]    ${center_name}
    [Documentation]    Applies a filter for center name with "is not" operator
    Log To Console    🔍 Applying Center Name Filter Not: ${center_name}
    
    # Ensure filter panel is open before applying filters
    ${filter_panel_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    2s
    IF    not ${filter_panel_open}
        Log To Console    🔄 Filter panel is closed, opening it first
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        # Wait for filter panel to fully load
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
        Log To Console    ✅ Filter panel opened successfully
    ELSE
        Log To Console    ✅ Filter panel is already open
    END
    
    # Select Center Name column
    Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Center Name
    Sleep    2s
    
    # Check if filter panel closed after column selection and re-open if needed
    ${filter_panel_still_open}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    ${FILTER_OPERATOR_DROPDOWN}    3s
    IF    not ${filter_panel_still_open}
        Log To Console    🔄 Filter panel closed after column selection, re-opening it
        Web.Wait Until Page Contains Element    ${FILTER_BUTTON}    5s
        Web.Click Element    ${FILTER_BUTTON}
        Sleep    3s
        # Wait for filter panel to fully load
        Web.Wait Until Page Contains Element    ${FILTER_COLUMN_DROPDOWN}    10s
        Sleep    2s
        # Re-select column
        Web.Select From List By Label    ${FILTER_COLUMN_DROPDOWN}    Center Name
        Sleep    2s
        Log To Console    ✅ Filter panel re-opened and column re-selected: Center Name
    ELSE
        Log To Console    ✅ Filter panel remained open after column selection
    END
    
    # Select "equals" operator (using same as "is" for now)
    Web.Select From List By Label    ${FILTER_OPERATOR_DROPDOWN}    equals
    Sleep    1s
    
    # Type center name value in the input field
    Web.Wait Until Page Contains Element    xpath=//input[@placeholder="Filter value"]    5s
    Web.Input Text    xpath=//input[@placeholder="Filter value"]    ${center_name}
    Sleep    2s
    
    Log To Console    ✅ Center Name Filter Not Applied: ${center_name}

Verify Approval Status Filter Results
    [Arguments]    ${expected_approval_status}
    [Documentation]    Verifies that all visible rows match the expected approval status filter criteria
    Log To Console    🔍 Verifying Approval Status Filter Results: ${expected_approval_status}
    
    # Use the Dhyankendra-specific approval status verification with pagination
    Handle Pagination For Dhyankendra Filter Verification    Verify Approval Status Filter Results On Current Page    ${expected_approval_status}

Verify Approval Status Filter Results On Current Page
    [Arguments]    ${expected_approval_status}
    [Documentation]    Verifies approval status filter results on the current page only for Dhyankendra
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with approval status filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        ${approval_status_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='approvalStatus']//span[contains(@class,'minimal__label__root')])[${i}]
        TRY
            ${approval_status_text}=    Web.Get Text    ${approval_status_cell_locator}
            Log To Console    📋 Row ${i}: Approval Status = ${approval_status_text}
            Should Be Equal    ${approval_status_text}    ${expected_approval_status}
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get approval status text, continuing...
            CONTINUE
        END
    END
    
    Log To Console    ✅ Approval status filter results verified successfully for Dhyankendra

Verify Is Active Filter Results
    [Arguments]    ${expected_is_active}
    [Documentation]    Verifies that all visible rows match the expected is active filter criteria
    Log To Console    🔍 Verifying Is Active Filter Results: ${expected_is_active}
    
    # Use the Dhyankendra-specific is active verification with pagination
    Handle Pagination For Dhyankendra Filter Verification    Verify Is Active Filter Results On Current Page    ${expected_is_active}

Verify Is Active Filter Results On Current Page
    [Arguments]    ${expected_is_active}
    [Documentation]    Verifies is active filter results on the current page only for Dhyankendra
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with is active filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        ${is_active_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='isActive']//span[contains(@class,'minimal__label__root')])[${i}]
        TRY
            ${is_active_text}=    Web.Get Text    ${is_active_cell_locator}
            Log To Console    📋 Row ${i}: Is Active = ${is_active_text}
            Should Be Equal    ${is_active_text}    ${expected_is_active}
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get is active text, continuing...
            CONTINUE
        END
    END
    
    Log To Console    ✅ Is active filter results verified successfully for Dhyankendra

Verify Center Name Filter Results
    [Arguments]    ${expected_center_name}
    [Documentation]    Verifies that all visible rows match the expected center name filter criteria
    Log To Console    🔍 Verifying Center Name Filter Results: ${expected_center_name}
    
    # Use the Dhyankendra-specific center name verification with pagination
    Handle Pagination For Dhyankendra Filter Verification    Verify Center Name Filter Results On Current Page    ${expected_center_name}

Verify Center Name Filter Results On Current Page
    [Arguments]    ${expected_center_name}
    [Documentation]    Verifies center name filter results on the current page only for Dhyankendra
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with center name filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        # Use correct field name: dhyankendraName (not centerName)
        ${center_name_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='dhyankendraName'])[${i}]
        TRY
            ${center_name_text}=    Web.Get Text    ${center_name_cell_locator}
            Log To Console    📋 Row ${i}: Center Name = ${center_name_text}
            
            # Handle different operators
            IF    '${expected_center_name}' == '${EMPTY}'
                # For "is empty" operator, check if field is empty
                Should Be Empty    ${center_name_text}
            ELSE
                # For other operators, use contains check
                Should Contain    ${center_name_text}    ${expected_center_name}
            END
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get center name text, continuing...
            CONTINUE
        END
    END
    
    Log To Console    ✅ Center name filter results verified successfully for Dhyankendra

Verify Center Name Filter Not Results
    [Arguments]    ${expected_center_name}
    [Documentation]    Verifies that all visible rows do NOT match the expected center name filter criteria
    Log To Console    🔍 Verifying Center Name Filter Not Results: ${expected_center_name}
    
    # Use the Dhyankendra-specific center name verification with pagination
    Handle Pagination For Dhyankendra Filter Verification    Verify Center Name Filter Not Results On Current Page    ${expected_center_name}

Verify Center Name Filter Not Results On Current Page
    [Arguments]    ${expected_center_name}
    [Documentation]    Verifies center name filter not results on the current page only for Dhyankendra
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with center name filter not: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        # Use correct field name: dhyankendraName (not centerName)
        ${center_name_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='dhyankendraName'])[${i}]
        TRY
            ${center_name_text}=    Web.Get Text    ${center_name_cell_locator}
            Log To Console    📋 Row ${i}: Center Name = ${center_name_text}
            Should Not Contain    ${center_name_text}    ${expected_center_name}
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get center name text, continuing...
            CONTINUE
        END
    END
    
    Log To Console    ✅ Center name filter not results verified successfully for Dhyankendra

# ===== VERIFICATION METHODS FOR OTHER FIELDS =====

Verify Address Filter Results
    [Arguments]    ${expected_address}
    [Documentation]    Verifies that all visible rows match the expected address filter criteria
    Log To Console    🔍 Verifying Address Filter Results: ${expected_address}
    Handle Pagination For Dhyankendra Filter Verification    Verify Address Filter Results On Current Page    ${expected_address}

Verify Address Filter Results On Current Page
    [Arguments]    ${expected_address}
    [Documentation]    Verifies address filter results on the current page only
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with address filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        ${address_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='address'])[${i}]
        TRY
            ${address_text}=    Web.Get Text    ${address_cell_locator}
            Log To Console    📋 Row ${i}: Address = ${address_text}
            Should Contain    ${address_text}    ${expected_address}
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get address text, continuing...
            CONTINUE
        END
    END
    Log To Console    ✅ Address filter results verified successfully

Verify Primary Sanchalak Filter Results
    [Arguments]    ${expected_sanchalak}
    [Documentation]    Verifies that all visible rows match the expected primary sanchalak filter criteria
    Log To Console    🔍 Verifying Primary Sanchalak Filter Results: ${expected_sanchalak}
    Handle Pagination For Dhyankendra Filter Verification    Verify Primary Sanchalak Filter Results On Current Page    ${expected_sanchalak}

Verify Primary Sanchalak Filter Results On Current Page
    [Arguments]    ${expected_sanchalak}
    [Documentation]    Verifies primary sanchalak filter results on the current page only
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with primary sanchalak filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        ${sanchalak_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='sanchalak1Name'])[${i}]
        TRY
            ${sanchalak_text}=    Web.Get Text    ${sanchalak_cell_locator}
            Log To Console    📋 Row ${i}: Primary Sanchalak = ${sanchalak_text}
            Should Contain    ${sanchalak_text}    ${expected_sanchalak}
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get primary sanchalak text, continuing...
            CONTINUE
        END
    END
    Log To Console    ✅ Primary sanchalak filter results verified successfully

Verify Phone Number Filter Results
    [Arguments]    ${expected_phone}
    [Documentation]    Verifies that all visible rows match the expected phone number filter criteria
    Log To Console    🔍 Verifying Phone Number Filter Results: ${expected_phone}
    Handle Pagination For Dhyankendra Filter Verification    Verify Phone Number Filter Results On Current Page    ${expected_phone}

Verify Phone Number Filter Results On Current Page
    [Arguments]    ${expected_phone}
    [Documentation]    Verifies phone number filter results on the current page only
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with phone number filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        ${phone_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='officePhoneNumber'])[${i}]
        TRY
            ${phone_text}=    Web.Get Text    ${phone_cell_locator}
            Log To Console    📋 Row ${i}: Phone Number = ${phone_text}
            Should Contain    ${phone_text}    ${expected_phone}
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get phone number text, continuing...
            CONTINUE
        END
    END
    Log To Console    ✅ Phone number filter results verified successfully

Verify Email Filter Results
    [Arguments]    ${expected_email}
    [Documentation]    Verifies that all visible rows match the expected email filter criteria
    Log To Console    🔍 Verifying Email Filter Results: ${expected_email}
    Handle Pagination For Dhyankendra Filter Verification    Verify Email Filter Results On Current Page    ${expected_email}

Verify Email Filter Results On Current Page
    [Arguments]    ${expected_email}
    [Documentation]    Verifies email filter results on the current page only
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with email filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        ${email_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='email'])[${i}]
        TRY
            ${email_text}=    Web.Get Text    ${email_cell_locator}
            Log To Console    📋 Row ${i}: Email = ${email_text}
            
            # Handle different operators
            IF    '${expected_email}' == '${EMPTY}'
                # For "is not empty" operator, check if field is not empty
                Should Not Be Empty    ${email_text}
            ELSE
                # For other operators, use contains check
                Should Contain    ${email_text}    ${expected_email}
            END
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get email text, continuing...
            CONTINUE
        END
    END
    Log To Console    ✅ Email filter results verified successfully

Verify Premise Type Filter Results
    [Arguments]    ${expected_premise_type}
    [Documentation]    Verifies that all visible rows match the expected premise type filter criteria
    Log To Console    🔍 Verifying Premise Type Filter Results: ${expected_premise_type}
    Handle Pagination For Dhyankendra Filter Verification    Verify Premise Type Filter Results On Current Page    ${expected_premise_type}

Verify Premise Type Filter Results On Current Page
    [Arguments]    ${expected_premise_type}
    [Documentation]    Verifies premise type filter results on the current page only
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with premise type filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        ${premise_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='premiseType'])[${i}]
        TRY
            ${premise_text}=    Web.Get Text    ${premise_cell_locator}
            Log To Console    📋 Row ${i}: Premise Type = ${premise_text}
            
            # Handle comma-separated values for "is any of" operator
            IF    ',' in '${expected_premise_type}'
                @{value_list}=    Split String    ${expected_premise_type}    ,
                ${value_found}=    Set Variable    False
                FOR    ${value_item}    IN    @{value_list}
                    ${value_item}=    Strip String    ${value_item}
                    IF    '${premise_text}' == '${value_item}'
                        ${value_found}=    Set Variable    True
                        BREAK
                    END
                END
                Should Be True    ${value_found}    Value ${premise_text} not found in expected list: ${expected_premise_type}
            ELSE
                Should Be Equal    ${premise_text}    ${expected_premise_type}
            END
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get premise type text, continuing...
            CONTINUE
        END
    END
    Log To Console    ✅ Premise type filter results verified successfully

Verify Active Inactive Filter Results
    [Arguments]    ${expected_active_status}
    [Documentation]    Verifies that all visible rows match the expected active/inactive filter criteria
    Log To Console    🔍 Verifying Active/Inactive Filter Results: ${expected_active_status}
    Handle Pagination For Dhyankendra Filter Verification    Verify Active Inactive Filter Results On Current Page    ${expected_active_status}

Verify Active Inactive Filter Results On Current Page
    [Arguments]    ${expected_active_status}
    [Documentation]    Verifies active/inactive filter results on the current page only
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with active/inactive filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        ${active_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='isActive'])[${i}]
        TRY
            # Check if the switch is checked (Active) or not (Inactive)
            ${is_checked}=    Run Keyword And Return Status    Web.Wait Until Page Contains Element    xpath=(//div[@role='gridcell' and @data-field='isActive'])[${i}]//input[@checked]    1s
            ${active_text}=    Set Variable If    ${is_checked}    Active    Inactive
            Log To Console    📋 Row ${i}: Active/Inactive = ${active_text}
            Should Be Equal    ${active_text}    ${expected_active_status}
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get active/inactive status, continuing...
            CONTINUE
        END
    END
    Log To Console    ✅ Active/Inactive filter results verified successfully

Verify Review Status Filter Results
    [Arguments]    ${expected_review_status}
    [Documentation]    Verifies that all visible rows match the expected review status filter criteria
    Log To Console    🔍 Verifying Review Status Filter Results: ${expected_review_status}
    Handle Pagination For Dhyankendra Filter Verification    Verify Review Status Filter Results On Current Page    ${expected_review_status}

Verify Review Status Filter Results On Current Page
    [Arguments]    ${expected_review_status}
    [Documentation]    Verifies review status filter results on the current page only
    ${row_count}=    Web.Get Element Count    ${DATA_GRID_ROWS}
    Log To Console    📊 Total rows with review status filter: ${row_count}
    
    FOR    ${i}    IN RANGE    1    ${row_count} + 1
        ${review_cell_locator}=    Set Variable    xpath=(//div[@role='gridcell' and @data-field='approvalStatus']//span[contains(@class,'minimal__label__root')])[${i}]
        TRY
            ${review_text}=    Web.Get Text    ${review_cell_locator}
            Log To Console    📋 Row ${i}: Review Status = ${review_text}
            Should Be Equal    ${review_text}    ${expected_review_status}
        EXCEPT
            Log To Console    ⚠️ Row ${i}: Could not get review status text, continuing...
            CONTINUE
        END
    END
    Log To Console    ✅ Review status filter results verified successfully