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
  database: 'postgres'
};

const pool = new Pool(config);

async function setupDatabase() {
  try {
    // Create the database
    await pool.query(`
      CREATE DATABASE cilari_compliance
      WITH 
      OWNER = ${process.env.DB_USER}
      ENCODING = 'UTF8'
      LC_COLLATE = 'en_US.UTF-8'
      LC_CTYPE = 'en_US.UTF-8'
      TABLESPACE = pg_default
      CONNECTION LIMIT = -1;
    `);

    // Close connection to default database
    await pool.end();

    // Connect to new database
    const dbPool = new Pool({
      ...config,
      database: 'cilari_compliance'
    });

    // Create users table
    await dbPool.query(`
      CREATE TABLE IF NOT EXISTS users (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        email VARCHAR(255) UNIQUE NOT NULL,
        password_hash VARCHAR(255) NOT NULL,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
      );
    `);

    // Create user_roles table
    await dbPool.query(`
      CREATE TABLE IF NOT EXISTS user_roles (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        user_id UUID REFERENCES users(id) ON DELETE CASCADE,
        role VARCHAR(50) NOT NULL CHECK (role IN ('admin', 'user')),
        created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        UNIQUE(user_id)
      );
    `);

    // Create modules table with unique title constraint
    await dbPool.query(`
      CREATE TABLE IF NOT EXISTS modules (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        title VARCHAR(255) UNIQUE NOT NULL,
        description TEXT NOT NULL,
        order_number INTEGER NOT NULL,
        passing_score INTEGER NOT NULL DEFAULT 80,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
      );
    `);

    // Create sections table
    await dbPool.query(`
      CREATE TABLE IF NOT EXISTS sections (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        module_id UUID REFERENCES modules(id) ON DELETE CASCADE,
        title VARCHAR(255) NOT NULL,
        content TEXT NOT NULL,
        order_number INTEGER NOT NULL,
        type VARCHAR(50) NOT NULL CHECK (type IN ('introduction', 'content', 'case_study', 'conclusion')),
        created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
      );
    `);

    // Create quizzes table
    await dbPool.query(`
      CREATE TABLE IF NOT EXISTS quizzes (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        module_id UUID REFERENCES modules(id) ON DELETE CASCADE,
        question TEXT NOT NULL,
        options JSONB NOT NULL,
        correct_answer TEXT NOT NULL,
        explanation TEXT,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
      );
    `);

    // Create user_progress table
    await dbPool.query(`
      CREATE TABLE IF NOT EXISTS user_progress (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        user_id UUID REFERENCES users(id) ON DELETE CASCADE,
        module_id UUID REFERENCES modules(id) ON DELETE CASCADE,
        completed BOOLEAN DEFAULT false,
        current_section UUID REFERENCES sections(id),
        created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        UNIQUE(user_id, module_id)
      );
    `);

    // Create quiz_attempts table
    await dbPool.query(`
      CREATE TABLE IF NOT EXISTS quiz_attempts (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        user_id UUID REFERENCES users(id) ON DELETE CASCADE,
        module_id UUID REFERENCES modules(id) ON DELETE CASCADE,
        score INTEGER NOT NULL,
        passed BOOLEAN NOT NULL,
        answers JSONB NOT NULL,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        UNIQUE(user_id, module_id, created_at)
      );
    `);

    // Create indexes for better performance
    await dbPool.query(`
      CREATE INDEX IF NOT EXISTS idx_user_progress_user_id ON user_progress(user_id);
      CREATE INDEX IF NOT EXISTS idx_user_progress_module_id ON user_progress(module_id);
      CREATE INDEX IF NOT EXISTS idx_quiz_attempts_user_id ON quiz_attempts(user_id);
      CREATE INDEX IF NOT EXISTS idx_quiz_attempts_module_id ON quiz_attempts(module_id);
      CREATE INDEX IF NOT EXISTS idx_sections_module_id ON sections(module_id);
      CREATE INDEX IF NOT EXISTS idx_quizzes_module_id ON quizzes(module_id);
    `);

    // Create admin user
    const adminPassword = await bcryptjs.hash('Admin123!', 10);
    await dbPool.query(`
      INSERT INTO users (email, password_hash) 
      VALUES ('admin@cilari.com', $1)
      ON CONFLICT (email) DO NOTHING
      RETURNING id;
    `, [adminPassword]);

    // Get admin user id
    const adminResult = await dbPool.query(`
      SELECT id FROM users WHERE email = 'admin@cilari.com';
    `);

    if (adminResult.rows.length > 0) {
      const adminId = adminResult.rows[0].id;
      // Add admin role
      await dbPool.query(`
        INSERT INTO user_roles (user_id, role)
        VALUES ($1, 'admin')
        ON CONFLICT (user_id) DO NOTHING;
      `, [adminId]);
    }

    console.log('Database setup completed successfully!');
    await dbPool.end();

  } catch (error) {
    console.error('Error setting up database:', error);
    process.exit(1);
  }
}

setupDatabase();