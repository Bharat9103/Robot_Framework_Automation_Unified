*** Settings ***
Library    SeleniumLibrary
Variables    ../../PageObjects/WebLocators/Locators.py
Resource    ../../Resources/WebVariables/NanoLoginVariables.robot
*** Keywords ***
Given Open Nanonets Url
    [Arguments]    ${url}   ${browser}
    open browser    ${url}   ${browser}
    sleep    3
    maximize browser window

When Enter User email
    [Arguments]    ${useremail}
    SeleniumLibrary.input text  ${emailIdTxtBox}     ${useremail}

When Enter User password
    [Arguments]    ${userPassword}
    SeleniumLibrary.input text  ${passwordTxtBox}     ${userPassword}
Then Click Login Button
    SeleniumLibrary.click element    ${loginBtn}
Then Verify home page is visible
    SeleniumLibrary.wait until element is visible    ${logo}
    SeleniumLibrary.element should be visible    ${logo}
    SeleniumLibrary.close all browsers