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

// Module 6 sections data
const sections = [
  {
    title: 'Overview',
    content: `A strong ethical foundation ensures a positive work environment, promotes trust, and aligns employees with company values.

This module will cover:
* Company values and ethical standards employees must follow.
* Professional behaviour and integrity in a remote work environment.
* Reporting unethical behaviour and handling ethical dilemmas.

By the end of this module, you will:
* Understand company ethics and professional standards.
* Recognise and address ethical dilemmas in remote work.
* Know how to report ethical violations securely and responsibly.`,
    order_number: 1,
    type: 'introduction'
  },
  {
    title: 'Company Values and Ethical Standards',
    content: `Company ethics define the standards of professional behaviour expected from employees. This includes honesty, fairness, accountability, and compliance with policies. In a remote work environment, ethical standards must still be upheld in digital communication, confidentiality, and decision-making.`,
    order_number: 2,
    type: 'content'
  },
  {
    title: 'Case Study: Handling Confidential Information',
    content: `Scenario:
Lisa, an HR coordinator, is working from home and forgets to log out of her company laptop. Her family member accidentally sees an email containing sensitive employee salary details.

Questions:
1. What ethical violation occurred in this situation?
2. What could Lisa have done to prevent the breach?
3. Why is it important to protect confidential company information?

Answers:
1. Lisa failed to secure confidential data, leading to an unintentional data breach.
2. She should have locked her computer or logged out when not using it.
3. Protecting confidential information maintains trust, prevents legal issues, and ensures compliance with company policies.`,
    order_number: 3,
    type: 'case_study'
  },
  {
    title: 'Case Study: Conflict of Interest',
    content: `Scenario:
Daniel, a remote financial analyst, is asked to review a contract for a vendor that his close friend owns. He feels conflicted but decides not to disclose this information to his manager.

Questions:
1. What ethical issue is present in this situation?
2. Why should Daniel disclose his relationship with the vendor?
3. How should conflicts of interest be handled in a remote work setting?

Answers:
1. Daniel has a conflict of interest because his personal connection to the vendor may influence his decision-making.
2. He should disclose this relationship to his manager to ensure transparency and fairness.
3. Employees should report conflicts of interest and remove themselves from situations that may compromise objectivity.`,
    order_number: 4,
    type: 'case_study'
  },
  {
    title: 'Professional Behaviour and Integrity in Remote Work',
    content: `Maintaining professionalism while working remotely requires strong communication, responsible time management, and ethical decision-making. Employees should:

* Communicate professionally in emails and virtual meetings.
* Meet deadlines and work independently with integrity.
* Avoid dishonest practices such as falsifying work hours.`,
    order_number: 5,
    type: 'content'
  },
  {
    title: 'Case Study: Falsifying Work Hours',
    content: `Scenario:
Mark, a remote operations manager, frequently logs in late but manually adjusts his time records to show he started on time. His manager notices inconsistencies in his work output.

Questions:
1. What ethical violation is Mark committing?
2. Why is honesty in time tracking essential in remote work?
3. How can companies monitor employee productivity without micromanaging?

Answers:
1. Mark is falsifying work hours, which is dishonest and violates company policy.
2. Accurate time tracking ensures fair pay, accountability, and trust in remote work environments.
3. Companies can focus on project milestones and task completion instead of micromanaging daily login times.`,
    order_number: 6,
    type: 'case_study'
  },
  {
    title: 'Reporting Unethical Behaviour and Handling Ethical Dilemmas',
    content: `Employees must feel safe reporting unethical behaviour without fear of retaliation. This section covers:

* How to report ethics violations confidentially.
* Whistle-blower protection policies.
* Steps to take when facing ethical dilemmas.`,
    order_number: 7,
    type: 'content'
  },
  {
    title: 'Conclusion and Key Takeaways',
    content: `* Follow company policies and act with integrity in all business dealings.
* Report unethical behavior through appropriate channels without fear of retaliation.
* Avoid conflicts of interest that could compromise fairness and objectivity.
* Maintain confidentiality and protect company and client information.
* Uphold a respectful and inclusive workplace culture, free from discrimination or harassment.`,
    order_number: 8,
    type: 'conclusion'
  }
]

