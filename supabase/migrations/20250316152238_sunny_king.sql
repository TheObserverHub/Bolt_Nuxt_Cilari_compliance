/*
  # Module 6: Communication Skills

  1. Content Added
    - Module 6 details
    - Sections covering communication principles
    - Professional communication techniques
    - Case studies demonstrating effective communication
    - Quiz questions testing understanding of concepts

  2. Structure
    - Introduction to workplace communication
    - Verbal and non-verbal communication
    - Written communication best practices
    - Real-world case studies
    - Comprehensive assessment
*/

DO $$
DECLARE
  module_id uuid;
BEGIN
  -- Generate a UUID for the module
  module_id := gen_random_uuid();

  -- Insert Module 6
  INSERT INTO modules (id, title, description, order_number, passing_score)
  VALUES (
    module_id,
    'Communication Skills',
    'Develop essential workplace communication skills. Learn effective verbal, non-verbal, and written communication techniques to enhance professional relationships and productivity.',
    6,
    80
  );

  -- Insert Sections
  INSERT INTO sections (module_id, title, content, order_number, type) VALUES
  -- Introduction
  (
    module_id,
    'Overview',
    E'Effective communication is fundamental to workplace success. This module will help you develop crucial communication skills for professional environments.\n\nParticipants will learn:\n* Verbal and non-verbal communication techniques\n* Active listening skills\n* Professional writing best practices\n* Conflict resolution through communication\n* Cross-cultural communication awareness\n\nLearning Objective:\nBy the end of this module, participants will be able to communicate more effectively in various professional situations.',
    1,
    'introduction'
  ),

  -- Section 1: Verbal Communication
  (
    module_id,
    'Effective Verbal Communication',
    E'Key Elements of Verbal Communication:\n\n1. Clarity\n- Clear pronunciation\n- Appropriate pace\n- Structured messaging\n\n2. Active Listening\n- Full attention\n- Clarifying questions\n- Meaningful responses\n\n3. Tone and Voice\n- Professional tone\n- Volume control\n- Emotional awareness\n\n4. Feedback\n- Constructive delivery\n- Specific examples\n- Solution-focused approach',
    2,
    'content'
  ),

  -- Case Study 1
  (
    module_id,
    'Case Study: Difficult Conversations',
    E'Scenario:\nA team leader needs to address performance issues with a team member who has been consistently missing deadlines.\n\nQuestion:\nHow should they approach this conversation?\n\nAnswer: They should schedule a private meeting, prepare specific examples, maintain a constructive tone, listen to the employee''s perspective, and work together to create an improvement plan.',
    3,
    'case_study'
  ),

  -- Section 2: Non-Verbal Communication
  (
    module_id,
    'Non-Verbal Communication Skills',
    E'Essential Non-Verbal Elements:\n\n1. Body Language\n- Eye contact\n- Facial expressions\n- Posture\n\n2. Gestures\n- Open gestures\n- Cultural awareness\n- Professional boundaries\n\n3. Personal Space\n- Appropriate distance\n- Cultural considerations\n- Virtual meeting presence\n\n4. Visual Aids\n- Presentation support\n- Demonstration tools\n- Visual clarity',
    4,
    'content'
  ),

  -- Case Study 2
  (
    module_id,
    'Case Study: Virtual Communication',
    E'Scenario:\nA manager is leading a virtual team meeting and notices some team members seem disengaged.\n\nQuestion:\nWhat non-verbal strategies could improve engagement?\n\nAnswer: Use video when possible, incorporate visual aids, encourage camera use, watch for visual cues of understanding or confusion, and use engaging gestures and expressions.',
    5,
    'case_study'
  ),

  -- Section 3: Written Communication
  (
    module_id,
    'Professional Written Communication',
    E'Written Communication Guidelines:\n\n1. Email Etiquette\n- Clear subject lines\n- Professional tone\n- Proper formatting\n\n2. Business Writing\n- Concise messaging\n- Audience awareness\n- Purpose-driven content\n\n3. Documentation\n- Clear instructions\n- Organized structure\n- Version control\n\n4. Digital Communication\n- Chat platforms\n- Collaboration tools\n- Social media professionalism',
    6,
    'content'
  ),

  -- Case Study 3
  (
    module_id,
    'Case Study: Email Communication',
    E'Scenario:\nAn employee needs to send a complex project update to multiple stakeholders with different levels of technical knowledge.\n\nQuestion:\nHow should they structure the email?\n\nAnswer: Use a clear subject line, start with an executive summary, organize details in sections, use bullet points for clarity, and provide both high-level and detailed information in a logical flow.',
    7,
    'case_study'
  ),

  -- Conclusion
  (
    module_id,
    'Conclusion and Key Takeaways',
    E'Remember these essential points:\n\n* Clear communication is vital for success\n* Active listening is as important as speaking\n* Non-verbal cues impact message delivery\n* Written communication requires careful attention\n* Cultural awareness enhances communication\n* Regular practice improves skills',
    8,
    'conclusion'
  );

  -- Insert Quiz Questions
  INSERT INTO quizzes (module_id, question, options, correct_answer, explanation) VALUES
  (
    module_id,
    'What is active listening?',
    '["Waiting for your turn to speak", "Fully engaging with the speaker and providing meaningful feedback", "Taking detailed notes only", "Agreeing with everything being said"]',
    'Fully engaging with the speaker and providing meaningful feedback',
    'Active listening involves full engagement, understanding, and appropriate response.'
  ),
  (
    module_id,
    'Which is most important in professional email communication?',
    '["Using casual language", "Including all possible details", "Clear subject lines and organized content", "Adding multiple recipients"]',
    'Clear subject lines and organized content',
    'Clear subject lines and organized content help recipients quickly understand and act on messages.'
  ),
  (
    module_id,
    'What role does body language play in communication?',
    '["It has no impact", "It can reinforce or contradict verbal messages", "It only matters in formal presentations", "It''s less important than words"]',
    'It can reinforce or contradict verbal messages',
    'Body language is a crucial component of message delivery and reception.'
  ),
  (
    module_id,
    'How should you handle cultural differences in communication?',
    '["Ignore them completely", "Be aware and respectful of different communication styles", "Expect everyone to adapt to your style", "Avoid cross-cultural communication"]',
    'Be aware and respectful of different communication styles',
    'Cultural awareness and respect enhance communication effectiveness.'
  ),
  (
    module_id,
    'What is the best approach to giving constructive feedback?',
    '["Focus only on negatives", "Be specific and solution-oriented", "Avoid giving feedback", "Use general statements"]',
    'Be specific and solution-oriented',
    'Effective feedback is specific, constructive, and focuses on solutions.'
  ),
  (
    module_id,
    'Which is most effective for virtual meetings?',
    '["Having no agenda", "Using video and encouraging participation", "Keeping microphone muted always", "Multitasking during the meeting"]',
    'Using video and encouraging participation',
    'Video presence and active participation enhance virtual meeting effectiveness.'
  ),
  (
    module_id,
    'What is the key to effective written documentation?',
    '["Using complex language", "Clear organization and appropriate detail", "Minimal information", "Avoiding updates"]',
    'Clear organization and appropriate detail',
    'Well-organized, appropriately detailed documentation ensures understanding.'
  ),
  (
    module_id,
    'How should you handle communication conflicts?',
    '["Ignore the conflict", "Address issues professionally and seek resolution", "Escalate immediately", "Avoid the person involved"]',
    'Address issues professionally and seek resolution',
    'Professional conflict resolution maintains positive workplace relationships.'
  ),
  (
    module_id,
    'What is most important in presentation delivery?',
    '["Reading directly from slides", "Clear speech and engaging delivery", "Using complex terminology", "Speaking quickly to save time"]',
    'Clear speech and engaging delivery',
    'Engaging delivery ensures message retention and audience engagement.'
  ),
  (
    module_id,
    'Which practice improves email effectiveness?',
    '["Using all caps for emphasis", "Proofreading and organizing content", "Sending without review", "Including everyone in cc"]',
    'Proofreading and organizing content',
    'Careful review and organization enhance email communication effectiveness.'
  );
END $$;