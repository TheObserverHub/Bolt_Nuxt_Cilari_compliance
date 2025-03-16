/*
  # Module 2: Cybersecurity and Awareness Content

  1. Content Added
    - Understanding cyber threats section
    - Safe online practices section
    - Handling suspicious activity section
    - Case studies for each section
    - Quiz questions with answers and explanations

  2. Structure
    - Three main sections with content
    - Case studies for practical understanding
    - Comprehensive quiz with 10 questions
*/

DO $$
DECLARE
  module2_id uuid;
BEGIN
  -- Get the ID of Module 2
  SELECT id INTO module2_id FROM modules WHERE order_number = 2;

  -- Insert sections for Module 2
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module2_id,
    'Overview',
    E'In today''s digital world, cybersecurity threats are constantly evolving. Employees play a crucial role in protecting company data and preventing cyberattacks. This module will cover:\n\n1. Recognising Cyber Threats – Understanding phishing, malware, and social engineering.\n2. Safe Online Practices – Guidelines for secure browsing, password management, and email security.\n3. Handling Suspicious Activity – What to do if you suspect a security breach.\n\nLearning Objectives:\nBy completing this module, employees will be able to:\n1. Identify common cyber threats such as phishing, malware, and social engineering.\n2. Implement secure online practices, including password management, email security, and safe browsing.\n3. Recognise and respond to suspicious activity to prevent security breaches.\n4. Understand company policies regarding device security, remote work safety, and data access.\n5. Report cybersecurity incidents effectively to minimise potential risks.',
    1,
    'introduction'
  ),
  -- Section 1: Recognising Cyber Threats
  (
    module2_id,
    'Recognising Cyber Threats',
    E'Cybercriminals use various tactics to steal information, manipulate employees, and gain unauthorised access to company systems. The most common cyber threats include:\n\n* Phishing Attacks: Fake emails or messages designed to steal login credentials.\n* Malware & Ransomware: Harmful software that can compromise or lock data.\n* Social Engineering: Manipulating employees into giving up sensitive information.\n\nUnderstanding these threats is the first step in preventing cyberattacks.',
    2,
    'content'
  ),
  -- Case Study 1.1
  (
    module2_id,
    'Case Study: Phishing Email Attack',
    E'Scenario:\nLisa, an HR coordinator, receives an email that appears to be from the IT department, asking her to reset her company password through a provided link. The email says her account will be locked if she does not act immediately. She clicks the link, enters her credentials, and later finds out her account has been compromised.\n\nQuestions:\n1. How could Lisa have identified this as a phishing attempt?\n2. What should she do after realising she has fallen for a phishing attack?\n\nAnswers:\n1. Lisa should have checked the sender''s email, looked for red flags (urgent language, suspicious links), and verified the request with IT before clicking.\n2. She should immediately report the incident, change her passwords, and alert IT to mitigate damage.',
    3,
    'case_study'
  ),
  -- Case Study 1.2
  (
    module2_id,
    'Case Study: Ransomware Attack',
    E'Scenario:\nMark, an IT technician, downloads what appears to be a software update from an email attachment. Shortly after, his screen freezes, and a message appears demanding payment to unlock his files.\n\nQuestions:\n1. What is a ransomware attack, and how does it work?\n2. How could Mark have avoided this situation?\n3. What steps should he take now?\n\nAnswers:\n1. Ransomware encrypts files and demands payment for their release.\n2. Mark should have verified the sender, avoided opening unknown attachments, and ensured updates were from trusted sources.\n3. He should disconnect his computer, report the attack to IT, and avoid paying the ransom.',
    4,
    'case_study'
  ),
  -- Section 2: Safe Online Practices
  (
    module2_id,
    'Safe Online Practices',
    E'Secure online behaviour is essential to protecting company data. This section covers:\n\n* Password Security: Creating strong, unique passwords and enabling multi-factor authentication.\n* Safe Email Practices: Avoiding malicious attachments and verifying senders.\n* Secure Remote Work: Using VPNs, avoiding public Wi-Fi, and securing company devices.\n\nEmployees who follow these best practices reduce the risk of cyberattacks.',
    5,
    'content'
  ),
  -- Case Study 2.1
  (
    module2_id,
    'Case Study: Unsafe Public Wi-Fi Use',
    E'Scenario:\nJake, a logistics officer, accesses the company portal using free public Wi-Fi at a coffee shop. Later, he notices unauthorised access to company systems from an unknown location.\n\nQuestions:\n1. What risks come with using public Wi-Fi for work?\n2. How can employees protect data while working remotely?\n3. What security tools should companies provide for remote workers?\n\nAnswers:\n1. Public Wi-Fi is unsecured and vulnerable to cyberattacks.\n2. Employees should use a Virtual Private Network (VPN) and avoid logging into sensitive accounts on public networks.\n3. Companies should provide VPN access and enforce secure remote work policies.',
    6,
    'case_study'
  ),
  -- Section 3: Handling Suspicious Activity
  (
    module2_id,
    'Handling Suspicious Activity',
    E'Cyber threats are not always preventable, but quick action can minimise damage. Employees must:\n\n* Recognise signs of unauthorised access.\n* Report security incidents immediately.\n* Follow company protocols for data breaches.\n\nThis section provides real-world scenarios on how to respond to cybersecurity incidents.',
    7,
    'content'
  ),
  -- Conclusion
  (
    module2_id,
    'Conclusion and Key Takeaways',
    E'* Always verify the authenticity of emails, links, and attachments before opening them.\n* Use strong, unique passwords and enable multi-factor authentication (MFA) for added security.\n* Avoid using public Wi-Fi for work-related tasks without a secure VPN.\n* Report any suspicious emails, unauthorised access, or security concerns immediately to IT.\n* Never share your login credentials or sensitive company information with unauthorised parties.',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions for Module 2
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module2_id,
    'What is the most common method hackers use to steal passwords?',
    '["Social engineering", "Brute-force attacks", "Phishing emails"]',
    'Phishing emails',
    'Phishing emails are the most common method of stealing passwords. Attackers trick users into revealing login credentials.'
  ),
  (
    module2_id,
    'Which of the following is a sign of a phishing email?',
    '["Urgent language", "Generic greetings", "Unexpected attachments", "All of the above"]',
    'All of the above',
    'Phishing emails often use urgency, generic greetings, and attachments to trick recipients.'
  ),
  (
    module2_id,
    'Why is using the same password for multiple accounts risky?',
    '["It increases the chance of forgetting the password", "If one account is compromised, all accounts using the same password are vulnerable", "It makes logging in easier"]',
    'If one account is compromised, all accounts using the same password are vulnerable',
    'If a hacker gains access to one account, they can use the same password to break into other accounts.'
  ),
  (
    module2_id,
    'What should you do if you receive a suspicious login alert?',
    '["Ignore it unless it happens multiple times", "Click the link in the alert email to verify the login", "Change your password immediately and report it to IT"]',
    'Change your password immediately and report it to IT',
    'Changing your password immediately and reporting the incident helps prevent unauthorised access.'
  ),
  (
    module2_id,
    'What is a VPN, and why is it important?',
    '["A tool that speeds up internet browsing", "A software that blocks malware", "A secure connection that encrypts internet traffic, protecting sensitive data"]',
    'A secure connection that encrypts internet traffic, protecting sensitive data',
    'A VPN encrypts data, making it difficult for hackers to intercept sensitive information, especially on public Wi-Fi.'
  ),
  (
    module2_id,
    'How should you respond to a suspected ransomware attack?',
    '["Pay the ransom to regain access to files", "Disconnect from the network, report to IT, and avoid paying the ransom", "Restart the computer and hope the issue resolves itself"]',
    'Disconnect from the network, report to IT, and avoid paying the ransom',
    'Disconnecting prevents further infection, and reporting to IT helps contain the attack. Paying the ransom is not recommended.'
  ),
  (
    module2_id,
    'Why is public Wi-Fi a security risk?',
    '["It allows hackers to intercept data", "It is slower than private networks", "It requires a password to access"]',
    'It allows hackers to intercept data',
    'Public networks are often unsecured, making it easier for attackers to steal sensitive information.'
  ),
  (
    module2_id,
    'What is multi-factor authentication (MFA), and how does it help?',
    '["A method to save multiple passwords in one place", "A feature that allows logging in without a password", "A security system requiring a second form of verification, making unauthorised access harder"]',
    'A security system requiring a second form of verification, making unauthorised access harder',
    'MFA adds an extra layer of security by requiring additional authentication beyond a password.'
  ),
  (
    module2_id,
    'What should you do if you lose a company device?',
    '["Report it to IT immediately so they can lock or erase the device", "Wait a few days to see if you find it", "Use a personal device to access work data instead"]',
    'Report it to IT immediately so they can lock or erase the device',
    'Promptly reporting a lost device helps IT secure company data before it falls into the wrong hands.'
  ),
  (
    module2_id,
    'Which is the best practice for handling suspicious email attachments?',
    '["Open them to check the content", "Forward them to a colleague for verification", "Do not open them and report to IT"]',
    'Do not open them and report to IT',
    'Never open suspicious attachments as they may contain malware. Report them to IT for proper handling.'
  );
END $$;