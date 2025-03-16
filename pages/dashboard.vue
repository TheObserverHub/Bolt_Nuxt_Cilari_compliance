<template>
  <div class="max-w-4xl mx-auto py-8">
    <h1 class="text-3xl font-bold text-cilari-800 mb-8">Compliance Training Dashboard</h1>
    
    <div v-if="loading" class="text-center py-8">
      <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-cilari-600 mx-auto"></div>
    </div>
    
    <div v-else-if="error" class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded">
      {{ error }}
    </div>
    
    <div v-else>
      <!-- Not Started -->
      <div v-if="!hasStarted" class="text-center py-12">
        <div class="bg-white rounded-lg shadow-md p-8">
          <h2 class="text-2xl font-semibold text-cilari-800 mb-4">Welcome to Compliance Training</h2>
          <p class="text-gray-600 mb-6">Complete all required modules to ensure compliance with company policies.</p>
          <NuxtLink
            :to="`/modules/${firstModule?.id}`"
            class="inline-flex items-center px-6 py-3 border border-transparent rounded-md shadow-sm text-base font-medium text-white bg-cilari-600 hover:bg-cilari-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cilari-500"
          >
            Start Training
          </NuxtLink>
        </div>
      </div>

      <!-- In Progress -->
      <div v-else-if="!isCompleted" class="space-y-6">
        <div class="bg-white rounded-lg shadow-md p-6 mb-8">
          <div class="flex items-center justify-between mb-4">
            <h2 class="text-xl font-semibold text-cilari-800">Training Progress</h2>
            <span class="text-gray-600">{{ completedCount }} of {{ modules.length }} modules completed</span>
          </div>
          <div class="w-full bg-gray-200 rounded-full h-2.5">
            <div 
              class="bg-cilari-600 h-2.5 rounded-full" 
              :style="{ width: `${(completedCount / modules.length) * 100}%` }"
            ></div>
          </div>
        </div>

        <div v-for="module in modules" :key="module.id" class="bg-white rounded-lg shadow-md p-6">
          <div class="flex items-center justify-between">
            <h2 class="text-xl font-semibold text-cilari-800">{{ module.title }}</h2>
            <span 
              :class="[
                'px-3 py-1 rounded-full text-sm font-medium',
                userProgress[module.id]?.completed 
                  ? 'bg-green-100 text-green-800'
                  : previousModuleCompleted(module) 
                    ? 'bg-yellow-100 text-yellow-800'
                    : 'bg-gray-100 text-gray-800'
              ]"
            >
              {{ 
                userProgress[module.id]?.completed 
                  ? 'Completed' 
                  : previousModuleCompleted(module)
                    ? 'In Progress'
                    : 'Locked'
              }}
            </span>
          </div>
          
          <p class="mt-2 text-gray-600">{{ module.description }}</p>
          
          <div class="mt-4">
            <NuxtLink
              v-if="userProgress[module.id]?.completed || previousModuleCompleted(module)"
              :to="`/modules/${module.id}`"
              class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-cilari-600 hover:bg-cilari-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cilari-500"
            >
              {{ userProgress[module.id]?.completed ? 'Review Module' : 'Start Module' }}
            </NuxtLink>
          </div>
        </div>
      </div>

      <!-- Completed -->
      <div v-else class="text-center py-12">
        <div class="bg-white rounded-lg shadow-md p-8">
          <div class="mb-6">
            <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
              </svg>
            </div>
            <h2 class="text-2xl font-semibold text-cilari-800 mb-2">Congratulations!</h2>
            <p class="text-gray-600">You have successfully completed all compliance training modules.</p>
          </div>
          
          <div class="space-y-4">
            <p class="text-gray-600">You can review any module at any time:</p>
            <div class="flex flex-wrap gap-4 justify-center">
              <NuxtLink
                v-for="module in modules"
                :key="module.id"
                :to="`/modules/${module.id}`"
                class="inline-flex items-center px-4 py-2 border border-cilari-600 rounded-md text-sm font-medium text-cilari-600 hover:bg-cilari-50"
              >
                Review {{ module.title }}
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const { user } = useAuth()
const loading = ref(false)
const error = ref<string | null>(null)
const modules = ref<any[]>([])
const userProgress = ref<Record<string, any>>({})

// Computed properties
const hasStarted = computed(() => Object.keys(userProgress.value).length > 0)
const completedCount = computed(() => Object.values(userProgress.value).filter(p => p.completed).length)
const isCompleted = computed(() => completedCount.value === modules.value.length)
const firstModule = computed(() => modules.value[0])

// Helper function to check if previous module is completed
const previousModuleCompleted = (module: any) => {
  const moduleIndex = modules.value.findIndex(m => m.id === module.id)
  if (moduleIndex === 0) return true // First module is always available
  const previousModule = modules.value[moduleIndex - 1]
  return userProgress.value[previousModule.id]?.completed
}

onMounted(async () => {
  try {
    loading.value = true
    
    // Fetch modules
    const modulesResponse = await $fetch('/api/modules')
    modules.value = modulesResponse.modules
    
    // Fetch user progress
    if (user.value) {
      const progressResponse = await $fetch('/api/user/progress')
      userProgress.value = progressResponse.progress.reduce((acc: any, curr: any) => ({
        ...acc,
        [curr.module_id]: curr
      }), {})
    }
  } catch (err) {
    error.value = err instanceof Error ? err.message : 'An error occurred'
  } finally {
    loading.value = false
  }
})
</script>