*** Settings ***
Library    AppiumLibrary
Variables   ../../PageObjects/MobileLocators/loginScreen.py
Resource    ../../Resources/MobileVariables/loginVariables.robot
Resource    ../../configs/Mobileconfigs/BizomAppConfig.robot
Resource    CustomCommandsMobile.robot

*** Keywords ***
When User Click multiple times for env to appear and select staging environment
    Sleep    5
    Repeat Keyword    6    AppiumLibrary.Click Element    ${clickForEnv}
    AppiumLibrary.Click Element     ${envDropdown}
    AppiumLibrary.Wait Until Element Is Visible    ${stagingEnvOption}    timeout=10s
    AppiumLibrary.Click Element     ${stagingEnvOption}
When User enters username and password
    AppiumLibrary.Input Text    ${usernameTxtField}   ${email}
    AppiumLibrary.Input Password    ${passwordTxtField}     ${pass}
Then Click on Login button
    AppiumLibrary.Click Element    ${loginBtn1}


#When User Click multiple times for env to appear and select staging environment
#    Sleep    5
#    Repeat Keyword    6     Click an Element    clickForEnv
#    Click an Element    envDropdown
#    Wait For Element    stagingEnvOption
#    Click an Element    stagingEnvOption
#When User enters username and password
##    AppiumLibrary.Input Text    ${usernameTxtField}   ${email}
#    Send Keys    usernameTxtField    ${email}
#    Send Keys    passwordTxtField    ${pass}
#Then Click on Login button
#    Click an Element    loginBtn1