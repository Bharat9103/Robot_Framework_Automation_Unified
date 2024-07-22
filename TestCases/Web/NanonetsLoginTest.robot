*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/WebKeywords/NanonetsLoginKeyword.robot
Resource    ../../Resources/WebVariables/NanoLoginVariables.robot
Library    AppiumLibrary
Variables   ../../PageObjects/MobileLocators/loginScreen.py
Resource    ../../Resources/MobileVariables/loginVariables.robot
#Resource    ../../configs/Mobileconfigs/BizomAppConfig.robot
Resource    ../../Resources/MobileKeywords/BizomLoginKeywords.robot
*** Test Cases ***

Verify user is able to login
        [Tags]    UAT   MUT1
        Given open Nanonets Url    ${url}      ${browser}
        When enter user email    ${email}
        When enter user password    ${password}
        Then click login button
        Then verify home page is visible

Verify user is able to login web and mobile
        [Tags]    UAT   MUT1
        Given open Nanonets Url    ${url}      ${browser}
        When enter user email    ${email}
        When enter user password    ${password}
        Then click login button
        Then verify home page is visible
        Given Open Bizom Application
        When User Click multiple times for env to appear and select staging environment
        When User enters username and password
        Then Click on Login button