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

// Module 4 sections data
const sections = [
  {
    title: 'Overview',
    content: `Remote work has become a standard practice, but it introduces new security and ethical challenges. Employees working from home must maintain the same level of professionalism, cybersecurity awareness, and workplace safety as they would in an office environment.

This module will help you:
* Set up a secure and safe remote workspace to protect company data and personal well-being.
* Follow company security policies when working outside the office.
* Maintain professional conduct and ethical standards in virtual environments.

By the end of this module, you will be able to identify remote work risks, apply best practices, and ensure compliance with company policies.`,
    order_number: 1,
    type: 'introduction'
  },
  {
    title: 'Securing Your Remote Workspace',
    content: `Working remotely means employees must take extra steps to protect company data and systems from cyber threats and physical security risks.

This section covers:
* Best practices for securing home networks (e.g., using strong Wi-Fi passwords, enabling firewalls, and avoiding public networks).
* Protecting company devices by locking screens, using VPNs, and enabling encryption.
* Preventing unauthorised access by family members or outsiders.`,
    order_number: 2,
    type: 'content'
  },
  {
    title: 'Case Study: Unsecured Home Wi-Fi',
    content: `Scenario:
Jake, an IT specialist, works from home using his personal Wi-Fi network. He never changed the default router password, and his Wi-Fi network is open (no password protection). A hacker nearby gains access to his network and intercepts sensitive company communications.

Questions:
1. What security risks exist in Jake's setup?
2. What steps should he take to secure his Wi-Fi?
3. How can employees check if their home network is secure?

Answers:
1. An open Wi-Fi network allows unauthorised users to access sensitive company data.
2. Jake should enable WPA3 encryption, set a strong password, and change the default router credentials.
3. Employees should regularly update their router firmware and enable firewalls.`,
    order_number: 3,
    type: 'case_study'
  },
  {
    title: 'Case Study: Lost Company Laptop',
    content: `Scenario:
Maria, a supply chain manager, works remotely from a café. She briefly leaves her laptop unattended to get coffee. When she returns, the laptop is missing, and it contains confidential supply chain contracts.

Questions:
1. Why is leaving company devices unattended a risk?
2. What should Maria have done differently?
3. How can employees prevent device theft when working remotely?

Answers:
1. Unattended devices can be stolen, leading to data breaches.
2. Maria should have taken the laptop with her or used a security cable lock.
3. Employees should store devices securely and enable remote-wipe capabilities.`,
    order_number: 4,
    type: 'case_study'
  },
  {
    title: 'Remote Work Conduct and Ethics',
    content: `Remote employees must maintain the same level of professionalism, confidentiality, and ethical behaviour as they would in an office setting.

This section covers:
* Professionalism in virtual meetings (e.g., appropriate attire, background setup, and engagement).
* Ethical considerations, including working designated hours and avoiding distractions.
* Handling sensitive information in shared spaces to maintain confidentiality.`,
    order_number: 5,
    type: 'content'
  },
  {
    title: 'Case Study: Unprofessional Virtual Meeting Behaviour',
    content: `Scenario:
During a video call with clients, Alex, a sales representative, is wearing pyjamas, eating loudly, and has a messy background. He also forgets to mute his microphone when speaking to a family member.

Questions:
1. Why is Alex's behaviour unprofessional?
2. How should employees present themselves in virtual meetings?
3. What steps can companies take to improve remote meeting etiquette?

Answers:
1. Unprofessional behaviour in virtual meetings can damage the company's reputation and credibility.
2. Employees should dress appropriately, mute their mic when not speaking, and ensure a tidy background.
3. Companies should provide virtual meeting etiquette guidelines and training.`,
    order_number: 6,
    type: 'case_study'
  },
  {
    title: 'Cybersecurity Best Practices for Remote Work',
    content: `Cybersecurity risks increase when employees work remotely. This section covers:
* The importance of using VPNs to secure internet connections.
* Recognising remote work-specific cyber threats, such as remote phishing scams.
* Company policies for reporting cybersecurity concerns while working remotely.`,
    order_number: 7,
    type: 'content'
  },
  {
    title: 'Conclusion and Key Takeaways',
    content: `* Set up a secure and ergonomic remote workspace to promote health and productivity.
* Use company-approved communication tools for work-related discussions and data sharing.
* Maintain professional conduct in virtual meetings, emails, and online interactions.
* Secure company devices and lock screens when stepping away.
* Follow all data protection policies, even while working remotely.`,
    order_number: 8,
    type: 'conclusion'
  }
]

