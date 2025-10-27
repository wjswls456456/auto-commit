@echo off
REM Windows Task Scheduler setup script
REM Run this as Administrator

set SCRIPT_PATH=%~dp0auto-commit.js
set TASK_NAME=DailyAutoCommit

echo Creating scheduled task: %TASK_NAME%
echo Script path: %SCRIPT_PATH%
echo.

REM Delete existing task if it exists
schtasks /Delete /TN "%TASK_NAME%" /F 2>nul

REM Create new task - runs daily at 11:00 PM
schtasks /Create /TN "%TASK_NAME%" /TR "node \"%SCRIPT_PATH%\"" /SC DAILY /ST 23:00 /F

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Successfully created scheduled task!
    echo The script will run daily at 11:00 PM
    echo.
    echo To view the task: schtasks /Query /TN "%TASK_NAME%"
    echo To delete the task: schtasks /Delete /TN "%TASK_NAME%" /F
) else (
    echo.
    echo Failed to create scheduled task.
    echo Make sure you run this script as Administrator.
)

pause
