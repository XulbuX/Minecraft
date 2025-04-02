<template>
  <div class="mb-5 flex flex-col gap-2 rounded-lg bg-gray-8 p-4">
    <div class="mr-5 flex flex-wrap items-center">
      <div class="w-36 select-none font-bold">
        Minecraft Colors:
      </div>
      <motion.div
        v-for="color in minecraftColors"
        :key="color.label"
        class="mr-1 h-6 w-6 rounded"
        :style="{ backgroundColor: color.rgb }"
        :title="color.label"
        :while-hover="{ scale: 1.1 }"
        :while-press="{ scale: 0.95 }"
        @click="$emit('applyColor', color.rgb)" />
    </div>
    <div class="mr-5 flex items-center">
      <div class="w-36 select-none font-bold">
        Custom Color:
      </div>
      <ColorPicker
        v-model="customColorValue"
        @change="applyCustomColor" />
    </div>
    <motion.button
      class="select-none rounded bg-red-5 px-3 py-1 transition-all duration-200 hover:bg-red-6"
      @click="$emit('resetFormatting')">
      Reset All Formatting
    </motion.button>
  </div>
</template>

<script setup lang="ts">
import { motion } from 'motion-v';
import ColorPicker from './ColorPicker.vue';

type MinecraftColor = {
  idx: number;
  label: string;
  rgb: string;
  mcName?: string;
};

type Props = {
  minecraftColors: MinecraftColor[];
};

defineProps<Props>();

const emit = defineEmits<{
  (e: 'applyColor', color: string): void;
  (e: 'resetFormatting'): void;
}>();

const customColorValue = ref('#FFFFFF');
const applyCustomColor = () => emit('applyColor', customColorValue.value);
</script>
