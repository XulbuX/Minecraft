<template>
  <div class="mb-5 flex flex-col gap-2 rounded-lg bg-gray-8 p-4 text-white">
    <div class="mr-5 flex flex-wrap items-center">
      <div class="w-36 select-none font-bold">
        Minecraft Colors:
      </div>
      <button
        v-for="color in minecraftColors"
        :key="color.label"
        class="mr-1 h-6 w-6 rounded"
        :style="{ backgroundColor: color.rgb }"
        :title="color.label"
        @click="$emit('applyColor', color.rgb)" />
    </div>
    <div class="mr-5 flex items-center">
      <div class="w-36 select-none font-bold">
        Custom Color:
      </div>
      <input
        v-model="customColorValue"
        class="h-6 w-6 rounded"
        type="color"
        @change="applyCustomColor">
    </div>
    <button
      class="select-none rounded bg-red-5 px-3 py-1 text-white transition-all duration-200 hover:bg-red-6"
      @click="$emit('resetFormatting')">
      Reset All Formatting
    </button>
  </div>
</template>

<script setup lang="ts">
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
