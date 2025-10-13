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

### Basic Test Execution

```cmd
# Run all tests
robot --outputdir results tests/

# Run specific test suite
robot --outputdir results tests/E2EEvents.robot

# Run with specific tags
robot --outputdir results --include TC46 tests/E2EEvents.robot
```

### Test Execution with Email Notifications

The project automatically sends email notifications after test completion. No additional setup required - just run your tests normally:

```cmd
robot --outputdir results tests/
```

## 📧 Email Notifications

### Features

- **One-line test summary**: "Out of 10, 1 Test failed, and 9 Passed"
- **ZIP file attachment**: Contains report.html, log.html, and output.xml
- **Multiple CC recipients**: Support for multiple email addresses
- **Professional HTML format**: Clean, readable email templates
- **Automatic triggering**: Sends after every test suite execution

### Email Configuration

Update the email settings in `resources/simple_email_notifications.robot`:

```robot
*** Variables ***
${SMTP_SERVER}              smtp.gmail.com
${SMTP_PORT}                587
${SMTP_USERNAME}            your-email@gmail.com
${SMTP_PASSWORD}            your-app-password
${EMAIL_FROM}               your-email@gmail.com
${EMAIL_TO}                 recipient@example.com
${EMAIL_CC}                 cc1@example.com,cc2@example.com
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

For issues or questions:
1. Check the troubleshooting section
2. Review test logs in `results/log.html`
3. Verify email configuration settings

---

**Generated by Robot Framework E2E Testing Suite** 🤖