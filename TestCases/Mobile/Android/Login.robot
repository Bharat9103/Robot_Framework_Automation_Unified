*** Settings ***
Library    AppiumLibrary
Resource    ../../../Resources/MobileKeywords/BizomLoginKeywords.robot
Resource    ../../../Resources/MobileVariables/loginVariables.robot

*** Test Cases ***

Login Bizom mobile app
    [Documentation]     Open bizom mobile app
    [Tags]  UAT
    Given I open Bizom Mobile application
    When User Click multiple times for env to appear and select staging environment
    When User enters username and password
    Then Click on Login button