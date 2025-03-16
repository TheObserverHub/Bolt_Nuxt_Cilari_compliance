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

// Module 3 sections data
const sections = [
  {
    title: 'Overview',
    content: `Even with strong cybersecurity and data protection measures, security incidents can still occur. A fast and effective response minimises damage, protects company assets, and ensures business continuity.

This module will equip you with the skills to:
* Identify different types of security incidents, including data breaches, unauthorised access, and malware infections.
* Follow company procedures for reporting incidents in a timely and structured manner.
* Take immediate action to contain threats and prevent further damage.
* Understand legal and compliance requirements related to incident reporting.

By the end of this module, you will be able to recognise, report, and respond appropriately to cybersecurity and data security incidents.`,
    order_number: 1,
    type: 'introduction'
  },
  {
    title: 'Identifying Security Incidents',
    content: `A security incident is any event that compromises the confidentiality, integrity, or availability of company data or systems. Some incidents are obvious, such as ransomware attacks, while others, like unauthorised access, may go unnoticed if employees are not vigilant.

This section covers:
* Common security incidents, such as phishing, malware infections, insider threats, and lost devices.
* Signs of a security breach, including unusual login attempts, unexpected data changes, and system slowdowns.
* Real-world examples to help employees recognise security threats early.`,
    order_number: 2,
    type: 'content'
  },
  {
    title: 'Case Study: Unauthorised Access',
    content: `Scenario:
Samantha, an HR specialist, notices that a terminated employee's account is still active in the system. She checks recent login activity and sees that the account was accessed after the employee left the company.

Questions:
1. Why is this a security risk?
2. What should Samantha do next?
3. How can companies prevent this type of incident?

Answers:
1. An active account for a former employee can be exploited for unauthorised access.
2. Samantha should report it to IT immediately so the account can be deactivated.
3. Companies should implement strict offboarding procedures to revoke access when employees leave.`,
    order_number: 3,
    type: 'case_study'
  },
  {
    title: 'Case Study: Malware Infection',
    content: `Scenario:
John, an IT administrator, receives multiple reports of employees experiencing slow computers and frequent pop-ups. A security scan detects malware across multiple devices.

Questions:
1. How did the malware likely spread?
2. What immediate steps should IT take?
3. What measures can prevent future infections?

Answers:
1. The malware likely spread through infected email attachments, downloads, or unsecured websites.
2. IT should isolate affected devices, remove the malware, and investigate the source.
3. Employees should be trained on safe downloading practices, and IT should enforce security updates.`,
    order_number: 4,
    type: 'case_study'
  },
  {
    title: 'Responding to Security Incidents',
    content: `A fast and structured response to security incidents can reduce damage and prevent further issues. Every employee has a role in reporting and responding to incidents.

This section covers:
* Immediate actions employees should take when they suspect a security breach.
* Who to report incidents to, including IT, HR, or management.
* The importance of documentation and evidence collection for investigations.`,
    order_number: 5,
    type: 'content'
  },
  {
    title: 'Case Study: Lost Company Laptop',
    content: `Scenario:
Jessica, an HR executive, loses her company-issued laptop while traveling. It contains confidential employee records. She hasn't enabled remote tracking or encryption.

Questions:
1. Why is this a major security risk?
2. What steps should Jessica take immediately?
3. How can companies protect sensitive data on devices?

Answers:
1. A lost laptop with unprotected sensitive data can lead to identity theft or regulatory fines.
2. Jessica should report the loss to IT, attempt to track the device, and reset login credentials.
3. Companies should enforce device encryption, enable remote wiping, and train employees on securing devices.`,
    order_number: 6,
    type: 'case_study'
  },
  {
    title: 'Case Study: Insider Threat',
    content: `Scenario:
Sarah, a finance department employee, discovers that her colleague, Mark, has been accessing financial records he doesn't need for his job. When she confronts him, he says he's "just curious."

Questions:
1. Why is Mark's behaviour a security risk?
2. What should Sarah do next?
3. How can companies prevent unauthorised access?

Answers:
1. Mark is accessing confidential data without authorisation, which could indicate fraud or data theft.
2. Sarah should report this to her manager or IT security team for further investigation.
3. Companies should implement strict access controls and monitor user activity for suspicious behaviour.`,
    order_number: 7,
    type: 'case_study'
  },
  {
    title: 'Conclusion and Key Takeaways',
    content: `* Recognise different types of incidents, including cybersecurity breaches, data leaks, and workplace safety violations.
* Report incidents immediately using the correct channels to prevent escalation.
* Follow the company's incident response plan, including containment, mitigation, and recovery procedures.
* Keep detailed documentation of incidents to support investigations and prevent recurrence.
* Stay informed about emergency protocols and best practices for incident handling.`,
    order_number: 8,
    type: 'conclusion'
  }
]

