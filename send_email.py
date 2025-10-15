#!/usr/bin/env python3
"""
Delayed email script that waits for Robot Framework reports to be fully generated
and then sends the email with the latest report files.
"""

import os
import sys
import time
import zipfile
import smtplib
from datetime import datetime
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders

# Add the project directory to Python path
project_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, project_dir)

# Email Configuration
SMTP_SERVER = "mail.smtp2go.com"
SMTP_PORT = 587
SMTP_USERNAME = "smtp@rysun.com"
SMTP_PASSWORD = "uA4VEvIpnN5tKVjT"
EMAIL_FROM = "smtp@rysun.com"
EMAIL_TO = "warish.kumar@rysun.com"
EMAIL_CC = "rumana.mansuri@rysun.com"
PROJECT_NAME = "Gurutattva Automation"

def wait_for_reports_generation(report_dir, max_wait_time=30):
    """
    Wait for Robot Framework to finish generating all report files.
    Returns True if all files are ready, False if timeout.
    """
    print("⏳ Waiting for Robot Framework reports to be fully generated...")
    
    required_files = ['report.html', 'log.html', 'output.xml']
    start_time = time.time()
    
    while time.time() - start_time < max_wait_time:
        all_ready = True
        
        for filename in required_files:
            file_path = os.path.join(report_dir, filename)
            if not os.path.exists(file_path):
                all_ready = False
                break
            
            # Check if file is still being written (size changes)
            try:
                stat1 = os.stat(file_path)
                time.sleep(1)
                stat2 = os.stat(file_path)
                if stat1.st_size != stat2.st_size:
                    all_ready = False
                    break
            except OSError:
                all_ready = False
                break
        
        if all_ready:
            print("✅ All report files are ready!")
            return True
        
        print("⏳ Reports still being generated, waiting...")
        time.sleep(2)
    
    print("⚠️ Timeout waiting for reports, proceeding with available files")
    return False

def create_latest_report_zip(report_dir):
    """
    Create a ZIP file with the latest report files.
    """
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    zip_filename = f"Test_Report_{timestamp}.zip"
    zip_path = os.path.join(report_dir, zip_filename)
    
    print(f"📦 Creating ZIP file: {zip_filename}")
    
    required_files = ['report.html', 'log.html', 'output.xml']
    files_to_zip = []
    
    # Check which files exist and are ready
    for filename in required_files:
        file_path = os.path.join(report_dir, filename)
        if os.path.exists(file_path):
            files_to_zip.append(file_path)
            print(f"✅ Found: {filename}")
        else:
            print(f"❌ Missing: {filename}")
    
    if not files_to_zip:
        print("❌ No report files found to zip")
        return None
    
    try:
        with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
            for file_path in files_to_zip:
                filename = os.path.basename(file_path)
                zipf.write(file_path, filename)
                print(f"📁 Added to ZIP: {filename}")
        
        print(f"✅ ZIP file created successfully: {zip_filename}")
        return zip_path
        
    except Exception as e:
        print(f"❌ Failed to create ZIP file: {e}")
        return None

