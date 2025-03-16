<template>
  <div class="max-w-7xl mx-auto py-8 px-4">
    <div class="mb-8">
      <div class="flex items-center gap-4">
        <button
          @click="router.back()"
          class="text-cilari-600 hover:text-cilari-700"
        >
          ← Back
        </button>
        <h1 class="text-3xl font-bold text-cilari-800">User Progress Details</h1>
      </div>
      <p class="text-gray-600 mt-2">{{ user?.email }}</p>
    </div>

    <div class="bg-white rounded-lg shadow-md p-6">
      <h2 class="text-xl font-semibold text-cilari-800 mb-4">Module Progress</h2>
      
      <div class="space-y-6">
        <div v-for="module in modules" :key="module.id" class="border-b pb-6 last:border-b-0">
          <div class="flex items-center justify-between mb-2">
            <h3 class="text-lg font-medium text-gray-900">{{ module.title }}</h3>
            <span 
              :class="[
                'px-3 py-1 rounded-full text-sm font-medium',
                module.completed 
                  ? 'bg-green-100 text-green-800'
                  : 'bg-yellow-100 text-yellow-800'
              ]"
            >
              {{ module.completed ? 'Completed' : 'In Progress' }}
            </span>
          </div>
          
          <p class="text-gray-600 mb-4">{{ module.description }}</p>
          
          <div v-if="module.quiz_attempts && module.quiz_attempts.length > 0">
            <h4 class="text-sm font-medium text-gray-700 mb-2">Quiz Attempts</h4>
            <div class="space-y-2">
              <div 
                v-for="attempt in module.quiz_attempts" 
                :key="attempt.created_at"
                class="flex items-center gap-4 text-sm"
              >
                <span>Score: {{ attempt.score }}%</span>
                <span>{{ attempt.passed ? 'Passed' : 'Failed' }}</span>
                <span class="text-gray-500">{{ formatDate(attempt.created_at) }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const route = useRoute();
const router = useRouter();
const client = useSupabaseClient();

const user = ref<any>(null);
const modules = ref<any[]>([]);
const loading = ref(false);
const error = ref<string | null>(null);

// Format date helper
const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString();
};

// Fetch user details and progress
const fetchUserProgress = async () => {
  try {
    loading.value = true;
    const userId = route.params.id as string;

    // Get user details
    const { data: userData, error: userError } = await client
      .from('users')
      .select('email')
      .eq('id', userId)
      .single();

    if (userError) throw userError;
    user.value = userData;

    // Get modules with progress
    const { data: moduleData, error: moduleError } = await client
      .from('modules')
      .select(`
        *,
        user_progress!inner (
          completed,
          updated_at
        ),
        quiz_attempts (
          score,
          passed,
          created_at
        )
      `)
      .eq('user_progress.user_id', userId)
      .order('order_number');

    if (moduleError) throw moduleError;
    modules.value = moduleData || [];
  } catch (err) {
    error.value = err instanceof Error ? err.message : 'An error occurred while fetching user progress';
  } finally {
    loading.value = false;
  }
};

// Initial fetch
onMounted(fetchUserProgress);
</script>