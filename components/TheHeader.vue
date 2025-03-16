<template>
  <header class="bg-white shadow">
    <nav class="container mx-auto px-4 py-4">
      <div class="flex items-center justify-between">
        <NuxtLink to="/" class="flex items-center space-x-2">
          <img src="/logo.svg" alt="Cilari Logo" class="h-8 w-8" />
          <span class="text-xl font-semibold text-cilari-800">Compliance Portal</span>
        </NuxtLink>
        
        <div v-if="isAuthenticated" class="flex items-center space-x-4">
          <NuxtLink 
            v-if="isAdmin"
            to="/admin" 
            class="text-gray-600 hover:text-cilari-600"
          >
            Admin Dashboard
          </NuxtLink>
          <NuxtLink 
            v-else
            to="/dashboard" 
            class="text-gray-600 hover:text-cilari-600"
          >
            Dashboard
          </NuxtLink>
          <button 
            @click="handleLogout" 
            class="text-gray-600 hover:text-cilari-600"
          >
            Logout
          </button>
        </div>
        <div v-else class="flex items-center space-x-4">
          <NuxtLink 
            to="/auth/login" 
            class="text-gray-600 hover:text-cilari-600"
          >
            Login
          </NuxtLink>
        </div>
      </div>
    </nav>
  </header>
</template>

<script setup lang="ts">
const router = useRouter()
const { user, logout } = useAuth()

const isAuthenticated = computed(() => !!user.value)
const isAdmin = computed(() => user.value?.role === 'admin')

const handleLogout = () => {
  logout()
  router.push('/auth/login')
}
</script>