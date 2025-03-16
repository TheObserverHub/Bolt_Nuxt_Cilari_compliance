/*
  # Module 7: Final Exam Content

  1. Content Added
    - Comprehensive final exam overview
    - Review sections for key topics
    - Quiz questions covering all previous modules
    - Final assessment requirements

  2. Structure
    - Introduction and exam guidelines
    - Review sections
    - Comprehensive quiz questions
*/

DO $$
DECLARE
  module7_id uuid;
BEGIN
  -- Get the ID of Module 7
  SELECT id INTO module7_id FROM modules WHERE order_number = 7;

  -- Insert sections for Module 7
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module7_id,
    'Overview',
    E'The Final Exam tests your understanding of all previous modules, including data protection, cybersecurity, incident response, remote work safety, health and safety, and professional conduct.\n\nThis comprehensive assessment will:\n* Evaluate your understanding of key concepts from all modules\n* Test your ability to apply knowledge in practical scenarios\n* Ensure readiness for maintaining compliance standards\n\nTo pass the final exam, you must achieve a score of 80% or higher.',
    1,
    'introduction'
  ),
  -- Section 1: Exam Guidelines
  (
    module7_id,
    'Exam Guidelines and Format',
    E'The final exam consists of multiple-choice questions covering all previous modules. Key points:\n\n1. Exam Structure\n* 20 questions total\n* Questions from all previous modules\n* Mix of theoretical and practical scenarios\n\n2. Time Limit\n* 45 minutes to complete\n* All questions must be answered\n\n3. Passing Requirements\n* Minimum score of 80% required\n* Multiple attempts allowed if needed',
    2,
    'content'
  ),
  -- Section 2: Review Summary
  (
    module7_id,
    'Key Topics Review',
    E'Before taking the exam, review these essential topics:\n\n1. Data Protection and Confidentiality\n* Types of sensitive data\n* Security best practices\n* Breach prevention\n\n2. Cybersecurity\n* Common threats\n* Prevention measures\n* Response procedures\n\n3. Incident Response\n* Types of incidents\n* Reporting procedures\n* Documentation requirements\n\n4. Remote Work Safety\n* Secure workspace setup\n* Professional conduct\n* Communication guidelines\n\n5. Health and Safety\n* Ergonomic considerations\n* Mental health awareness\n* Work-life balance\n\n6. Professional Conduct\n* Ethical decision-making\n* Professional relationships\n* Workplace standards',
    3,
    'content'
  ),
  -- Conclusion
  (
    module7_id,
    'Final Instructions',
    E'Before starting the exam:\n\n* Review all previous modules\n* Ensure you have a quiet, uninterrupted time period\n* Have any necessary reference materials ready\n* Take your time and read each question carefully\n\nGood luck with your final assessment!',
    4,
    'conclusion'
  );

  -- Insert Quiz Questions for Module 7 (Final Exam)
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module7_id,
    'Which of the following is NOT considered sensitive data?',
    '["Medical records", "Published annual reports", "Credit card numbers", "Employee salary information"]',
    'Published annual reports',
    'Published annual reports are public information, while the other options contain confidential data.'
  ),
  (
    module7_id,
    'What is the first step in responding to a suspected data breach?',
    '["Try to fix it yourself", "Report it immediately to IT security", "Delete affected files", "Wait to see if it happens again"]',
    'Report it immediately to IT security',
    'Immediate reporting allows for quick response and minimizes potential damage.'
  ),
  (
    module7_id,
    'Which practice best protects against phishing attacks?',
    '["Opening all emails", "Clicking links to check them", "Verifying sender identity and being cautious of unexpected requests", "Sharing suspicious emails with colleagues"]',
    'Verifying sender identity and being cautious of unexpected requests',
    'Verification and caution are key defenses against phishing attempts.'
  ),
  (
    module7_id,
    'What is the most secure way to work remotely?',
    '["Using public Wi-Fi", "Using a VPN and secure connection", "Sharing passwords with family", "Saving work files on personal devices"]',
    'Using a VPN and secure connection',
    'VPNs and secure connections protect data during remote work.'
  ),
  (
    module7_id,
    'How should you handle confidential documents in a home office?',
    '["Leave them on your desk", "Shred when no longer needed", "Store them with personal papers", "Share them with household members"]',
    'Shred when no longer needed',
    'Proper disposal of confidential documents prevents unauthorized access.'
  ),
  (
    module7_id,
    'What is the best response to workplace stress?',
    '["Ignore it and keep working", "Take regular breaks and seek support if needed", "Work longer hours", "Avoid team meetings"]',
    'Take regular breaks and seek support if needed',
    'Managing stress through breaks and support maintains mental health.'
  ),
  (
    module7_id,
    'Which is an example of professional conduct in virtual meetings?',
    '["Multitasking during calls", "Dressing professionally and being punctual", "Keeping your camera off always", "Eating during presentations"]',
    'Dressing professionally and being punctual',
    'Professional appearance and punctuality show respect for colleagues.'
  ),
  (
    module7_id,
    'What should you do if you witness unethical behavior?',
    '["Ignore it if it doesn''t affect you", "Report it through appropriate channels", "Confront the person directly", "Discuss it with colleagues"]',
    'Report it through appropriate channels',
    'Proper reporting ensures appropriate handling of ethical concerns.'
  ),
  (
    module7_id,
    'Which ergonomic practice is most important for long-term health?',
    '["Working from a couch", "Proper posture and screen height", "Using a laptop on your lap", "Working without breaks"]',
    'Proper posture and screen height',
    'Good posture and proper screen positioning prevent physical strain.'
  ),
  (
    module7_id,
    'What is the best way to maintain work-life balance when working remotely?',
    '["Being available 24/7", "Setting clear boundaries between work and personal time", "Checking emails constantly", "Taking calls during family time"]',
    'Setting clear boundaries between work and personal time',
    'Clear boundaries help maintain healthy work-life balance.'
  ),
  (
    module7_id,
    'How should you handle sensitive data on mobile devices?',
    '["Store it locally", "Use encryption and secure access", "Share it via personal email", "Save it to public cloud storage"]',
    'Use encryption and secure access',
    'Encryption and secure access protect sensitive data on mobile devices.'
  ),
  (
    module7_id,
    'What is the proper response to a ransomware attack?',
    '["Pay the ransom immediately", "Disconnect from the network and report to IT", "Try to fix it yourself", "Ignore the warning messages"]',
    'Disconnect from the network and report to IT',
    'Quick isolation and reporting are crucial in ransomware situations.'
  ),
  (
    module7_id,
    'Which password practice is most secure?',
    '["Using the same password everywhere", "Creating complex, unique passwords for each account", "Using simple, memorable passwords", "Sharing passwords with trusted colleagues"]',
    'Creating complex, unique passwords for each account',
    'Unique, complex passwords provide the best security.'
  ),
  (
    module7_id,
    'What should you do if you accidentally send sensitive information to the wrong person?',
    '["Hope they don''t notice", "Report it immediately to your supervisor", "Ask them to delete it", "Ignore the incident"]',
    'Report it immediately to your supervisor',
    'Prompt reporting allows for appropriate response to data exposure.'
  ),
  (
    module7_id,
    'How should you handle conflicts with remote team members?',
    '["Avoid the person", "Address issues professionally through appropriate channels", "Complain to other team members", "Wait for someone else to solve it"]',
    'Address issues professionally through appropriate channels',
    'Professional conflict resolution maintains team harmony.'
  ),
  (
    module7_id,
    'What is the best practice for securing your home office?',
    '["Leave devices unlocked", "Use strong passwords and lock devices when away", "Share workspace with family", "Keep sensitive documents visible"]',
    'Use strong passwords and lock devices when away',
    'Securing devices and workspace protects company data.'
  ),
  (
    module7_id,
    'How should you respond to a security policy violation?',
    '["Ignore it if no damage occurred", "Report it and correct the behavior", "Hide the violation", "Blame others involved"]',
    'Report it and correct the behavior',
    'Reporting and correcting violations maintains security standards.'
  ),
  (
    module7_id,
    'What is the most important factor in maintaining professional relationships?',
    '["Being friends with everyone", "Maintaining appropriate boundaries and respect", "Avoiding all personal conversations", "Sharing personal problems"]',
    'Maintaining appropriate boundaries and respect',
    'Professional boundaries and respect foster positive workplace relationships.'
  ),
  (
    module7_id,
    'Which practice best supports mental health while working remotely?',
    '["Working through lunch", "Taking regular breaks and maintaining social connections", "Avoiding team meetings", "Working longer hours"]',
    'Taking regular breaks and maintaining social connections',
    'Regular breaks and social connections support mental well-being.'
  ),
  (
    module7_id,
    'What is the most effective way to protect against cyber threats?',
    '["Installing a single antivirus program", "Using multiple security measures and staying vigilant", "Avoiding all internet use", "Relying on default security settings"]',
    'Using multiple security measures and staying vigilant',
    'A comprehensive security approach provides the best protection.'
  );
END $$;