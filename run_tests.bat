@echo off
REM Set the path to the Robot Framework executable and the test case file
SET ROBOT_EXECUTABLE=robot
SET TEST_SUITE_PATH=C:\Users\Admin\PycharmProjects\RobotFrameworkAutomation\TestCases\Mobile\Android\Login.robot

REM Print a message to indicate the start of the test run
echo Running Robot Framework tests with Allure listener...

REM Run the Robot Framework test suite with Allure listener
%ROBOT_EXECUTABLE% --listener allure_robotframework %TEST_SUITE_PATH%
SET ERRORLEVEL=%ERRORLEVEL%

REM Check if the tests were successful
IF %ERRORLEVEL% EQU 0 (
    echo Tests passed successfully.
) ELSE (
    echo Tests failed. See the report for details.
)

REM Generate Allure report from the results
allure generate output/allure --clean

REM Pause to keep the command prompt window open
pause