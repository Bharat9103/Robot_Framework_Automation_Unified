*** Settings ***
Documentation       Tests to login to Login Page
Library             SeleniumLibrary
Resource    ../../Resources/WebKeywords/keywords.robot
Resource    ../../Resources/WebVariables/variables.robot

*** Test Cases ***

Validate Unsuccessful Login using invalid credentials
    [Tags]    SMOKE     MUT3
    Given I open the Browser with URL
    When I fill the login form with invalid credentials
    Then I verify the error message is correct
    And I close the browser session

Validate successful Login
    [Tags]    UAT
    Given I open the Browser with URL
    When I fill the login form with valid credentials
    Then I verify the Dashboard page opens
    And I close the browser session