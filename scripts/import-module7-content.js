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

// Module 7 sections data
const sections = [
  {
    title: 'Overview',
    content: `The Final Exam tests your understanding of all previous modules, including data protection, cybersecurity, incident response, remote work safety, health and safety, and professional conduct.

This comprehensive assessment will:
* Evaluate your understanding of key concepts from all modules
* Test your ability to apply knowledge in practical scenarios
* Ensure readiness for maintaining compliance standards

To pass the final exam, you must achieve a score of 80% or higher.`,
    order_number: 1,
    type: 'introduction'
  },
  {
    title: 'Exam Guidelines and Format',
    content: `The final exam consists of multiple-choice questions covering all previous modules. Key points:

1. Exam Structure
* 20 questions total
* Questions from all previous modules
* Mix of theoretical and practical scenarios

2. Time Limit
* 45 minutes to complete
* All questions must be answered

3. Passing Requirements
* Minimum score of 80% required
* Multiple attempts allowed if needed`,
    order_number: 2,
    type: 'content'
  },
  {
    title: 'Key Topics Review',
    content: `Before taking the exam, review these essential topics:

1. Data Protection and Confidentiality
* Types of sensitive data
* Security best practices
* Breach prevention

2. Cybersecurity
* Common threats
* Prevention measures
* Response procedures

3. Incident Response
* Types of incidents
* Reporting procedures
* Documentation requirements

4. Remote Work Safety
* Secure workspace setup
* Professional conduct
* Communication guidelines

5. Health and Safety
* Ergonomic considerations
* Mental health awareness
* Work-life balance

6. Professional Conduct
* Ethical decision-making
* Professional relationships
* Workplace standards`,
    order_number: 3,
    type: 'content'
  },
  {
    title: 'Final Instructions',
    content: `Before starting the exam:

* Review all previous modules
* Ensure you have a quiet, uninterrupted time period
* Have any necessary reference materials ready
* Take your time and read each question carefully

Good luck with your final assessment!`,
    order_number: 4,
    type: 'conclusion'
  }
]

