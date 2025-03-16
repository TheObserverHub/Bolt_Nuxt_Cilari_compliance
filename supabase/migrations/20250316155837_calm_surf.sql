/*
  # Module 5: Health and Safety for Remote Workers Content

  1. Content Added
    - Physical health and safety section
    - Mental health and well-being section
    - Case studies demonstrating best practices
    - Quiz questions testing comprehension

  2. Structure
    - Three main sections with detailed content
    - Real-world case studies
    - Comprehensive assessment
*/

DO $$
DECLARE
  module5_id uuid;
BEGIN
  -- Get the ID of Module 5
  SELECT id INTO module5_id FROM modules WHERE order_number = 5;

  -- Insert sections for Module 5
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module5_id,
    'Overview',
    E'Ensuring health and safety for remote employees is just as important as in-office environments. This module will cover the essential elements of maintaining both physical well-being (ergonomics, workspace safety) and mental health while working remotely.\n\nBy the end of this module, you will be familiar with best practices to ensure a safe and healthy remote working environment and understand how to manage both physical and mental health concerns.',
    1,
    'introduction'
  ),
  -- Section 1: Physical Health and Safety
  (
    module5_id,
    'Physical Health and Safety in a Remote Workspace',
    E'Even though employees work remotely, maintaining a safe and ergonomic workspace is crucial to avoid injuries or long-term health issues.\n\nThis section will focus on:\n* Ergonomics for remote work to prevent musculoskeletal injuries.\n* Setting up a safe home office to minimise accidents.\n* Best practices for long-term health when working from home.',
    2,
    'content'
  ),
  -- Case Study 1.1
  (
    module5_id,
    'Case Study: Ergonomic Mistakes in a Home Office',
    E'Scenario:\nMaria, a customer support agent, spends long hours working from her home office, but her chair is not adjustable and her laptop screen is too low. She begins to feel pain in her neck and back.\n\nQuestions:\n1. What ergonomic mistakes did Maria make?\n2. How can she adjust her workspace to reduce pain and discomfort?\n3. What should remote employees consider when setting up their home offices?\n\nAnswers:\n1. Maria''s chair is not adjustable, and her screen is too low, leading to neck and back strain.\n2. Maria should use an adjustable chair, position her screen at eye level, and ensure her feet are flat on the floor.\n3. Remote employees should prioritise adjustable furniture, proper screen placement, and break times to prevent strain.',
    3,
    'case_study'
  ),
  -- Case Study 1.2
  (
    module5_id,
    'Case Study: Cable Hazards in the Home Office',
    E'Scenario:\nJames works from a home office where cables are scattered around his desk. One day, he trips over a loose cable while walking to the printer, injuring his foot.\n\nQuestions:\n1. What caused the accident in this case?\n2. What should James have done to prevent the accident?\n3. How can remote employees ensure their workspace is safe from similar hazards?\n\nAnswers:\n1. The accident was caused by loose cables on the floor, creating a tripping hazard.\n2. James should have organised cables and used cable management solutions to keep them off the floor.\n3. Remote employees should keep cables tidy, use cable ties, and ensure there are no obstacles in walkways.',
    4,
    'case_study'
  ),
  -- Section 2: Mental Health and Well-Being
  (
    module5_id,
    'Mental Health and Well-Being in Remote Work',
    E'Working remotely can lead to challenges in managing mental health, including isolation, stress, and burnout. In this section, we will discuss:\n\n* Recognising signs of mental health struggles in remote employees.\n* Strategies to maintain mental well-being while working remotely.\n* How to access support when facing mental health challenges.',
    5,
    'content'
  ),
  -- Case Study 2.1
  (
    module5_id,
    'Case Study: Burnout from Overwork',
    E'Scenario:\nAmanda, an HR coordinator, has been working long hours from home, often beyond the standard workday, in an attempt to keep up with an increasing workload. She begins to feel overwhelmed, anxious, and exhausted.\n\nQuestions:\n1. What mental health issue is Amanda facing?\n2. How can Amanda manage her workload and prevent burnout?\n3. What steps can managers take to support employees at risk of burnout?\n\nAnswers:\n1. Amanda is experiencing burnout due to overwork and lack of boundaries between personal and work life.\n2. Amanda can manage her workload by setting clear work-life boundaries, taking regular breaks, and asking for help with tasks when needed.\n3. Managers can help by encouraging breaks, setting reasonable work expectations, and offering support for employees struggling with workload.',
    6,
    'case_study'
  ),
  -- Section 3: Maintaining a Safe and Healthy Remote Workspace
  (
    module5_id,
    'Maintaining a Safe and Healthy Remote Workspace',
    E'Creating a physically safe, ergonomic, and mentally healthy remote workspace is key to preventing accidents and maintaining long-term well-being.\n\nThis section will focus on:\n* Home office safety and ergonomics.\n* Creating a mentally healthy workspace.\n* Company policies for reporting remote work accidents or health issues.',
    7,
    'content'
  ),
  -- Conclusion
  (
    module5_id,
    'Conclusion and Key Takeaways',
    E'* Maintain proper ergonomics by using a comfortable chair, desk, and correct posture.\n* Take regular breaks to reduce physical and mental strain.\n* Manage work-life balance to avoid burnout and fatigue.\n* Be mindful of mental health, and seek support if feeling overwhelmed.\n* Follow company policies on emergency preparedness and safety measures at home.',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions for Module 5
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module5_id,
    'What is the first thing you should do if you notice a tripping hazard in your home office?',
    '["Ignore it", "Move the hazard immediately", "Report it to your manager"]',
    'Move the hazard immediately',
    'Employees should remove tripping hazards as soon as they are noticed to prevent accidents.'
  ),
  (
    module5_id,
    'What should be the ideal height of your screen to avoid neck strain?',
    '["Below eye level", "At eye level", "Above eye level"]',
    'At eye level',
    'Keeping the screen at eye level minimises neck strain and promotes proper posture.'
  ),
  (
    module5_id,
    'Which of the following is a sign of burnout from remote work?',
    '["Increased motivation", "Feeling exhausted and disengaged", "Greater focus and energy"]',
    'Feeling exhausted and disengaged',
    'Burnout is characterised by chronic exhaustion, lack of motivation, and decreased work performance.'
  ),
  (
    module5_id,
    'How often should you take breaks when working on a computer for long hours?',
    '["Every 20 minutes", "Every 2 hours", "Only during lunch breaks"]',
    'Every 20 minutes',
    'Following the 20-20-20 rule (every 20 minutes, take a 20-second break to look at something 20 feet away) helps reduce eye strain.'
  ),
  (
    module5_id,
    'Which of the following best describes proper ergonomic chair positioning?',
    '["Feet flat on the floor, knees at a 90-degree angle, and back supported", "Feet dangling, leaning forward, and knees above hip level", "Sitting on a soft couch with legs stretched out"]',
    'Feet flat on the floor, knees at a 90-degree angle, and back supported',
    'Proper ergonomic positioning reduces back and joint strain.'
  ),
  (
    module5_id,
    'What should you do if you start feeling isolated while working remotely?',
    '["Keep working and ignore it", "Reach out to colleagues and participate in virtual social events", "Quit your job"]',
    'Reach out to colleagues and participate in virtual social events',
    'Staying connected through virtual team meetings, social events, and casual check-ins can help reduce feelings of isolation.'
  ),
  (
    module5_id,
    'What is the best way to reduce stress when working remotely?',
    '["Work longer hours to finish tasks quickly", "Take breaks, exercise, and set boundaries for work hours", "Avoid talking to your manager about workload concerns"]',
    'Take breaks, exercise, and set boundaries for work hours',
    'Managing stress involves balancing work with self-care, including breaks and clear boundaries between work and personal life.'
  ),
  (
    module5_id,
    'Which of the following is the most effective way to prevent eye strain?',
    '["Keeping the room dark when working", "Using proper lighting, reducing glare, and following the 20-20-20 rule", "Sitting very close to the screen"]',
    'Using proper lighting, reducing glare, and following the 20-20-20 rule',
    'Proper lighting, anti-glare settings, and regular breaks help prevent digital eye strain.'
  ),
  (
    module5_id,
    'If you injure yourself while working remotely, what should you do?',
    '["Keep working and ignore the injury", "Report it to your manager and seek medical attention if necessary", "Only report it if it happens in an office"]',
    'Report it to your manager and seek medical attention if necessary',
    'Workplace injuries should be reported, even in remote work settings, to ensure proper documentation and support.'
  ),
  (
    module5_id,
    'How can companies support employees'' mental health while working remotely?',
    '["Encourage long working hours to maximise productivity", "Provide mental health resources, encourage work-life balance, and maintain regular communication", "Avoid checking in with employees to reduce pressure"]',
    'Provide mental health resources, encourage work-life balance, and maintain regular communication',
    'Companies should actively support employees'' mental health by offering resources, promoting balance, and fostering an open culture for mental health discussions.'
  );
END $$;