# Credentials Mapping for E2E Test Modules

This document maps which credentials are used for each test module in the Gurutattva E2E automation framework.

## Module-wise Credentials

### 1. News Module (E2ENews.robot)

#### Global News Tests
- **Keyword Used**: `Login in with valid credentials`
- **Email**: sushrut.nistane@rysun.com
- **Password**: Sharu@051220
- **Role**: Super Admin
- **Access**: Global News, Categories, All CMS features
- **Defined In**: `resources/web_keywords.robot` (lines 43-44)
- **Used By**: TC01, TC02, TC03, TC04, TC05, TC78

#### Local News Tests
- **Keyword Used**: `Login in with Sanchalak credentials`
- **Email**: patilvaishub@gmail.com
- **Password**: Lavanya@21
- **Role**: Sanchalak (Local Coordinator)
- **Access**: Local News only
- **Defined In**: `pages/CRM_AudioPage.robot` (lines 77-78)
- **Used By**: TC46, TC47

---

### 2. Events Module (E2EEvents.robot)

#### Global Events Tests
- **Keyword Used**: `Login in with valid credentials`
- **Email**: sushrut.nistane@rysun.com
- **Password**: Sharu@051220
- **Role**: Super Admin
- **Access**: Global Events, All CMS features
- **Defined In**: `resources/web_keywords.robot` (lines 43-44)
- **Used By**: Most Event test cases

#### Local Events Tests
- **Keyword Used**: `Login in with Sanchalak credentials`
- **Email**: patilvaishub@gmail.com
- **Password**: Lavanya@21
- **Role**: Sanchalak (Local Coordinator)
- **Access**: Local Events only
- **Defined In**: `pages/CRM_AudioPage.robot` (lines 77-78)
- **Used By**: Local Event specific test cases

---

### 3. Role-Based Access Tests (E2ERoleRight.robot)

All role-based credentials are defined in `pages/E2ERoleRightPage.robot` (lines 16-29):

#### Prayer Coordinator
- **Email**: sankalp.kamdi@rysun.com
- **Password**: Admin@123
- **Access**: Prayer module only

#### Global Event Coordinator
- **Email**: amit.jadhav@rysun.com
- **Password**: Admin@123
- **Access**: Events - Global, Events - Local, Dhyansthali Management

#### Acharya
- **Email**: uttamshlok.sharma@rysun.com
- **Password**: Admin@123
- **Access**: Dhyansthali, Dhyankendra, News - Local, Events - Local, User Management

#### Maha Acharya
- **Email**: Bhavya.gajjar@rysun.com
- **Password**: Admin@123
- **Access**: Dhyansthali, Dhyankendra, News - Local, Events - Local, User Management

#### Namkaran Coordinator
- **Email**: ayush.chauhan@rysun.com
- **Password**: Admin@123
- **Access**: Dhyansthali Management, Namkaran

---

## How Credentials Are Used

### Automatic Selection
The test framework automatically uses the correct credentials based on the keyword called in the test:

1. **For News/Events Global Tests**: Call `Login in with valid credentials`
   - Automatically uses Super Admin credentials
   - No need to pass email/password manually

2. **For Local News/Events Tests**: Call `Login in with Sanchalak credentials`
   - Automatically uses Sanchalak credentials
   - No need to pass email/password manually

3. **For Role-Based Tests**: Call `Login With User Role    ${role_name}`
   - Example: `Login With User Role    Prayer Coordinator`
   - Automatically maps to correct email/password

### Example Usage in Test Cases

```robot
*** Test Cases ***
TC01 Add Global News
    [Documentation]    Test adding global news
    Open Web Browser
    Login in with valid credentials    # Uses Super Admin automatically
    Navigate To Global News In CMS
    # ... rest of test steps

TC46 Add Local News
    [Documentation]    Test adding local news
    Open Web Browser
    Login in with Sanchalak credentials    # Uses Sanchalak automatically
    Navigate To Local News In CMS
    # ... rest of test steps

TC01 Prayer Coordinator Access
    [Documentation]    Test prayer coordinator access
    Open Web Browser
    Navigate To CMS URL
    Login With User Role    Prayer Coordinator    # Auto-maps to sankalp.kamdi@rysun.com
    # ... rest of test steps
```

---

## Credential Files Reference

| File Path | Purpose | Credentials Stored |
|-----------|---------|-------------------|
| `resources/web_keywords.robot` | Super Admin login | sushrut.nistane@rysun.com |
| `pages/CRM_AudioPage.robot` | Sanchalak login | patilvaishub@gmail.com |
| `pages/E2ERoleRightPage.robot` | All role-based logins | 5 role-based credentials |

---

## Important Notes

1. **No Manual Credential Entry Needed**: All credentials are pre-configured in the framework
2. **Test Cases Use Keywords**: Tests call login keywords, not direct credentials
3. **Credential Changes**: If credentials need to be updated, modify the respective page/resource files
4. **Security**: Credentials are stored in code for test automation purposes only

---

## Last Updated
- Date: 2025-12-09
- Updated By: Automation Team
- Reason: Documented News and Events module credentials mapping
