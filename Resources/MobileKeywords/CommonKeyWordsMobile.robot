*** Settings ***
Library    AppiumLibrary
Resource    ../../Resources/MobileKeywords/DSM_Attendance_Keys.robot

*** Keywords ***

#######################DSM_Attendance#######################
When Login and Navigate to Attendance Page
    [Documentation]    Logs in to the Bizom app and navigates to the attendance page
    When User Click multiple times for env to appear and select staging environment
    When User enters username and password
    Then Click on Login button
    When User click done button displayed on sync page
    Then Verify user is on attendance page