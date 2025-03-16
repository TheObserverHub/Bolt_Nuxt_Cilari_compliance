/*
  # Module 3: Incident Response and Emergency Procedures

  1. Content Added
    - Module 3 details
    - Module sections covering incident response procedures
    - Case studies demonstrating real-world scenarios
    - Quiz questions testing emergency response knowledge

  2. Structure
    - Introduction to incident response
    - Sections on different types of incidents
    - Emergency procedures and protocols
    - Practical case studies
    - Comprehensive assessment
*/

DO $$
DECLARE
  module_id uuid;
BEGIN
  -- Generate a UUID for the module
  module_id := gen_random_uuid();

  -- Insert Module 3
  INSERT INTO modules (id, title, description, order_number, passing_score)
  VALUES (
    module_id,
    'Incident Response and Emergency Procedures',
    'Learn how to identify, report, and respond to various workplace incidents and emergencies. This module covers essential procedures for maintaining workplace safety and security.',
    3,
    80
  );

  -- Insert Sections
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module_id,
    'Overview',
    E'Proper incident response is crucial for maintaining workplace safety and minimizing potential damages. This module covers various types of incidents and the appropriate response procedures.\n\nParticipants will learn:\n* How to identify different types of workplace incidents\n* Proper reporting procedures\n* Emergency response protocols\n* Post-incident documentation requirements\n\nLearning Objective:\nBy the end of this module, participants will be able to effectively respond to and report workplace incidents while following established safety protocols.',
    1,
    'introduction'
  ),

  -- Section 1: Types of Incidents
  (
    module_id,
    'Understanding Different Types of Incidents',
    E'Common Workplace Incidents:\n\n1. Security Incidents\n- Unauthorized access\n- Suspicious behavior\n- Lost/stolen equipment\n\n2. Safety Incidents\n- Workplace accidents\n- Health emergencies\n- Fire or evacuation situations\n\n3. Environmental Incidents\n- Chemical spills\n- Water leaks\n- Air quality issues\n\n4. IT Incidents\n- System outages\n- Data breaches\n- Network security issues',
    2,
    'content'
  ),

  -- Case Study 1
  (
    module_id,
    'Case Study: Unauthorized Access',
    E'Scenario:\nAn employee notices an unfamiliar person following another employee through a secure door without scanning their badge (tailgating).\n\nQuestion:\nWhat should the employee do in this situation?\n\nAnswer: The employee should immediately report the incident to security, noting the time, location, and description of the individual. If safe to do so, they can politely ask the person to show their badge.',
    3,
    'case_study'
  ),

  -- Section 2: Reporting Procedures
  (
    module_id,
    'Incident Reporting Procedures',
    E'Steps for Reporting Incidents:\n\n1. Initial Response\n- Ensure immediate safety\n- Contact emergency services if needed\n- Secure the area if necessary\n\n2. Notification Process\n- Alert supervisor or security\n- Contact relevant department (IT, HR, Facilities)\n- Follow escalation procedures\n\n3. Documentation\n- Record incident details\n- Take photos if applicable\n- Gather witness statements\n\n4. Follow-up\n- Cooperate with investigation\n- Complete required forms\n- Participate in post-incident review',
    4,
    'content'
  ),

  -- Case Study 2
  (
    module_id,
    'Case Study: Medical Emergency',
    E'Scenario:\nDuring a meeting, a colleague suddenly experiences chest pain and difficulty breathing.\n\nQuestion:\nWhat is the correct sequence of actions?\n\nAnswer: 1) Call emergency services immediately, 2) Alert office first aid responders, 3) Clear the area and ensure easy access for emergency personnel, 4) Document the incident once the situation is stable.',
    5,
    'case_study'
  ),

  -- Section 3: Emergency Response
  (
    module_id,
    'Emergency Response Protocols',
    E'Key Emergency Procedures:\n\n1. Evacuation Protocol\n- Know evacuation routes\n- Location of emergency exits\n- Assembly points\n- Role-specific responsibilities\n\n2. Fire Response\n- R.A.C.E. procedure (Rescue, Alarm, Contain, Evacuate)\n- Fire extinguisher use (P.A.S.S.)\n- Evacuation procedures\n\n3. Medical Emergencies\n- First aid locations\n- AED locations\n- Emergency contact numbers\n\n4. Active Threat Response\n- Run, Hide, Fight protocol\n- Lockdown procedures\n- Communication channels',
    6,
    'content'
  ),

  -- Case Study 3
  (
    module_id,
    'Case Study: Fire Emergency',
    E'Scenario:\nAn employee discovers a small fire in the break room microwave.\n\nQuestion:\nWhat should be the immediate response?\n\nAnswer: 1) Pull the fire alarm to alert others, 2) If trained and if the fire is small, use appropriate fire extinguisher, 3) If fire is too large or spreading, evacuate immediately, 4) Close doors to contain the fire while evacuating.',
    7,
    'case_study'
  ),

  -- Conclusion
  (
    module_id,
    'Conclusion and Key Takeaways',
    E'Remember these critical points:\n\n* Safety always comes first\n* Know emergency procedures before incidents occur\n* Report all incidents promptly\n* Document thoroughly\n* Participate in regular emergency drills\n* Stay calm and follow established protocols',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module_id,
    'What is the first priority in any incident response?',
    '["Document the incident", "Ensure personal and others'' safety", "Notify supervisor", "Secure company assets"]',
    'Ensure personal and others'' safety',
    'Safety of personnel always takes precedence over other concerns in emergency situations.'
  ),
  (
    module_id,
    'Which of the following is NOT a proper response to unauthorized access?',
    '["Report to security", "Document the incident", "Confront the person physically", "Alert your supervisor"]',
    'Confront the person physically',
    'Physical confrontation can escalate situations and create safety risks.'
  ),
  (
    module_id,
    'What does R.A.C.E. stand for in fire response?',
    '["Run Away Carefully Everywhere", "Rescue, Alarm, Contain, Evacuate", "Report, Assess, Control, Exit", "Ready, Aim, Contain, Escape"]',
    'Rescue, Alarm, Contain, Evacuate',
    'R.A.C.E. is the standard protocol for responding to fire emergencies.'
  ),
  (
    module_id,
    'When should you complete an incident report?',
    '["Only for serious incidents", "Never, let management handle it", "As soon as it''s safe to do so", "Wait until the next day"]',
    'As soon as it''s safe to do so',
    'Prompt documentation ensures accurate details are recorded while memory is fresh.'
  ),
  (
    module_id,
    'What information should be included in an incident report?',
    '["Just the date and time", "Only the names of those involved", "All relevant details including time, location, people involved, and actions taken", "A brief one-sentence summary"]',
    'All relevant details including time, location, people involved, and actions taken',
    'Comprehensive documentation is crucial for proper incident investigation and follow-up.'
  ),
  (
    module_id,
    'In case of a medical emergency, what should you do first?',
    '["Start first aid immediately", "Call emergency services", "Look for the person''s emergency contact", "Send an email to HR"]',
    'Call emergency services',
    'Professional medical help should be summoned immediately in serious medical emergencies.'
  ),
  (
    module_id,
    'What is "tailgating" in security terms?',
    '["Following security protocols", "Following up on incidents", "Following someone through a secure door without scanning a badge", "Following emergency vehicles"]',
    'Following someone through a secure door without scanning a badge',
    'Tailgating is a common security breach that compromises access control measures.'
  ),
  (
    module_id,
    'What should you do if you discover a chemical spill?',
    '["Clean it up immediately", "Alert others and contact emergency response team", "Ignore it if it''s small", "Pour water on it"]',
    'Alert others and contact emergency response team',
    'Chemical spills require professional handling to ensure safety.'
  ),
  (
    module_id,
    'During an evacuation, what should you do?',
    '["Use elevators to exit quickly", "Stay calm and follow designated evacuation routes", "Call family members first", "Return to your desk for belongings"]',
    'Stay calm and follow designated evacuation routes',
    'Following evacuation procedures ensures safe and orderly exit during emergencies.'
  ),
  (
    module_id,
    'What is the "Run, Hide, Fight" protocol used for?',
    '["Fire emergencies", "Chemical spills", "Active threat situations", "Weather emergencies"]',
    'Active threat situations',
    'Run, Hide, Fight is the recommended response protocol for active threat situations.'
  );
END $$;