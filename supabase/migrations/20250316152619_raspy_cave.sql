/*
  # Module 9: Data Privacy and Information Security

  1. Content Added
    - Module 9 details
    - Sections covering data privacy principles
    - Information security best practices
    - Case studies on data protection
    - Quiz questions testing comprehension

  2. Structure
    - Introduction to data privacy
    - Security fundamentals
    - Privacy regulations
    - Best practices
    - Assessment questions
*/

DO $$
DECLARE
  module_id uuid;
BEGIN
  -- Generate a UUID for the module
  module_id := gen_random_uuid();

  -- Insert Module 9
  INSERT INTO modules (id, title, description, order_number, passing_score)
  VALUES (
    module_id,
    'Data Privacy and Information Security',
    'Learn essential principles of data privacy and information security. Understand regulatory requirements, best practices, and your role in protecting sensitive information.',
    9,
    80
  );

  -- Insert Sections
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module_id,
    'Overview',
    E'Data privacy and information security are crucial components of our business operations. This module covers fundamental concepts and practical applications.\n\nParticipants will learn:\n* Data privacy principles\n* Information security basics\n* Regulatory compliance\n* Security best practices\n* Incident response procedures\n\nLearning Objective:\nBy the end of this module, participants will understand how to protect sensitive information and maintain data privacy standards.',
    1,
    'introduction'
  ),

  -- Section 1: Data Privacy Fundamentals
  (
    module_id,
    'Understanding Data Privacy',
    E'Key Privacy Concepts:\n\n1. Personal Data\n- Definition and types\n- Sensitive information\n- Data classification\n\n2. Privacy Principles\n- Consent and transparency\n- Purpose limitation\n- Data minimization\n\n3. Individual Rights\n- Access rights\n- Rectification rights\n- Erasure rights\n\n4. Privacy by Design\n- Privacy-first approach\n- Built-in safeguards\n- Default protection',
    2,
    'content'
  ),

  -- Case Study 1
  (
    module_id,
    'Case Study: Data Collection',
    E'Scenario:\nA department wants to collect customer data for a new service.\n\nQuestion:\nWhat privacy considerations should be addressed?\n\nAnswer: Determine necessary data points, obtain explicit consent, implement security measures, establish retention periods, and ensure compliance with privacy regulations.',
    3,
    'case_study'
  ),

  -- Section 2: Information Security
  (
    module_id,
    'Security Fundamentals',
    E'Security Framework:\n\n1. Authentication\n- Strong passwords\n- Multi-factor authentication\n- Access controls\n\n2. Data Protection\n- Encryption methods\n- Secure storage\n- Safe transmission\n\n3. Network Security\n- Firewalls\n- VPN usage\n- Secure connections\n\n4. Device Security\n- Mobile devices\n- Remote access\n- Physical security',
    4,
    'content'
  ),

  -- Case Study 2
  (
    module_id,
    'Case Study: Security Incident',
    E'Scenario:\nAn employee notices suspicious activity on their computer.\n\nQuestion:\nWhat steps should they take?\n\nAnswer: Disconnect from the network, report to IT security immediately, document observations, and follow incident response procedures.',
    5,
    'case_study'
  ),

  -- Section 3: Regulatory Compliance
  (
    module_id,
    'Privacy Regulations',
    E'Compliance Requirements:\n\n1. Key Regulations\n- GDPR overview\n- CCPA requirements\n- Industry standards\n\n2. Compliance Measures\n- Documentation\n- Assessments\n- Reporting\n\n3. International Transfer\n- Data transfer rules\n- Adequacy decisions\n- Transfer mechanisms\n\n4. Breach Notification\n- Requirements\n- Timelines\n- Procedures',
    6,
    'content'
  ),

  -- Case Study 3
  (
    module_id,
    'Case Study: Data Transfer',
    E'Scenario:\nA team needs to share sensitive data with an international partner.\n\nQuestion:\nWhat precautions should be taken?\n\nAnswer: Verify legal basis for transfer, implement appropriate safeguards, ensure recipient compliance, and document transfer procedures.',
    7,
    'case_study'
  ),

  -- Conclusion
  (
    module_id,
    'Conclusion and Key Takeaways',
    E'Remember these essential points:\n\n* Privacy is everyone''s responsibility\n* Security requires constant vigilance\n* Compliance is mandatory\n* Report incidents promptly\n* When in doubt, ask for guidance\n* Stay updated on policies',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module_id,
    'What is personal data?',
    '["Company assets only", "Information identifying individuals", "Public records only", "Anonymous data"]',
    'Information identifying individuals',
    'Personal data is any information that can identify a specific individual.'
  ),
  (
    module_id,
    'Which is a strong password practice?',
    '["Using common words", "Same password everywhere", "Complex combination", "Birthday dates"]',
    'Complex combination',
    'Strong passwords use a complex combination of letters, numbers, and special characters.'
  ),
  (
    module_id,
    'What is data encryption?',
    '["Data deletion", "Converting data to code", "Public sharing", "Plain text storage"]',
    'Converting data to code',
    'Encryption converts data into coded form to prevent unauthorized access.'
  ),
  (
    module_id,
    'When should incidents be reported?',
    '["Next scheduled meeting", "Immediately", "End of day", "Monthly review"]',
    'Immediately',
    'Security incidents should be reported immediately to minimize potential damage.'
  ),
  (
    module_id,
    'What is multi-factor authentication?',
    '["Single password", "Multiple verification methods", "Weekly password changes", "Shared access"]',
    'Multiple verification methods',
    'MFA requires multiple forms of verification to access systems.'
  ),
  (
    module_id,
    'Which is a privacy principle?',
    '["Unlimited collection", "Data minimization", "Permanent storage", "Public sharing"]',
    'Data minimization',
    'Data minimization means collecting only necessary information.'
  ),
  (
    module_id,
    'What is a data breach?',
    '["System upgrade", "Unauthorized access", "Regular backup", "Normal access"]',
    'Unauthorized access',
    'A data breach occurs when unauthorized parties access protected information.'
  ),
  (
    module_id,
    'How should sensitive data be shared?',
    '["Public email", "Secure channels only", "Social media", "Plain text"]',
    'Secure channels only',
    'Sensitive data should only be shared through secure, encrypted channels.'
  ),
  (
    module_id,
    'What is privacy by design?',
    '["Afterthought security", "Built-in privacy features", "Optional protection", "No privacy"]',
    'Built-in privacy features',
    'Privacy by design incorporates privacy protection from the start of projects.'
  ),
  (
    module_id,
    'Which is NOT a security best practice?',
    '["Regular updates", "Sharing passwords", "Access controls", "Data encryption"]',
    'Sharing passwords',
    'Sharing passwords compromises security and should never be done.'
  );
END $$;