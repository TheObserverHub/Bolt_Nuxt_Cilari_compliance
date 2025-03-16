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

// Module 1 sections data
const sections = [
  {
    title: 'Overview',
    content: `In today's digital world, protecting sensitive data is critical to maintaining trust, compliance, and business integrity. This module will introduce you to best practices for handling confidential information, preventing data breaches, and ensuring compliance with data protection regulations.

Participants will learn how to:
* Identify and protect sensitive company and customer data.
* Follow best practices for data security in digital and physical formats.
* Recognise and respond to data breaches effectively.

Learning Objective:
By the end of this module, participants will understand their role in safeguarding information and will be able to demonstrate compliance with the company's policies and legal standards.`,
    order_number: 1,
    type: 'introduction'
  },
  {
    title: 'Understanding Data Protection and Confidentiality',
    content: `Data protection refers to the policies and procedures designed to secure personal, financial, and business information from unauthorised access, use, or disclosure.

What is Confidentiality?
Confidentiality ensures that sensitive information is only accessible to authorised individuals and not shared inappropriately.

Types of Sensitive Data:
1. Personally Identifiable Information (PII) – Name, address, phone number, email, social security number.
2. Financial Data – Credit card details, banking information, payroll records.
3. Health Information – Medical records, insurance details.
4. Company Confidential Data – Trade secrets, business strategies, employee records, internal reports.

Why is Data Protection Important?
* Prevents identity theft and fraud.
* Maintains trust with customers and employees.
* Ensures compliance with laws like GDPR and HIPAA.
* Avoids legal and financial penalties for data breaches.`,
    order_number: 2,
    type: 'content'
  },
  {
    title: 'Case Study: Mishandling Employee Data',
    content: `Scenario:
Sarah, an HR specialist, receives a request from an unknown number asking for the salary details of all employees in the marketing department. The person claims to be a senior manager but refuses to verify their identity. Sarah hesitates but eventually emails the requested data.

Question:
What mistake did Sarah make?

Answer: Sarah should have verified the request through official channels before sharing sensitive employee data.`,
    order_number: 3,
    type: 'case_study'
  },
  {
    title: 'Case Study: Security Breach',
    content: `Scenario:
Jake, an IT support technician, is helping an employee reset their password. The employee is struggling to access their account and asks Jake to just share the password over email. To save time, Jake sends the password through email instead of resetting it properly.

Question:
What security risk did Jake create?

Answer: Sending passwords over email creates a security risk because unauthorised individuals may intercept the message.`,
    order_number: 4,
    type: 'case_study'
  },
  {
    title: 'Best Practices for Data Protection',
    content: `1. Create complex passwords and update them regularly.
2. Always lock your workstation when stepping away.
3. Store documents in encrypted files and avoid saving sensitive data on personal devices.
4. Verify sender identities before clicking on links or sharing data.
5. Shred paper documents and securely delete electronic files when no longer needed.
6. Avoid accessing sensitive data on public Wi-Fi without a VPN.`,
    order_number: 5,
    type: 'content'
  },
  {
    title: 'Case Study: The Importance of Strong Passwords',
    content: `Scenario:
David, an IT administrator, uses the same password for multiple accounts, including his personal banking, email, and company login. One day, his email account gets hacked, and the attackers use the same credentials to access the company's internal system.

Question:
What mistake did David make?

Answer: David should have used unique, strong passwords for each account and enabled multi-factor authentication (MFA).`,
    order_number: 6,
    type: 'case_study'
  },
  {
    title: 'Data Breaches and Reporting',
    content: `What is a Data Breach?
A data breach occurs when unauthorised individuals access confidential information. This can happen due to hacking, human error, or improper disposal of data.

What to Do if You Suspect a Data Breach?
1. Report It Immediately – Notify IT or the compliance team.
2. Do Not Try to Fix It Yourself – Let professionals investigate and resolve the issue.
3. Follow Company Protocols – Ensure data security measures are in place to prevent future incidents.`,
    order_number: 7,
    type: 'content'
  },
  {
    title: 'Conclusion and Key Takeaways',
    content: `Remember these critical points:

* Protecting data is a shared responsibility
* Always verify, encrypt, and secure sensitive information
* Be alert to phishing, unauthorised access, and data leaks
* Report any suspicious activity immediately`,
    order_number: 8,
    type: 'conclusion'
  }
]