// Module 7 quiz questions (Final Exam)
const quizQuestions = [
  {
    question: 'What is the best way to protect sensitive company data while working remotely?',
    options: JSON.stringify([
      'Store it in a personal email account for easy access',
      'Use company-approved cloud storage and secure passwords',
      'Share it in group chats for team collaboration'
    ]),
    correct_answer: 'Use company-approved cloud storage and secure passwords',
    explanation: 'Secure cloud storage ensures data protection, and strong passwords prevent unauthorised access.'
  },
  {
    question: 'If an employee accidentally sends confidential data to the wrong recipient, what should they do?',
    options: JSON.stringify([
      'Do nothing and hope no one notices',
      'Immediately report the incident to IT or management',
      'Delete the email and pretend it never happened'
    ]),
    correct_answer: 'Immediately report the incident to IT or management',
    explanation: 'Reporting the incident allows IT to mitigate risks and prevent data breaches.'
  },
  {
    question: 'Why is it important to use multi-factor authentication (MFA) for work accounts?',
    options: JSON.stringify([
      'It looks more professional',
      'It makes logging in easier',
      'It adds an extra layer of security against cyber threats'
    ]),
    correct_answer: 'It adds an extra layer of security against cyber threats',
    explanation: 'MFA reduces the risk of unauthorised access even if a password is compromised.'
  },
  {
    question: 'What should an employee do if they notice suspicious activity on their company account?',
    options: JSON.stringify([
      'Change their password and report the issue immediately',
      'Wait to see if the issue gets worse',
      'Log out and continue working'
    ]),
    correct_answer: 'Change their password and report the issue immediately',
    explanation: 'Changing passwords prevents further breaches, and reporting allows for a security review.'
  },
  {
    question: 'What is phishing?',
    options: JSON.stringify([
      'A cybersecurity measure to protect against fraud',
      'A fraudulent attempt to obtain sensitive information via email or messages',
      'A secure way to send company data'
    ]),
    correct_answer: 'A fraudulent attempt to obtain sensitive information via email or messages',
    explanation: 'Phishing attacks trick employees into revealing confidential data.'
  },
  {
    question: 'What is the best way to maintain professionalism in a remote work environment?',
    options: JSON.stringify([
      'Keep the camera off in all meetings',
      'Use respectful language in emails and virtual meetings',
      'Work in casual clothing and avoid communication'
    ]),
    correct_answer: 'Use respectful language in emails and virtual meetings',
    explanation: 'Professional communication ensures a respectful and productive work environment.'
  },
  {
    question: 'What should an employee do if they feel isolated while working remotely?',
    options: JSON.stringify([
      'Ignore it and continue working',
      'Engage in virtual team meetings and communicate with colleagues',
      'Take unapproved time off'
    ]),
    correct_answer: 'Engage in virtual team meetings and communicate with colleagues',
    explanation: 'Social interaction and teamwork improve remote work engagement and well-being.'
  },
  {
    question: 'How can employees prevent physical strain while working remotely?',
    options: JSON.stringify([
      'Work from bed for comfort',
      'Maintain proper posture and take regular breaks',
      'Sit in one position for long periods'
    ]),
    correct_answer: 'Maintain proper posture and take regular breaks',
    explanation: 'Ergonomic workspaces and breaks reduce physical strain.'
  },
  {
    question: 'What should an employee do if they witness unethical behaviour in the workplace?',
    options: JSON.stringify([
      'Ignore it to avoid conflict',
      'Report it using the company\'s ethics reporting process',
      'Post about it on social media'
    ]),
    correct_answer: 'Report it using the company\'s ethics reporting process',
    explanation: 'Reporting ensures accountability while maintaining confidentiality.'
  },
  {
    question: 'If an employee is unsure whether an action violates company policy, what should they do?',
    options: JSON.stringify([
      'Proceed and hope it\'s acceptable',
      'Consult the company handbook or ask a supervisor',
      'Ask a co-worker for advice'
    ]),
    correct_answer: 'Consult the company handbook or ask a supervisor',
    explanation: 'Seeking guidance ensures actions align with company policies.'
  },
  {
    question: 'Why should employees avoid conflicts of interest in the workplace?',
    options: JSON.stringify([
      'It helps employees make unbiased decisions',
      'It allows employees to prioritise personal relationships over work',
      'It is only important in leadership roles'
    ]),
    correct_answer: 'It helps employees make unbiased decisions',
    explanation: 'Avoiding conflicts of interest ensures fairness and integrity in decision-making.'
  },
  {
    question: 'What is the first step in responding to a cybersecurity incident?',
    options: JSON.stringify([
      'Ignore the issue and continue working',
      'Disconnect from the network and report the incident',
      'Try to fix it yourself before informing IT'
    ]),
    correct_answer: 'Disconnect from the network and report the incident',
    explanation: 'Disconnecting prevents further damage, and reporting allows professionals to investigate.'
  },
  {
    question: 'Why should employees follow compliance policies?',
    options: JSON.stringify([
      'To ensure legal and ethical business operations',
      'To make work more complicated',
      'To avoid working too much'
    ]),
    correct_answer: 'To ensure legal and ethical business operations',
    explanation: 'Compliance policies protect the company and employees from legal and ethical risks.'
  },
  {
    question: 'What should an employee do if they receive an email requesting sensitive company information?',
    options: JSON.stringify([
      'Respond quickly to avoid delays',
      'Verify the sender and report phishing attempts',
      'Forward it to a colleague for their opinion'
    ]),
    correct_answer: 'Verify the sender and report phishing attempts',
    explanation: 'Verifying emails prevents data breaches and security threats.'
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
    question: 'What should an employee do if they witness fraud in the company?',
    options: JSON.stringify([
      'Confront the person directly',
      'Report it through the company\'s whistle-blower protection system',
      'Keep quiet to avoid conflict'
    ]),
    correct_answer: 'Report it through the company\'s whistle-blower protection system',
    explanation: 'Reporting fraud through proper channels ensures accountability and protects company integrity.'
  },
  {
    question: 'What is an important cybersecurity practice for remote employees?',
    options: JSON.stringify([
      'Use public Wi-Fi for work tasks',
      'Lock their screen when stepping away from the computer',
      'Share their passwords with trusted colleagues'
    ]),
    correct_answer: 'Lock their screen when stepping away from the computer',
    explanation: 'Locking screens prevents unauthorised access to company data.'
  },
  {
    question: 'What is considered unethical in a remote work environment?',
    options: JSON.stringify([
      'Logging in for a meeting but not actively participating',
      'Using professional language in emails',
      'Following IT security policies'
    ]),
    correct_answer: 'Logging in for a meeting but not actively participating',
    explanation: 'Pretending to be present while not engaging is dishonest and unprofessional.'
  },
  {
    question: 'An employee is using company time to work on a personal side project. Is this ethical?',
    options: JSON.stringify([
      'Yes, as long as work is completed',
      'No, because company time should be used for company tasks',
      'Yes, if they don\'t get caught'
    ]),
    correct_answer: 'No, because company time should be used for company tasks',
    explanation: 'Using company time for personal work is unethical and violates company policy.'
  },
  {
    question: 'What is the safest way to share sensitive company information with a colleague?',
    options: JSON.stringify([
      'Through an encrypted company-approved platform',
      'Via a personal messaging app for convenience',
      'By emailing it to their personal account'
    ]),
    correct_answer: 'Through an encrypted company-approved platform',
    explanation: 'Encryption ensures that sensitive information remains secure and protected from unauthorised access.'
  }
]

async function importModule7Content() {
  try {
    console.log('Starting Module 7 content import...')

    // Get Module 7 ID
    const { rows: [module7] } = await pool.query(
      'SELECT id FROM modules WHERE order_number = 7'
    )

    if (!module7) {
      throw new Error('Module 7 not found')
    }

    // Import sections
    console.log('Importing sections...')
    for (const section of sections) {
      await pool.query(
        `INSERT INTO sections (module_id, title, content, order_number, type)
         VALUES ($1, $2, $3, $4, $5)`,
        [module7.id, section.title, section.content, section.order_number, section.type]
      )
    }

    // Import quiz questions
    console.log('Importing quiz questions...')
    for (const quiz of quizQuestions) {
      await pool.query(
        `INSERT INTO quizzes (module_id, question, options, correct_answer, explanation)
         VALUES ($1, $2, $3, $4, $5)`,
        [module7.id, quiz.question, quiz.options, quiz.correct_answer, quiz.explanation]
      )
    }

    console.log('Module 7 content import completed successfully!')
  } catch (error) {
    console.error('Error importing Module 7 content:', error)
  } finally {
    await pool.end()
  }
}

// Run the import
importModule7Content()