// Module 6 quiz questions
const quizQuestions = [
  {
    question: 'Why is protecting confidential company data important?',
    options: JSON.stringify([
      'It prevents data leaks and legal issues',
      'It increases company profits',
      'It makes work more interesting'
    ]),
    correct_answer: 'It prevents data leaks and legal issues',
    explanation: 'Protecting confidential data prevents unauthorized access, legal issues, and maintains trust.'
  },
  {
    question: 'Which of the following is an example of a conflict of interest?',
    options: JSON.stringify([
      'Reviewing a contract for a vendor owned by a friend',
      'Attending a company meeting',
      'Using a company email account'
    ]),
    correct_answer: 'Reviewing a contract for a vendor owned by a friend',
    explanation: 'Personal relationships with vendors can compromise objectivity in business decisions.'
  },
  {
    question: 'What is the best way to report an ethics violation?',
    options: JSON.stringify([
      'Ignore it',
      'Use the company\'s reporting process',
      'Share it on social media'
    ]),
    correct_answer: 'Use the company\'s reporting process',
    explanation: 'Official reporting channels ensure proper handling of ethical concerns.'
  },
  {
    question: 'Why should remote employees be honest about their work hours?',
    options: JSON.stringify([
      'It ensures trust and accountability',
      'It helps employees work less',
      'It allows employees to get extra pay'
    ]),
    correct_answer: 'It ensures trust and accountability',
    explanation: 'Honest time reporting maintains trust and accountability in remote work.'
  },
  {
    question: 'Which of the following behaviours is considered unethical in a remote work environment?',
    options: JSON.stringify([
      'Logging in for a meeting but not actively participating',
      'Using professional language in emails',
      'Following IT security policies'
    ]),
    correct_answer: 'Logging in for a meeting but not actively participating',
    explanation: 'Pretending to be present while not engaging is dishonest and unprofessional.'
  },
  {
    question: 'What should you do if you accidentally receive confidential information that you were not supposed to access?',
    options: JSON.stringify([
      'Share it with a colleague',
      'Delete it and notify the appropriate department',
      'Save it for future reference'
    ]),
    correct_answer: 'Delete it and notify the appropriate department',
    explanation: 'Employees should report accidental access to confidential data and ensure it is not misused.'
  },
  {
    question: 'If a colleague shares offensive content in a company chat, what is the best course of action?',
    options: JSON.stringify([
      'Ignore it',
      'Report it through the appropriate company channels',
      'Respond with a similar joke'
    ]),
    correct_answer: 'Report it through the appropriate company channels',
    explanation: 'Offensive content creates an unprofessional and uncomfortable work environment and should be reported.'
  },
  {
    question: 'Why should employees avoid installing unauthorised software on company devices?',
    options: JSON.stringify([
      'It could slow down the device',
      'It violates company security policies and creates security risks',
      'It makes the job more difficult'
    ]),
    correct_answer: 'It violates company security policies and creates security risks',
    explanation: 'Unauthorised software can introduce malware and other security vulnerabilities.'
  },
  {
    question: 'What is the best way to handle ethical dilemmas in the workplace?',
    options: JSON.stringify([
      'Discuss with a trusted manager or ethics officer',
      'Make a decision based on personal opinion only',
      'Ignore the situation'
    ]),
    correct_answer: 'Discuss with a trusted manager or ethics officer',
    explanation: 'Ethical dilemmas should be handled with guidance from company leaders or ethics teams.'
  },
  {
    question: 'What should an employee do if they witness fraud in the company?',
    options: JSON.stringify([
      'Confront the person directly',
      'Report it through the company\'s whistle-blower protection system',
      'Keep quiet to avoid conflict'
    ]),
    correct_answer: 'Report it through the company\'s whistle-blower protection system',
    explanation: 'Reporting fraud through proper channels ensures accountability and protects company integrity.'
  }
]

async function importModule6Content() {
  try {
    console.log('Starting Module 6 content import...')

    // Get Module 6 ID
    const { rows: [module6] } = await pool.query(
      'SELECT id FROM modules WHERE order_number = 6'
    )

    if (!module6) {
      throw new Error('Module 6 not found')
    }

    // Import sections
    console.log('Importing sections...')
    for (const section of sections) {
      await pool.query(
        `INSERT INTO sections (module_id, title, content, order_number, type)
         VALUES ($1, $2, $3, $4, $5)`,
        [module6.id, section.title, section.content, section.order_number, section.type]
      )
    }

    // Import quiz questions
    console.log('Importing quiz questions...')
    for (const quiz of quizQuestions) {
      await pool.query(
        `INSERT INTO quizzes (module_id, question, options, correct_answer, explanation)
         VALUES ($1, $2, $3, $4, $5)`,
        [module6.id, quiz.question, quiz.options, quiz.correct_answer, quiz.explanation]
      )
    }

    console.log('Module 6 content import completed successfully!')
  } catch (error) {
    console.error('Error importing Module 6 content:', error)
  } finally {
    await pool.end()
  }
}

// Run the import
importModule6Content()