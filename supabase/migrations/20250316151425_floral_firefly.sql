/*
  # Insert Module 1: Data Protection and Confidentiality

  1. Content Added
    - Module 1 details
    - Module sections (introduction, content, case studies, conclusion)
    - Quiz questions with answers
*/

-- Insert Module 1
DO $$
DECLARE
  module_id uuid;
BEGIN
  -- Generate a UUID for the module
  module_id := gen_random_uuid();

  -- Insert Module 1
  INSERT INTO modules (id, title, description, order_number, passing_score)
  VALUES (
    module_id,
    'Data Protection and Confidentiality',
    'Learn how to handle sensitive data responsibly and prevent data breaches. This module covers best practices for data security, confidentiality, and breach prevention.',
    1,
    80
  );

  -- Insert Sections
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module_id,
    'Overview',
    E'In today\'s digital world, protecting sensitive data is critical to maintaining trust, compliance, and business integrity. This module will introduce you to best practices for handling confidential information, preventing data breaches, and ensuring compliance with data protection regulations.\n\nParticipants will learn how to:\n* Identify and protect sensitive company and customer data.\n* Follow best practices for data security in digital and physical formats.\n* Recognise and respond to data breaches effectively.\n\nLearning Objective:\nBy the end of this module, participants will understand their role in safeguarding information and will be able to demonstrate compliance with the company\'s policies and legal standards.',
    1,
    'introduction'
  ),

  -- Section 1
  (
    module_id,
    'Understanding Data Protection and Confidentiality',
    E'Data protection refers to the policies and procedures designed to secure personal, financial, and business information from unauthorised access, use, or disclosure.\n\nWhat is Confidentiality?\nConfidentiality ensures that sensitive information is only accessible to authorised individuals and not shared inappropriately.\n\nTypes of Sensitive Data:\n1. Personally Identifiable Information (PII) – Name, address, phone number, email, social security number.\n2. Financial Data – Credit card details, banking information, payroll records.\n3. Health Information – Medical records, insurance details.\n4. Company Confidential Data – Trade secrets, business strategies, employee records, internal reports.\n\nWhy is Data Protection Important?\n* Prevents identity theft and fraud.\n* Maintains trust with customers and employees.\n* Ensures compliance with laws like GDPR and HIPAA.\n* Avoids legal and financial penalties for data breaches.',
    2,
    'content'
  ),

  -- Case Studies for Section 1
  (
    module_id,
    'Case Study: Mishandling Employee Data',
    E'Scenario:\nSarah, an HR specialist, receives a request from an unknown number asking for the salary details of all employees in the marketing department. The person claims to be a senior manager but refuses to verify their identity. Sarah hesitates but eventually emails the requested data.\n\nQuestion:\nWhat mistake did Sarah make?\n\nAnswer: Sarah should have verified the request through official channels before sharing sensitive employee data.',
    3,
    'case_study'
  ),

  (
    module_id,
    'Case Study: Security Breach',
    E'Scenario:\nJake, an IT support technician, is helping an employee reset their password. The employee is struggling to access their account and asks Jake to just share the password over email. To save time, Jake sends the password through email instead of resetting it properly.\n\nQuestion:\nWhat security risk did Jake create?\n\nAnswer: Sending passwords over email creates a security risk because unauthorised individuals may intercept the message.',
    4,
    'case_study'
  ),

  -- Section 2
  (
    module_id,
    'Best Practices for Data Protection',
    E'1. Create complex passwords and update them regularly.\n2. Always lock your workstation when stepping away.\n3. Store documents in encrypted files and avoid saving sensitive data on personal devices.\n4. Verify sender identities before clicking on links or sharing data.\n5. Shred paper documents and securely delete electronic files when no longer needed.\n6. Avoid accessing sensitive data on public Wi-Fi without a VPN.',
    5,
    'content'
  ),

  -- Case Studies for Section 2
  (
    module_id,
    'Case Study: The Importance of Strong Passwords',
    E'Scenario:\nDavid, an IT administrator, uses the same password for multiple accounts, including his personal banking, email, and company login. One day, his email account gets hacked, and the attackers use the same credentials to access the company\'s internal system.\n\nQuestion:\nWhat mistake did David make?\n\nAnswer: David should have used unique, strong passwords for each account and enabled multi-factor authentication (MFA).',
    6,
    'case_study'
  ),

  -- Section 3
  (
    module_id,
    'Data Breaches and Reporting',
    E'What is a Data Breach?\nA data breach occurs when unauthorised individuals access confidential information. This can happen due to hacking, human error, or improper disposal of data.\n\nWhat to Do if You Suspect a Data Breach?\n1. Report It Immediately – Notify IT or the compliance team.\n2. Do Not Try to Fix It Yourself – Let professionals investigate and resolve the issue.\n3. Follow Company Protocols – Ensure data security measures are in place to prevent future incidents.',
    7,
    'content'
  ),

  -- Conclusion
  (
    module_id,
    'Conclusion and Key Takeaways',
    E'* Protecting data is a shared responsibility.\n* Always verify, encrypt, and secure sensitive information.\n* Be alert to phishing, unauthorised access, and data leaks.\n* Report any suspicious activity immediately.',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module_id,
    'Which of the following is NOT a type of sensitive data?',
    '["Employee salary records", "A company''s public marketing materials", "Customer credit card information", "Patient medical records"]',
    'A company''s public marketing materials',
    'Public marketing materials are not confidential or sensitive as they are intended for public distribution.'
  ),
  (
    module_id,
    'What is the best way to send sensitive company data?',
    '["Through a personal email account", "In an unencrypted file attachment", "Using a secure, company-approved platform", "On a USB drive left in a shared workspace"]',
    'Using a secure, company-approved platform',
    'Always use secure, company-approved methods to share sensitive information.'
  ),
  (
    module_id,
    'If you receive an email from an unknown sender asking for employee records, what should you do?',
    '["Forward the email to a colleague for advice", "Reply and ask for more details", "Verify the request with IT or management before responding", "Assume it''s urgent and send the requested information"]',
    'Verify the request with IT or management before responding',
    'Always verify requests for sensitive data before responding.'
  ),
  (
    module_id,
    'What should you do if you accidentally send confidential information to the wrong person?',
    '["Ignore it and hope they don''t notice", "Notify your manager or compliance team immediately", "Delete the email and move on", "Ask the recipient to ignore it"]',
    'Notify your manager or compliance team immediately',
    'Reporting incidents promptly helps prevent further risks.'
  ),
  (
    module_id,
    'Which of the following is an example of improper data handling?',
    '["Encrypting files before emailing them", "Leaving confidential documents on your desk overnight", "Storing customer data in a secured cloud system", "Using a VPN when accessing company systems remotely"]',
    'Leaving confidential documents on your desk overnight',
    'Leaving sensitive documents unattended can lead to unauthorized access.'
  ),
  (
    module_id,
    'What is the first step to take if you suspect a data breach?',
    '["Try to fix it yourself", "Report it to IT or the compliance team", "Ignore it and wait for someone else to notice", "Discuss it with a colleague before reporting"]',
    'Report it to IT or the compliance team',
    'Reporting a breach immediately ensures it is handled properly.'
  ),
  (
    module_id,
    'Which of the following is a strong password example?',
    '["12345678", "CompanyName2023", "P@ssw0rd", "M$7y&Qz!p3r%"]',
    'M$7y&Qz!p3r%',
    'A strong password includes a mix of uppercase, lowercase, numbers, and special characters.'
  ),
  (
    module_id,
    'How can an employee prevent unauthorised access to company systems?',
    '["Always lock their screen when leaving their desk", "Share login credentials with trusted co-workers", "Use the same password for all work accounts", "Store sensitive information in an unlocked drawer"]',
    'Always lock their screen when leaving their desk',
    'Locking your screen prevents unauthorized access.'
  ),
  (
    module_id,
    'Which situation could be considered a data breach?',
    '["A colleague sees confidential data on an unlocked screen", "A misplaced document is found and secured before anyone reads it", "A team meeting discusses project details in a private conference room", "A report containing sensitive customer information is encrypted and sent securely"]',
    'A colleague sees confidential data on an unlocked screen',
    'Unauthorized viewing of confidential data can be classified as a breach.'
  ),
  (
    module_id,
    'What is the safest way to dispose of confidential paper documents?',
    '["Throw them in the recycling bin", "Leave them on your desk for later disposal", "Shred them using an approved shredder", "Crumple them up and place them in the trash"]',
    'Shred them using an approved shredder',
    'Shredding prevents unauthorized access to sensitive information.'
  );
END $$;