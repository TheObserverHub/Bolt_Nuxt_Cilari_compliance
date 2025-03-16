<template>
  <div class="bg-white rounded-lg shadow-md p-6 mb-6">
    <h2 class="text-2xl font-semibold text-cilari-800 mb-4">{{ section.title }}</h2>
    <div class="prose max-w-none" v-html="renderedContent"></div>
  </div>
</template>

<script setup lang="ts">
import { marked } from 'marked';

const props = defineProps<{
  section: {
    title: string;
    content: string;
    type: string;
  };
}>();

const renderedContent = computed(() => marked(props.section.content));
</script>