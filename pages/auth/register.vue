<template>
  <div class="min-h-[80vh] flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
      <h2 class="text-2xl font-bold text-cilari-800 mb-6">Create Account</h2>
      
      <form @submit.prevent="handleRegister" class="space-y-6">
        <div>
          <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
          <input
            id="email"
            type="email"
            v-model="email"
            required
            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-cilari-500 focus:ring-cilari-500"
          />
        </div>

        <div>
          <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
          <input
            id="password"
            type="password"
            v-model="password"
            required
            minlength="8"
            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-cilari-500 focus:ring-cilari-500"
          />
          <p class="mt-1 text-sm text-gray-500">Password must be at least 8 characters long</p>
        </div>

        <div v-if="error" class="bg-red-50 border border-red-400 text-red-700 px-4 py-3 rounded">
          {{ error }}
        </div>

        <button
          type="submit"
          :disabled="loading"
          class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-cilari-600 hover:bg-cilari-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cilari-500 disabled:opacity-50"
        >
          {{ loading ? 'Creating account...' : 'Create Account' }}
        </button>

        <div class="text-center">
          <NuxtLink to="/auth/login" class="text-sm text-cilari-600 hover:text-cilari-500">
            Already have an account? Sign in
          </NuxtLink>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup lang="ts">
const client = useSupabaseAuthClient();
const router = useRouter();

const email = ref('');
const password = ref('');
const loading = ref(false);
const error = ref<string | null>(null);

const handleRegister = async () => {
  try {
    loading.value = true;
    error.value = null;

    const { error: err } = await client.auth.signUp({
      email: email.value,
      password: password.value
    });

    if (err) throw err;

    router.push('/dashboard');
  } catch (err) {
    error.value = err instanceof Error ? err.message : 'An error occurred during registration';
  } finally {
    loading.value = false;
  }
};
</script>