<template>
  <div class="mb-5 flex flex-wrap items-center rounded-lg bg-gray-8 p-4 text-white">
    <div class="mr-5 flex flex-wrap items-center">
      <span class="mr-2 font-bold">Colors:</span>
      <button
        v-for="color in minecraftColors"
        :key="color.label"
        class="m-0.5 h-6 w-6 cursor-pointer rounded border-none"
        :style="{ backgroundColor: color.rgb }"
        :title="color.label"
        @click="$emit('applyColor', color.rgb)" />
    </div>
    <div class="mr-5 flex items-center">
      <label class="mr-2">Custom: </label>
      <input
        v-model="customColorValue"
        class="h-6 w-6 cursor-pointer rounded border-none"
        type="color"
        @change="applyCustomColor">
    </div>
    <button
      class="cursor-pointer rounded border-none bg-red-5 px-3 py-1 text-white transition-all duration-200 hover:bg-red-6"
      @click="$emit('resetFormatting')">
      Reset Formatting
    </button>
  </div>
</template>

<script setup lang="ts">
import type { MinecraftColor } from 'helpers/minecraftColors';
import { ref } from 'vue';

type Props = {
  minecraftColors: MinecraftColor[];
};

defineProps<Props>();

const emit = defineEmits<{
  (e: 'applyColor', color: string): void;
  (e: 'resetFormatting'): void;
}>();

const customColorValue = ref('#FFFFFF');

function applyCustomColor() {
  emit('applyColor', customColorValue.value);
}
</script>
