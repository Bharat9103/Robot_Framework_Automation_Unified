*** Settings ***
Library    AppiumLibrary
Variables   ../../PageObjects/MobileLocators/DSM_Attendance.py
Resource    ../../configs/Mobileconfigs/BizomAppConfig.robot
Variables   ../../PageObjects/MobileLocators/loginScreen.py
Resource    ../../Resources/MobileVariables/loginVariables.robot
Resource    ../../configs/Mobileconfigs/BizomAppConfig.robot
Resource    ../../Resources/MobileKeywords/LoginKeywords.robot
Resource    ../../Resources/MobileKeywords/CustomCommandsMobile.robot
*** Keywords ***

#TC3811 - verify that user is able to see the attendance page for the first log in of the day
When User click done button displayed on sync page
    Wait For Element    syncDoneBtn
    Click an Element   syncDoneBtn
Then Verify user is on attendance page
    Wait For Element    AttendanceHeader
    Check Element Contains Text     AttendanceHeader    Attendance

#TC3812 - verify that User is not able to see the attendance page as attendance has already been registered in first time
When User log in whose attendance is marked
    Input Text    ${usernameTxtField}   ${username}
    Input Password    ${passwordTxtField}     ${pass}
Then Verify user lands on beat page
    Wait For Element    plusIconAddOutlet
    Check Element Visibility    plusIconAddOutlet

#TC3814 - verify that User can see the NOT WORKING button on the header for attendance page
Then Verify user is able to see NOT WORKING button on the top of the page
    Check Element Visibility    notWorkingBtn
    Check Element Contains Text     notWorkingBtn   NOT WORKING

#TC3815 - verify that user is able to see the picture box in the attendance page
Then Verify user is able to locate picture box in attendance page with camera icon
    Check Element Visibility    cameraIcon

#TC3816 - verify that upon clicking the picture icon, the camera will open to take the picture for attendance
When User clicks on camera icon
    Click an Element    cameraIcon
Then Verify user is able to see camera getting open
    Wait For Element    cameraScreen
    Check Element Visibility    cameraScreen

#TC3817 - verify that user is abel to see the address in the attendance window
Then Verify user is able to see the address in the attendance screen
    Check Element Visibility    addressField
    Check Element Contains Text     addressField    Address

#TC3818 - verify that user is able to see the phone number in the attendance window
Then Verify user is able to see the phone number in the attendance screen
    Check Element Visibility    phoneField
    Check Element Contains Text     phoneField    Phone

#TC3819 - verify that user is able to see the email information in attendance window
Then Verify user is able to see the mail information in the attendance screen
    Check Element Visibility    emailField
    Check Element Contains Text     emailField      Email

#TC3820 - verify that usr is able to see the designation in the attendance window
Then Verify user is able to see the designation in the attendance screen
    Check Element Visibility    designationField
    Check Element Contains Text    designationField    Designation

#TC3821 - verify that user can see the present button in green color in the footer
Then Verify user is able to see the green present button in the footer in the attendance screen
    Check Element Visibility    presentButton
    Check Element Contains Text    presentButton    PRESENT

#TC3822 - verify that user is able to locate the absent button in the footer with amber color
Then Verify user is able to locate absent button with amber color in the footer in the attendance screen
    Check Element Visibility    absentButton
    Check Element Contains Text    absentButton    ABSENT

#TC3823 -verify that if user tries to click present without any registered picture, it will show pop up message
When User clicks on Present button
    Wait For Element    presentButton
    Click an Element    presentButton
Then User is able to locate a pop up message as "PLease take your picture to mark your attendance"
    Wait Until the Page Contains    ${EXPECTED_MESSAGE}

#TC3825 - verify that user can rotate the camera in camera window if needed
Then Click on switch icon to rotate the camera and validate the screen
    Check Element Visibility    cameraRotateIcon
    Check Element is Clickable    cameraRotateIcon
    Click an Element    cameraRotateIcon

#TC3827 - verify that upon clicking present user is able to see the dialogue box with remarks text box and the reason dropdown
When User captures the image for attendance
    Wait For Element    takePhotoIcon
    Click an Element    takePhotoIcon
Then Verify the Dialogue box with remark field is visible
    Wait For Element    confirmationPopUp
    Check Element Visibility    confirmationPopUp
    Check Element Visibility    remarkTitle
    Check Element Contains Text    remarkTitle    Remarks
    Check Element Visibility    remarkTitle

#TC3828 - verify that upon successfully marking the attenndance as present, user is able to see the day wise beat page
    When User Click multiple times for env to appear and select staging environment
When User logs in whose attendance is not marked
    Input Text    ${usernameTxtField}   ${user1}
    Input Password    ${passwordTxtField}     ${pass}
Then Enter Remark and submit
    Wait For Element    remarkTxtField
    Send Keys    remarkTxtField    Test
    Wait For Element    submitButton
    Click an Element    submitButton
    Wait For Element    submitButton
    Click an Element    submitButton

#TC3829 - verify that user can click on cancel, even when the photo is clicked
Then Enter Remark and click cancel button
    Wait For Element    remarkTxtField
    Send Keys    remarkTxtField    Test
    Wait For Element    cancelButton
    Click an Element    cancelButton

#TC3830 - verify that user can see the remarks and reason box when user marks it as absent
When User clicks on Absent button
    Wait For Element    absentButton
    Click an Element    absentButton
Then Verify the Dialogue box with absent title remark field is visible
    Wait For Element    absentTitle
    Check Element Visibility    absentTitle
    Check Element Contains Text    absentTitle    You will be marked Absent for the day
    Check Element Visibility    remarkTitle
    Check Element Contains Text    remarkTitle    Remarks
    Check Element Visibility    remarkTxtField

#TC3831 - verify that user is abel to go forward to beats Page with NOT WORKING button clicked, but cants start a call
When User logs in with user who marks as NOT WORKING
    Input Text    ${usernameTxtField}   ${user2}
    Input Password    ${passwordTxtField}     ${pass}
When User marks as NOT WORKING
    Wait For Element    notWorkingBtn
    Click an Element    notWorkingBtn
Then Verify user is on outlets screen
    Wait Until the Page Contains    Outlet
When User selects any dealer
    Wait Until the Page Contains    18. ABC Kirana Store
    Click Text    ABC Kirana Store
    Sleep    10s
Then Verify user is not able to see Start Call option
    Page Should Not Contain the Element    plusIconAddOutlet

#TC3832 - Verify that user can mark attendance later from the side collapsible menu
When User clicks on side menu icon
    Single Tap On Specific Coordinates     93    173
When User selects Mark Attendance option from side menu
    Wait For Element    markAttendanceOption
    Check Element Visibility    markAttendanceOption
    Click an Element    markAttendanceOption
Then Verify NOT WORKING button should not be displayed
    Page Should Not Contain the Element    notWorkingBtn

#TC3833 - verify that user is able to see EOD option from the collpasible menu only if attendance is registered
Then Verify User can see EOS option in the side collapsible menu
    Wait For Element    eodOption
    Check Element Visibility    eodOption

#TC3834 - verify that User can see the attendance status from my info page of side menu
Then Verify user can see My Info option and click on it
    Wait For Element    myInfoOption
    Check Element Visibility    myInfoOption
    Click an Element    myInfoOption
Then Verify user can see attendance status in the My Info section
    Wait For Element    attendanceStatusMyInfo
    Check Element Contains Text    attendanceStatusMyInfo    present (synced)



