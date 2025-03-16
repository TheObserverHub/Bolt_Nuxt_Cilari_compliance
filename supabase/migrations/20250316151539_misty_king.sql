/*
  # Module 2: Cybersecurity and Awareness

  1. Content Added
    - Module 2 details
    - Module sections (introduction, content, case studies, conclusion)
    - Quiz questions with answers and explanations

  2. Structure
    - Introduction to cybersecurity concepts
    - Three main sections covering key topics
    - Case studies for practical understanding
    - Comprehensive quiz with 10 questions
*/

DO $$
DECLARE
  module_id uuid;
BEGIN
  -- Generate a UUID for the module
  module_id := gen_random_uuid();

  -- Insert Module 2
  INSERT INTO modules (id, title, description, order_number, passing_score)
  VALUES (
    module_id,
    'Cybersecurity and Awareness',
    'Understand cyber threats, safe online practices, and how to prevent hacking attempts. This module covers essential cybersecurity concepts and best practices for maintaining digital security.',
    2,
    80
  );

  -- Insert Sections
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module_id,
    'Overview',
    E'Cybersecurity is crucial in today\'s interconnected world. This module will help you understand common cyber threats and how to protect against them.\n\nParticipants will learn:\n* How to identify and prevent cyber attacks\n* Best practices for online security\n* Steps to protect company data from cyber threats\n\nLearning Objective:\nBy the end of this module, participants will understand basic cybersecurity concepts and be able to implement security measures in their daily work.',
    1,
    'introduction'
  ),

  -- Section 1: Understanding Cyber Threats
  (
    module_id,
    'Understanding Cyber Threats',
    E'Common Types of Cyber Threats:\n\n1. Phishing Attacks\n- Deceptive emails or messages attempting to steal information\n- Often impersonates legitimate organizations\n- May contain urgent or threatening language\n\n2. Malware\n- Viruses, trojans, and ransomware\n- Can damage systems and steal data\n- Often spreads through downloads or infected links\n\n3. Social Engineering\n- Manipulates people into revealing information\n- Uses psychological tactics\n- Can occur through phone, email, or in person',
    2,
    'content'
  ),

  -- Case Study 1
  (
    module_id,
    'Case Study: Phishing Attack',
    E'Scenario:\nAn employee receives an urgent email appearing to be from the CEO, requesting immediate wire transfer of funds. The email address is slightly different from the CEO\'s actual address, but the employee doesn\'t notice and processes the transfer.\n\nQuestion:\nWhat red flags should have been noticed?\n\nAnswer: The urgent nature of the request, slightly different email address, and unusual request for wire transfer are all red flags of a phishing attempt.',
    3,
    'case_study'
  ),

  -- Section 2: Security Best Practices
  (
    module_id,
    'Security Best Practices',
    E'Essential Security Measures:\n\n1. Password Management\n- Use unique, complex passwords\n- Enable two-factor authentication\n- Never share passwords\n\n2. Email Security\n- Verify sender addresses\n- Don\'t click suspicious links\n- Be cautious with attachments\n\n3. Device Security\n- Keep software updated\n- Use antivirus protection\n- Encrypt sensitive data',
    4,
    'content'
  ),

  -- Case Study 2
  (
    module_id,
    'Case Study: Password Security',
    E'Scenario:\nA team member uses the same password for multiple work accounts. After a third-party website is breached, hackers use these credentials to access the company\'s cloud storage.\n\nQuestion:\nWhat security practice would have prevented this?\n\nAnswer: Using unique passwords for each account and enabling two-factor authentication would have prevented unauthorized access.',
    5,
    'case_study'
  ),

  -- Section 3: Incident Response
  (
    module_id,
    'Responding to Cyber Incidents',
    E'Steps for Handling Cyber Incidents:\n\n1. Immediate Response\n- Disconnect affected systems\n- Report to IT security team\n- Document the incident\n\n2. Prevention\n- Regular security training\n- System updates and patches\n- Security audits\n\n3. Recovery\n- Restore from backups\n- Change compromised credentials\n- Review and improve security measures',
    6,
    'content'
  ),

  -- Case Study 3
  (
    module_id,
    'Case Study: Ransomware Attack',
    E'Scenario:\nAn employee clicks on a link in a suspicious email, and suddenly their computer files are encrypted. A message demands payment to restore access.\n\nQuestion:\nWhat immediate steps should be taken?\n\nAnswer: Disconnect the computer from the network immediately and report the incident to IT security. Do not pay the ransom or attempt to fix it yourself.',
    7,
    'case_study'
  ),

  -- Conclusion
  (
    module_id,
    'Conclusion and Key Takeaways',
    E'Remember these key points:\n\n* Stay vigilant against phishing and social engineering\n* Use strong, unique passwords and two-factor authentication\n* Keep software and systems updated\n* Report security incidents immediately\n* When in doubt, verify through official channels',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module_id,
    'Which of the following is a common sign of a phishing email?',
    '["Professional greeting with your name", "Urgent request for immediate action", "Company logo in the signature", "Reply-to address matching the sender"]',
    'Urgent request for immediate action',
    'Phishing emails often create a false sense of urgency to pressure recipients into making mistakes.'
  ),
  (
    module_id,
    'What is the best practice for password security?',
    '["Use the same password for all accounts", "Share passwords with trusted colleagues", "Enable two-factor authentication", "Write passwords on sticky notes"]',
    'Enable two-factor authentication',
    'Two-factor authentication adds an extra layer of security beyond just passwords.'
  ),
  (
    module_id,
    'What should you do if you suspect your computer is infected with malware?',
    '["Continue working but avoid sensitive tasks", "Disconnect from the network and report to IT", "Try to remove the malware yourself", "Ignore it if your computer still works"]',
    'Disconnect from the network and report to IT',
    'Immediate isolation and professional handling prevents malware spread and data loss.'
  ),
  (
    module_id,
    'Which is NOT a secure way to store sensitive files?',
    '["Company-approved cloud storage", "Encrypted hard drive", "Personal email account", "Password-protected server"]',
    'Personal email account',
    'Personal email accounts lack enterprise-level security and control measures.'
  ),
  (
    module_id,
    'What is social engineering?',
    '["Installing security software", "Manipulating people to reveal information", "Building social networks", "Programming security systems"]',
    'Manipulating people to reveal information',
    'Social engineering exploits human psychology rather than technical vulnerabilities.'
  ),
  (
    module_id,
    'When should you update your work computer''s software?',
    '["Only when having technical issues", "When IT forces an update", "As soon as updates are available", "At the end of the year"]',
    'As soon as updates are available',
    'Prompt updates ensure security vulnerabilities are patched quickly.'
  ),
  (
    module_id,
    'What should you do if you accidentally click a suspicious link?',
    '["Wait to see if anything happens", "Disconnect and report to IT immediately", "Run a quick virus scan", "Restart the computer"]',
    'Disconnect and report to IT immediately',
    'Quick response and reporting can minimize potential damage from malicious links.'
  ),
  (
    module_id,
    'Which is a secure way to share sensitive documents?',
    '["Through personal messaging apps", "Via encrypted company platforms", "Using public cloud storage", "As email attachments"]',
    'Via encrypted company platforms',
    'Company-approved encrypted platforms ensure secure document sharing.'
  ),
  (
    module_id,
    'What is ransomware?',
    '["Software that speeds up your computer", "Malware that encrypts files and demands payment", "A type of antivirus program", "A password manager"]',
    'Malware that encrypts files and demands payment',
    'Ransomware is a serious threat that can lock you out of your files and systems.'
  ),
  (
    module_id,
    'How often should you back up important work files?',
    '["Only when remembering", "When the system is slow", "According to company backup policy", "Once a year"]',
    'According to company backup policy',
    'Regular backups following company policy ensure data can be recovered if needed.'
  );
END $$;