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

// Module 2 sections data
const sections = [
  {
    title: 'Overview',
    content: `In today's digital world, cybersecurity threats are constantly evolving. Employees play a crucial role in protecting company data and preventing cyberattacks. This module will cover:

1. Recognising Cyber Threats – Understanding phishing, malware, and social engineering.
2. Safe Online Practices – Guidelines for secure browsing, password management, and email security.
3. Handling Suspicious Activity – What to do if you suspect a security breach.

Learning Objectives:
By completing this module, employees will be able to:
1. Identify common cyber threats such as phishing, malware, and social engineering.
2. Implement secure online practices, including password management, email security, and safe browsing.
3. Recognise and respond to suspicious activity to prevent security breaches.
4. Understand company policies regarding device security, remote work safety, and data access.
5. Report cybersecurity incidents effectively to minimise potential risks.`,
    order_number: 1,
    type: 'introduction'
  },
  {
    title: 'Recognising Cyber Threats',
    content: `Cybercriminals use various tactics to steal information, manipulate employees, and gain unauthorised access to company systems. The most common cyber threats include:

* Phishing Attacks: Fake emails or messages designed to steal login credentials.
* Malware & Ransomware: Harmful software that can compromise or lock data.
* Social Engineering: Manipulating employees into giving up sensitive information.

Understanding these threats is the first step in preventing cyberattacks.`,
    order_number: 2,
    type: 'content'
  },
  {
    title: 'Case Study: Phishing Email Attack',
    content: `Scenario:
Lisa, an HR coordinator, receives an email that appears to be from the IT department, asking her to reset her company password through a provided link. The email says her account will be locked if she does not act immediately. She clicks the link, enters her credentials, and later finds out her account has been compromised.

Questions:
1. How could Lisa have identified this as a phishing attempt?
2. What should she do after realising she has fallen for a phishing attack?

Answers:
1. Lisa should have checked the sender's email, looked for red flags (urgent language, suspicious links), and verified the request with IT before clicking.
2. She should immediately report the incident, change her passwords, and alert IT to mitigate damage.`,
    order_number: 3,
    type: 'case_study'
  },
  {
    title: 'Case Study: Ransomware Attack',
    content: `Scenario:
Mark, an IT technician, downloads what appears to be a software update from an email attachment. Shortly after, his screen freezes, and a message appears demanding payment to unlock his files.

Questions:
1. What is a ransomware attack, and how does it work?
2. How could Mark have avoided this situation?
3. What steps should he take now?

Answers:
1. Ransomware encrypts files and demands payment for their release.
2. Mark should have verified the sender, avoided opening unknown attachments, and ensured updates were from trusted sources.
3. He should disconnect his computer, report the attack to IT, and avoid paying the ransom.`,
    order_number: 4,
    type: 'case_study'
  },
  {
    title: 'Safe Online Practices',
    content: `Secure online behaviour is essential to protecting company data. This section covers:

* Password Security: Creating strong, unique passwords and enabling multi-factor authentication.
* Safe Email Practices: Avoiding malicious attachments and verifying senders.
* Secure Remote Work: Using VPNs, avoiding public Wi-Fi, and securing company devices.

Employees who follow these best practices reduce the risk of cyberattacks.`,
    order_number: 5,
    type: 'content'
  },
  {
    title: 'Case Study: Unsafe Public Wi-Fi Use',
    content: `Scenario:
Jake, a logistics officer, accesses the company portal using free public Wi-Fi at a coffee shop. Later, he notices unauthorised access to company systems from an unknown location.

Questions:
1. What risks come with using public Wi-Fi for work?
2. How can employees protect data while working remotely?
3. What security tools should companies provide for remote workers?

Answers:
1. Public Wi-Fi is unsecured and vulnerable to cyberattacks.
2. Employees should use a Virtual Private Network (VPN) and avoid logging into sensitive accounts on public networks.
3. Companies should provide VPN access and enforce secure remote work policies.`,
    order_number: 6,
    type: 'case_study'
  },
  {
    title: 'Handling Suspicious Activity',
    content: `Cyber threats are not always preventable, but quick action can minimise damage. Employees must:

* Recognise signs of unauthorised access.
* Report security incidents immediately.
* Follow company protocols for data breaches.

This section provides real-world scenarios on how to respond to cybersecurity incidents.`,
    order_number: 7,
    type: 'content'
  },
  {
    title: 'Conclusion and Key Takeaways',
    content: `* Always verify the authenticity of emails, links, and attachments before opening them.
* Use strong, unique passwords and enable multi-factor authentication (MFA) for added security.
* Avoid using public Wi-Fi for work-related tasks without a secure VPN.
* Report any suspicious emails, unauthorised access, or security concerns immediately to IT.
* Never share your login credentials or sensitive company information with unauthorised parties.`,
    order_number: 8,
    type: 'conclusion'
  }
]

