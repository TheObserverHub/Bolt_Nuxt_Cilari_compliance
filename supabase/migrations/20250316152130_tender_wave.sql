/*
  # Module 5: Time Management and Productivity

  1. Content Added
    - Module 5 details
    - Sections covering time management principles
    - Practical productivity techniques
    - Case studies demonstrating effective time management
    - Quiz questions testing understanding of concepts

  2. Structure
    - Introduction to time management
    - Core productivity principles
    - Time management techniques
    - Real-world case studies
    - Comprehensive assessment
*/

DO $$
DECLARE
  module_id uuid;
BEGIN
  -- Generate a UUID for the module
  module_id := gen_random_uuid();

  -- Insert Module 5
  INSERT INTO modules (id, title, description, order_number, passing_score)
  VALUES (
    module_id,
    'Time Management and Productivity',
    'Master essential time management skills and productivity techniques. Learn how to prioritize tasks, minimize distractions, and achieve better work-life balance.',
    5,
    80
  );

  -- Insert Sections
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module_id,
    'Overview',
    E'Effective time management is crucial for professional success and personal well-being. This module will help you develop practical skills to enhance productivity and work efficiency.\n\nParticipants will learn:\n* Core time management principles\n* Productivity techniques and tools\n* Prioritization strategies\n* Managing distractions\n* Work-life balance techniques\n\nLearning Objective:\nBy the end of this module, participants will be able to implement effective time management strategies and boost their workplace productivity.',
    1,
    'introduction'
  ),

  -- Section 1: Time Management Fundamentals
  (
    module_id,
    'Understanding Time Management',
    E'Core Time Management Principles:\n\n1. Planning\n- Setting clear goals\n- Creating actionable plans\n- Establishing deadlines\n\n2. Prioritization\n- Urgent vs. Important tasks\n- The Eisenhower Matrix\n- Value-based prioritization\n\n3. Organization\n- Structured workflow\n- Digital and physical organization\n- Calendar management\n\n4. Execution\n- Focus and concentration\n- Task completion\n- Progress tracking',
    2,
    'content'
  ),

  -- Case Study 1
  (
    module_id,
    'Case Study: Managing Multiple Deadlines',
    E'Scenario:\nA project manager has three important deliverables due within the same week. Each project requires significant attention and involves different team members.\n\nQuestion:\nHow should they approach this challenge?\n\nAnswer: They should assess each project''s priority, break them into smaller tasks, create a detailed schedule, delegate where possible, and communicate clearly with all stakeholders about timelines and expectations.',
    3,
    'case_study'
  ),

  -- Section 2: Productivity Techniques
  (
    module_id,
    'Effective Productivity Methods',
    E'Key Productivity Techniques:\n\n1. The Pomodoro Technique\n- 25-minute focused work sessions\n- Short breaks between sessions\n- Longer breaks after 4 sessions\n\n2. Time Blocking\n- Scheduling specific tasks\n- Creating focused work periods\n- Buffer time for unexpected issues\n\n3. The Two-Minute Rule\n- Complete quick tasks immediately\n- Reduce mental overhead\n- Maintain momentum\n\n4. Task Batching\n- Group similar tasks\n- Reduce context switching\n- Improve efficiency',
    4,
    'content'
  ),

  -- Case Study 2
  (
    module_id,
    'Case Study: Dealing with Distractions',
    E'Scenario:\nAn employee finds their productivity suffering due to constant email notifications, chat messages, and impromptu meetings.\n\nQuestion:\nWhat strategies could they implement to manage these distractions?\n\nAnswer: They should set specific times for checking emails, use "do not disturb" modes, block focused work time on their calendar, and communicate their availability to colleagues.',
    5,
    'case_study'
  ),

  -- Section 3: Work-Life Balance
  (
    module_id,
    'Maintaining Work-Life Balance',
    E'Essential Strategies:\n\n1. Setting Boundaries\n- Defined working hours\n- Clear communication\n- Personal time protection\n\n2. Energy Management\n- Peak productivity periods\n- Regular breaks\n- Stress management\n\n3. Digital Wellness\n- Screen time management\n- Notification control\n- Digital boundaries\n\n4. Sustainable Habits\n- Regular exercise\n- Adequate rest\n- Stress reduction techniques',
    6,
    'content'
  ),

  -- Case Study 3
  (
    module_id,
    'Case Study: Preventing Burnout',
    E'Scenario:\nA high-performing employee starts showing signs of burnout, working long hours and taking on too many responsibilities.\n\nQuestion:\nWhat steps should be taken to address this situation?\n\nAnswer: Implement better workload management, establish clear boundaries, take regular breaks, and communicate with supervisors about realistic expectations and resource needs.',
    7,
    'case_study'
  ),

  -- Conclusion
  (
    module_id,
    'Conclusion and Key Takeaways',
    E'Remember these essential points:\n\n* Time management is a learnable skill\n* Prioritization is key to productivity\n* Regular breaks enhance performance\n* Work-life balance is essential\n* Continuous improvement through feedback\n* Adapt techniques to your style',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module_id,
    'What is the Pomodoro Technique?',
    '["Working without any breaks", "25-minute focused work sessions with breaks", "Working overtime to complete tasks", "Multitasking between different projects"]',
    '25-minute focused work sessions with breaks',
    'The Pomodoro Technique uses timed work sessions to maintain focus and prevent burnout.'
  ),
  (
    module_id,
    'Which is the best approach to prioritizing tasks?',
    '["Do everything immediately", "Use the Eisenhower Matrix to categorize tasks", "Always do the easiest tasks first", "Multitask to complete everything at once"]',
    'Use the Eisenhower Matrix to categorize tasks',
    'The Eisenhower Matrix helps prioritize tasks based on urgency and importance.'
  ),
  (
    module_id,
    'What is time blocking?',
    '["Working without breaks", "Scheduling specific tasks for specific times", "Blocking all meetings", "Working on multiple tasks simultaneously"]',
    'Scheduling specific tasks for specific times',
    'Time blocking involves dedicating specific time periods to specific tasks.'
  ),
  (
    module_id,
    'How should you handle email distractions?',
    '["Check emails constantly", "Turn off notifications and check at scheduled times", "Ignore all emails", "Respond to every email immediately"]',
    'Turn off notifications and check at scheduled times',
    'Scheduled email checks help maintain focus and productivity.'
  ),
  (
    module_id,
    'What is the Two-Minute Rule?',
    '["Take a break every two minutes", "Complete quick tasks immediately if they take less than two minutes", "Work for only two minutes at a time", "Spend two minutes planning each task"]',
    'Complete quick tasks immediately if they take less than two minutes',
    'The Two-Minute Rule helps prevent small tasks from piling up.'
  ),
  (
    module_id,
    'Which is the best strategy for preventing burnout?',
    '["Work longer hours", "Take regular breaks and maintain boundaries", "Skip lunch to finish work", "Accept all project requests"]',
    'Take regular breaks and maintain boundaries',
    'Regular breaks and boundaries help maintain long-term productivity.'
  ),
  (
    module_id,
    'What is task batching?',
    '["Doing everything at once", "Grouping similar tasks together", "Delegating all tasks", "Postponing all tasks"]',
    'Grouping similar tasks together',
    'Task batching reduces context switching and improves efficiency.'
  ),
  (
    module_id,
    'How should you handle multiple deadlines?',
    '["Work on everything simultaneously", "Prioritize tasks and create a schedule", "Ignore less important deadlines", "Request extensions for all deadlines"]',
    'Prioritize tasks and create a schedule',
    'Proper planning and prioritization help manage multiple deadlines effectively.'
  ),
  (
    module_id,
    'What is the best way to maintain work-life balance?',
    '["Work overtime regularly", "Set clear boundaries between work and personal time", "Be available 24/7", "Skip breaks to finish work faster"]',
    'Set clear boundaries between work and personal time',
    'Clear boundaries help maintain a healthy work-life balance.'
  ),
  (
    module_id,
    'Which productivity technique is best for managing energy levels?',
    '["Working without breaks", "Matching important tasks to your peak energy times", "Pushing through fatigue", "Using caffeine to stay alert"]',
    'Matching important tasks to your peak energy times',
    'Aligning tasks with natural energy levels maximizes productivity.'
  );
END $$;