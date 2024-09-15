*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/WebVariables/AD_Warehouse_Vars.robot
Variables    ../../PageObjects/WebLocators/AD_Warehouse.py

*** Keywords ***

Setup For Add Warehouse Page
    [Arguments]    ${url}    ${browser}    ${useremail}    ${userPassword}    ${base_url}
    Given User logs in as Admin    ${url}    ${browser}    ${useremail}    ${userPassword}
    When User navigates to add warehouse page    ${base_url}

#TC3068 - Verify user is able to access the add warehouse page
Given User logs in as Admin
    [Arguments]    ${url}   ${browser}  ${useremail}    ${userPassword}
    Open Browser    ${url}   ${browser}
    Maximize Browser Window
    Set Window Size    1200    800
    input text  ${emailIdTxtBox}     ${useremail}
    input text  ${passwordTxtBox}     ${userPassword}
    Click Element    ${loginBtn}

When User navigates to add warehouse page
    [Arguments]    ${base_url}
    Go To    ${base_url}/warehouses/add

Then Verify user is redirected to add warehouse page
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${expected_url}

#TC3070 - Verify Warehouse name is a mandatory field
When Admin clicks on submit button
    Click Element    ${submitBtn}

Then Verify a pop prompt is visible that does not allow the admin to submit without a name
    Page Should Contain Element    ${popPrompt}
    ${alert_text_actual}=    Get Text    ${popPrompt}
    Should Be Equal As Strings    ${alert_text_actual}    ${nameFieldAlertText}

#TC3071 - Verify warehouse name is a alpha numeric field.
When Admin enters alphanumeric text in warehouse field
    ${warehouseName}=    Evaluate    ''.join(random.choices(string.ascii_letters, k=6))    modules=random,string
    Set Global Variable    ${warehouseName}
    Input Text    ${nameTxtField}    ${warehouseName}
Then Verify alert pop up for warehouse field should not be visible
    Page Should Contain Element    ${popPrompt}
    ${alert_text_actual}=    Get Text    ${popPrompt}
    Should Not Be Equal As Strings    ${alert_text_actual}    ${nameFieldAlertText}

#TC3072 - Verify state is a mandatory field.
Then Verify a pop prompt "Please Select State," prevents user from submiting.
    Page Should Contain Element    ${popPrompt}
    ${alert_text_actual}=    Get Text    ${popPrompt}
    Should Be Equal As Strings    ${alert_text_actual}    ${stateFieldAlertText}

#TC3073 - Verify user is able to access the state drop down and pick a state.
Then Verify admin is able to select state from the dropdown
    Click Element    ${stateDropdown}
    Sleep    2
    ${elements}=    Get WebElements    ${dropDownList}
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Run Keyword If    '${text}' == 'DELHI'    Click Element    ${element}
    END

#TC3074 - Verify city is a mandatory field.
Then Verify a pop prompt "Please Select city," prevents user from submiting.
    Page Should Contain Element    ${popPrompt}
    ${alert_text_actual}=    Get Text    ${popPrompt}
    Should Be Equal As Strings    ${alert_text_actual}    ${cityFieldAlertText}
    
#TC3075 - Verify user can access the city drop down and pick a city.
Then Verify admin is able to pick the desired city
    Sleep    2
    Click Element    ${cityDropdown}
    Sleep    2
    ${elements}=    Get WebElements    ${dropDownList}
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Run Keyword If    '${text}' == 'Delhi'    Click Element    ${element}
    END

#TC3076 - Verify "Jurisdiction" in the Tax details section is a mandatory field.
Then Verify a pop prompt "Please provide Jurisdiction, under Tax Details prevents user from submiting.
    Page Should Contain Element    ${popPrompt}
    ${alert_text_actual}=    Get Text    ${popPrompt}
    Should Be Equal As Strings    ${alert_text_actual}    ${jurisdictionFieldAlertTxt}

#TC3077 - Verify user can sucessfully create a new warehouse by providing, the mandatory fields.
When Admin enters Jurisdiction detail
    Click Element    ${taxDetailsHeader}
    Sleep    2
    ${random_text}=    Evaluate    ''.join(random.choices(string.ascii_letters, k=6))    modules=random,string
    Input Text    ${jurisdictionTxtField}    ${random_text}
    Sleep    2
Then Verify success msg is displayed
    Element Should Be Visible    ${successToastMsg}
    ${successMsg}=    Get Text    ${successToastMsg}
    Should Be Equal As Strings    ${successMsg}    ${warehouseSavedMsg}

#TC3078 - Verify user can access edit warehouse page.
When Admin goes to warehouses page
    ${warehousesUrl}=    Get Location
    ${warehousesUrl}=    Evaluate    "${warehousesUrl}".replace("companies/dashboard", "warehouses")
    Go To    ${warehousesUrl}
When Admin searches newly created warehouse
    Input Text    ${searchBox}    ${warehouseName}
    Sleep    1
Then Admin clicks on edit button and is redirected to edit page of selected warehouse
    Click Element    ${warehouseEditBtn}
    Element Should Be Visible    ${EditWarehouseTitle}
    Sleep    10