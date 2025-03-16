/*
  # Module 4: Workplace Ethics and Professional Conduct

  1. Content Added
    - Module 4 details
    - Sections covering workplace ethics and professional conduct
    - Case studies demonstrating ethical dilemmas
    - Quiz questions testing understanding of ethical principles

  2. Structure
    - Introduction to workplace ethics
    - Core ethical principles
    - Professional conduct guidelines
    - Real-world case studies
    - Comprehensive assessment
*/

DO $$
DECLARE
  module_id uuid;
BEGIN
  -- Generate a UUID for the module
  module_id := gen_random_uuid();

  -- Insert Module 4
  INSERT INTO modules (id, title, description, order_number, passing_score)
  VALUES (
    module_id,
    'Workplace Ethics and Professional Conduct',
    'Learn about ethical decision-making and professional behavior in the workplace. This module covers core ethical principles, professional standards, and how to handle ethical dilemmas.',
    4,
    80
  );

  -- Insert Sections
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module_id,
    'Overview',
    E'Understanding workplace ethics and maintaining professional conduct is essential for creating a positive work environment and upholding company values.\n\nParticipants will learn:\n* Core ethical principles in the workplace\n* Professional conduct standards\n* How to identify and handle ethical dilemmas\n* Reporting procedures for ethical concerns\n\nLearning Objective:\nBy the end of this module, participants will understand ethical decision-making frameworks and be able to maintain professional conduct in various workplace situations.',
    1,
    'introduction'
  ),

  -- Section 1: Core Ethical Principles
  (
    module_id,
    'Understanding Workplace Ethics',
    E'Core Ethical Principles:\n\n1. Integrity\n- Honesty in all communications\n- Keeping commitments\n- Taking responsibility for actions\n\n2. Respect\n- Treating all individuals with dignity\n- Valuing diversity and inclusion\n- Maintaining professional boundaries\n\n3. Fairness\n- Equal treatment of all employees\n- Unbiased decision-making\n- Fair allocation of resources\n\n4. Accountability\n- Taking responsibility for actions\n- Admitting and learning from mistakes\n- Following through on commitments',
    2,
    'content'
  ),

  -- Case Study 1
  (
    module_id,
    'Case Study: Conflict of Interest',
    E'Scenario:\nA manager is considering hiring their cousin for a position in their department. The cousin is qualified, but there are other equally qualified candidates.\n\nQuestion:\nWhat ethical concerns does this situation raise?\n\nAnswer: This presents a potential conflict of interest. The manager should disclose the relationship to HR and remove themselves from the hiring process to ensure fair and unbiased selection.',
    3,
    'case_study'
  ),

  -- Section 2: Professional Conduct
  (
    module_id,
    'Professional Conduct Guidelines',
    E'Key Areas of Professional Conduct:\n\n1. Communication\n- Clear and respectful language\n- Appropriate tone and medium\n- Active listening\n\n2. Appearance and Behavior\n- Appropriate dress code\n- Professional demeanor\n- Workplace etiquette\n\n3. Work Habits\n- Punctuality and attendance\n- Meeting deadlines\n- Quality of work\n\n4. Collaboration\n- Team cooperation\n- Respect for colleagues\n- Constructive feedback',
    4,
    'content'
  ),

  -- Case Study 2
  (
    module_id,
    'Case Study: Professional Boundaries',
    E'Scenario:\nAn employee regularly shares detailed personal problems with coworkers during work hours, affecting team productivity and making others uncomfortable.\n\nQuestion:\nHow should this situation be handled?\n\nAnswer: While maintaining empathy, the situation should be addressed professionally by discussing appropriate workplace boundaries and suggesting employee assistance resources if needed.',
    5,
    'case_study'
  ),

  -- Section 3: Ethical Decision-Making
  (
    module_id,
    'Making Ethical Decisions',
    E'Ethical Decision-Making Framework:\n\n1. Identify the Issue\n- Recognize ethical implications\n- Gather relevant facts\n- Identify stakeholders\n\n2. Evaluate Options\n- Consider alternatives\n- Assess consequences\n- Review applicable policies\n\n3. Take Action\n- Make an informed decision\n- Implement with integrity\n- Document as needed\n\n4. Reflect and Learn\n- Evaluate outcomes\n- Consider improvements\n- Share lessons learned',
    6,
    'content'
  ),

  -- Case Study 3
  (
    module_id,
    'Case Study: Reporting Misconduct',
    E'Scenario:\nAn employee discovers a colleague is falsifying expense reports for personal gain.\n\nQuestion:\nWhat is the appropriate course of action?\n\nAnswer: The employee should report the misconduct through appropriate channels (supervisor, HR, or ethics hotline) and maintain confidentiality while the matter is investigated.',
    7,
    'case_study'
  ),

  -- Conclusion
  (
    module_id,
    'Conclusion and Key Takeaways',
    E'Remember these essential points:\n\n* Ethics guide our decisions and actions\n* Professional conduct builds trust and respect\n* Everyone is responsible for maintaining ethical standards\n* When in doubt, seek guidance\n* Report concerns through appropriate channels\n* Learn from ethical challenges',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module_id,
    'What is the first step in ethical decision-making?',
    '["Take immediate action", "Identify the ethical issue and gather facts", "Ask a colleague for advice", "Report to management"]',
    'Identify the ethical issue and gather facts',
    'Understanding the situation fully is essential for making ethical decisions.'
  ),
  (
    module_id,
    'Which of the following is NOT an example of professional conduct?',
    '["Meeting deadlines", "Respecting colleagues", "Sharing confidential information with friends", "Maintaining appropriate workplace boundaries"]',
    'Sharing confidential information with friends',
    'Sharing confidential information violates trust and professional standards.'
  ),
  (
    module_id,
    'What should you do if you witness unethical behavior?',
    '["Ignore it if it doesn''t affect you", "Report it through appropriate channels", "Confront the person directly", "Discuss it with other colleagues"]',
    'Report it through appropriate channels',
    'Using proper reporting channels ensures appropriate handling of ethical concerns.'
  ),
  (
    module_id,
    'What is a conflict of interest?',
    '["Working overtime", "Having multiple projects", "A situation where personal interests conflict with professional duties", "Disagreeing with a colleague"]',
    'A situation where personal interests conflict with professional duties',
    'Conflicts of interest can compromise objectivity and fairness.'
  ),
  (
    module_id,
    'Which principle is most important in maintaining professional relationships?',
    '["Being friends with everyone", "Respect and appropriate boundaries", "Sharing personal problems", "Avoiding all conflicts"]',
    'Respect and appropriate boundaries',
    'Maintaining appropriate professional boundaries ensures a respectful workplace.'
  ),
  (
    module_id,
    'What is the best approach to handling sensitive information?',
    '["Share it only with trusted colleagues", "Keep it completely confidential unless authorized to share", "Discuss it in private meetings", "Use personal judgment about sharing"]',
    'Keep it completely confidential unless authorized to share',
    'Maintaining confidentiality is a key aspect of professional ethics.'
  ),
  (
    module_id,
    'How should you handle a disagreement with a colleague?',
    '["Avoid them", "Address it professionally and directly", "Complain to other colleagues", "Wait for them to apologize"]',
    'Address it professionally and directly',
    'Professional conflict resolution maintains workplace harmony.'
  ),
  (
    module_id,
    'What is the purpose of professional conduct guidelines?',
    '["To restrict personal freedom", "To create a positive and respectful work environment", "To make work more difficult", "To monitor employees"]',
    'To create a positive and respectful work environment',
    'Guidelines help maintain a professional and productive workplace.'
  ),
  (
    module_id,
    'When faced with an ethical dilemma, what should you do first?',
    '["Make a quick decision", "Consult company policies and guidelines", "Ask friends for advice", "Ignore the situation"]',
    'Consult company policies and guidelines',
    'Company policies provide guidance for handling ethical situations.'
  ),
  (
    module_id,
    'What is the best way to maintain professional boundaries?',
    '["Never interact with colleagues", "Be friendly but maintain appropriate limits", "Share everything openly", "Avoid all personal conversations"]',
    'Be friendly but maintain appropriate limits',
    'Balance between friendliness and professionalism is key to workplace relationships.'
  );
END $$;