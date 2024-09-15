*** Settings ***
Library    AppiumLibrary
Resource    ../../../Resources/MobileKeywords/LoginKeywords.robot
Resource    ../../../Resources/MobileVariables/loginVariables.robot
Resource    ../../../Resources/MobileKeywords/DSM_Attendance_Keys.robot
Resource    ../../../Resources/MobileKeywords/CommonKeyWordsMobile.robot
Task Setup      Open Bizom Application
Suite Teardown      Terminate Application    in.bizom.android
*** Test Cases ***

TC3811 - verify that user is able to see the attendance page for the first log in of the day
    [Tags]  UAT     MUT2
    When Login and Navigate to Attendance Page

TC3812 - verify that User is not able to see the attendance page as attendance has already been registered in first time
    When User Click multiple times for env to appear and select staging environment
    When User log in whose attendance is marked
    Then Click on Login button
    Then Verify user lands on beat page

TC3813 - verify that user can see attendance written as header
    When Login and Navigate to Attendance Page

TC3814 - verify that User can see the NOT WORKING button on the header for attendance page
    When Login and Navigate to Attendance Page
    Then Verify user is able to see NOT WORKING button on the top of the page

TC3815 - verify that user is able to see the picture box in the attendance page
    When Login and Navigate to Attendance Page
    Then Verify user is able to locate picture box in attendance page with camera icon

TC3816 - verify that upon clicking the picture icon, the camera will open to take the picture for attendance
    When Login and Navigate to Attendance Page
    When User clicks on camera icon
    Then Verify user is able to see camera getting open

TC3817 - verify that user is abel to see the address in the attendance window
    When Login and Navigate to Attendance Page
    Then Verify user is able to see the address in the attendance screen

TC3818 - verify that user is able to see the phone number in the attendance window
    When Login and Navigate to Attendance Page
    Then Verify user is able to see the phone number in the attendance screen

TC3819 - verify that user is able to see the email information in attendance window
    When Login and Navigate to Attendance Page
    Then Verify user is able to see the mail information in the attendance screen

TC3820 - verify that usr is able to see the designation in the attendance window
    When Login and Navigate to Attendance Page
    Then Verify user is able to see the designation in the attendance screen

TC3821 - verify that user can see the present button in green color in the footer
    When Login and Navigate to Attendance Page
    Then Verify user is able to see the green present button in the footer in the attendance screen

TC3822 - verify that user is able to locate the absent button in the footer with amber color
    When Login and Navigate to Attendance Page
    Then Verify user is able to locate absent button with amber color in the footer in the attendance screen

TC3823 -verify that if user tries to click present without any registered picture, it will show pop up message
    When Login and Navigate to Attendance Page
    When User clicks on Present button
    Then User is able to locate a pop up message as "PLease take your picture to mark your attendance"

TC3824 - verify that upon clikcing the camera icon, user is able to open camera and click a picture
    When Login and Navigate to Attendance Page
    When User clicks on camera icon
    Then Verify user is able to see camera getting open

TC3825 - verify that user can rotate the camera in camera window if needed
    When Login and Navigate to Attendance Page
    When User clicks on camera icon
    Then Verify user is able to see camera getting open
    Then Click on switch icon to rotate the camera and validate the screen

TC3827 - verify that upon clicking present user is able to see the dialogue box with remarks text box and the reason dropdown
    When Login and Navigate to Attendance Page
    When User clicks on camera icon
    When User captures the image for attendance
    When User clicks on Present button
    Then Verify the Dialogue box with remark field is visible

TC3828 - verify that upon successfully marking the attenndance as present, user is able to see the day wise beat page
    When User Click multiple times for env to appear and select staging environment
    When User logs in whose attendance is not marked
    Then Click on Login button
    When User click done button displayed on sync page
    Then Verify user is on attendance page
    When User clicks on camera icon
    When User captures the image for attendance
    When User clicks on Present button
    Then Enter Remark and submit
    Then Verify user lands on beat page

TC3829 - verify that user can click on cancel, even when the photo is clicked
    When Login and Navigate to Attendance Page
    When User clicks on camera icon
    When User captures the image for attendance
    When User clicks on Present button
    Then Enter Remark and click cancel button
    Then Verify user is on attendance page

TC3830 - verify that user can see the remarks and reason box when user marks it as absent
    When Login and Navigate to Attendance Page
    When User clicks on Absent button
    Then Verify the Dialogue box with absent title remark field is visible

TC3831 - verify that user is abel to go forward to beats Page with NOT WORKING button clicked, but cants start a call
    When User Click multiple times for env to appear and select staging environment
    When User logs in with user who marks as NOT WORKING
    Then Click on Login button
    When User click done button displayed on sync page
    Then Verify user is on attendance page
    When User marks as NOT WORKING
    Then Verify user is on outlets screen
    When User selects any dealer
    Then Verify user is not able to see Start Call option

TC3832 - Verify that user can mark attendance later from the side collapsible menu
    When User Click multiple times for env to appear and select staging environment
    When User logs in with user who marks as NOT WORKING
    Then Click on Login button
    When User click done button displayed on sync page
    Then Verify user is on attendance page
    When User marks as NOT WORKING
    Then Verify user is on outlets screen
    When User clicks on side menu icon
    When User selects Mark Attendance option from side menu
    Then Verify NOT WORKING button should not be displayed

TC3833 - verify that user is able to see EOD option from the collpasible menu only if attendance is registered
    When User Click multiple times for env to appear and select staging environment
    When User log in whose attendance is marked
    Then Click on Login button
    Then Verify user lands on beat page
    When User clicks on side menu icon
    Then Verify User can see EOS option in the side collapsible menu

TC3834 - verify that User can see the attendance status from my info page of side menu
    When User Click multiple times for env to appear and select staging environment
    When User log in whose attendance is marked
    Then Click on Login button
    Then Verify user lands on beat page
    When User clicks on side menu icon
    Then Verify user can see My Info option and click on it
    Then Verify user can see attendance status in the My Info section