# GURUTATTVA E2E AUTOMATION - PROJECT HANDOVER DOCUMENT

**Handover Date:** February 7, 2026
**Prepared By:** Sushrut Nistane
**Project Status:** Active Development
**Document Version:** 1.0

---

## TABLE OF CONTENTS

1. [Executive Summary](#1-executive-summary)
2. [Repository Access](#2-repository-access)
3. [Technology Stack](#3-technology-stack)
4. [Project Structure](#4-project-structure)
5. [Test Coverage Summary](#5-test-coverage-summary)
6. [Configuration & Credentials](#6-configuration--credentials)
7. [How to Run Tests](#7-how-to-run-tests)
8. [CI/CD Pipeline](#8-cicd-pipeline)
9. [Email Notifications](#9-email-notifications)
10. [Known Issues & Pending Work](#10-known-issues--pending-work)
11. [Handover Checklist](#11-handover-checklist)
12. [Key Contacts](#12-key-contacts)
13. [Additional Documentation](#13-additional-documentation)

---

## 1. EXECUTIVE SUMMARY

The **Gurutattva E2E Automation** project is a comprehensive test automation framework for the Gurutattva spiritual application. It provides end-to-end testing coverage for both the Web CMS (Content Management System) and the Android Mobile Application.

### Key Highlights

| Metric | Value |
|--------|-------|
| **Total Test Cases** | 78+ |
| **Test Suites** | 11 |
| **Page Object Files** | 24 |
| **Current Pass Rate** | ~60% (47/78) |
| **Framework** | Robot Framework |
| **Web Testing** | Selenium WebDriver |
| **Mobile Testing** | Appium (Android) |
| **CI/CD** | Jenkins + GitHub Actions |

### Application Under Test

- **Web CMS URL:** https://gurutattva-cms.rfrdev.com/
- **Mobile App:** Gurutattva (Android - com.org.gurutattva.app)
- **App Package:** com.org.gurutattva.app
- **App Activity:** com.example.gurutattva_flutter_app.MainActivity

---

## 2. REPOSITORY ACCESS

The project is maintained on **both GitHub and Azure DevOps** (kept in sync):

| Platform | URL | Clone Command |
|----------|-----|---------------|
| **GitHub** | https://github.com/Sushrut-01/gurutattva-e2e-automation | `git clone https://github.com/Sushrut-01/gurutattva-e2e-automation.git` |
| **Azure DevOps** | https://dev.azure.com/WarishKumar-Rysun/Gurutattva_E2E_Automation | `git clone https://dev.azure.com/WarishKumar-Rysun/Gurutattva_E2E_Automation/_git/Gurutattva_E2E_Automation` |

**Branch:** `master` (main development branch)

---

## 3. TECHNOLOGY STACK

### Core Technologies

| Component | Technology | Version |
|-----------|------------|---------|
| Test Framework | Robot Framework | 7.0.1+ |
| Web Automation | Selenium WebDriver | 4.16+ |
| Mobile Automation | Appium | 2.0+ |
| Programming Language | Python | 3.12+ |
| Mobile Driver | UIAutomator2 | Latest |
| Browser | Chrome | Latest |
| Mobile Platform | Android | 10+ |

### Required Software Installation

1. **Python 3.12+** - https://www.python.org/downloads/
2. **Node.js v20 LTS** - https://nodejs.org/ (NOT v22 or v23)
3. **Java JDK 11+** - https://adoptium.net/
4. **Android SDK** - https://developer.android.com/studio
5. **Appium Server** - `npm install -g appium`
6. **UIAutomator2 Driver** - `npm install -g appium-uiautomator2-driver`

### Python Dependencies

Install via: `pip install -r requirements.txt`

Key packages:
- robotframework>=7.0.1
- robotframework-seleniumlibrary>=6.2.0
- robotframework-appiumlibrary>=2.0.0
- Appium-Python-Client>=3.1.0
- selenium>=4.16.0

---

## 4. PROJECT STRUCTURE

```
Gurutattva_E2E_Automation/
│
├── tests/                      # Test Suites (11 files)
│   ├── E2EAudio.robot          # Audio/Music/Podcast tests (20 TCs)
│   ├── E2EDhyankendra.robot    # Dhyankendra management (8 TCs)
│   ├── E2EEvents.robot         # Events management (10 TCs)
│   ├── E2ENews.robot           # News management (6 TCs)
│   ├── E2ERegistration.robot   # Mobile registration (14 TCs)
│   ├── E2ENamkaran.robot       # Namkaran ceremony (12 TCs)
│   ├── E2EHindi.robot          # Hindi language (1 TC)
│   ├── E2EPrayer.robot         # Prayer module (2 TCs)
│   ├── E2ERoleRight.robot      # Role-based access (5 TCs)
│   ├── Dhyankendra.robot       # Filter tests
│   └── CleanUpDummyE2EData.robot
│
├── pages/                      # Page Object Models (24 files)
│   ├── E2EAudioPage.robot
│   ├── E2EEventsPage.robot
│   ├── E2ENewsPage.robot
│   ├── E2ERegistrationPage.robot
│   ├── DhyankendraPage.robot
│   ├── loginPage.robot
│   └── ... (more page files)
│
├── resources/                  # Shared Resources
│   ├── variables.robot         # Global variables & credentials
│   ├── keywords.robot          # Common keywords
│   ├── libraries.robot         # Library imports
│   ├── web_keywords.robot      # Web-specific keywords
│   └── test_setup_teardown.robot
│
├── test_data/                  # Test Data Files
│   ├── English_sample-12s.mp3
│   ├── Hindi_sample-15s.mp3
│   └── ... (thumbnails, images)
│
├── results/                    # Test Results (generated)
│
├── Jenkinsfile                 # CI/CD Pipeline
├── send_email.py               # Email notification script
├── requirements.txt            # Python dependencies
├── README.md                   # Project overview
└── TEAM_MEMBER_SETUP_GUIDE.md  # Detailed setup guide
```

---

## 5. TEST COVERAGE SUMMARY

### Test Suite Overview

| Suite | Tests | Passing | Pass Rate | Description |
|-------|-------|---------|-----------|-------------|
| E2EAudio | 20 | 14 | 70% | Audio track management (Music/Podcast) |
| E2EDhyankendra | 8 | 6 | 75% | Prayer center management |
| E2EEvents | 10 | 5 | 50% | Event management (Global/Local) |
| E2ENews | 6 | 3 | 50% | News management |
| E2ERegistration | 14 | 9 | 64% | Mobile app registration |
| E2ENamkaran | 12 | 8 | 67% | Marriage ceremony management |
| E2EHindi | 1 | 0 | 0% | Hindi language testing |
| E2EPrayer | 2 | 1 | 50% | Prayer submissions |
| E2ERoleRight | 5 | 1 | 20% | Role-based access control |
| **TOTAL** | **78** | **47** | **60%** | |

### Features Tested

- **Web CMS:** Login, CRUD operations, Publishing, Approval workflows
- **Mobile App:** Registration, OTP login, Content verification, Language switching
- **Integration:** Web-to-Mobile data sync verification
- **Filters:** Multiple filter operators (equals, contains, starts with, etc.)
- **Multi-language:** English and Hindi support

---

## 6. CONFIGURATION & CREDENTIALS

### Appium Server Configuration

```robot
${REMOTE_URL}           http://localhost:4723
${PLATFORM_NAME}        Android
${DEVICE_NAME}          RZCT40WL69K    # Or ${EMPTY} for auto-detect
${APP_PACKAGE}          com.org.gurutattva.app
${APP_ACTIVITY}         com.example.gurutattva_flutter_app.MainActivity
${AUTOMATION_NAME}      UiAutomator2
```

### Web CMS Credentials

| Role | Email | Password | Access Level |
|------|-------|----------|--------------|
| **Super Admin** | sushrut.nistane@rysun.com | Sharu@051220 | Full CMS access |
| **Sanchalak** | patilvaishub@gmail.com | Lavanya@21 | Local modules only |

### Mobile Test Data

| Purpose | Phone Number | OTP |
|---------|--------------|-----|
| Primary User | 9999999999 | 999999 |
| Secondary User | 9999999999 | 999999 |
| Tertiary User | 9999999911 | 999999 |

### Role-Based Test Credentials

| Role | Email | Password | Status |
|------|-------|----------|--------|
| Prayer Coordinator | surajsaini520@gmail.com | Suraj@123 | Working |
| Event Coordinator | amit.jadhav@rysun.com | Admin@123 | Working |
| Acharya | suraj.punetha@rysun.com | Admin@123 | INVALID |
| Maha Acharya | sankalp.kamdi@rysun.com | Admin@123 | Working |
| Namkaran Coordinator | parthmpandya@gmail.com | Admin@123 | NOT REGISTERED |

**Note:** Configuration is in `resources/variables.robot`

---

## 7. HOW TO RUN TESTS

### Prerequisites

1. Start Appium Server (Terminal 1):
```bash
appium server --address 0.0.0.0 --port 4723
```

2. Connect Android device via USB OR start emulator:
```bash
# Verify device
adb devices
```

### Run Commands

```bash
# Navigate to project
cd C:\Users\srvadmin\Gurutattva_E2E_Automation

# Run all E2E Audio tests
python -m robot --outputdir results tests/E2EAudio.robot

# Run specific test by tag
python -m robot --outputdir results --include tc01 tests/E2EAudio.robot

# Run with debug logging
python -m robot --outputdir results --loglevel DEBUG tests/E2EDhyankendra.robot

# Run all E2E tests
python -m robot --outputdir results tests/E2E*.robot

# Run tests and send email report
python -m robot --outputdir results tests/E2EAudio.robot && python send_email.py
```

### View Results

Test results are generated in `results/` folder:
- `report.html` - Test summary report
- `log.html` - Detailed execution log
- `output.xml` - Machine-readable results

---

## 8. CI/CD PIPELINE

### Jenkins Pipeline (Jenkinsfile)

The project includes a complete Jenkins pipeline with:

- **Multi-platform support:** Android, iOS, Web
- **Test type selection:** All, Smoke, Regression, Sanity
- **Stages:**
  1. Checkout
  2. Environment Setup
  3. Appium Verification
  4. Android Tests
  5. iOS Tests
  6. Web Tests
  7. Result Parsing
  8. Report Upload

### GitHub Actions

Playwright tests run on push/PR to main/master branches.

### Docker Support

Multiple Docker Compose files for containerized Appium:
- `docker-compose-appium.yml` - Standard setup
- `docker-compose-appium-usb.yml` - USB device support

---

## 9. EMAIL NOTIFICATIONS

### Configuration (send_email.py)

```python
SMTP_SERVER = "mail.smtp2go.com"
SMTP_PORT = 587
SMTP_USERNAME = "smtp@rysun.com"
SMTP_PASSWORD = "uA4VEvIpnN5tKVjT"
EMAIL_FROM = "smtp@rysun.com"
EMAIL_TO = "sushrut.nistane@rysun.com"
EMAIL_CC = "amit.manjesh@rysun.com"
```

### Features

- Automatically parses test results from output.xml
- Creates ZIP archive of reports
- Sends HTML formatted email with pass/fail summary
- Includes test execution timestamp

### Usage

```bash
python send_email.py
```

---

## 10. KNOWN ISSUES & PENDING WORK

### Critical Issues

| Issue | Affected Tests | Status | Priority |
|-------|----------------|--------|----------|
| SSL Certificate Warnings | 15 tests | Workaround applied | High |
| Mobile Login Timing | 17 tests | Pending fix | High |
| Role-Based User Registration | 2 users | Needs registration | Medium |
| Mobile Profile Navigation | 4 tests | Pending fix | Medium |

### Pending Tasks

1. **Register Missing Users:**
   - suraj.punetha@rysun.com (Acharya role)
   - parthmpandya@gmail.com (Namkaran Coordinator role)

2. **Fix Menu Locators:**
   - Update Maha Acharya Dhyankendra menu locator (href → span)

3. **Improve Test Stability:**
   - Add better wait conditions for mobile OTP entry
   - Fix mobile profile navigation timing

### Recent Fixes (December 2025 - January 2026)

- Fixed search field clearing (TC2, TC4)
- Fixed mobile search bar locators (TC3)
- Fixed edit button XPath (TC7, TC8)
- Improved OTP automation reliability
- Fixed Dhyankendra pagination
- Pass rate improved: 40% → 70%

---

## 11. HANDOVER CHECKLIST

### For New Team Member - Day 1

- [ ] Get access to GitHub repository
- [ ] Get access to Azure DevOps repository
- [ ] Install Python 3.12+
- [ ] Install Node.js v20 LTS (NOT v22/v23)
- [ ] Install Java JDK 11+
- [ ] Install Android SDK / Android Studio
- [ ] Clone repository
- [ ] Create Python virtual environment
- [ ] Install dependencies (`pip install -r requirements.txt`)
- [ ] Install Appium and UIAutomator2 driver
- [ ] Connect Android device or start emulator
- [ ] Verify setup with: `adb devices`
- [ ] Start Appium server
- [ ] Run first test: `python -m robot tests/E2EAudio.robot --include tc01`

### For New Team Member - Week 1

- [ ] Read TEAM_MEMBER_SETUP_GUIDE.md completely
- [ ] Run all E2E test suites
- [ ] Review test results and understand failures
- [ ] Study Page Object Model structure
- [ ] Understand variables.robot configuration
- [ ] Test email notification functionality
- [ ] Review Jenkins pipeline configuration

### Pending Actions (To Be Done by Successor)

- [ ] Register missing role-based test users
- [ ] Fix SSL certificate handling
- [ ] Improve mobile login timing
- [ ] Update documentation with new status
- [ ] Achieve 80%+ pass rate target

---

## 12. KEY CONTACTS

| Role | Name | Email |
|------|------|-------|
| **Outgoing Developer** | Sushrut Nistane | sushrut.nistane@rysun.com |
| **Team Member** | Amit Manjesh | amit.manjesh@rysun.com |
| **Azure DevOps Owner** | Warish Kumar | (Azure organization owner) |

---

## 13. ADDITIONAL DOCUMENTATION

The following documentation files are available in the repository:

| Document | Purpose |
|----------|---------|
| `README.md` | Project overview and quick start |
| `TEAM_MEMBER_SETUP_GUIDE.md` | Complete setup instructions |
| `HOW_TO_CREATE_PR.md` | Pull request guidelines |
| `CREDENTIALS_MAPPING.md` | Credential usage mapping |
| `CHANGES_APPLIED.md` | History of test fixes |
| `TEST_FAILURE_ANALYSIS.md` | Root cause analysis |
| `CODE_AUDIT_REPORT.md` | Code quality report |
| `MOBILE_TESTING_SETUP_GUIDE.md` | Mobile testing details |
| `FIX_NODE_AND_RUN_TESTS.md` | Node.js troubleshooting |
| `APPIUM_DEPLOYMENT_SUMMARY.md` | Appium deployment guide |

---

## QUICK REFERENCE COMMANDS

```bash
# Clone repository
git clone https://github.com/Sushrut-01/gurutattva-e2e-automation.git

# Setup environment
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
npm install -g appium appium-uiautomator2-driver

# Start Appium
appium server --address 0.0.0.0 --port 4723

# Run tests
python -m robot --outputdir results tests/E2EAudio.robot

# Send email report
python send_email.py

# Pull latest code
git pull origin master

# Push to both repos
git push origin master && git push azure master
```

---

**END OF HANDOVER DOCUMENT**

*This document contains all essential information for project continuity. For detailed technical information, refer to the documentation files listed above.*

---

**Document Prepared By:** Sushrut Nistane
**Date:** February 7, 2026
**Version:** 1.0
