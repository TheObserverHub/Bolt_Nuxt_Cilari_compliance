import pg from 'pg';
import bcryptjs from 'bcryptjs';
import 'dotenv/config';

const { Pool } = pg;

// Database connection configuration
const config = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  port: parseInt(process.env.DB_PORT || '5432'),
  database: process.env.DB_NAME
};

const pool = new Pool(config);

async function setupTrainingData() {
  try {
    // Create users
    const users = [
      { email: 'admin@cilari.com', password: 'Admin123!', role: 'admin' },
      { email: 'user1@cilari.com', password: 'User123!', role: 'user' },
      { email: 'user2@cilari.com', password: 'User123!', role: 'user' },
      { email: 'tester@cilari.com', password: 'Test123!', role: 'user' }
    ];

    // Insert users and their roles
    for (const user of users) {
      const passwordHash = await bcryptjs.hash(user.password, 10);
      
      // Insert user
      const userResult = await pool.query(`
        INSERT INTO users (email, password_hash)
        VALUES ($1, $2)
        ON CONFLICT (email) DO NOTHING
        RETURNING id;
      `, [user.email, passwordHash]);

      // Get user id (either from insert or existing user)
      const userIdResult = await pool.query(`
        SELECT id FROM users WHERE email = $1;
      `, [user.email]);

      const userId = userIdResult.rows[0].id;

      // Add role
      await pool.query(`
        INSERT INTO user_roles (user_id, role)
        VALUES ($1, $2)
        ON CONFLICT (user_id) DO UPDATE
        SET role = EXCLUDED.role;
      `, [userId, user.role]);
    }

    // Create training modules
    const modules = [
      {
        title: 'Data Protection and Confidentiality',
        description: 'Learn essential practices for protecting sensitive data, maintaining confidentiality, and ensuring compliance with data protection regulations.',
        order_number: 1
      },
      {
        title: 'Cybersecurity and Awareness',
        description: 'Understand cybersecurity threats, safe online practices, and how to protect company assets from digital attacks.',
        order_number: 2
      },
      {
        title: 'Incident Response',
        description: 'Learn how to identify, report, and respond to security incidents effectively to minimize damage and ensure business continuity.',
        order_number: 3
      },
      {
        title: 'Remote Workspace Safety and Conduct',
        description: 'Establish best practices for maintaining a secure and professional remote work environment.',
        order_number: 4
      },
      {
        title: 'Health and Safety for Remote Workers',
        description: 'Understand how to maintain physical and mental well-being while working remotely, including ergonomics and stress management.',
        order_number: 5
      },
      {
        title: 'Code of Conduct and Ethics',
        description: 'Learn about professional conduct, ethical decision-making, and maintaining company values in all business interactions.',
        order_number: 6
      },
      {
        title: 'Final Exam',
        description: 'Comprehensive assessment covering all previous modules to ensure complete understanding of compliance requirements.',
        order_number: 7
      }
    ];

    // Insert modules
    for (const module of modules) {
      const moduleResult = await pool.query(`
        INSERT INTO modules (title, description, order_number)
        VALUES ($1, $2, $3)
        ON CONFLICT (title) DO UPDATE 
        SET description = EXCLUDED.description, 
            order_number = EXCLUDED.order_number
        RETURNING id;
      `, [module.title, module.description, module.order_number]);

      const moduleId = moduleResult.rows[0].id;

      // Add sample section for each module
      await pool.query(`
        INSERT INTO sections (module_id, title, content, order_number, type)
        VALUES ($1, 'Introduction', 'Welcome to this module. Here you will learn about ' || $2, 1, 'introduction');
      `, [moduleId, module.description]);

      // Add sample quiz question for each module
      await pool.query(`
        INSERT INTO quizzes (module_id, question, options, correct_answer, explanation)
        VALUES (
          $1,
          'What is the main purpose of ' || $2 || '?',
          $3,
          'To ensure compliance and safety',
          'Understanding the purpose helps maintain security and compliance.'
        );
      `, [moduleId, module.title, JSON.stringify(['To ensure compliance and safety', 'To complete tasks quickly', 'To avoid work', 'None of the above'])]);
    }

    console.log('Training modules and users setup completed successfully!');
    await pool.end();

  } catch (error) {
    console.error('Error setting up training data:', error);
    process.exit(1);
  }
}

setupTrainingData();