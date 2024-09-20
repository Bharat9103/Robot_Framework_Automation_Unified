*** Settings ***
Library    AppiumLibrary
Library    Collections
Resource    ../../Resources/MobileKeywords/DSM_Attendance_Keys.robot
Variables   ../../PageObjects/MobileLocators/CommonLocatorsMobile.py
*** Keywords ***
Single Tap On Specific Coordinates
    [Arguments]    ${x}    ${y}
    @{coordinates}    Create List    ${x}    ${y}
    @{all_coordinates}    Create List    ${coordinates}
    AppiumLibrary.Tap With Positions    ${100}    @{all_coordinates}

Click an Element
    [Arguments]    ${element_key}
    ${element_locator}=    Get From Dictionary    ${elements}    ${element_key}
    Run Keyword If    '${element_locator}' != 'None'    Click Element    ${element_locator}
    ...    ELSE    Fail    Element with key "${element_key}" not found in the dictionary

Wait For Element Until Visible
    [Arguments]    ${element_key}
    ${element_locator}=    Get From Dictionary    ${elements}    ${element_key}
    Run Keyword If    '${element_locator}' != 'None'    Wait Until Element Is Visible    ${element_locator}    timeout=3 minutes
    ...    ELSE    Fail    Element with key "${element_key}" not found in the dictionary

Check Element Visibility
    [Arguments]    ${element_key}
    ${element_locator}=    Get From Dictionary    ${elements}    ${element_key}
    Run Keyword If    '${element_locator}' != 'None'    Element Should Be Visible    ${element_locator}
    ...    ELSE    Fail    Element with key "${element_key}" not found in the dictionary

Check Element Contains Text
    [Arguments]    ${element_key}    ${expected_text}
    ${element_locator}=    Get From Dictionary    ${elements}    ${element_key}
    Run Keyword If    '${element_locator}' != 'None'    Element Should Contain Text    ${element_locator}    ${expected_text}
    ...    ELSE    Fail    Element with key "${element_key}" not found in the dictionary

Page Should Not Contain the Element
    [Arguments]    ${element_key}
    ${element_locator}=    Get From Dictionary    ${elements}    ${element_key}
    Run Keyword If    '${element_locator}' != 'None'    Page Should Not Contain Element    ${element_locator}
    ...    ELSE    Fail    Element with key "${element_key}" not found in the dictionary

Send Keys
    [Arguments]    ${element_key}    ${text_to_input}
    ${element_locator}=    Get From Dictionary    ${elements}    ${element_key}
    Run Keyword If    '${element_locator}' != 'None'    Input Text    ${element_locator}    ${text_to_input}
    ...    ELSE    Fail    Element with key "${element_key}" not found in the dictionary

Wait Until the Page Contains Element
    [Arguments]    ${element_key}
    ${element_locator}=    Get From Dictionary    ${elements}    ${element_key}
    Run Keyword If    '${element_locator}' != 'None'    Wait Until Page Contains Element    ${element_locator}    timeout=50s
    ...    ELSE    Fail    Element with key "${element_key}" not found in the dictionary

Wait Until Page Contains Text
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}    timeout=30s

Check Element is Clickable
    [Arguments]    ${element_key}
    ${element_locator}=    Get From Dictionary    ${elements}    ${element_key}
    Run Keyword If    '${element_locator}' != 'None'    Check Element Clickable Attribute    ${element_locator}
    ...    ELSE    Fail    Element with key "${element_key}" not found in the dictionary
Check Element Clickable Attribute
    [Arguments]    ${element_locator}
    ${clickable}=    Get Element Attribute    ${element_locator}    clickable
    Should Be Equal As Strings    ${clickable}    true
