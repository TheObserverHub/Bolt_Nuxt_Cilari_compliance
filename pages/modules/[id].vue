<template>
  <div class="max-w-4xl mx-auto py-8">
    <div v-if="loading" class="text-center py-8">
      <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-cilari-600 mx-auto"></div>
    </div>
    
    <div v-else-if="error" class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded">
      {{ error }}
    </div>
    
    <template v-else>
      <div class="mb-8">
        <h1 class="text-3xl font-bold text-cilari-800">{{ module?.title }}</h1>
        <p class="mt-2 text-gray-600">{{ module?.description }}</p>
      </div>
      
      <div class="space-y-8">
        <template v-if="!showQuiz">
          <div v-for="section in sections" :key="section.id" class="bg-white rounded-lg shadow-md p-6">
            <h2 class="text-xl font-semibold text-cilari-800 mb-4">{{ section.title }}</h2>
            <div class="prose max-w-none" v-html="marked(section.content)"></div>
          </div>
          
          <div class="flex justify-end">
            <button
              @click="showQuiz = true"
              class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-cilari-600 hover:bg-cilari-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cilari-500"
            >
              Take Module Quiz
            </button>
          </div>
        </template>
        
        <div v-else class="bg-white rounded-lg shadow-md p-6">
          <h2 class="text-2xl font-bold text-cilari-800 mb-6">Module Quiz</h2>
          
          <form @submit.prevent="submitQuiz" class="space-y-6">
            <div v-for="(question, index) in quiz" :key="question.id" class="space-y-4">
              <p class="font-medium">{{ index + 1 }}. {{ question.question }}</p>
              
              <div class="space-y-2">
                <label 
                  v-for="option in question.options" 
                  :key="option"
                  class="flex items-center space-x-3"
                >
                  <input
                    type="radio"
                    :name="`question-${question.id}`"
                    :value="option"
                    v-model="answers[question.id]"
                    class="h-4 w-4 text-cilari-600 focus:ring-cilari-500"
                  >
                  <span>{{ option }}</span>
                </label>
              </div>
            </div>
            
            <div class="flex justify-end space-x-4">
              <button
                type="button"
                @click="showQuiz = false"
                class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cilari-500"
              >
                Back to Module
              </button>
              <button
                type="submit"
                :disabled="!isQuizComplete"
                class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-cilari-600 hover:bg-cilari-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cilari-500 disabled:opacity-50 disabled:cursor-not-allowed"
              >
                Submit Quiz
              </button>
            </div>
          </form>
        </div>
      </div>
    </template>
  </div>
</template>

<script setup lang="ts">
import { marked } from 'marked'

const route = useRoute()
const router = useRouter()
const { fetchModules, fetchModuleSections, fetchModuleQuiz, submitQuizAttempt } = useSupabase()

const loading = ref(false)
const error = ref<string | null>(null)
const module = ref<any>(null)
const sections = ref<any[]>([])
const quiz = ref<any[]>([])
const showQuiz = ref(false)
const answers = ref<Record<string, string>>({})

const isQuizComplete = computed(() => {
  return quiz.value.every(q => answers.value[q.id])
})

onMounted(async () => {
  try {
    loading.value = true
    const moduleId = route.params.id as string
    
    // Fetch module data
    const modules = await fetchModules()
    module.value = modules.find(m => m.id === moduleId)
    
    if (!module.value) {
      throw new Error('Module not found')
    }
    
    // Fetch sections and quiz
    sections.value = await fetchModuleSections(moduleId)
    quiz.value = await fetchModuleQuiz(moduleId)
  } catch (err) {
    error.value = err instanceof Error ? err.message : 'An error occurred'
  } finally {
    loading.value = false
  }
})

const submitQuiz = async () => {
  try {
    loading.value = true
    const moduleId = route.params.id as string
    
    // Calculate score
    const totalQuestions = quiz.value.length
    const correctAnswers = quiz.value.filter(q => 
      answers.value[q.id] === q.correct_answer
    ).length
    const score = Math.round((correctAnswers / totalQuestions) * 100)
    
    // Submit attempt
    const result = await submitQuizAttempt(moduleId, score, answers.value)
    
    if (result?.passed) {
      // Show success message and redirect to dashboard
      alert(`Congratulations! You passed the quiz with a score of ${score}%`)
      router.push('/dashboard')
    } else {
      // Show failure message and reset quiz
      alert(`You scored ${score}%. You need 80% to pass. Please try again.`)
      answers.value = {}
      showQuiz.value = false
    }
  } catch (err) {
    error.value = err instanceof Error ? err.message : 'An error occurred'
  } finally {
    loading.value = false
  }
}
</script>