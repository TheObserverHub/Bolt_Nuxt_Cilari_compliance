import { createClient } from '@supabase/supabase-js'
import { ref } from 'vue'

export const useSupabase = () => {
  const user = useSupabaseUser()
  const client = useSupabaseClient()

  const loading = ref(false)
  const error = ref<string | null>(null)

  const fetchModules = async () => {
    try {
      loading.value = true
      const { data, error: err } = await client
        .from('modules')
        .select('*')
        .order('order_number')

      if (err) throw err
      return data
    } catch (err) {
      error.value = err instanceof Error ? err.message : 'An error occurred'
      return []
    } finally {
      loading.value = false
    }
  }

  const fetchModuleSections = async (moduleId: string) => {
    try {
      loading.value = true
      const { data, error: err } = await client
        .from('sections')
        .select('*')
        .eq('module_id', moduleId)
        .order('order_number')

      if (err) throw err
      return data
    } catch (err) {
      error.value = err instanceof Error ? err.message : 'An error occurred'
      return []
    } finally {
      loading.value = false
    }
  }

  const fetchModuleQuiz = async (moduleId: string) => {
    try {
      loading.value = true
      const { data, error: err } = await client
        .from('quizzes')
        .select('*')
        .eq('module_id', moduleId)

      if (err) throw err
      return data
    } catch (err) {
      error.value = err instanceof Error ? err.message : 'An error occurred'
      return []
    } finally {
      loading.value = false
    }
  }

  const submitQuizAttempt = async (moduleId: string, score: number, answers: any) => {
    try {
      loading.value = true
      const passed = score >= 80
      const { data, error: err } = await client
        .from('quiz_attempts')
        .insert({
          module_id: moduleId,
          user_id: user.value?.id,
          score,
          passed,
          answers
        })
        .select()
        .single()

      if (err) throw err

      if (passed) {
        await updateUserProgress(moduleId, true)
      }

      return data
    } catch (err) {
      error.value = err instanceof Error ? err.message : 'An error occurred'
      return null
    } finally {
      loading.value = false
    }
  }

  const updateUserProgress = async (moduleId: string, completed: boolean) => {
    try {
      loading.value = true
      const { data, error: err } = await client
        .from('user_progress')
        .upsert({
          module_id: moduleId,
          user_id: user.value?.id,
          completed
        })
        .select()
        .single()

      if (err) throw err
      return data
    } catch (err) {
      error.value = err instanceof Error ? err.message : 'An error occurred'
      return null
    } finally {
      loading.value = false
    }
  }

  return {
    loading,
    error,
    fetchModules,
    fetchModuleSections,
    fetchModuleQuiz,
    submitQuizAttempt,
    updateUserProgress
  }
}