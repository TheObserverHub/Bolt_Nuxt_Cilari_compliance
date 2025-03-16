import { defineEventHandler, readBody } from 'h3'
import jwt from 'jsonwebtoken'

export default defineEventHandler(async (event) => {
  try {
    const { token } = await readBody(event)
    
    const decoded = jwt.verify(token, process.env.JWT_SECRET || 'your-secret-key') as {
      userId: string
      role: string
    }

    return {
      userId: decoded.userId,
      role: decoded.role,
      isAdmin: decoded.role === 'admin'
    }
  } catch (error) {
    throw createError({
      statusCode: 401,
      message: 'Invalid token'
    })
  }
})