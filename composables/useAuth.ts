import { ref } from 'vue'

interface User {
  id: string
  email: string
  role: string
}

// Create a reactive user state that persists across component instances
const user = ref<User | null>(null)
const loading = ref(false)
const error = ref<string | null>(null)

export const useAuth = () => {
  const login = async (email: string, password: string) => {
    try {
      loading.value = true
      error.value = null

      const response = await $fetch('/api/auth/login', {
        method: 'POST',
        body: { email, password }
      })

      user.value = response.user
      return response.user
    } catch (err) {
      error.value = err instanceof Error ? err.message : 'An error occurred'
      throw error.value
    } finally {
      loading.value = false
    }
  }

  const logout = async () => {
    try {
      await $fetch('/api/auth/logout', {
        method: 'POST'
      })
      user.value = null
    } catch (err) {
      console.error('Logout error:', err)
    }
  }

  const checkAuth = async () => {
    try {
      const response = await $fetch('/api/auth/verify')
      if (response.user) {
        user.value = response.user
        return true
      }
      return false
    } catch {
      user.value = null
      return false
    }
  }

  return {
    user,
    loading,
    error,
    login,
    logout,
    checkAuth
  }
}