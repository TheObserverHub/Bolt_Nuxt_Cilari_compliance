/*
  # Module 8: Environmental Sustainability and Corporate Responsibility

  1. Content Added
    - Module 8 details
    - Sections covering environmental practices
    - Corporate responsibility principles
    - Case studies on sustainability
    - Quiz questions testing understanding

  2. Structure
    - Introduction to sustainability
    - Environmental impact
    - Corporate responsibility
    - Practical implementation
    - Assessment questions
*/

DO $$
DECLARE
  module_id uuid;
BEGIN
  -- Generate a UUID for the module
  module_id := gen_random_uuid();

  -- Insert Module 8
  INSERT INTO modules (id, title, description, order_number, passing_score)
  VALUES (
    module_id,
    'Environmental Sustainability and Corporate Responsibility',
    'Understand our commitment to environmental stewardship and social responsibility. Learn about sustainable practices, corporate initiatives, and your role in creating a positive impact.',
    8,
    80
  );

  -- Insert Sections
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module_id,
    'Overview',
    E'Environmental sustainability and corporate responsibility are fundamental to our business practices. This module explores our commitment to creating positive environmental and social impact.\n\nParticipants will learn:\n* Environmental sustainability principles\n* Corporate responsibility framework\n* Sustainable business practices\n* Social impact initiatives\n* Individual contribution opportunities\n\nLearning Objective:\nBy the end of this module, participants will understand our environmental and social commitments and how to contribute to these initiatives.',
    1,
    'introduction'
  ),

  -- Section 1: Environmental Sustainability
  (
    module_id,
    'Understanding Environmental Impact',
    E'Key Environmental Concepts:\n\n1. Carbon Footprint\n- Definition and measurement\n- Corporate impact\n- Reduction strategies\n\n2. Resource Conservation\n- Energy efficiency\n- Water conservation\n- Waste reduction\n\n3. Sustainable Practices\n- Green initiatives\n- Recycling programs\n- Energy management\n\n4. Environmental Goals\n- Short-term targets\n- Long-term objectives\n- Progress tracking',
    2,
    'content'
  ),

  -- Case Study 1
  (
    module_id,
    'Case Study: Office Sustainability',
    E'Scenario:\nAn office wants to reduce its environmental impact.\n\nQuestion:\nWhat practical steps can be implemented?\n\nAnswer: Implement recycling programs, reduce paper usage through digitalization, install energy-efficient lighting, encourage sustainable commuting options, and monitor resource consumption.',
    3,
    'case_study'
  ),

  -- Section 2: Corporate Responsibility
  (
    module_id,
    'Social Impact and Ethics',
    E'Corporate Responsibility Framework:\n\n1. Social Impact\n- Community engagement\n- Ethical practices\n- Stakeholder relations\n\n2. Workplace Ethics\n- Fair practices\n- Diversity and inclusion\n- Employee well-being\n\n3. Supply Chain\n- Sustainable sourcing\n- Ethical partnerships\n- Fair trade practices\n\n4. Reporting and Transparency\n- Impact measurement\n- Public reporting\n- Stakeholder communication',
    4,
    'content'
  ),

  -- Case Study 2
  (
    module_id,
    'Case Study: Community Engagement',
    E'Scenario:\nA team wants to develop a community outreach program.\n\nQuestion:\nHow should they approach this initiative?\n\nAnswer: Assess community needs, engage stakeholders, develop measurable goals, create sustainable programs, and establish long-term partnerships.',
    5,
    'case_study'
  ),

  -- Section 3: Implementation
  (
    module_id,
    'Practical Implementation',
    E'Implementation Strategies:\n\n1. Individual Actions\n- Daily practices\n- Behavioral changes\n- Personal impact\n\n2. Team Initiatives\n- Group projects\n- Collaborative efforts\n- Shared goals\n\n3. Department Programs\n- Resource management\n- Impact tracking\n- Success metrics\n\n4. Corporate Support\n- Available resources\n- Support systems\n- Recognition programs',
    6,
    'content'
  ),

  -- Case Study 3
  (
    module_id,
    'Case Study: Sustainable Innovation',
    E'Scenario:\nA department proposes a new sustainable business practice.\n\nQuestion:\nHow should the initiative be evaluated and implemented?\n\nAnswer: Assess environmental impact, analyze cost-benefit, engage stakeholders, pilot the program, measure results, and scale successful practices.',
    7,
    'case_study'
  ),

  -- Conclusion
  (
    module_id,
    'Conclusion and Key Takeaways',
    E'Remember these critical points:\n\n* Sustainability is a shared responsibility\n* Small actions create significant impact\n* Corporate responsibility benefits everyone\n* Innovation drives sustainability\n* Continuous improvement matters\n* Engagement creates change',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module_id,
    'What is a carbon footprint?',
    '["Physical footprints only", "Total greenhouse gas emissions", "Carbon paper usage", "Shoe size measurement"]',
    'Total greenhouse gas emissions',
    'Carbon footprint measures the total greenhouse gas emissions caused by an individual, organization, or activity.'
  ),
  (
    module_id,
    'Which is a sustainable office practice?',
    '["Using disposable items", "Double-sided printing", "Keeping lights on", "Individual trash bins"]',
    'Double-sided printing',
    'Double-sided printing reduces paper consumption and waste.'
  ),
  (
    module_id,
    'What is corporate social responsibility?',
    '["Profit maximization", "Legal compliance only", "Voluntary ethical practices", "Marketing strategy"]',
    'Voluntary ethical practices',
    'CSR involves voluntary actions that benefit society beyond legal requirements.'
  ),
  (
    module_id,
    'How can employees reduce energy consumption?',
    '["Leave computers on", "Turn off unused equipment", "Use personal heaters", "Ignore energy settings"]',
    'Turn off unused equipment',
    'Turning off unused equipment significantly reduces energy consumption.'
  ),
  (
    module_id,
    'What is sustainable sourcing?',
    '["Cheapest options", "Ethical supply chain practices", "Fast delivery only", "Local purchases only"]',
    'Ethical supply chain practices',
    'Sustainable sourcing considers environmental and social impacts in procurement decisions.'
  ),
  (
    module_id,
    'Which is a community engagement example?',
    '["Ignoring local issues", "Volunteer programs", "Private events", "Internal meetings"]',
    'Volunteer programs',
    'Volunteer programs actively engage with and benefit the community.'
  ),
  (
    module_id,
    'What is waste reduction?',
    '["Increasing waste", "Minimizing resource use", "Regular disposal", "Maximum packaging"]',
    'Minimizing resource use',
    'Waste reduction involves minimizing resource use and waste generation.'
  ),
  (
    module_id,
    'How is environmental impact measured?',
    '["Profit only", "Multiple environmental indicators", "Employee count", "Building size"]',
    'Multiple environmental indicators',
    'Environmental impact is measured using various indicators including emissions, waste, and resource use.'
  ),
  (
    module_id,
    'What is stakeholder engagement?',
    '["Ignoring feedback", "Involving affected parties", "Internal meetings only", "Avoiding communication"]',
    'Involving affected parties',
    'Stakeholder engagement involves consulting and involving parties affected by decisions.'
  ),
  (
    module_id,
    'Which is NOT a sustainable practice?',
    '["Energy conservation", "Waste reduction", "Single-use materials", "Water efficiency"]',
    'Single-use materials',
    'Single-use materials contribute to waste and environmental degradation.'
  );
END $$;