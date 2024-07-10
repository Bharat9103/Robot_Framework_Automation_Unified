*** Settings ***
Library    AppiumLibrary
Variables   ../../PageObjects/MobileLocators/loginScreen.py
Resource    ../../Resources/MobileVariables/loginVariables.robot
*** Keywords ***

Given I open Bizom Mobile application
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    autoGrantPermissions=${AUTO_GRANT_PERMISSIONS}
When User Click multiple times for env to appear and select staging environment
    Sleep    5
    Repeat Keyword    7    AppiumLibrary.Click Element    ${clickForEnv}
    AppiumLibrary.Click Element     ${envDropdown}
    Sleep    5
    AppiumLibrary.Click Element     ${stagingEnvOption}
When User enters username and password
    Input Text    ${usernameTxtField}   ${email}
    Input Password    ${passwordTxtField}     ${pass}
Then Click on Login button
    AppiumLibrary.Click Element    ${loginBtn1}
    Sleep    10