// Module 4 quiz questions
const quizQuestions = [
  {
    question: 'What is the most secure way to connect to company systems remotely?',
    options: JSON.stringify([
      'Public Wi-Fi',
      'VPN',
      'Personal email'
    ]),
    correct_answer: 'VPN',
    explanation: 'A VPN (Virtual Private Network) encrypts internet connections, ensuring secure access to company systems when working remotely.'
  },
  {
    question: 'Why should work devices not be shared with family members?',
    options: JSON.stringify([
      'To prevent unauthorised access and malware infections',
      'Because company policies prohibit it',
      'Both A and B'
    ]),
    correct_answer: 'Both A and B',
    explanation: 'Allowing family members to use work devices increases security risks (e.g., malware infections, unauthorised access) and violates company policies.'
  },
  {
    question: 'What is a sign of a phishing attack?',
    options: JSON.stringify([
      'Emails with urgent requests',
      'Unfamiliar links',
      'Spelling errors',
      'All of the above'
    ]),
    correct_answer: 'All of the above',
    explanation: 'Phishing emails often create a sense of urgency, contain suspicious links, and have errors in spelling or grammar to deceive recipients.'
  },
  {
    question: 'What is the most effective way to secure your home Wi-Fi network?',
    options: JSON.stringify([
      'Use a simple password',
      'Enable WPA3 encryption and set a strong password',
      'Leave the network open'
    ]),
    correct_answer: 'Enable WPA3 encryption and set a strong password',
    explanation: 'WPA3 encryption and strong passwords prevent unauthorised access and protect your home network from cyber threats.'
  },
  {
    question: 'What should you do if you find your company laptop is missing while working remotely?',
    options: JSON.stringify([
      'Ignore it and continue working',
      'Report the theft immediately to your company\'s IT or security team',
      'Wait for someone to find it'
    ]),
    correct_answer: 'Report the theft immediately to your company\'s IT or security team',
    explanation: 'Reporting the theft immediately allows the IT team to lock or wipe the device to protect sensitive data.'
  },
  {
    question: 'What is the most secure way to protect confidential data when working remotely in a public space (e.g., café)?',
    options: JSON.stringify([
      'Speak quietly',
      'Use a VPN and avoid discussing sensitive information',
      'Leave your laptop open for quick access'
    ]),
    correct_answer: 'Use a VPN and avoid discussing sensitive information',
    explanation: 'A VPN encrypts your connection, and avoiding sensitive conversations in public helps maintain confidentiality.'
  },
  {
    question: 'Why is it important to use multi-factor authentication (MFA) for remote access?',
    options: JSON.stringify([
      'To add an extra layer of security',
      'To make it easier to access accounts',
      'To reduce passwords'
    ]),
    correct_answer: 'To add an extra layer of security',
    explanation: 'MFA enhances security by requiring users to provide two or more forms of identification, making it harder for unauthorised individuals to gain access.'
  },
  {
    question: 'How can you protect your remote work devices from theft or unauthorised access?',
    options: JSON.stringify([
      'Lock the screen when not in use',
      'Leave the device unattended in public places',
      'Use weak passwords'
    ]),
    correct_answer: 'Lock the screen when not in use',
    explanation: 'Locking your screen prevents unauthorised access when you step away from your device, ensuring its security.'
  },
  {
    question: 'What should you do if you suspect that your personal device has been infected with malware?',
    options: JSON.stringify([
      'Ignore it and continue working',
      'Immediately report it to IT and disconnect the device from company networks',
      'Use antivirus software and continue using it'
    ]),
    correct_answer: 'Immediately report it to IT and disconnect the device from company networks',
    explanation: 'Reporting the incident allows IT to investigate, and disconnecting the device prevents further spread of malware to the company network.'
  },
  {
    question: 'How should you behave during virtual meetings to maintain professionalism?',
    options: JSON.stringify([
      'Wear casual clothing and do not worry about background noise',
      'Dress appropriately, mute your microphone when not speaking, and ensure a professional background',
      'Leave your camera off and use text chat only'
    ]),
    correct_answer: 'Dress appropriately, mute your microphone when not speaking, and ensure a professional background',
    explanation: 'Professional attire, muting the microphone to avoid background noise, and having a clean background reflect professionalism during virtual meetings.'
  }
]

async function importModule4Content() {
  try {
    console.log('Starting Module 4 content import...')

    // Get Module 4 ID
    const { rows: [module4] } = await pool.query(
      'SELECT id FROM modules WHERE order_number = 4'
    )

    if (!module4) {
      throw new Error('Module 4 not found')
    }

    // Import sections
    console.log('Importing sections...')
    for (const section of sections) {
      await pool.query(
        `INSERT INTO sections (module_id, title, content, order_number, type)
         VALUES ($1, $2, $3, $4, $5)`,
        [module4.id, section.title, section.content, section.order_number, section.type]
      )
    }

    // Import quiz questions
    console.log('Importing quiz questions...')
    for (const quiz of quizQuestions) {
      await pool.query(
        `INSERT INTO quizzes (module_id, question, options, correct_answer, explanation)
         VALUES ($1, $2, $3, $4, $5)`,
        [module4.id, quiz.question, quiz.options, quiz.correct_answer, quiz.explanation]
      )
    }

    console.log('Module 4 content import completed successfully!')
  } catch (error) {
    console.error('Error importing Module 4 content:', error)
  } finally {
    await pool.end()
  }
}

// Run the import
importModule4Content()