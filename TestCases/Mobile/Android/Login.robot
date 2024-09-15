*** Settings ***
Library    AppiumLibrary
Resource    ../../../Resources/MobileKeywords/LoginKeywords.robot
Resource    ../../../Resources/MobileVariables/loginVariables.robot
Task Setup      Open Bizom Application
Suite Teardown      Terminate Application    in.bizom.android

*** Test Cases ***

Login Bizom mobile app
    [Documentation]     Open bizom mobile app
    [Tags]  UAT     MUT2
    When User Click multiple times for env to appear and select staging environment
    When User enters username and password
    Then Click on Login button