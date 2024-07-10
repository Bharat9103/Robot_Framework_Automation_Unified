*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/WebKeywords/NanonetsLoginKeyword.robot
Resource    ../../Resources/WebVariables/NanoLoginVariables.robot
*** Test Cases ***
Verify user is able to login
        open Nanonets Url    ${url}      ${browser}
        enter user email    ${email}
        enter user password    ${password}
        click login button
        verify home page is visible