// Module 1 quiz questions
const quizQuestions = [
  {
    question: 'Which of the following is NOT a type of sensitive data?',
    options: JSON.stringify([
      'Employee salary records',
      'A company\'s public marketing materials',
      'Customer credit card information',
      'Patient medical records'
    ]),
    correct_answer: 'A company\'s public marketing materials',
    explanation: 'Public marketing materials are not confidential or sensitive as they are intended for public distribution.'
  },
  {
    question: 'What is the best way to send sensitive company data?',
    options: JSON.stringify([
      'Through a personal email account',
      'In an unencrypted file attachment',
      'Using a secure, company-approved platform',
      'On a USB drive left in a shared workspace'
    ]),
    correct_answer: 'Using a secure, company-approved platform',
    explanation: 'Always use secure, company-approved methods to share sensitive information.'
  },
  {
    question: 'If you receive an email from an unknown sender asking for employee records, what should you do?',
    options: JSON.stringify([
      'Forward the email to a colleague for advice',
      'Reply and ask for more details',
      'Verify the request with IT or management before responding',
      'Assume it\'s urgent and send the requested information'
    ]),
    correct_answer: 'Verify the request with IT or management before responding',
    explanation: 'Always verify requests for sensitive data before responding.'
  },
  {
    question: 'What should you do if you accidentally send confidential information to the wrong person?',
    options: JSON.stringify([
      'Ignore it and hope they don\'t notice',
      'Notify your manager or compliance team immediately',
      'Delete the email and move on',
      'Ask the recipient to ignore it'
    ]),
    correct_answer: 'Notify your manager or compliance team immediately',
    explanation: 'Reporting incidents promptly helps prevent further risks.'
  },
  {
    question: 'Which of the following is an example of improper data handling?',
    options: JSON.stringify([
      'Encrypting files before emailing them',
      'Leaving confidential documents on your desk overnight',
      'Storing customer data in a secured cloud system',
      'Using a VPN when accessing company systems remotely'
    ]),
    correct_answer: 'Leaving confidential documents on your desk overnight',
    explanation: 'Leaving sensitive documents unattended can lead to unauthorized access.'
  },
  {
    question: 'What is the first step to take if you suspect a data breach?',
    options: JSON.stringify([
      'Try to fix it yourself',
      'Report it to IT or the compliance team',
      'Ignore it and wait for someone else to notice',
      'Discuss it with a colleague before reporting'
    ]),
    correct_answer: 'Report it to IT or the compliance team',
    explanation: 'Reporting a breach immediately ensures it is handled properly.'
  },
  {
    question: 'Which of the following is a strong password example?',
    options: JSON.stringify([
      '12345678',
      'CompanyName2023',
      'P@ssw0rd',
      'M$7y&Qz!p3r%'
    ]),
    correct_answer: 'M$7y&Qz!p3r%',
    explanation: 'A strong password includes a mix of uppercase, lowercase, numbers, and special characters.'
  },
  {
    question: 'How can an employee prevent unauthorised access to company systems?',
    options: JSON.stringify([
      'Always lock their screen when leaving their desk',
      'Share login credentials with trusted co-workers',
      'Use the same password for all work accounts',
      'Store sensitive information in an unlocked drawer'
    ]),
    correct_answer: 'Always lock their screen when leaving their desk',
    explanation: 'Locking your screen prevents unauthorized access.'
  },
  {
    question: 'Which situation could be considered a data breach?',
    options: JSON.stringify([
      'A colleague sees confidential data on an unlocked screen',
      'A misplaced document is found and secured before anyone reads it',
      'A team meeting discusses project details in a private conference room',
      'A report containing sensitive customer information is encrypted and sent securely'
    ]),
    correct_answer: 'A colleague sees confidential data on an unlocked screen',
    explanation: 'Unauthorized viewing of confidential data can be classified as a breach.'
  },
  {
    question: 'What is the safest way to dispose of confidential paper documents?',
    options: JSON.stringify([
      'Throw them in the recycling bin',
      'Leave them on your desk for later disposal',
      'Shred them using an approved shredder',
      'Crumple them up and place them in the trash'
    ]),
    correct_answer: 'Shred them using an approved shredder',
    explanation: 'Shredding prevents unauthorized access to sensitive information.'
  }
]

async function importModule1Content() {
  try {
    console.log('Starting Module 1 content import...')

    // Get Module 1 ID
    const { rows: [module1] } = await pool.query(
      'SELECT id FROM modules WHERE order_number = 1'
    )

    if (!module1) {
      throw new Error('Module 1 not found')
    }

    // Import sections
    console.log('Importing sections...')
    for (const section of sections) {
      await pool.query(
        `INSERT INTO sections (module_id, title, content, order_number, type)
         VALUES ($1, $2, $3, $4, $5)`,
        [module1.id, section.title, section.content, section.order_number, section.type]
      )
    }

    // Import quiz questions
    console.log('Importing quiz questions...')
    for (const quiz of quizQuestions) {
      await pool.query(
        `INSERT INTO quizzes (module_id, question, options, correct_answer, explanation)
         VALUES ($1, $2, $3, $4, $5)`,
        [module1.id, quiz.question, quiz.options, quiz.correct_answer, quiz.explanation]
      )
    }

    console.log('Module 1 content import completed successfully!')
  } catch (error) {
    console.error('Error importing Module 1 content:', error)
  } finally {
    await pool.end()
  }
}

// Run the import
importModule1Content()