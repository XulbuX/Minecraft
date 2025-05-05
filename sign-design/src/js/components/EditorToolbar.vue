<template>
  <div class="toolbar flex flex-wrap items-center gap-x-2 gap-y-3 border border-b-0 border-gray-6 rounded-t-lg bg-gray-8 p-3">
    <div class="flex gap-2">
      <button
        class="border border-gray-6 rounded bg-gray-7 px-2 py-1 hover:bg-gray-6"
        :class="{ 'bg-gray-6! font-bold border-gray-5!': editor.isActive('bold') }"
        @click="toggleBold">
        Bold
      </button>
      <button
        class="border border-gray-6 rounded bg-gray-7 px-2 py-1 hover:bg-gray-6"
        :class="{ 'bg-gray-6! font-bold border-gray-5!': editor.isActive('italic') }"
        @click="toggleItalic">
        Italic
      </button>
      <button
        class="border border-gray-6 rounded bg-gray-7 px-2 py-1 hover:bg-gray-6"
        :class="{ 'bg-gray-6! font-bold border-gray-5!': editor.isActive('underline') }"
        @click="toggleUnderline">
        Underline
      </button>
    </div>

    <div class="flex flex-wrap items-center gap-1">
      <span class="mr-2 select-none text-sm text-gray-3 font-semibold">MC Colors:</span>
      <motion.div
        v-for="color in minecraftColors"
        :key="color.label"
        class="h-5 w-5 cursor-pointer border border-white/33 rounded"
        :style="{ backgroundColor: color.rgb }"
        :title="color.label"
        :while-hover="{ scale: 1.1, y: -2 }"
        :while-tap="{ scale: 0.95 }"
        @click="$emit('applyColor', color.rgb)" />
    </div>

    <div class="flex items-center gap-2">
      <span class="select-none text-sm text-gray-3 font-semibold">Custom:</span>
      <ColorPicker
        v-model="customColorValue"
        @update:model-value="applyCustomColor" />
    </div>

    <motion.button
      class="ml-auto select-none rounded bg-red-5 px-3 py-1 text-sm transition-colors duration-200 hover:bg-red-6"
      :while-hover="{ scale: 1.05 }"
      :while-tap="{ scale: 0.98 }"
      @click="$emit('resetFormatting')">
      Reset Selected
    </motion.button>
  </div>
</template>

<script setup lang="ts">
import type { EditorInstance } from '@@/interfaces';
import { motion } from 'motion-v';
import ColorPicker from './ColorPicker.vue';

const { editor } = defineProps<{
  editor: EditorInstance;
  minecraftColors: MinecraftColor[];
}>();

const emit = defineEmits<{
  (e: 'applyColor', color: string): void;
  (e: 'resetFormatting'): void;
}>();

const customColorValue = ref('#FFFFFF');

function toggleBold() {
  editor.chain().focus().toggleBold({ keepMarks: true }).run();
}

function toggleItalic() {
  editor.chain().focus().toggleItalic({ keepMarks: true }).run();
}

function toggleUnderline() {
  editor.chain().focus().toggleUnderline({ keepMarks: true }).run();
}

const applyCustomColor = () => emit('applyColor', customColorValue.value);
</script>
