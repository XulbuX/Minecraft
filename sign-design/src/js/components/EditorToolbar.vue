<template>
  <div class="flex flex-wrap select-none items-center gap-x-4 gap-y-3 border border-b-0 border-black/5 rounded-t-lg bg-gray-2 px-3.5 py-3 dark:border-white/10 dark:bg-gray-8">
    <div class="w-min flex flex-wrap gap-1 sm:w-auto">
      <div v-for="(row, rowIndex) in colorRows" :key="rowIndex" class="flex flex-row items-center gap-1">
        <motion.button
          v-for="color in row"
          :key="color.label"
          class="size-5 cursor-pointer rounded"
          :class="{ 'inset-border': currentTheme === 'dark' ? color.isDark : !color.isDark }"
          :style="{ backgroundColor: color.rgb }"
          :title="color.label"
          :while-hover="{ scale: 1.1 }"
          :while-press="{ scale: 0.95 }"
          @click="$emit('applyColor', color.rgb)" />
      </div>
    </div>

    <ColorPicker v-model="customColorValue" title="Pick Custom Color" @update:model-value="applyCustomColor" />

    <div class="flex grow flex-wrap items-center justify-between gap-4">
      <div class="flex flex-row gap-1">
        <button
          class="format-b size-6 flex items-center justify-center border border-black/5 rounded bg-gray-3 text-lg leading-none transition-all-200 dark:border-white/10 dark:bg-gray-7 -tracking-0.5"
          :class="{ 'brightness-83 dark:brightness-133': editor?.isActive('bold') }"
          title="Bold"
          @click="toggleBold">
          B
        </button>
        <button
          class="format-i size-6 flex items-center justify-center border border-black/5 rounded bg-gray-3 text-lg leading-none tracking-0.2 transition-all-200 dark:border-white/10 dark:bg-gray-7"
          :class="{ 'brightness-83 dark:brightness-133': editor?.isActive('italic') }"
          title="Italic"
          @click="toggleItalic">
          I
        </button>
        <button
          class="format-u size-6 flex items-center justify-center border border-black/5 rounded bg-gray-3 text-lg leading-none transition-all-200 dark:border-white/10 dark:bg-gray-7 -tracking-0.2"
          :class="{ 'brightness-83 dark:brightness-133': editor?.isActive('underline') }"
          title="Underline"
          @click="toggleUnderline">
          U
        </button>
      </div>

      <button
        class="ml-auto size-6 flex items-center justify-center border border-black/14 rounded bg-red-4/80 px-0.75 transition-all-200 dark:border-white/14 dark:bg-red-5/80 hover:bg-red-4 dark:hover:bg-red-5"
        title="Reset Formatting"
        @click="$emit('resetFormatting')">
        <svg fill="currentColor" stroke="none" viewBox="0 0 640 512" xmlns="http://www.w3.org/2000/svg">
          <path d="M38.8 5.1C28.4-3.1 13.3-1.2 5.1 9.2S-1.2 34.7 9.2 42.9l592 464c10.4 8.2 25.5 6.3 33.7-4.1s6.3-25.5-4.1-33.7L355.7 253.5 400.2 96 503 96 497 120.2c-4.3 17.1 6.1 34.5 23.3 38.8s34.5-6.1 38.8-23.3l11-44.1C577.6 61.3 554.7 32 523.5 32L376.1 32l-.3 0L204.5 32c-22 0-41.2 15-46.6 36.4l-6.3 25.2L38.8 5.1zm168 131.7c.1-.3 .2-.7 .3-1L217 96l116.7 0L301.3 210.8l-94.5-74.1zM243.3 416L192 416c-17.7 0-32 14.3-32 32s14.3 32 32 32l160 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-42.2 0 17.6-62.1L272.9 311 243.3 416z" />
        </svg>
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { Editor } from '@tiptap/vue-3';
import { motion } from 'motion-v';
import { currentTheme } from 'theme';
import ColorPicker from './ColorPicker.vue';

const { editor, minecraftColors } = defineProps<{
  editor?: Editor;
  minecraftColors: MinecraftColor[];
}>();

const emit = defineEmits<{
  (e: 'applyColor', color: string): void;
  (e: 'resetFormatting'): void;
}>();

const customColorValue = ref(currentTheme.value === 'dark' ? '#FFFFFF' : '#000000');

const colorRows = computed(() => {
  const chunkSize = 8;
  const result = [];
  for (let i = 0; i < minecraftColors.length; i += chunkSize) {
    result.push(minecraftColors.slice(i, i + chunkSize));
  }
  return result;
});

function toggleBold() {
  editor?.chain().focus().toggleBold().run();
}

function toggleItalic() {
  editor?.chain().focus().toggleItalic().run();
}

function toggleUnderline() {
  editor?.chain().focus().toggleUnderline().run();
}

const applyCustomColor = () => emit('applyColor', customColorValue.value);
</script>

<style scoped>
.inset-border {
  box-shadow: inset 0 0 0 0.5px rgb(var(--white-rgb) / 0.5);
}
[data-theme="light"] .inset-border {
  box-shadow: inset 0 0 0 0.5px rgb(var(--white-rgb) / 0.2);
}
</style>
