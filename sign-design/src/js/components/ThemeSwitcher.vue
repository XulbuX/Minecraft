<template>
  <div class="flex gap-2">
    <button
      v-for="themeOption in availableThemes"
      :key="themeOption.value"
      class="border border-gray-300 rounded px-3 py-1 dark:border-gray-700"
      :class="{
        'bg-sky-500 text-white dark:bg-sky-600': currentTheme === themeOption.value,
        'hover:bg-gray-100 dark:hover:bg-gray-800': currentTheme !== themeOption.value,
      }"
      @click="setTheme(themeOption.value)">
      {{ themeOption.label }}
    </button>
  </div>
</template>

<script setup lang="ts">
import { availableThemes, currentTheme, setTheme } from 'theme';
</script>
