*** Settings ***
Library    SeleniumLibrary
Variables    ../../PageObjects/WebLocators/Locators.py
Resource    ../../Resources/WebVariables/NanoLoginVariables.robot
*** Keywords ***
Open Nanonets Url
    [Arguments]    ${url}   ${browser}
    open browser    ${url}   ${browser}
    sleep    3
    maximize browser window

Enter User email
    [Arguments]    ${useremail}
    input text  ${emailIdTxtBox}     ${useremail}

Enter User password
    [Arguments]    ${userPassword}
    input text  ${passwordTxtBox}     ${userPassword}
Click Login Button
    click element    ${loginBtn}
Verify home page is visible
    wait until element is visible    ${logo}
    element should be visible    ${logo}
    close all browsers