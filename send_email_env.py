#!/usr/bin/env python3
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import os
import sys

def send_test_email():
    try:
        # Email configuration
        smtp_server = "mail.smtp2go.com"
        smtp_port = 587
        username = "smtp@rysun.com"
        password = "uA4VEvIpnN5tKVjT"
        from_email = "smtp@rysun.com"
        to_email = "warish.kumar@rysun.com"
        cc_email = "technology.warish@gmail.com"
        
        # Read arguments from environment variables
        subject = os.environ.get('EMAIL_SUBJECT', '[ROBOT FRAMEWORK] Test Email')
        body = os.environ.get('EMAIL_BODY', '<p>Test email from Robot Framework</p>')
        zip_file = os.environ.get('EMAIL_ZIP_FILE', '')
        
        print("Sending email: " + subject)
        print("To: " + to_email)
        print("CC: " + cc_email)
        print("ZIP file: " + zip_file)
        
        # Create message container
        msg = MIMEMultipart()
        msg['From'] = from_email
        msg['To'] = to_email
        if cc_email and cc_email.strip():
            msg['Cc'] = cc_email
        msg['Subject'] = subject
        
        # Add body to email
        msg.attach(MIMEText(body, 'html'))
        
        # Add ZIP file attachment if provided
        if zip_file and os.path.isfile(zip_file):
            print("Attaching ZIP file: " + zip_file)
            with open(zip_file, "rb") as f:
                part = MIMEBase('application', 'zip')
                part.set_payload(f.read())
                encoders.encode_base64(part)
                part.add_header('Content-Disposition', f'attachment; filename= {os.path.basename(zip_file)}')
                msg.attach(part)
            print("ZIP file attached successfully")
        else:
            print("No ZIP file to attach")
        
        # Prepare recipient list
        recipients = [to_email]
        if cc_email and cc_email.strip():
            cc_list = [email.strip() for email in cc_email.split(',') if email.strip()]
            recipients.extend(cc_list)
        
        # Connect to server and send email
        print("Connecting to SMTP server...")
        server = smtplib.SMTP(smtp_server, smtp_port)
        print("Starting TLS...")
        server.starttls()
        print("Logging in...")
        server.login(username, password)
        print("Sending email to " + str(len(recipients)) + " recipients...")
        
        text = msg.as_string()
        result = server.sendmail(from_email, recipients, text)
        server.quit()
        
        if result:
            print("SMTP returned errors: " + str(result))
            return "Email delivery failed: " + str(result)
        else:
            print("Email sent successfully to " + str(len(recipients)) + " recipients")
            return "Email sent successfully to " + str(len(recipients)) + " recipients"
        
    except Exception as e:
        error_msg = "Error sending email: " + str(e)
        print(error_msg)
        return error_msg

if __name__ == "__main__":
    result = send_test_email()
    print("RESULT: " + result)
