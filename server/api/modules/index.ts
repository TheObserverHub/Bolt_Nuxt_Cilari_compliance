import { defineEventHandler } from 'h3'
import pool from '~/server/utils/db'

export default defineEventHandler(async () => {
  try {
    const { rows } = await pool.query(
      'SELECT * FROM modules ORDER BY order_number'
    )
    
    return {
      modules: rows
    }
  } catch (error) {
    throw createError({
      statusCode: 500,
      message: 'Error fetching modules'
    })
  }
})