@echo off
REM Set the path to the Robot Framework executable
SET ROBOT_EXECUTABLE=robot

REM Set the tags you want to include (replace with your actual tags)
SET TAGS=UAT

REM Print a message to indicate the start of the test run
echo Running Robot Framework tests with Allure listener...

REM Run the Robot Framework tests from Mobile\Android directory with Allure listener and specific tags
%ROBOT_EXECUTABLE% --listener allure_robotframework --include %TAGS% %CD%\TestCases\Mobile\Android\
SET ERRORLEVEL=%ERRORLEVEL%

REM Check if the tests were successful
IF %ERRORLEVEL% NEQ 0 (
    echo Tests in Mobile\Android directory failed. See the report for details.
    pause
    exit /b %ERRORLEVEL%
)

REM Run the Robot Framework tests from Web directory with Allure listener and specific tags
%ROBOT_EXECUTABLE% --listener allure_robotframework --include %TAGS% %CD%\TestCases\Web
SET ERRORLEVEL=%ERRORLEVEL%

REM Check if the tests were successful
IF %ERRORLEVEL% EQU 0 (
    echo Tests passed successfully.
) ELSE (
    echo Tests in Web directory failed. See the report for details.
)

REM Generate Allure report from the results
allure generate output/allure --clean

REM Pause to keep the command prompt window open
pause
