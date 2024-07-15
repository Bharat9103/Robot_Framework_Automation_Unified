@echo off
REM Set the path to the Robot Framework executable
SET ROBOT_EXECUTABLE=robot

REM Define tags and their corresponding directories in the desired sequence
SET TAGS1=MUT1
SET TAGS2=MUT2
SET TAGS3=MUT3

REM Define directories corresponding to each tag
SET DIRS1=%CD%\TestCases\Web
SET DIRS2=%CD%\TestCases\Mobile\Android\
SET DIRS3=%CD%\TestCases\Web

REM Print a message to indicate the start of the test run
echo Running Robot Framework tests with Allure listener...

REM Run tests with TAGS1 in DIRS1
%ROBOT_EXECUTABLE% --listener allure_robotframework --include %TAGS1% %DIRS1%
IF ERRORLEVEL 1 (
    echo Tests with %TAGS1% in %DIRS1% directory failed. See the report for details.
    pause
    exit /b %ERRORLEVEL%
)

REM Run tests with TAGS2 in DIRS2
%ROBOT_EXECUTABLE% --listener allure_robotframework --include %TAGS2% %DIRS2%
IF ERRORLEVEL 1 (
    echo Tests with %TAGS2% in %DIRS2% directory failed. See the report for details.
    pause
    exit /b %ERRORLEVEL%
)

REM Run tests with TAGS3 in DIRS3
%ROBOT_EXECUTABLE% --listener allure_robotframework --include %TAGS3% %DIRS3%
IF ERRORLEVEL 1 (
    echo Tests with %TAGS3% in %DIRS3% directory failed. See the report for details.
    pause
    exit /b %ERRORLEVEL%
)

REM If all tests passed, display success message
echo All tests passed successfully.

REM Generate Allure report from the results
allure generate output/allure --clean

REM Pause to keep the command prompt window open
pause

EXIT /B 0
