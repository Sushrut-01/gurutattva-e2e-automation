# Gurutattva E2E Testing Project

## 📋 Project Overview

This is a comprehensive End-to-End (E2E) testing suite for the Gurutattva application using Robot Framework. The project covers both web-based CMS (Content Management System) and mobile app testing with automated email notifications.

## 🏗️ Project Structure

```
E2E_Project/
├── pages/                          # Page Object Model files
│   ├── E2EEventsPage.robot         # Events page locators and keywords
│   ├── E2ENewsPage.robot           # News page locators and keywords
│   └── ...                         # Other page files
├── tests/                          # Test case files
│   ├── E2EEvents.robot             # Events test cases
│   ├── E2ENews.robot               # News test cases
│   └── ...                         # Other test files
├── resources/                      # Resource files
│   ├── libraries.robot             # Library imports
│   ├── keywords.robot              # Common keywords
│   ├── test_setup_teardown.robot   # Setup/teardown keywords
│   └── simple_email_notifications.robot  # Email notification system
├── test_data/                      # Test data files
│   └── *.jpg                       # Image files for testing
└── results/                        # Test execution results
    ├── report.html                 # HTML test report
    ├── log.html                    # Detailed test log
    ├── output.xml                  # XML output
    └── Test_Report_*.zip           # Zipped reports for email
```

## 🚀 Setup Process

### Prerequisites

