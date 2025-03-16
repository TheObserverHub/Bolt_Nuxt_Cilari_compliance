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
    }

    // Get user progress with module details using a LEFT JOIN
    const { rows } = await pool.query(`
      SELECT 
        m.id as module_id,
        m.title,
        m.description,
        m.order_number,
        COALESCE(up.completed, false) as completed,
        up.current_section,
        up.created_at,
        up.updated_at
      FROM modules m
      LEFT JOIN user_progress up ON m.id = up.module_id AND up.user_id = $1
      ORDER BY m.order_number
    `, [decoded.userId])
    
    // Transform the results to include module info even for modules without progress
    const progress = rows.map(row => ({
      module_id: row.module_id,
      title: row.title,
      description: row.description,
      order_number: row.order_number,
      completed: row.completed,
      current_section: row.current_section,
      created_at: row.created_at,
      updated_at: row.updated_at
    }))

    return {
      progress
    }
  } catch (error) {
    throw createError({
      statusCode: error instanceof jwt.JsonWebTokenError ? 401 : 500,
      message: error instanceof Error ? error.message : 'Error fetching user progress'
    })
  }
})