// Module 3 quiz questions
const quizQuestions = [
  {
    question: 'What is considered a security incident?',
    options: JSON.stringify([
      'A malware infection',
      'Unauthorised access to a company system',
      'A lost or stolen company device',
      'All of the above'
    ]),
    correct_answer: 'All of the above',
    explanation: 'All these scenarios are security incidents that require a response.'
  },
  {
    question: 'What is the first step if you suspect unauthorised access to your account?',
    options: JSON.stringify([
      'Ignore it unless it happens again',
      'Change your password and report it to IT',
      'Log out and continue working'
    ]),
    correct_answer: 'Change your password and report it to IT',
    explanation: 'Changing your password and reporting the incident help secure your account.'
  },
  {
    question: 'If you receive a suspicious email requesting sensitive information, what should you do?',
    options: JSON.stringify([
      'Reply and ask for confirmation',
      'Click the link to check its legitimacy',
      'Report it to IT and do not interact with the email'
    ]),
    correct_answer: 'Report it to IT and do not interact with the email',
    explanation: 'Reporting suspicious emails prevents phishing attacks.'
  },
  {
    question: 'What should you do if you lose a company device containing sensitive data?',
    options: JSON.stringify([
      'Report it to IT immediately',
      'Try to recover it yourself before notifying IT',
      'Ignore it if the device is password-protected'
    ]),
    correct_answer: 'Report it to IT immediately',
    explanation: 'IT can remotely lock or erase lost devices to protect data.'
  },
  {
    question: 'What information should be included when reporting a security incident?',
    options: JSON.stringify([
      'Date and time of the incident',
      'Description of what happened',
      'Any actions already taken',
      'All of the above'
    ]),
    correct_answer: 'All of the above',
    explanation: 'Providing detailed information helps IT assess and respond effectively.'
  },
  {
    question: 'How can businesses prevent unauthorised access by former employees?',
    options: JSON.stringify([
      'Allow access for one month after termination',
      'Disable accounts immediately after an employee leaves',
      'Change passwords occasionally'
    ]),
    correct_answer: 'Disable accounts immediately after an employee leaves',
    explanation: 'Immediate deactivation prevents unauthorised access.'
  },
  {
    question: 'What should you do if you accidentally send sensitive data to the wrong recipient?',
    options: JSON.stringify([
      'Recall the email if possible and notify IT',
      'Do nothing and hope the recipient doesn\'t notice',
      'Send a follow-up email asking them to ignore it'
    ]),
    correct_answer: 'Recall the email if possible and notify IT',
    explanation: 'IT can assess the risk and advise on corrective actions.'
  },
  {
    question: 'What is the primary goal of an incident response plan?',
    options: JSON.stringify([
      'To assign blame for security failures',
      'To ensure a fast, effective response that minimises damage',
      'To create more paperwork'
    ]),
    correct_answer: 'To ensure a fast, effective response that minimises damage',
    explanation: 'A structured response reduces harm and restores security.'
  }
]

async function importModule3Content() {
  try {
    console.log('Starting Module 3 content import...')

    // Get Module 3 ID
    const { rows: [module3] } = await pool.query(
      'SELECT id FROM modules WHERE order_number = 3'
    )

    if (!module3) {
      throw new Error('Module 3 not found')
    }

    // Import sections
    console.log('Importing sections...')
    for (const section of sections) {
      await pool.query(
        `INSERT INTO sections (module_id, title, content, order_number, type)
         VALUES ($1, $2, $3, $4, $5)`,
        [module3.id, section.title, section.content, section.order_number, section.type]
      )
    }

    // Import quiz questions
    console.log('Importing quiz questions...')
    for (const quiz of quizQuestions) {
      await pool.query(
        `INSERT INTO quizzes (module_id, question, options, correct_answer, explanation)
         VALUES ($1, $2, $3, $4, $5)`,
        [module3.id, quiz.question, quiz.options, quiz.correct_answer, quiz.explanation]
      )
    }

    console.log('Module 3 content import completed successfully!')
  } catch (error) {
    console.error('Error importing Module 3 content:', error)
  } finally {
    await pool.end()
  }
}

// Run the import
importModule3Content()