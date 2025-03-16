/*
  # Module 6: Code of Conduct and Ethics Content

  1. Content Added
    - Professional conduct guidelines
    - Ethical decision-making framework
    - Case studies demonstrating ethical scenarios
    - Quiz questions testing understanding

  2. Structure
    - Three main sections with detailed content
    - Real-world case studies
    - Comprehensive assessment
*/

DO $$
DECLARE
  module6_id uuid;
BEGIN
  -- Get the ID of Module 6
  SELECT id INTO module6_id FROM modules WHERE order_number = 6;

  -- Insert sections for Module 6
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module6_id,
    'Overview',
    E'Professional conduct and ethical behavior are fundamental to maintaining trust, respect, and integrity in the workplace. This module explores key principles of business ethics and professional conduct.\n\nBy completing this module, you will:\n* Understand core ethical principles and professional standards\n* Learn how to make ethical decisions in challenging situations\n* Know how to maintain professional relationships and boundaries\n* Recognize and report ethical concerns appropriately',
    1,
    'introduction'
  ),
  -- Section 1: Professional Conduct
  (
    module6_id,
    'Professional Conduct Standards',
    E'Professional conduct encompasses how we present ourselves, communicate with others, and perform our work duties. Key areas include:\n\n1. Communication Standards\n* Clear and respectful communication\n* Appropriate use of communication channels\n* Professional tone in all interactions\n\n2. Workplace Behavior\n* Punctuality and reliability\n* Appropriate dress code\n* Respectful treatment of colleagues\n\n3. Work Quality\n* Meeting deadlines\n* Attention to detail\n* Taking responsibility for actions',
    2,
    'content'
  ),
  -- Case Study 1.1
  (
    module6_id,
    'Case Study: Professional Communication',
    E'Scenario:\nTom, a team leader, becomes frustrated with a project delay and sends an angry email to his team, using inappropriate language and making accusatory statements.\n\nQuestions:\n1. What professional conduct standards did Tom violate?\n2. How should he have handled the situation?\n3. What are the potential consequences of unprofessional communication?\n\nAnswers:\n1. Tom violated professional communication standards by using inappropriate language and making accusations.\n2. He should have addressed concerns calmly in a team meeting, focusing on solutions rather than blame.\n3. Unprofessional communication can damage team morale, trust, and workplace relationships.',
    3,
    'case_study'
  ),
  -- Case Study 1.2
  (
    module6_id,
    'Case Study: Meeting Professional Standards',
    E'Scenario:\nSarah consistently joins virtual meetings late, often appears disheveled, and frequently multitasks during discussions.\n\nQuestions:\n1. How does Sarah''s behavior impact professional standards?\n2. What should she do to improve?\n3. How can managers address such behavior?\n\nAnswers:\n1. Her behavior shows disrespect for colleagues'' time and affects meeting productivity.\n2. Sarah should prepare for meetings in advance, join on time, and give full attention to discussions.\n3. Managers should address concerns privately and set clear expectations for meeting conduct.',
    4,
    'case_study'
  ),
  -- Section 2: Ethical Decision-Making
  (
    module6_id,
    'Making Ethical Decisions',
    E'Ethical decision-making requires careful consideration of principles, consequences, and stakeholder impacts. Key components include:\n\n1. Ethical Principles\n* Integrity and honesty\n* Fairness and respect\n* Responsibility and accountability\n\n2. Decision Framework\n* Identify ethical issues\n* Consider alternatives\n* Evaluate consequences\n* Make and implement decisions\n\n3. Stakeholder Consideration\n* Impact on individuals\n* Company implications\n* Community effects',
    5,
    'content'
  ),
  -- Case Study 2.1
  (
    module6_id,
    'Case Study: Ethical Dilemma',
    E'Scenario:\nMichael discovers that his colleague is falsifying expense reports for personal gain. The colleague is a close friend who is experiencing financial difficulties.\n\nQuestions:\n1. What ethical principles are involved?\n2. How should Michael handle this situation?\n3. What are the potential consequences of different actions?\n\nAnswers:\n1. The situation involves integrity, honesty, and loyalty conflicts.\n2. Michael should report the fraud through appropriate channels, despite personal friendship.\n3. Ignoring fraud can lead to legal issues and damage company trust.',
    6,
    'case_study'
  ),
  -- Section 3: Maintaining Professional Relationships
  (
    module6_id,
    'Professional Relationships and Boundaries',
    E'Professional relationships require clear boundaries and appropriate behavior. This section covers:\n\n1. Setting Boundaries\n* Personal vs. professional relationships\n* Appropriate workplace behavior\n* Managing conflicts of interest\n\n2. Workplace Relationships\n* Colleague interactions\n* Supervisor-employee dynamics\n* Client relationships\n\n3. Conflict Resolution\n* Addressing issues professionally\n* Following proper channels\n* Maintaining respect during disagreements',
    7,
    'content'
  ),
  -- Conclusion
  (
    module6_id,
    'Conclusion and Key Takeaways',
    E'Remember these essential points:\n\n* Maintain professional conduct in all workplace interactions\n* Make ethical decisions based on clear principles\n* Set appropriate boundaries in workplace relationships\n* Report ethical concerns through proper channels\n* Take responsibility for your actions and decisions',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions for Module 6
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module6_id,
    'What is the first step in ethical decision-making?',
    '["Take immediate action", "Identify the ethical issue", "Ask colleagues for advice", "Ignore the problem"]',
    'Identify the ethical issue',
    'Understanding the ethical implications is crucial before taking action.'
  ),
  (
    module6_id,
    'How should you handle a conflict with a colleague?',
    '["Ignore them", "Address it professionally and directly", "Complain to other colleagues", "Wait for them to apologize"]',
    'Address it professionally and directly',
    'Professional conflict resolution maintains workplace harmony and productivity.'
  ),
  (
    module6_id,
    'What is the best approach to maintaining professional boundaries?',
    '["Avoid all personal conversations", "Balance friendly behavior with professional limits", "Share everything about your personal life", "Treat everyone as close friends"]',
    'Balance friendly behavior with professional limits',
    'Professional relationships require appropriate boundaries while maintaining positive interactions.'
  ),
  (
    module6_id,
    'When should you report an ethical concern?',
    '["Only if it affects you directly", "As soon as you become aware of it", "Wait to see if it resolves itself", "Only if others report it"]',
    'As soon as you become aware of it',
    'Prompt reporting of ethical concerns helps maintain workplace integrity.'
  ),
  (
    module6_id,
    'What defines professional conduct?',
    '["Following personal preferences", "Meeting minimum requirements", "Maintaining high standards of behavior and work quality", "Doing whatever makes you comfortable"]',
    'Maintaining high standards of behavior and work quality',
    'Professional conduct involves consistent high standards in behavior and work.'
  ),
  (
    module6_id,
    'How should you handle confidential information?',
    '["Share it with trusted colleagues", "Keep it completely confidential unless authorized to share", "Use your judgment about sharing", "Discuss it in private conversations"]',
    'Keep it completely confidential unless authorized to share',
    'Confidential information should only be shared with proper authorization.'
  ),
  (
    module6_id,
    'What is a conflict of interest?',
    '["Working overtime", "When personal interests conflict with professional duties", "Having multiple projects", "Disagreeing with colleagues"]',
    'When personal interests conflict with professional duties',
    'Conflicts of interest arise when personal and professional responsibilities clash.'
  ),
  (
    module6_id,
    'How should you respond to inappropriate workplace behavior?',
    '["Ignore it", "Report it through appropriate channels", "Confront the person aggressively", "Gossip about it with colleagues"]',
    'Report it through appropriate channels',
    'Using proper reporting channels ensures appropriate handling of workplace issues.'
  ),
  (
    module6_id,
    'What is the purpose of professional standards?',
    '["To limit personal freedom", "To create a positive and respectful work environment", "To make work more difficult", "To control employees"]',
    'To create a positive and respectful work environment',
    'Professional standards help maintain a productive and respectful workplace.'
  ),
  (
    module6_id,
    'How should you handle a mistake in your work?',
    '["Hide it and hope no one notices", "Acknowledge it and take steps to correct it", "Blame others", "Minimize its importance"]',
    'Acknowledge it and take steps to correct it',
    'Taking responsibility for mistakes and correcting them is professional and ethical.'
  );
END $$;