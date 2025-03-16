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

// Module data from migrations
const modules = [
  {
    title: 'Data Protection and Confidentiality',
    description: 'Learn essential practices for protecting sensitive data, maintaining confidentiality, and ensuring compliance with data protection regulations.',
    order_number: 1,
    passing_score: 80
  },
  {
    title: 'Cybersecurity and Awareness',
    description: 'Understand cybersecurity threats, safe online practices, and how to protect company assets from digital attacks.',
    order_number: 2,
    passing_score: 80
  },
  {
    title: 'Incident Response',
    description: 'Learn how to identify, report, and respond to security incidents effectively to minimize damage and ensure business continuity.',
    order_number: 3,
    passing_score: 80
  },
  {
    title: 'Remote Workspace Safety and Conduct',
    description: 'Establish best practices for maintaining a secure and professional remote work environment.',
    order_number: 4,
    passing_score: 80
  },
  {
    title: 'Health and Safety for Remote Workers',
    description: 'Understand how to maintain physical and mental well-being while working remotely, including ergonomics and stress management.',
    order_number: 5,
    passing_score: 80
  },
  {
    title: 'Code of Conduct and Ethics',
    description: 'Learn about professional conduct, ethical decision-making, and maintaining company values in all business interactions.',
    order_number: 6,
    passing_score: 80
  },
  {
    title: 'Final Exam',
    description: 'Comprehensive assessment covering all previous modules to ensure complete understanding of compliance requirements.',
    order_number: 7,
    passing_score: 80
  }
]

async function importModules() {
  try {
    console.log('Starting module import...')

    // Insert each module
    for (const module of modules) {
      const { rows } = await pool.query(
        `INSERT INTO modules (title, description, order_number, passing_score)
         VALUES ($1, $2, $3, $4)
         ON CONFLICT (title) DO UPDATE 
         SET description = EXCLUDED.description,
             order_number = EXCLUDED.order_number,
             passing_score = EXCLUDED.passing_score
         RETURNING id`,
        [module.title, module.description, module.order_number, module.passing_score]
      )
      
      console.log(`Imported module: ${module.title} (ID: ${rows[0].id})`)
    }

    console.log('Module import completed successfully!')
  } catch (error) {
    console.error('Error importing modules:', error)
  } finally {
    await pool.end()
  }
}

// Run the import
importModules()