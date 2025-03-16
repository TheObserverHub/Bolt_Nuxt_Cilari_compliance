import { defineEventHandler, readBody } from 'h3'
import pool, { hashPassword, generateToken } from '~/server/utils/db'

export default defineEventHandler(async (event) => {
  try {
    const { email, password } = await readBody(event)

    // Hash password
    const passwordHash = await hashPassword(password)

    // Start transaction
    const client = await pool.connect()
    try {
      await client.query('BEGIN')

      // Insert user
      const userResult = await client.query(
        'INSERT INTO users (email, password_hash) VALUES ($1, $2) RETURNING id',
        [email, passwordHash]
      )

      // Assign default role
      await client.query(
        'INSERT INTO user_roles (user_id, role) VALUES ($1, $2)',
        [userResult.rows[0].id, 'user']
      )

      await client.query('COMMIT')

      // Generate token
      const token = generateToken(userResult.rows[0].id, 'user')

      return {
        token,
        user: {
          id: userResult.rows[0].id,
          email,
          role: 'user'
        }
      }
    } catch (err) {
      await client.query('ROLLBACK')
      throw err
    } finally {
      client.release()
    }
  } catch (error) {
    console.error('Registration error:', error)
    throw createError({
      statusCode: 400,
      message: error instanceof Error ? error.message : 'Registration failed'
    })
  }
})