<template>
  <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow">
    <h3 class="text-xl font-semibold text-cilari-800 mb-2">{{ module.title }}</h3>
    <p class="text-gray-600 mb-4">{{ module.description }}</p>
    
    <div class="flex items-center justify-between">
      <span 
        :class="[
          'px-3 py-1 rounded-full text-sm font-medium',
          progress?.completed 
            ? 'bg-green-100 text-green-800'
            : 'bg-yellow-100 text-yellow-800'
        ]"
      >
        {{ progress?.completed ? 'Completed' : 'In Progress' }}
      </span>
      
      <NuxtLink
        :to="`/modules/${module.id}`"
        class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-cilari-600 hover:bg-cilari-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cilari-500"
      >
        {{ progress?.completed ? 'Review Module' : 'Start Module' }}
      </NuxtLink>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  module: {
    id: string;
    title: string;
    description: string;
  };
  progress?: {
    completed: boolean;
  };
}>();
</script>