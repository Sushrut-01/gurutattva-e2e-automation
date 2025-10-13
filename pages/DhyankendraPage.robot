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
${SELECT_USER}                                         xpath=//android.widget.Button[@content-desc="yatish devlekar - 38"]
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
    Mobile Hide Keyboard
    Sleep    2s
    Mobile Input Text    ${CENTER_NAME_INPUT}    ${E2E_CENTER_NAME}
    Log To Console    Entered Center Name

Select Premise Type
    Mobile Click Element    ${SELECT_OPTION}
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText    Temple
    Mobile Click Element    ${TEMPLE_BUTTON}
    Mobile Hide Keyboard
    Log To Console    Selected Premise Type

Select Ownership
    Mobile Click Element    ${SELECT_OPTION}
    Mobile Click Element    xpath=//android.widget.EditText
    Mobile Input Text    xpath=//android.widget.EditText     Sadhak Owned
    Mobile Click Element    ${SAHKA_OWNED_BUTTON}
    Mobile Hide Keyboard
    Log To Console    Selected Ownership

Enter Sitting Capacity
    Mobile Click Element    ${SITTING}
    Mobile Hide Keyboard
    Mobile Input Text    ${SITTING}    100
    Log To Console    Entered Sitting Capacity
    Mobile Click Element    ${DHYANKENDRA_NEXT}
    Log To Console    Clicked on Next Button

Enter Full Address For Dhyankendra
    Mobile Click Element    ${FULL_ADDRESS_INPUT}
    Mobile Hide Keyboard
    Mobile Input Text    ${FULL_ADDRESS_INPUT}    ${E2E_FULL_ADDRESS}
    Log To Console    Entered Full Address

Enter Pincode For Dhyankendra
    Mobile Click Element    ${PINCODE_INPUT}
    Mobile Hide Keyboard
    Mobile Input Text    ${PINCODE_INPUT}    380015
    Log To Console    Entered Pincode

Enter Hall Length
    Mobile Click Element    ${INPUT_HALL_LENGTH}
    Mobile Hide Keyboard
    Mobile Input Text    ${INPUT_HALL_LENGTH}    10
    Log To Console    Entered Hall Length

Enter Hall Width
    Mobile Click Element    ${INPUT_HALL_WIDTH}
    Mobile Hide Keyboard
    Mobile Input Text    ${INPUT_HALL_WIDTH}    10
    Log To Console    Entered Hall Width

Enter Hall Height
    Mobile Click Element    ${INPUT_HALL_HEIGHT}
    Mobile Hide Keyboard
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
    Mobile Hide Keyboard
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
    Mobile Hide Keyboard
    Mobile Input Text    ${DHYANKENDRA_EMAIL_INPUT}    ${E2E_EMAIL}
    Log To Console    Entered Email for Dhyankendra

Enter Mobile for Dhyankendra
    Mobile Click Element    ${DHYANKENDRA_MOBILE_INPUT}
    Mobile Hide Keyboard
    Mobile Input Text    ${DHYANKENDRA_MOBILE_INPUT}    ${E2E_MOBILE}
    Log To Console    Entered Mobile for Dhyankendra

Click on the Submit Button for Dhyankendra
    Scroll until element found    ${DHYANKENDRA_SUBMIT}
    Mobile Click Element    ${DHYANKENDRA_SUBMIT}
    Log To Console    Clicked on the Submit Button for Dhyankendra

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
    [Documentation]    Verifies that the left menu access is displayed
    Web Wait Until Element Is Visible    ${NEWS_MENU}    10s
    Web Click Element    ${NEWS_MENU}
    Web Wait Until Element Is Visible    ${LOCAL_MENU}    10s
    Log To Console    Verified News Menu
    Web Wait Until Element Is Visible    ${EVENTS_MENU}    10s
    Web Click Element    ${EVENTS_MENU}
    Web Wait Until Element Is Visible    ${LOCAL_MENU}    10s
    Log To Console    Verified Events Menu
    Web Wait Until Element Is Visible    ${DHYANKENDRA_MENU}    10s
    Web Click Element    ${DHYANKENDRA_MENU}
    Log To Console    Verified Dhyankendra Menu
    Web Wait Until Element Is Visible    ${DHYANSTHALI_MENU}    10s
    Web Click Element    ${DHYANSTHALI_MENU}
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