/*
  # Module 3: Incident Response Content

  1. Content Added
    - Understanding incident types section
    - Response procedures section
    - Documentation requirements section
    - Case studies for practical application
    - Quiz questions testing comprehension

  2. Structure
    - Three main sections with detailed content
    - Real-world case studies
    - Comprehensive assessment
*/

DO $$
DECLARE
  module3_id uuid;
BEGIN
  -- Get the ID of Module 3
  SELECT id INTO module3_id FROM modules WHERE order_number = 3;

  -- Insert sections for Module 3
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module3_id,
    'Overview',
    E'Even with strong cybersecurity and data protection measures, security incidents can still occur. A fast and effective response minimises damage, protects company assets, and ensures business continuity.\n\nThis module will equip you with the skills to:\n* Identify different types of security incidents, including data breaches, unauthorised access, and malware infections.\n* Follow company procedures for reporting incidents in a timely and structured manner.\n* Take immediate action to contain threats and prevent further damage.\n* Understand legal and compliance requirements related to incident reporting.\n\nBy the end of this module, you will be able to recognise, report, and respond appropriately to cybersecurity and data security incidents.',
    1,
    'introduction'
  ),
  -- Section 1: Identifying Security Incidents
  (
    module3_id,
    'Identifying Security Incidents',
    E'A security incident is any event that compromises the confidentiality, integrity, or availability of company data or systems. Some incidents are obvious, such as ransomware attacks, while others, like unauthorised access, may go unnoticed if employees are not vigilant.\n\nThis section covers:\n* Common security incidents, such as phishing, malware infections, insider threats, and lost devices.\n* Signs of a security breach, including unusual login attempts, unexpected data changes, and system slowdowns.\n* Real-world examples to help employees recognise security threats early.',
    2,
    'content'
  ),
  -- Case Study 1.1
  (
    module3_id,
    'Case Study: Unauthorised Access',
    E'Scenario:\nSamantha, an HR specialist, notices that a terminated employee''s account is still active in the system. She checks recent login activity and sees that the account was accessed after the employee left the company.\n\nQuestions:\n1. Why is this a security risk?\n2. What should Samantha do next?\n3. How can companies prevent this type of incident?\n\nAnswers:\n1. An active account for a former employee can be exploited for unauthorised access.\n2. Samantha should report it to IT immediately so the account can be deactivated.\n3. Companies should implement strict offboarding procedures to revoke access when employees leave.',
    3,
    'case_study'
  ),
  -- Case Study 1.2
  (
    module3_id,
    'Case Study: Malware Infection',
    E'Scenario:\nJohn, an IT administrator, receives multiple reports of employees experiencing slow computers and frequent pop-ups. A security scan detects malware across multiple devices.\n\nQuestions:\n1. How did the malware likely spread?\n2. What immediate steps should IT take?\n3. What measures can prevent future infections?\n\nAnswers:\n1. The malware likely spread through infected email attachments, downloads, or unsecured websites.\n2. IT should isolate affected devices, remove the malware, and investigate the source.\n3. Employees should be trained on safe downloading practices, and IT should enforce security updates.',
    4,
    'case_study'
  ),
  -- Section 2: Responding to Security Incidents
  (
    module3_id,
    'Responding to Security Incidents',
    E'A fast and structured response to security incidents can reduce damage and prevent further issues. Every employee has a role in reporting and responding to incidents.\n\nThis section covers:\n* Immediate actions employees should take when they suspect a security breach.\n* Who to report incidents to, including IT, HR, or management.\n* The importance of documentation and evidence collection for investigations.',
    5,
    'content'
  ),
  -- Case Study 2.1
  (
    module3_id,
    'Case Study: Lost Company Laptop',
    E'Scenario:\nJessica, an HR executive, loses her company-issued laptop while traveling. It contains confidential employee records. She hasn''t enabled remote tracking or encryption.\n\nQuestions:\n1. Why is this a major security risk?\n2. What steps should Jessica take immediately?\n3. How can companies protect sensitive data on devices?\n\nAnswers:\n1. A lost laptop with unprotected sensitive data can lead to identity theft or regulatory fines.\n2. Jessica should report the loss to IT, attempt to track the device, and reset login credentials.\n3. Companies should enforce device encryption, enable remote wiping, and train employees on securing devices.',
    6,
    'case_study'
  ),
  -- Section 3: Documentation and Follow-up
  (
    module3_id,
    'Documentation and Follow-up',
    E'Proper documentation of security incidents is crucial for:\n* Investigation and analysis\n* Compliance requirements\n* Preventing future incidents\n* Improving response procedures\n\nThis section covers best practices for incident documentation and follow-up procedures.',
    7,
    'content'
  ),
  -- Conclusion
  (
    module3_id,
    'Conclusion and Key Takeaways',
    E'Remember these critical points:\n\n* Recognise different types of incidents, including cybersecurity breaches, data leaks, and workplace safety violations\n* Report incidents immediately using the correct channels to prevent escalation\n* Follow the company''s incident response plan, including containment, mitigation, and recovery procedures\n* Keep detailed documentation of incidents to support investigations and prevent recurrence\n* Stay informed about emergency protocols and best practices for incident handling',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions for Module 3
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module3_id,
    'What is considered a security incident?',
    '["A malware infection", "Unauthorised access to a company system", "A lost or stolen company device", "All of the above"]',
    'All of the above',
    'All these scenarios are security incidents that require a response.'
  ),
  (
    module3_id,
    'What is the first step if you suspect unauthorised access to your account?',
    '["Ignore it unless it happens again", "Change your password and report it to IT", "Log out and continue working"]',
    'Change your password and report it to IT',
    'Changing your password and reporting the incident help secure your account.'
  ),
  (
    module3_id,
    'If you receive a suspicious email requesting sensitive information, what should you do?',
    '["Reply and ask for confirmation", "Click the link to check its legitimacy", "Report it to IT and do not interact with the email"]',
    'Report it to IT and do not interact with the email',
    'Reporting suspicious emails prevents phishing attacks.'
  ),
  (
    module3_id,
    'What should you do if you lose a company device containing sensitive data?',
    '["Report it to IT immediately", "Try to recover it yourself before notifying IT", "Ignore it if the device is password-protected"]',
    'Report it to IT immediately',
    'IT can remotely lock or erase lost devices to protect data.'
  ),
  (
    module3_id,
    'What information should be included when reporting a security incident?',
    '["Date and time of the incident", "Description of what happened", "Any actions already taken", "All of the above"]',
    'All of the above',
    'Providing detailed information helps IT assess and respond effectively.'
  ),
  (
    module3_id,
    'How can businesses prevent unauthorised access by former employees?',
    '["Allow access for one month after termination", "Disable accounts immediately after an employee leaves", "Change passwords occasionally"]',
    'Disable accounts immediately after an employee leaves',
    'Immediate deactivation prevents unauthorised access.'
  ),
  (
    module3_id,
    'What should you do if you accidentally send sensitive data to the wrong recipient?',
    '["Recall the email if possible and notify IT", "Do nothing and hope the recipient doesn''t notice", "Send a follow-up email asking them to ignore it"]',
    'Recall the email if possible and notify IT',
    'IT can assess the risk and advise on corrective actions.'
  ),
  (
    module3_id,
    'What is the primary goal of an incident response plan?',
    '["To assign blame for security failures", "To ensure a fast, effective response that minimises damage", "To create more paperwork"]',
    'To ensure a fast, effective response that minimises damage',
    'A structured response reduces harm and restores security.'
  ),
  (
    module3_id,
    'When should you document a security incident?',
    '["Only if damage occurred", "As soon as possible after the incident", "At the end of the week", "Only if requested by management"]',
    'As soon as possible after the incident',
    'Immediate documentation ensures accurate details are captured while memory is fresh.'
  ),
  (
    module3_id,
    'Which action should NOT be taken during a security incident?',
    '["Report to appropriate personnel", "Document the incident", "Try to fix technical issues yourself", "Follow company procedures"]',
    'Try to fix technical issues yourself',
    'Attempting to fix technical issues without proper expertise can worsen the situation.'
  );
END $$;