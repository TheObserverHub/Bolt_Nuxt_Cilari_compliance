/*
  # Module 10: Business Ethics and Professional Conduct

  1. Content Added
    - Module 10 details
    - Sections covering business ethics
    - Professional conduct guidelines
    - Case studies on ethical dilemmas
    - Quiz questions testing understanding

  2. Structure
    - Introduction to business ethics
    - Professional conduct principles
    - Ethical decision-making
    - Real-world scenarios
    - Assessment questions
*/

DO $$
DECLARE
  module_id uuid;
BEGIN
  -- Generate a UUID for the module
  module_id := gen_random_uuid();

  -- Insert Module 10
  INSERT INTO modules (id, title, description, order_number, passing_score)
  VALUES (
    module_id,
    'Business Ethics and Professional Conduct',
    'Learn fundamental principles of business ethics and professional conduct. Understand ethical decision-making, conflict resolution, and maintaining professional standards in the workplace.',
    10,
    80
  );

  -- Insert Sections
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module_id,
    'Overview',
    E'Business ethics and professional conduct are foundational to our organization''s success and reputation. This module explores key principles and practical applications.\n\nParticipants will learn:\n* Ethical decision-making framework\n* Professional conduct standards\n* Conflict resolution\n* Reporting procedures\n* Corporate values integration\n\nLearning Objective:\nBy the end of this module, participants will understand how to navigate ethical challenges and maintain professional standards.',
    1,
    'introduction'
  ),

  -- Section 1: Business Ethics Fundamentals
  (
    module_id,
    'Understanding Business Ethics',
    E'Core Ethical Principles:\n\n1. Integrity\n- Honesty in all dealings\n- Transparency\n- Accountability\n\n2. Fairness\n- Equal treatment\n- Just practices\n- Unbiased decisions\n\n3. Responsibility\n- Corporate citizenship\n- Environmental stewardship\n- Social impact\n\n4. Respect\n- Dignity at work\n- Cultural sensitivity\n- Inclusive practices',
    2,
    'content'
  ),

  -- Case Study 1
  (
    module_id,
    'Case Study: Conflict of Interest',
    E'Scenario:\nAn employee is considering hiring their relative''s company as a vendor.\n\nQuestion:\nWhat ethical considerations are involved?\n\nAnswer: Potential conflict of interest must be disclosed, alternative vendors should be fairly considered, decision-making should be transparent, and proper procurement procedures must be followed.',
    3,
    'case_study'
  ),

  -- Section 2: Professional Conduct
  (
    module_id,
    'Professional Behavior Standards',
    E'Workplace Conduct:\n\n1. Communication\n- Respectful dialogue\n- Clear messaging\n- Appropriate channels\n\n2. Collaboration\n- Team dynamics\n- Inclusive practices\n- Conflict resolution\n\n3. Professionalism\n- Dress code\n- Time management\n- Work quality\n\n4. Workplace Relationships\n- Boundaries\n- Mentorship\n- Network building',
    4,
    'content'
  ),

  -- Case Study 2
  (
    module_id,
    'Case Study: Workplace Conduct',
    E'Scenario:\nAn employee witnesses inappropriate behavior between colleagues.\n\nQuestion:\nWhat is the appropriate response?\n\nAnswer: Document observations, report through proper channels, maintain confidentiality, and cooperate with any investigation.',
    5,
    'case_study'
  ),

  -- Section 3: Ethical Decision-Making
  (
    module_id,
    'Making Ethical Decisions',
    E'Decision Framework:\n\n1. Identify Issues\n- Recognize ethical dilemmas\n- Gather facts\n- Understand impact\n\n2. Evaluate Options\n- Consider alternatives\n- Assess consequences\n- Review policies\n\n3. Take Action\n- Make decisions\n- Implement solutions\n- Document process\n\n4. Review Results\n- Monitor outcomes\n- Learn from experience\n- Adjust approach',
    6,
    'content'
  ),

  -- Case Study 3
  (
    module_id,
    'Case Study: Ethical Dilemma',
    E'Scenario:\nAn employee discovers a minor error that benefits the company financially.\n\nQuestion:\nWhat should they do?\n\nAnswer: Report the error immediately, regardless of who benefits. Transparency and integrity are paramount in maintaining ethical standards.',
    7,
    'case_study'
  ),

  -- Conclusion
  (
    module_id,
    'Conclusion and Key Takeaways',
    E'Remember these essential points:\n\n* Ethics guide all business decisions\n* Professional conduct reflects company values\n* Report concerns promptly\n* Seek guidance when uncertain\n* Lead by example\n* Maintain integrity always',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module_id,
    'What is a conflict of interest?',
    '["Personal benefit conflicts with duty", "Regular business practice", "Team collaboration", "Project planning"]',
    'Personal benefit conflicts with duty',
    'A conflict of interest occurs when personal interests interfere with professional responsibilities.'
  ),
  (
    module_id,
    'Which is a key principle of business ethics?',
    '["Maximizing profit only", "Integrity", "Avoiding responsibility", "Hidden practices"]',
    'Integrity',
    'Integrity is fundamental to ethical business conduct and building trust.'
  ),
  (
    module_id,
    'What defines professional conduct?',
    '["Personal preferences", "Casual approach", "Established standards", "Random behavior"]',
    'Established standards',
    'Professional conduct follows established standards and expectations in the workplace.'
  ),
  (
    module_id,
    'How should ethical concerns be handled?',
    '["Ignore them", "Report promptly", "Wait and see", "Discuss with friends"]',
    'Report promptly',
    'Ethical concerns should be reported promptly through appropriate channels.'
  ),
  (
    module_id,
    'What is transparency?',
    '["Hiding information", "Open communication", "Selective sharing", "Private decisions"]',
    'Open communication',
    'Transparency involves open and honest communication about business practices.'
  ),
  (
    module_id,
    'Which demonstrates professionalism?',
    '["Late arrivals", "Consistent reliability", "Casual communication", "Minimal effort"]',
    'Consistent reliability',
    'Professional behavior includes consistent reliability and meeting commitments.'
  ),
  (
    module_id,
    'What is ethical decision-making?',
    '["Quick reactions", "Structured approach", "Random choices", "Following others"]',
    'Structured approach',
    'Ethical decision-making follows a structured approach considering principles and consequences.'
  ),
  (
    module_id,
    'How should conflicts be resolved?',
    '["Avoid them", "Constructive dialogue", "Force solutions", "Ignore issues"]',
    'Constructive dialogue',
    'Conflicts should be resolved through constructive dialogue and appropriate procedures.'
  ),
  (
    module_id,
    'What defines corporate values?',
    '["Profit margins", "Guiding principles", "Market trends", "Competition"]',
    'Guiding principles',
    'Corporate values are guiding principles that shape organizational culture and behavior.'
  ),
  (
    module_id,
    'Which is NOT ethical behavior?',
    '["Honesty", "Transparency", "Cover-ups", "Accountability"]',
    'Cover-ups',
    'Cover-ups violate ethical principles of honesty and transparency.'
  );
END $$;