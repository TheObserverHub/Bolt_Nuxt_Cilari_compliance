import { defineEventHandler, readBody } from 'h3'
import pool, { verifyPassword, generateToken } from '~/server/utils/db'

export default defineEventHandler(async (event) => {
  try {
    const { email, password } = await readBody(event)

    // Get user from database
    const userResult = await pool.query(
      'SELECT u.id, u.email, u.password_hash, r.role FROM users u LEFT JOIN user_roles r ON u.id = r.user_id WHERE u.email = $1',
      [email]
    )

    const user = userResult.rows[0]
    if (!user) {
      throw new Error('Invalid email or password')
    }

    // Verify password
    const isValid = await verifyPassword(password, user.password_hash)
    if (!isValid) {
      throw new Error('Invalid email or password')
    }

    // Generate token
    const token = generateToken(user.id, user.role)

    return {
      token,
      user: {
        id: user.id,
        email: user.email,
        role: user.role
      }
    }
  } catch (error) {
    console.error('Login error:', error)
    throw createError({
      statusCode: 401,
      message: error instanceof Error ? error.message : 'Authentication failed'
    })
  }
})