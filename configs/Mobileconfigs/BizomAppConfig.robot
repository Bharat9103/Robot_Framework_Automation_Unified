*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}         http://localhost:4723
${PLATFORM_NAME}      Android
${DEVICE_NAME}        emulator-5554
${APP_PACKAGE}        in.bizom.android
${APP_ACTIVITY}       in.bizom.android.ui.FullScreenActivity
${AUTOMATION_NAME}    UiAutomator2
${AUTO_GRANT_PERMISSIONS}    true

*** Keywords ***
Open Bizom Application
    [Documentation]    Opens the Bizom Mobile application
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${AUTOMATION_NAME}
    ...    autoGrantPermissions=${AUTO_GRANT_PERMISSIONS}
