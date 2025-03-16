import { defineEventHandler } from 'h3'
import jwt from 'jsonwebtoken'
import pool from '~/server/utils/db'

export default defineEventHandler(async (event) => {
  try {
    const token = getCookie(event, 'auth_token')
    
    if (!token) {
      throw createError({
        statusCode: 401,
        message: 'No token provided'
      })
    }

    const decoded = jwt.verify(token, process.env.JWT_SECRET || 'your-secret-key') as {
      userId: string
      role: string
    }

    // Get user details
    const userResult = await pool.query(
      'SELECT u.id, u.email, r.role FROM users u LEFT JOIN user_roles r ON u.id = r.user_id WHERE u.id = $1',
      [decoded.userId]
    )

    const user = userResult.rows[0]
    if (!user) {
      throw createError({
        statusCode: 401,
        message: 'User not found'
      })
    }

    return {
      user: {
        id: user.id,
        email: user.email,
        role: user.role
      }
    }
  } catch (error) {
    throw createError({
      statusCode: 401,
      message: 'Invalid or expired token'
    })
  }
})