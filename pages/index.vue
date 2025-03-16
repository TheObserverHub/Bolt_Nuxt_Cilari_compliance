<template>
  <div class="max-w-4xl mx-auto py-12 px-4">
    <div class="text-center mb-12">
      <h1 class="text-4xl font-bold text-cilari-800 mb-4">Welcome to Cilari Compliance Training</h1>
      <p class="text-xl text-gray-600">Complete all required modules to ensure compliance with company policies.</p>
    </div>

    <div v-if="!isAuthenticated" class="text-center">
      <NuxtLink
        to="/auth/login"
        class="inline-flex items-center px-6 py-3 border border-transparent rounded-md shadow-sm text-base font-medium text-white bg-cilari-600 hover:bg-cilari-700"
      >
        Sign In to Access Training
      </NuxtLink>
    </div>

    <div v-else>
      <div class="text-center">
        <NuxtLink
          :to="isAdmin ? '/admin' : '/dashboard'"
          class="inline-flex items-center px-6 py-3 border border-transparent rounded-md shadow-sm text-base font-medium text-white bg-cilari-600 hover:bg-cilari-700"
        >
          {{ isAdmin ? 'Go to Admin Dashboard' : 'Go to Dashboard' }}
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const { user } = useAuth()

const isAuthenticated = computed(() => !!user.value)
const isAdmin = computed(() => user.value?.role === 'admin')
</script>