// Module 2 quiz questions
const quizQuestions = [
  {
    question: 'What is the most common method hackers use to steal passwords?',
    options: JSON.stringify([
      'Social engineering',
      'Brute-force attacks',
      'Phishing emails'
    ]),
    correct_answer: 'Phishing emails',
    explanation: 'Phishing emails are the most common method of stealing passwords. Attackers trick users into revealing login credentials.'
  },
  {
    question: 'Which of the following is a sign of a phishing email?',
    options: JSON.stringify([
      'Urgent language',
      'Generic greetings',
      'Unexpected attachments',
      'All of the above'
    ]),
    correct_answer: 'All of the above',
    explanation: 'Phishing emails often use urgency, generic greetings, and attachments to trick recipients.'
  },
  {
    question: 'Why is using the same password for multiple accounts risky?',
    options: JSON.stringify([
      'It increases the chance of forgetting the password',
      'If one account is compromised, all accounts using the same password are vulnerable',
      'It makes logging in easier'
    ]),
    correct_answer: 'If one account is compromised, all accounts using the same password are vulnerable',
    explanation: 'If a hacker gains access to one account, they can use the same password to break into other accounts.'
  },
  {
    question: 'What should you do if you receive a suspicious login alert?',
    options: JSON.stringify([
      'Ignore it unless it happens multiple times',
      'Click the link in the alert email to verify the login',
      'Change your password immediately and report it to IT'
    ]),
    correct_answer: 'Change your password immediately and report it to IT',
    explanation: 'Changing your password immediately and reporting the incident helps prevent unauthorised access.'
  },
  {
    question: 'What is a VPN, and why is it important?',
    options: JSON.stringify([
      'A tool that speeds up internet browsing',
      'A software that blocks malware',
      'A secure connection that encrypts internet traffic, protecting sensitive data'
    ]),
    correct_answer: 'A secure connection that encrypts internet traffic, protecting sensitive data',
    explanation: 'A VPN encrypts data, making it difficult for hackers to intercept sensitive information, especially on public Wi-Fi.'
  },
  {
    question: 'How should you respond to a suspected ransomware attack?',
    options: JSON.stringify([
      'Pay the ransom to regain access to files',
      'Disconnect from the network, report to IT, and avoid paying the ransom',
      'Restart the computer and hope the issue resolves itself'
    ]),
    correct_answer: 'Disconnect from the network, report to IT, and avoid paying the ransom',
    explanation: 'Disconnecting prevents further infection, and reporting to IT helps contain the attack. Paying the ransom is not recommended.'
  },
  {
    question: 'Why is public Wi-Fi a security risk?',
    options: JSON.stringify([
      'It allows hackers to intercept data',
      'It is slower than private networks',
      'It requires a password to access'
    ]),
    correct_answer: 'It allows hackers to intercept data',
    explanation: 'Public networks are often unsecured, making it easier for attackers to steal sensitive information.'
  },
  {
    question: 'What is multi-factor authentication (MFA), and how does it help?',
    options: JSON.stringify([
      'A method to save multiple passwords in one place',
      'A feature that allows logging in without a password',
      'A security system requiring a second form of verification, making unauthorised access harder'
    ]),
    correct_answer: 'A security system requiring a second form of verification, making unauthorised access harder',
    explanation: 'MFA adds an extra layer of security by requiring additional authentication beyond a password.'
  },
  {
    question: 'What should you do if you lose a company device?',
    options: JSON.stringify([
      'Report it to IT immediately so they can lock or erase the device',
      'Wait a few days to see if you find it',
      'Use a personal device to access work data instead'
    ]),
    correct_answer: 'Report it to IT immediately so they can lock or erase the device',
    explanation: 'Promptly reporting a lost device helps IT secure company data before it falls into the wrong hands.'
  },
  {
    question: 'Which is the best practice for handling suspicious email attachments?',
    options: JSON.stringify([
      'Open them to check the content',
      'Forward them to a colleague for verification',
      'Do not open them and report to IT'
    ]),
    correct_answer: 'Do not open them and report to IT',
    explanation: 'Never open suspicious attachments as they may contain malware. Report them to IT for proper handling.'
  }
]

async function importModule2Content() {
  try {
    console.log('Starting Module 2 content import...')

    // Get Module 2 ID
    const { rows: [module2] } = await pool.query(
      'SELECT id FROM modules WHERE order_number = 2'
    )

    if (!module2) {
      throw new Error('Module 2 not found')
    }

    // Import sections
    console.log('Importing sections...')
    for (const section of sections) {
      await pool.query(
        `INSERT INTO sections (module_id, title, content, order_number, type)
         VALUES ($1, $2, $3, $4, $5)`,
        [module2.id, section.title, section.content, section.order_number, section.type]
      )
    }

    // Import quiz questions
    console.log('Importing quiz questions...')
    for (const quiz of quizQuestions) {
      await pool.query(
        `INSERT INTO quizzes (module_id, question, options, correct_answer, explanation)
         VALUES ($1, $2, $3, $4, $5)`,
        [module2.id, quiz.question, quiz.options, quiz.correct_answer, quiz.explanation]
      )
    }

    console.log('Module 2 content import completed successfully!')
  } catch (error) {
    console.error('Error importing Module 2 content:', error)
  } finally {
    await pool.end()
  }
}

// Run the import
importModule2Content()