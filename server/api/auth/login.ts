import { defineEventHandler, readBody } from 'h3'
import bcryptjs from 'bcryptjs'
import jwt from 'jsonwebtoken'
import pool from '~/server/utils/db'

export default defineEventHandler(async (event) => {
  try {
    const body = await readBody(event)
    const email = body?.email?.toString()
    const password = body?.password?.toString()

    if (!email || !password) {
      throw createError({
        statusCode: 400,
        message: 'Email and password are required'
      })
    }

    // Get user from database
    const userResult = await pool.query(
      'SELECT u.id, u.email, u.password_hash, r.role FROM users u LEFT JOIN user_roles r ON u.id = r.user_id WHERE u.email = $1',
      [email]
    )

    const user = userResult.rows[0]
    if (!user) {
      throw createError({
        statusCode: 401,
        message: 'Invalid email or password'
      })
    }

    // Verify password
    const isValid = await bcryptjs.compare(password, user.password_hash)
    if (!isValid) {
      throw createError({
        statusCode: 401,
        message: 'Invalid email or password'
      })
    }

    // Generate token
    const token = jwt.sign(
      { userId: user.id, role: user.role },
      process.env.JWT_SECRET || 'your-secret-key',
      { expiresIn: '24h' }
    )

    // Set cookie with token
    setCookie(event, 'auth_token', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      maxAge: 60 * 60 * 24 // 24 hours
    })

    return {
      user: {
        id: user.id,
        email: user.email,
        role: user.role
      }
    }
  } catch (error) {
    throw error
  }
})