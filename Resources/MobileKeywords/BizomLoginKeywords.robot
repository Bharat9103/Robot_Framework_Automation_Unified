*** Settings ***
Library    AppiumLibrary
Variables   ../../PageObjects/MobileLocators/loginScreen.py
Resource    ../../Resources/MobileVariables/loginVariables.robot
Resource    ../../configs/Mobileconfigs/BizomAppConfig.robot
Library     Screenshot
*** Keywords ***

When User Click multiple times for env to appear and select staging environment
    Sleep    5
    Repeat Keyword    7    AppiumLibrary.Click Element    ${clickForEnv}
    AppiumLibrary.Click Element     ${envDropdown}
#    Sleep    5
    Wait Until Element Is Visible    ${stagingEnvOption}    timeout=10s
    AppiumLibrary.Click Element     ${stagingEnvOption}
When User enters username and password
    Input Text    ${usernameTxtField}   ${email}
    Input Password    ${passwordTxtField}     ${pass}
Then Click on Login button
    AppiumLibrary.Click Element    ${loginBtn1}
    Sleep    10