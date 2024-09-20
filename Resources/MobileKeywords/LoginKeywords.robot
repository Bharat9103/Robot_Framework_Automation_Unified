*** Settings ***
Library    AppiumLibrary
Resource    ../../Resources/MobileVariables/loginVariables.robot
Resource    ../../configs/Mobileconfigs/BizomAppConfig.robot
Resource    CommonKeyWordsMobile.robot
Resource    ../../Utility/Mobile/CustomCommandsMobile.robot

*** Keywords ***

When User Click multiple times for env to appear and select staging environment
    Sleep    5
    Repeat Keyword    6     Click an Element    clickForEnv
    Click an Element    envDropdown
    Wait For Element Until Visible    stagingEnvOption
    Click an Element    stagingEnvOption
When User enters username and password
    Send Keys    usernameTxtField    ${email}
    Send Keys    passwordTxtField    ${pass}
Then Click on Login button
    Click an Element    loginBtn1