1. **Python 3.7+** - [Download Python](https://www.python.org/downloads/)
2. **Robot Framework** - Install via pip:
   ```cmd
   pip install robotframework
   ```
3. **AppiumLibrary** - For mobile app testing:
   ```cmd
   pip install robotframework-appiumlibrary
   ```
4. **SeleniumLibrary** - For web testing:
   ```cmd
   pip install robotframework-seleniumlibrary
   ```

### Installation Steps

1. **Clone/Download the project** to your local machine
2. **Install dependencies**:
   ```cmd
   pip install -r requirements.txt
   ```
3. **Configure email settings** in `resources/simple_email_notifications.robot`:
   ```robot
   ${SMTP_SERVER}              smtp.gmail.com
   ${SMTP_PORT}                587
   ${SMTP_USERNAME}            your-email@gmail.com
   ${SMTP_PASSWORD}            your-app-password
   ${EMAIL_FROM}               your-email@gmail.com
   ${EMAIL_TO}                 recipient@example.com
   ${EMAIL_CC}                 cc1@example.com,cc2@example.com
   ```
4. **Set up test data** in the `test_data/` folder
5. **Configure device/app settings** in your test files

## 🧪 Running Tests

### Why `--outputdir results` is Required

**✅ ALWAYS use `--outputdir results`** for the following reasons:

1. **Clean Project Structure**: Keeps reports organized in `results/` folder
2. **Email System Compatibility**: Email notifications expect reports in `results/` directory
3. **File Management**: Prevents cluttering the main project directory
4. **CI/CD Integration**: Standard practice for automated pipelines

**❌ Without `--outputdir results`:**
- Reports created in root directory (`D:\E2E_Project\`)
- Email system may fail to find report files
- Project directory becomes cluttered

### Command Examples

#### **1. Basic Test Execution**

```cmd
# Run all tests in the project
robot --outputdir results tests/

# Run specific test suite
robot --outputdir results tests/E2EEvents.robot

# Run specific test suite with verbose output
robot --outputdir results --loglevel DEBUG tests/E2EAudio.robot
```

#### **2. Tag-Based Execution**

```cmd
# Run tests with specific tag (single tag)
robot --outputdir results --include tc58_01 tests/E2EAudio.robot

# Run tests with multiple tags (AND condition)
robot --outputdir results --include tc58_01 --include E2EAudio tests/E2EAudio.robot

# Run tests with any of the tags (OR condition)
robot --outputdir results --include tc58_01ORtc58_02 tests/E2EAudio.robot

# Run tests with milestone tag across all test files
robot --outputdir results --include milestone2 tests/

# Run tests with regression tag across specific modules
robot --outputdir results --include regression tests/E2EEvents.robot tests/E2ENews.robot

# Exclude specific tags
robot --outputdir results --exclude skip tests/

# Combine include and exclude
robot --outputdir results --include smoke --exclude flaky tests/
```

#### **3. Module-Specific Execution**

```cmd
# Run all Events tests
robot --outputdir results tests/E2EEvents.robot

# Run all News tests
robot --outputdir results tests/E2ENews.robot

# Run all Audio tests
robot --outputdir results tests/E2EAudio.robot

# Run all Prayer tests
robot --outputdir results tests/E2EPrayer.robot

# Run all Registration tests
robot --outputdir results tests/E2ERegistration.robot
```

#### **4. Advanced Execution Options**

```cmd
# Run with custom output directory
robot --outputdir custom_results tests/

# Run with custom name for output files
robot --outputdir results --name "Smoke_Test_Run" tests/

# Run with specific log level
robot --outputdir results --loglevel TRACE tests/

# Run with variable substitution
robot --outputdir results --variable BROWSER:Chrome tests/

# Run with multiple variables
robot --outputdir results --variable BROWSER:Chrome --variable ENVIRONMENT:Staging tests/

# Run with dry run (no actual execution)
robot --outputdir results --dryrun tests/

# Run with specific test case name
robot --outputdir results --test "Test Add New Event" tests/E2EEvents.robot

# Run with specific suite name
robot --outputdir results --suite E2EEvents tests/
```

#### **5. Parallel Execution (if supported)**

```cmd
# Run tests in parallel (requires pabot)
pabot --outputdir results tests/

# Run specific suites in parallel
pabot --outputdir results tests/E2EEvents.robot tests/E2ENews.robot
```

#### **6. CI/CD Pipeline Commands**

```cmd
# Production test run
robot --outputdir results --include production tests/

# Smoke test run
robot --outputdir results --include smoke tests/

# Regression test run
robot --outputdir results --include regression tests/

# Critical path tests
robot --outputdir results --include critical tests/
```

#### **7. Debug and Troubleshooting**

```cmd
# Run with maximum verbosity
robot --outputdir results --loglevel TRACE --debugfile debug.log tests/

# Run single test case for debugging
robot --outputdir results --test "Test Podcast Different Filter Functionality" tests/E2EAudio.robot

# Run with console output
robot --outputdir results --consolecolors on tests/

# Run with timestamp in output
robot --outputdir results --timestampoutputs tests/
```

### **Common Tag Examples**

Based on your project structure, here are common tag patterns:

```cmd
# Test Case IDs
--include tc58_01
--include tc46_01
--include tc47_01

# Module Tags
--include E2EAudio
--include E2EEvents
--include E2ENews

# Priority Tags
--include high
--include medium
--include low

# Test Type Tags
--include smoke
--include regression
--include integration

# Milestone Tags
--include milestone1
--include milestone2
--include sprint1

# Status Tags
--include ready
--include wip
--include skip
```

### Test Execution with Email Notifications

The project sends email notifications after **complete test execution** (all test files). Use one of these methods:

#### **Method 1: Using Batch/PowerShell Scripts (Recommended)**
```cmd
# Windows Batch
run_tests_with_final_email.bat

# PowerShell
.\run_tests_with_final_email.ps1
```

#### **Method 2: Manual Execution**
```cmd
# Run tests
robot --outputdir results tests/

# Wait for reports to be finalized
timeout /t 3 /nobreak

# Send final email
python send_final_email.py
```

#### **Method 3: Direct Robot Framework (No Email)**
```cmd
# Run tests without email notification
robot --outputdir results tests/
```

**⚠️ Important:** Email is sent only after **all test files** are completed, ensuring the ZIP contains the final reports.

## 📧 Email Notifications

### Features

- **One-line test summary**: "Out of 10, 1 Test failed, and 9 Passed"
- **ZIP file attachment**: Contains report.html, log.html, and output.xml
- **Multiple CC recipients**: Support for multiple email addresses
- **Professional HTML format**: Clean, readable email templates
- **Delayed email triggering**: Waits for reports to be fully generated before sending
- **Automatic triggering**: Sends after every test suite execution

### How It Works

The email system now uses a **delayed email approach** to ensure you receive the latest reports:

1. **Test Execution**: Robot Framework runs tests and generates reports
2. **Teardown**: Suite teardown triggers a background delayed email process
3. **Report Wait**: The delayed email script waits for all HTML reports to be fully generated
4. **ZIP Creation**: Creates a ZIP file with the latest report.html, log.html, and output.xml
5. **Email Send**: Sends email with the complete, up-to-date reports

### Manual Email Triggering

If you need to send email manually after test execution:

```cmd
# Direct Python (recommended)
python send_email.py
```

### Email Configuration

Update the email settings in `send_email.py`:

```python
# Email Configuration
SMTP_SERVER = "mail.smtp2go.com"
SMTP_PORT = 587
SMTP_USERNAME = "smtp@rysun.com"
SMTP_PASSWORD = "your-password"
EMAIL_FROM = "smtp@rysun.com"
EMAIL_TO = "recipient@example.com"
PROJECT_NAME = "Gurutattva Automation"
```

### Gmail Setup (if using Gmail)

1. **Enable 2-Factor Authentication** in your Google Account
2. **Generate App Password**:
   - Go to Google Account → Security → 2-Step Verification → App passwords
   - Select "Mail" and "Other (Custom name)"
   - Generate password and use it as `${SMTP_PASSWORD}`

## 🏛️ Centric Library Concept

### Page Object Model (POM)

The project follows the **Page Object Model** pattern for better maintainability:

#### **Page Files** (`pages/`)
- **Purpose**: Contains all UI locators and page-specific keywords
- **Naming**: `[Module]Page.robot` (e.g., `E2EEventsPage.robot`)
- **Content**: 
  - Locators (XPath, CSS selectors)
  - Page-specific keywords
  - Form interactions
  - Validation methods

#### **Test Files** (`tests/`)
- **Purpose**: Contains test cases using simple English steps
- **Naming**: `E2E[Module].robot` (e.g., `E2EEvents.robot`)
- **Content**:
  - Test case definitions
  - High-level test steps
  - Test data setup
  - Assertions

### Example Structure

**Page File** (`pages/E2EEventsPage.robot`):
```robot
*** Variables ***
${EVENTS_MENU}              xpath=//div[@aria-label="Events"]
${ADD_EVENTS_BUTTON}        xpath=//a[contains(., 'Add Event')]

*** Keywords ***
Click Add Events Button
    [Documentation]    Clicks on the Add Events button
    Web.Wait Until Element Is Visible    ${ADD_EVENTS_BUTTON}    10s
    Web.Click Element    ${ADD_EVENTS_BUTTON}
    Log To Console    ✅ Clicked on Add Events Button
```

**Test File** (`tests/E2EEvents.robot`):
```robot
*** Test Cases ***
Test Add New Event
    [Documentation]    Test adding a new event
    Open Web Browser
    Login in with valid credentials
    Click Add Events Button
    Enter Event Details
    Submit Event
    Verify Event Created Successfully
    Close Web Browser
```

## 🔧 SMTP Configuration Details

### Supported Email Providers

| Provider | SMTP Server | Port | Security |
|----------|-------------|------|----------|
| Gmail | smtp.gmail.com | 587 | TLS |
| Outlook | smtp-mail.outlook.com | 587 | TLS |
| Yahoo | smtp.mail.yahoo.com | 587 | TLS |
| Custom | your-smtp-server.com | 587/465 | TLS/SSL |

### Configuration Variables

```robot
# Basic SMTP Configuration
${SMTP_SERVER}              smtp.gmail.com
${SMTP_PORT}                587
${SMTP_USERNAME}            your-email@domain.com
${SMTP_PASSWORD}            your-password-or-app-password

# Email Recipients
${EMAIL_FROM}               your-email@domain.com
${EMAIL_TO}                 primary@recipient.com
${EMAIL_CC}                 cc1@example.com,cc2@example.com
${EMAIL_BCC}                bcc@example.com

# Report Settings
${REPORT_DIRECTORY}         ${EXECDIR}/results
${TEST_ENVIRONMENT}         Local Machine
${PROJECT_NAME}             Gurutattva E2E Testing
```

### Security Best Practices

1. **Use App Passwords** for Gmail/Outlook instead of regular passwords
2. **Environment Variables**: Store sensitive data in environment variables
3. **Network Security**: Ensure SMTP ports are not blocked by firewall
4. **Authentication**: Always use TLS/SSL encryption

## 📊 Test Reports

### Generated Files

- **report.html**: Main test report with summary and details
- **log.html**: Detailed execution log with screenshots
- **output.xml**: Machine-readable XML output
- **Test_Report_*.zip**: Zipped reports sent via email

### Email Report Content

- **Test Summary**: One-line statistics (e.g., "Out of 10, 1 Test failed, and 9 Passed")
- **Execution Details**: Test name, status, execution time
- **Environment Info**: Test environment and generation time
- **Attachments**: Complete ZIP file with all reports

## 🐛 Troubleshooting

### Common Issues

1. **Email not sending**:
   - Check SMTP credentials
   - Verify network connectivity
   - Ensure app password is used for Gmail

2. **Tests failing**:
   - Check device/app connectivity
   - Verify locators are up-to-date
   - Review test data files

3. **ZIP file not created**:
   - Ensure report files exist in results directory
   - Check file permissions

### Debug Mode

Run tests with debug logging:
```cmd
robot --loglevel DEBUG --outputdir results tests/
```

## 📝 Contributing

1. Follow the Page Object Model pattern
2. Keep test cases simple and readable
3. Add proper documentation to keywords
4. Update this README when adding new features

## 📞 Support
   Email : warish.kumar@rysun.com

For issues or questions:
1. Check the troubleshooting section
2. Review test logs in `results/log.html`
3. Verify email configuration settings

---

**Generated by Robot Framework E2E Testing Suite** 🤖