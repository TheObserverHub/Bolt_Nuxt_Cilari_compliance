/*
  # Module 4: Remote Workspace Safety and Conduct Content

  1. Content Added
    - Remote workspace security section
    - Professional conduct guidelines
    - Case studies demonstrating best practices
    - Quiz questions testing comprehension

  2. Structure
    - Three main sections with detailed content
    - Real-world case studies
    - Comprehensive assessment
*/

DO $$
DECLARE
  module4_id uuid;
BEGIN
  -- Get the ID of Module 4
  SELECT id INTO module4_id FROM modules WHERE order_number = 4;

  -- Insert sections for Module 4
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module4_id,
    'Overview',
    E'Remote work has become a standard practice, but it introduces new security and ethical challenges. Employees working from home must maintain the same level of professionalism, cybersecurity awareness, and workplace safety as they would in an office environment.\n\nThis module will help you:\n* Set up a secure and safe remote workspace to protect company data and personal well-being.\n* Follow company security policies when working outside the office.\n* Maintain professional conduct and ethical standards in virtual environments.\n\nBy the end of this module, you will be able to identify remote work risks, apply best practices, and ensure compliance with company policies.',
    1,
    'introduction'
  ),
  -- Section 1: Securing Your Remote Workspace
  (
    module4_id,
    'Securing Your Remote Workspace',
    E'Working remotely means employees must take extra steps to protect company data and systems from cyber threats and physical security risks.\n\nThis section covers:\n* Best practices for securing home networks (e.g., using strong Wi-Fi passwords, enabling firewalls, and avoiding public networks).\n* Protecting company devices by locking screens, using VPNs, and enabling encryption.\n* Preventing unauthorised access by family members or outsiders.',
    2,
    'content'
  ),
  -- Case Study 1.1
  (
    module4_id,
    'Case Study: Unsecured Home Wi-Fi',
    E'Scenario:\nJake, an IT specialist, works from home using his personal Wi-Fi network. He never changed the default router password, and his Wi-Fi network is open (no password protection). A hacker nearby gains access to his network and intercepts sensitive company communications.\n\nQuestions:\n1. What security risks exist in Jake''s setup?\n2. What steps should he take to secure his Wi-Fi?\n3. How can employees check if their home network is secure?\n\nAnswers:\n1. An open Wi-Fi network allows unauthorised users to access sensitive company data.\n2. Jake should enable WPA3 encryption, set a strong password, and change the default router credentials.\n3. Employees should regularly update their router firmware and enable firewalls.',
    3,
    'case_study'
  ),
  -- Case Study 1.2
  (
    module4_id,
    'Case Study: Lost Company Laptop',
    E'Scenario:\nMaria, a supply chain manager, works remotely from a café. She briefly leaves her laptop unattended to get coffee. When she returns, the laptop is missing, and it contains confidential supply chain contracts.\n\nQuestions:\n1. Why is leaving company devices unattended a risk?\n2. What should Maria have done differently?\n3. How can employees prevent device theft when working remotely?\n\nAnswers:\n1. Unattended devices can be stolen, leading to data breaches.\n2. Maria should have taken the laptop with her or used a security cable lock.\n3. Employees should store devices securely and enable remote-wipe capabilities.',
    4,
    'case_study'
  ),
  -- Section 2: Remote Work Conduct and Ethics
  (
    module4_id,
    'Remote Work Conduct and Ethics',
    E'Remote employees must maintain the same level of professionalism, confidentiality, and ethical behaviour as they would in an office setting.\n\nThis section covers:\n* Professionalism in virtual meetings (e.g., appropriate attire, background setup, and engagement).\n* Ethical considerations, including working designated hours and avoiding distractions.\n* Handling sensitive information in shared spaces to maintain confidentiality.',
    5,
    'content'
  ),
  -- Case Study 2.1
  (
    module4_id,
    'Case Study: Unprofessional Virtual Meeting Behaviour',
    E'Scenario:\nDuring a video call with clients, Alex, a sales representative, is wearing pyjamas, eating loudly, and has a messy background. He also forgets to mute his microphone when speaking to a family member.\n\nQuestions:\n1. Why is Alex''s behaviour unprofessional?\n2. How should employees present themselves in virtual meetings?\n3. What steps can companies take to improve remote meeting etiquette?\n\nAnswers:\n1. Unprofessional behaviour in virtual meetings can damage the company''s reputation and credibility.\n2. Employees should dress appropriately, mute their mic when not speaking, and ensure a tidy background.\n3. Companies should provide virtual meeting etiquette guidelines and training.',
    6,
    'case_study'
  ),
  -- Section 3: Cybersecurity Best Practices
  (
    module4_id,
    'Cybersecurity Best Practices for Remote Work',
    E'Cybersecurity risks increase when employees work remotely. This section covers:\n* The importance of using VPNs to secure internet connections.\n* Recognising remote work-specific cyber threats, such as remote phishing scams.\n* Company policies for reporting cybersecurity concerns while working remotely.',
    7,
    'content'
  ),
  -- Conclusion
  (
    module4_id,
    'Conclusion and Key Takeaways',
    E'* Set up a secure and ergonomic remote workspace to promote health and productivity.\n* Use company-approved communication tools for work-related discussions and data sharing.\n* Maintain professional conduct in virtual meetings, emails, and online interactions.\n* Secure company devices and lock screens when stepping away.\n* Follow all data protection policies, even while working remotely.',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions for Module 4
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module4_id,
    'What is the most secure way to connect to company systems remotely?',
    '["Public Wi-Fi", "VPN", "Personal email"]',
    'VPN',
    'A VPN (Virtual Private Network) encrypts internet connections, ensuring secure access to company systems when working remotely.'
  ),
  (
    module4_id,
    'Why should work devices not be shared with family members?',
    '["To prevent unauthorised access and malware infections", "Because company policies prohibit it", "Both A and B"]',
    'Both A and B',
    'Allowing family members to use work devices increases security risks (e.g., malware infections, unauthorised access) and violates company policies.'
  ),
  (
    module4_id,
    'What is a sign of a phishing attack?',
    '["Emails with urgent requests", "Unfamiliar links", "Spelling errors", "All of the above"]',
    'All of the above',
    'Phishing emails often create a sense of urgency, contain suspicious links, and have errors in spelling or grammar to deceive recipients.'
  ),
  (
    module4_id,
    'What is the most effective way to secure your home Wi-Fi network?',
    '["Use a simple password", "Enable WPA3 encryption and set a strong password", "Leave the network open"]',
    'Enable WPA3 encryption and set a strong password',
    'WPA3 encryption and strong passwords prevent unauthorised access and protect your home network from cyber threats.'
  ),
  (
    module4_id,
    'What should you do if you find your company laptop is missing while working remotely?',
    '["Ignore it and continue working", "Report the theft immediately to your company''s IT or security team", "Wait for someone to find it"]',
    'Report the theft immediately to your company''s IT or security team',
    'Reporting the theft immediately allows the IT team to lock or wipe the device to protect sensitive data.'
  ),
  (
    module4_id,
    'What is the most secure way to protect confidential data when working remotely in a public space (e.g., café)?',
    '["Speak quietly", "Use a VPN and avoid discussing sensitive information", "Leave your laptop open for quick access"]',
    'Use a VPN and avoid discussing sensitive information',
    'A VPN encrypts your connection, and avoiding sensitive conversations in public helps maintain confidentiality.'
  ),
  (
    module4_id,
    'Why is it important to use multi-factor authentication (MFA) for remote access?',
    '["To add an extra layer of security", "To make it easier to access accounts", "To reduce passwords"]',
    'To add an extra layer of security',
    'MFA enhances security by requiring users to provide two or more forms of identification, making it harder for unauthorised individuals to gain access.'
  ),
  (
    module4_id,
    'How can you protect your remote work devices from theft or unauthorised access?',
    '["Lock the screen when not in use", "Leave the device unattended in public places", "Use weak passwords"]',
    'Lock the screen when not in use',
    'Locking your screen prevents unauthorised access when you step away from your device, ensuring its security.'
  ),
  (
    module4_id,
    'What should you do if you suspect that your personal device has been infected with malware?',
    '["Ignore it and continue working", "Immediately report it to IT and disconnect the device from company networks", "Use antivirus software and continue using it"]',
    'Immediately report it to IT and disconnect the device from company networks',
    'Reporting the incident allows IT to investigate, and disconnecting the device prevents further spread of malware to the company network.'
  ),
  (
    module4_id,
    'How should you behave during virtual meetings to maintain professionalism?',
    '["Wear casual clothing and do not worry about background noise", "Dress appropriately, mute your microphone when not speaking, and ensure a professional background", "Leave your camera off and use text chat only"]',
    'Dress appropriately, mute your microphone when not speaking, and ensure a professional background',
    'Professional attire, muting the microphone to avoid background noise, and having a clean background reflect professionalism during virtual meetings.'
  );
END $$;