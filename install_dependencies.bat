@echo off
REM ============================================================================
REM Gurutattva E2E Automation - Dependency Installation Script (Windows)
REM ============================================================================
REM This script installs all Python dependencies required for the project
REM Run this after setting up Python 3.12+
REM ============================================================================

echo.
echo ============================================================================
echo  Gurutattva E2E Automation - Installing Dependencies
echo ============================================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH
    echo Please install Python 3.12+ from https://www.python.org/
    pause
    exit /b 1
)

echo [INFO] Python found:
python --version
echo.

REM Check if pip is available
pip --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] pip is not available
    echo Installing pip...
    python -m ensurepip --upgrade
)

echo [INFO] pip found:
pip --version
echo.

REM Upgrade pip to latest version
echo [STEP 1/4] Upgrading pip to latest version...
python -m pip install --upgrade pip
if errorlevel 1 (
    echo [ERROR] Failed to upgrade pip
    pause
    exit /b 1
)
echo [SUCCESS] pip upgraded successfully
echo.

REM Install/upgrade setuptools and wheel
echo [STEP 2/4] Installing/upgrading setuptools and wheel...
pip install --upgrade setuptools wheel
if errorlevel 1 (
    echo [ERROR] Failed to install setuptools and wheel
    pause
    exit /b 1
)
echo [SUCCESS] setuptools and wheel installed
echo.

REM Install dependencies from requirements.txt
echo [STEP 3/4] Installing dependencies from requirements.txt...
pip install -r requirements.txt
if errorlevel 1 (
    echo [ERROR] Failed to install dependencies
    echo Check the error messages above for details
    pause
    exit /b 1
)
echo [SUCCESS] All dependencies installed successfully
echo.

REM Verify critical packages
echo [STEP 4/4] Verifying installation...
echo.
echo Checking Robot Framework:
robot --version
if errorlevel 1 (
    echo [WARNING] Robot Framework verification failed
) else (
    echo [SUCCESS] Robot Framework is working
)
echo.

echo Checking installed packages:
pip list | findstr /i "robot selenium appium"
echo.

echo ============================================================================
echo  Installation Complete!
echo ============================================================================
echo.
echo Next steps:
echo   1. Install Node.js v20.x LTS from https://nodejs.org/
echo   2. Install Appium: npm install -g appium
echo   3. Install UIAutomator2 driver: npm install -g appium-uiautomator2-driver
echo   4. Connect Android device via USB
echo   5. Run tests: python -m robot tests/E2EDhyankendra.robot
echo.
echo For detailed setup instructions, see:
echo   - TEAM_MEMBER_SETUP_GUIDE.md
echo   - MOBILE_TESTING_SETUP_GUIDE.md
echo.
pause
