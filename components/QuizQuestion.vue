<template>
  <div class="bg-white rounded-lg shadow-md p-6 mb-6">
    <p class="font-medium text-lg mb-4">{{ index + 1 }}. {{ question.question }}</p>
    
    <div class="space-y-3">
      <label 
        v-for="option in question.options" 
        :key="option"
        class="flex items-center space-x-3 p-3 rounded-lg border cursor-pointer hover:bg-gray-50"
        :class="{'border-cilari-500 bg-cilari-50': modelValue === option}"
      >
        <input
          type="radio"
          :name="`question-${question.id}`"
          :value="option"
          v-model="modelValue"
          class="h-4 w-4 text-cilari-600 focus:ring-cilari-500"
        >
        <span>{{ option }}</span>
      </label>
    </div>
  </div>
</template>

<script setup lang="ts">
const props = defineProps<{
  question: {
    id: string;
    question: string;
    options: string[];
  };
  index: number;
  modelValue: string;
}>();

const emit = defineEmits<{
  (e: 'update:modelValue', value: string): void;
}>();

watch(() => props.modelValue, (newValue) => {
  emit('update:modelValue', newValue);
});
</script>