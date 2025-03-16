import pg from 'pg'
import 'dotenv/config'

const { Pool } = pg

// Database connection configuration
const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  port: parseInt(process.env.DB_PORT || '5432'),
  database: process.env.DB_NAME
})

// Module 5 sections data
const sections = [
  {
    title: 'Overview',
    content: `Ensuring health and safety for remote employees is just as important as in-office environments. This module will cover the essential elements of maintaining both physical well-being (ergonomics, workspace safety) and mental health while working remotely.

By the end of this module, you will be familiar with best practices to ensure a safe and healthy remote working environment and understand how to manage both physical and mental health concerns.`,
    order_number: 1,
    type: 'introduction'
  },
  {
    title: 'Physical Health and Safety in a Remote Workspace',
    content: `Even though employees work remotely, maintaining a safe and ergonomic workspace is crucial to avoid injuries or long-term health issues.

This section will focus on:
* Ergonomics for remote work to prevent musculoskeletal injuries.
* Setting up a safe home office to minimise accidents.
* Best practices for long-term health when working from home.`,
    order_number: 2,
    type: 'content'
  },
  {
    title: 'Case Study: Ergonomic Mistakes in a Home Office',
    content: `Scenario:
Maria, a customer support agent, spends long hours working from her home office, but her chair is not adjustable and her laptop screen is too low. She begins to feel pain in her neck and back.

Questions:
1. What ergonomic mistakes did Maria make?
2. How can she adjust her workspace to reduce pain and discomfort?
3. What should remote employees consider when setting up their home offices?

Answers:
1. Maria's chair is not adjustable, and her screen is too low, leading to neck and back strain.
2. Maria should use an adjustable chair, position her screen at eye level, and ensure her feet are flat on the floor.
3. Remote employees should prioritise adjustable furniture, proper screen placement, and break times to prevent strain.`,
    order_number: 3,
    type: 'case_study'
  },
  {
    title: 'Case Study: Cable Hazards in the Home Office',
    content: `Scenario:
James works from a home office where cables are scattered around his desk. One day, he trips over a loose cable while walking to the printer, injuring his foot.

Questions:
1. What caused the accident in this case?
2. What should James have done to prevent the accident?
3. How can remote employees ensure their workspace is safe from similar hazards?

Answers:
1. The accident was caused by loose cables on the floor, creating a tripping hazard.
2. James should have organised cables and used cable management solutions to keep them off the floor.
3. Remote employees should keep cables tidy, use cable ties, and ensure there are no obstacles in walkways.`,
    order_number: 4,
    type: 'case_study'
  },
  {
    title: 'Mental Health and Well-Being in Remote Work',
    content: `Working remotely can lead to challenges in managing mental health, including isolation, stress, and burnout. In this section, we will discuss:

* Recognising signs of mental health struggles in remote employees.
* Strategies to maintain mental well-being while working remotely.
* How to access support when facing mental health challenges.`,
    order_number: 5,
    type: 'content'
  },
  {
    title: 'Case Study: Burnout from Overwork',
    content: `Scenario:
Amanda, an HR coordinator, has been working long hours from home, often beyond the standard workday, in an attempt to keep up with an increasing workload. She begins to feel overwhelmed, anxious, and exhausted.

Questions:
1. What mental health issue is Amanda facing?
2. How can Amanda manage her workload and prevent burnout?
3. What steps can managers take to support employees at risk of burnout?

Answers:
1. Amanda is experiencing burnout due to overwork and lack of boundaries between personal and work life.
2. Amanda can manage her workload by setting clear work-life boundaries, taking regular breaks, and asking for help with tasks when needed.
3. Managers can help by encouraging breaks, setting reasonable work expectations, and offering support for employees struggling with workload.`,
    order_number: 6,
    type: 'case_study'
  },
  {
    title: 'Maintaining a Safe and Healthy Remote Workspace',
    content: `Creating a physically safe, ergonomic, and mentally healthy remote workspace is key to preventing accidents and maintaining long-term well-being.

This section will focus on:
* Home office safety and ergonomics.
* Creating a mentally healthy workspace.
* Company policies for reporting remote work accidents or health issues.`,
    order_number: 7,
    type: 'content'
  },
  {
    title: 'Conclusion and Key Takeaways',
    content: `* Maintain proper ergonomics by using a comfortable chair, desk, and correct posture.
* Take regular breaks to reduce physical and mental strain.
* Manage work-life balance to avoid burnout and fatigue.
* Be mindful of mental health, and seek support if feeling overwhelmed.
* Follow company policies on emergency preparedness and safety measures at home.`,
    order_number: 8,
    type: 'conclusion'
  }
]

