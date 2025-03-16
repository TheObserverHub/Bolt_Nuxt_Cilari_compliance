/*
  # Module 7: Data Privacy and Security

  1. Content Added
    - Module 7 details
    - Sections covering data privacy principles
    - Security best practices
    - Case studies on data protection
    - Quiz questions testing understanding

  2. Structure
    - Introduction to data privacy
    - Security fundamentals
    - Compliance requirements
    - Real-world scenarios
    - Assessment questions
*/

DO $$
DECLARE
  module_id uuid;
BEGIN
  -- Generate a UUID for the module
  module_id := gen_random_uuid();

  -- Insert Module 7
  INSERT INTO modules (id, title, description, order_number, passing_score)
  VALUES (
    module_id,
    'Data Privacy and Security',
    'Learn essential data protection practices and security protocols. Understand privacy regulations, security best practices, and your role in maintaining data integrity.',
    7,
    80
  );

  -- Insert Sections
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module_id,
    'Overview',
    E'Data privacy and security are crucial in today''s digital workplace. This module covers essential practices for protecting sensitive information.\n\nParticipants will learn:\n* Data privacy fundamentals\n* Security best practices\n* Regulatory compliance\n* Incident response procedures\n* Risk management strategies\n\nLearning Objective:\nBy the end of this module, participants will understand how to handle sensitive data securely and comply with privacy regulations.',
    1,
    'introduction'
  ),

  -- Section 1: Data Privacy Fundamentals
  (
    module_id,
    'Understanding Data Privacy',
    E'Key Privacy Concepts:\n\n1. Personal Data\n- Definition and types\n- Sensitivity levels\n- Collection purposes\n\n2. Privacy Principles\n- Consent requirements\n- Data minimization\n- Purpose limitation\n- Storage restrictions\n\n3. Individual Rights\n- Access rights\n- Correction rights\n- Deletion rights\n- Portability rights\n\n4. Privacy by Design\n- Built-in privacy\n- Default protection\n- End-to-end security',
    2,
    'content'
  ),

  -- Case Study 1
  (
    module_id,
    'Case Study: Data Collection',
    E'Scenario:\nA department wants to collect employee health information for a wellness program.\n\nQuestion:\nWhat privacy considerations should be addressed?\n\nAnswer: Obtain explicit consent, clearly state the purpose, limit collection to necessary data, ensure secure storage, and provide opt-out options.',
    3,
    'case_study'
  ),

  -- Section 2: Security Best Practices
  (
    module_id,
    'Security Protocols',
    E'Essential Security Measures:\n\n1. Password Security\n- Strong passwords\n- Regular updates\n- Multi-factor authentication\n\n2. Data Protection\n- Encryption methods\n- Secure transfer\n- Access controls\n\n3. Device Security\n- Device management\n- Software updates\n- Physical security\n\n4. Network Safety\n- Secure connections\n- VPN usage\n- Public Wi-Fi risks',
    4,
    'content'
  ),

  -- Case Study 2
  (
    module_id,
    'Case Study: Security Breach',
    E'Scenario:\nAn employee notices unauthorized access to their work account.\n\nQuestion:\nWhat immediate steps should they take?\n\nAnswer: Report the incident to IT security, change passwords immediately, document any suspicious activities, and follow incident response procedures.',
    5,
    'case_study'
  ),

  -- Section 3: Compliance Requirements
  (
    module_id,
    'Regulatory Compliance',
    E'Compliance Framework:\n\n1. Key Regulations\n- GDPR basics\n- Local requirements\n- Industry standards\n\n2. Compliance Practices\n- Documentation\n- Regular audits\n- Training requirements\n\n3. Risk Management\n- Risk assessment\n- Mitigation strategies\n- Continuous monitoring\n\n4. Incident Response\n- Response plans\n- Reporting procedures\n- Recovery processes',
    6,
    'content'
  ),

  -- Case Study 3
  (
    module_id,
    'Case Study: Data Transfer',
    E'Scenario:\nA team needs to share sensitive customer data with an external partner.\n\nQuestion:\nWhat security measures should be implemented?\n\nAnswer: Use secure file transfer protocols, implement data encryption, establish data processing agreements, and maintain transfer logs.',
    7,
    'case_study'
  ),

  -- Conclusion
  (
    module_id,
    'Conclusion and Key Takeaways',
    E'Remember these critical points:\n\n* Privacy is everyone''s responsibility\n* Security requires constant vigilance\n* Compliance is mandatory\n* Report incidents promptly\n* Keep learning and staying updated\n* Follow best practices consistently',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module_id,
    'What is personal data?',
    '["Only financial information", "Any information that can identify an individual", "Company secrets", "Public records only"]',
    'Any information that can identify an individual',
    'Personal data includes any information that can directly or indirectly identify a person.'
  ),
  (
    module_id,
    'Which is a strong password practice?',
    '["Using your name", "Using the same password everywhere", "Combining letters, numbers, and symbols", "Sharing passwords with colleagues"]',
    'Combining letters, numbers, and symbols',
    'Strong passwords use a mix of characters and are unique for each account.'
  ),
  (
    module_id,
    'What should you do if you suspect a data breach?',
    '["Keep it to yourself", "Report it immediately", "Try to fix it yourself", "Wait and see what happens"]',
    'Report it immediately',
    'Prompt reporting enables quick response and minimizes potential damage.'
  ),
  (
    module_id,
    'How should sensitive data be transferred?',
    '["Through personal email", "Using encrypted channels only", "Via public cloud storage", "On USB drives"]',
    'Using encrypted channels only',
    'Encrypted channels ensure data security during transfer.'
  ),
  (
    module_id,
    'What is data minimization?',
    '["Collecting all possible data", "Collecting only necessary data", "Never collecting data", "Sharing all data"]',
    'Collecting only necessary data',
    'Data minimization reduces risk by limiting collection to essential information.'
  ),
  (
    module_id,
    'Which is a secure practice for remote work?',
    '["Using public Wi-Fi", "Using VPN connections", "Sharing work devices", "Disabling security software"]',
    'Using VPN connections',
    'VPNs provide secure connections for remote work.'
  ),
  (
    module_id,
    'What is multi-factor authentication?',
    '["Using multiple passwords", "Combining different security methods", "Sharing authentication", "Avoiding authentication"]',
    'Combining different security methods',
    'MFA adds security layers beyond passwords.'
  ),
  (
    module_id,
    'How often should passwords be updated?',
    '["Never", "When compromised or required", "Every day", "Only when forgotten"]',
    'When compromised or required',
    'Regular updates and immediate changes after compromise protect accounts.'
  ),
  (
    module_id,
    'What is privacy by design?',
    '["Adding privacy later", "Building in privacy from the start", "Ignoring privacy", "Minimal security"]',
    'Building in privacy from the start',
    'Privacy by design incorporates protection throughout development.'
  ),
  (
    module_id,
    'Which is NOT a proper data disposal method?',
    '["Secure deletion", "Physical destruction", "Throwing in regular trash", "Professional disposal"]',
    'Throwing in regular trash',
    'Proper disposal prevents unauthorized data access.'
  );
END $$;