*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/WebVariables/variables.robot
*** Keywords ***

Given I open the Browser with URL
    Open Browser    ${url}      ${browser_name}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

When I fill the login form with valid credentials
    Input Text    css:input[name='username']   ${valid_username}
    Input Password    css:input[name='password']   ${valid_password}
    Click Button    css:button[type='submit']

When I fill the login form with invalid credentials
    Input Text    css:input[name='username']   ${valid_username}
    Input Password    css:input[name='password']   ${invalid_password}
    Click Button    css:button[type='submit']

Then I verify the error message is correct
    Element Text Should Be    ${login_error_message}    Invalid credentials

Then I verify the Dashboard page opens
    Element Text Should Be    ${dashboard_title}      Dashboard

And I close the browser session
    Close Browser