// Module 5 quiz questions
const quizQuestions = [
  {
    question: 'What is the first thing you should do if you notice a tripping hazard in your home office?',
    options: JSON.stringify([
      'Ignore it',
      'Move the hazard immediately',
      'Report it to your manager'
    ]),
    correct_answer: 'Move the hazard immediately',
    explanation: 'Employees should remove tripping hazards as soon as they are noticed to prevent accidents.'
  },
  {
    question: 'What should be the ideal height of your screen to avoid neck strain?',
    options: JSON.stringify([
      'Below eye level',
      'At eye level',
      'Above eye level'
    ]),
    correct_answer: 'At eye level',
    explanation: 'Keeping the screen at eye level minimises neck strain and promotes proper posture.'
  },
  {
    question: 'Which of the following is a sign of burnout from remote work?',
    options: JSON.stringify([
      'Increased motivation',
      'Feeling exhausted and disengaged',
      'Greater focus and energy'
    ]),
    correct_answer: 'Feeling exhausted and disengaged',
    explanation: 'Burnout is characterised by chronic exhaustion, lack of motivation, and decreased work performance.'
  },
  {
    question: 'How often should you take breaks when working on a computer for long hours?',
    options: JSON.stringify([
      'Every 20 minutes',
      'Every 2 hours',
      'Only during lunch breaks'
    ]),
    correct_answer: 'Every 20 minutes',
    explanation: 'Following the 20-20-20 rule (every 20 minutes, take a 20-second break to look at something 20 feet away) helps reduce eye strain.'
  },
  {
    question: 'Which of the following best describes proper ergonomic chair positioning?',
    options: JSON.stringify([
      'Feet flat on the floor, knees at a 90-degree angle, and back supported',
      'Feet dangling, leaning forward, and knees above hip level',
      'Sitting on a soft couch with legs stretched out'
    ]),
    correct_answer: 'Feet flat on the floor, knees at a 90-degree angle, and back supported',
    explanation: 'Proper ergonomic positioning reduces back and joint strain.'
  },
  {
    question: 'What should you do if you start feeling isolated while working remotely?',
    options: JSON.stringify([
      'Keep working and ignore it',
      'Reach out to colleagues and participate in virtual social events',
      'Quit your job'
    ]),
    correct_answer: 'Reach out to colleagues and participate in virtual social events',
    explanation: 'Staying connected through virtual team meetings, social events, and casual check-ins can help reduce feelings of isolation.'
  },
  {
    question: 'What is the best way to reduce stress when working remotely?',
    options: JSON.stringify([
      'Work longer hours to finish tasks quickly',
      'Take breaks, exercise, and set boundaries for work hours',
      'Avoid talking to your manager about workload concerns'
    ]),
    correct_answer: 'Take breaks, exercise, and set boundaries for work hours',
    explanation: 'Managing stress involves balancing work with self-care, including breaks and clear boundaries between work and personal life.'
  },
  {
    question: 'Which of the following is the most effective way to prevent eye strain?',
    options: JSON.stringify([
      'Keeping the room dark when working',
      'Using proper lighting, reducing glare, and following the 20-20-20 rule',
      'Sitting very close to the screen'
    ]),
    correct_answer: 'Using proper lighting, reducing glare, and following the 20-20-20 rule',
    explanation: 'Proper lighting, anti-glare settings, and regular breaks help prevent digital eye strain.'
  },
  {
    question: 'If you injure yourself while working remotely, what should you do?',
    options: JSON.stringify([
      'Keep working and ignore the injury',
      'Report it to your manager and seek medical attention if necessary',
      'Only report it if it happens in an office'
    ]),
    correct_answer: 'Report it to your manager and seek medical attention if necessary',
    explanation: 'Workplace injuries should be reported, even in remote work settings, to ensure proper documentation and support.'
  },
  {
    question: 'How can companies support employees\' mental health while working remotely?',
    options: JSON.stringify([
      'Encourage long working hours to maximise productivity',
      'Provide mental health resources, encourage work-life balance, and maintain regular communication',
      'Avoid checking in with employees to reduce pressure'
    ]),
    correct_answer: 'Provide mental health resources, encourage work-life balance, and maintain regular communication',
    explanation: 'Companies should actively support employees\' mental health by offering resources, promoting balance, and fostering an open culture for mental health discussions.'
  }
]

async function importModule5Content() {
  try {
    console.log('Starting Module 5 content import...')

    // Get Module 5 ID
    const { rows: [module5] } = await pool.query(
      'SELECT id FROM modules WHERE order_number = 5'
    )

    if (!module5) {
      throw new Error('Module 5 not found')
    }

    // Import sections
    console.log('Importing sections...')
    for (const section of sections) {
      await pool.query(
        `INSERT INTO sections (module_id, title, content, order_number, type)
         VALUES ($1, $2, $3, $4, $5)`,
        [module5.id, section.title, section.content, section.order_number, section.type]
      )
    }

    // Import quiz questions
    console.log('Importing quiz questions...')
    for (const quiz of quizQuestions) {
      await pool.query(
        `INSERT INTO quizzes (module_id, question, options, correct_answer, explanation)
         VALUES ($1, $2, $3, $4, $5)`,
        [module5.id, quiz.question, quiz.options, quiz.correct_answer, quiz.explanation]
      )
    }

    console.log('Module 5 content import completed successfully!')
  } catch (error) {
    console.error('Error importing Module 5 content:', error)
  } finally {
    await pool.end()
  }
}

// Run the import
importModule5Content()