def get_test_statistics(report_dir):
    """
    Extract test statistics from output.xml
    """
    output_xml_path = os.path.join(report_dir, 'output.xml')
    
    if not os.path.exists(output_xml_path):
        print("❌ output.xml not found")
        return 0, 0, 0
    
    try:
        with open(output_xml_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        import re
        total_match = re.search(r'tests="(\d+)"', content)
        pass_match = re.search(r'pass="(\d+)"', content)
        fail_match = re.search(r'fail="(\d+)"', content)
        
        total_tests = int(total_match.group(1)) if total_match else 0
        passed_tests = int(pass_match.group(1)) if pass_match else 0
        failed_tests = int(fail_match.group(1)) if fail_match else 0
        
        print(f"📊 Test Statistics - Total: {total_tests}, Passed: {passed_tests}, Failed: {failed_tests}")
        return total_tests, passed_tests, failed_tests
        
    except Exception as e:
        print(f"❌ Failed to parse test statistics: {e}")
        return 0, 0, 0

def send_email_with_attachment(total_tests, passed_tests, failed_tests, zip_file_path=None):
    """
    Send email with test results and optional ZIP attachment
    """
    try:
        print("📧 Preparing email...")
        
        # Determine test status
        test_status = "FAIL" if failed_tests > 0 else "PASS"
        status_icon = "✅" if test_status == "PASS" else "❌"
        
        # Create email content
        test_summary = f"Total Test Case Executed: {total_tests}, {failed_tests} failed, and {passed_tests} passed"
        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        # Create email body
        email_body = f"""
        <html>
        <head><title>Test Execution Report</title></head>
        <body style="font-family: Arial, sans-serif; margin: 20px;">
        <h2>{PROJECT_NAME} - Test Execution Report</h2>
        <div style="background-color: #f0f0f0; padding: 15px; border-radius: 5px; margin: 10px 0;">
        <h3 style="margin: 0; color: #333;">📊 Test Summary</h3>
        <p style="font-size: 18px; font-weight: bold; margin: 10px 0; color: #2c3e50;">{test_summary}</p>
        </div>
        <p><strong>Status:</strong> {status_icon} {test_status}</p>
        <p><strong>Test Name:</strong> Complete Test Execution</p>
        <p><strong>Execution Time:</strong> {current_time}</p>
        <p><strong>Environment:</strong> Local Machine</p>
        <p><strong>Report Generated:</strong> {current_time}</p>
        <hr>
        <p>📎 <strong>Attachments:</strong> Complete test reports in ZIP format (report.html, log.html, output.xml)</p>
        <p>Generated by Robot Framework E2E Testing Suite.</p>
        </body>
        </html>
        """
        
        # Create message
        msg = MIMEMultipart()
        msg['From'] = EMAIL_FROM
        msg['To'] = EMAIL_TO
        msg['Cc'] = EMAIL_CC
        msg['Subject'] = f"[{test_status}] {PROJECT_NAME} - Complete Test Execution - {current_time}"
        
        # Add body to email
        msg.attach(MIMEText(email_body, 'html'))
        
        # Add ZIP attachment if provided
        if zip_file_path and os.path.exists(zip_file_path):
            print(f"📎 Adding ZIP attachment: {os.path.basename(zip_file_path)}")
            with open(zip_file_path, "rb") as attachment:
                part = MIMEBase('application', 'octet-stream')
                part.set_payload(attachment.read())
                encoders.encode_base64(part)
                part.add_header(
                    'Content-Disposition',
                    f'attachment; filename= {os.path.basename(zip_file_path)}'
                )
                msg.attach(part)
        
        # Send email
        print(f"📧 Sending email to {EMAIL_TO} (CC: {EMAIL_CC})...")
        server = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
        server.starttls()
        server.login(SMTP_USERNAME, SMTP_PASSWORD)
        text = msg.as_string()
        server.sendmail(EMAIL_FROM, [EMAIL_TO, EMAIL_CC], text)
        server.quit()
        
        print("✅ Email sent successfully!")
        return True
        
    except Exception as e:
        print(f"❌ Failed to send email: {e}")
        return False

def send_delayed_email():
    """
    Main function to send delayed email with latest reports
    """
    try:
        print("📧 Starting delayed email notification process...")
        
        # Set up paths
        report_dir = os.path.join(project_dir, 'results')
        
        if not os.path.exists(report_dir):
            print(f"❌ Report directory not found: {report_dir}")
            return False
        
        # Wait for reports to be fully generated
        wait_for_reports_generation(report_dir, max_wait_time=30)
        
        # Get test statistics
        total_tests, passed_tests, failed_tests = get_test_statistics(report_dir)
        
        # Create ZIP file with latest reports
        zip_path = create_latest_report_zip(report_dir)
        
        if not zip_path:
            print("❌ Failed to create ZIP file, sending email without attachment")
            zip_path = None
        
        # Send email using the existing Python email script
        send_email_with_attachment(
            total_tests=total_tests,
            passed_tests=passed_tests,
            failed_tests=failed_tests,
            zip_file_path=zip_path
        )
        
        print("✅ Delayed email notification sent successfully")
        return True
        
    except Exception as e:
        print(f"❌ Failed to send delayed email: {e}")
        return False

if __name__ == "__main__":
    success = send_delayed_email()
    sys.exit(0 if success else 1)
