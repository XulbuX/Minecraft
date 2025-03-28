<template>
  <div class="bg-gray-100 p-4 mb-5 rounded-lg flex flex-wrap items-center">
    <div class="flex flex-wrap items-center mr-5">
      <span class="mr-2 font-bold">Colors:</span>
      <button 
        v-for="color in minecraftColors" 
        :key="color.name"
        @click="$emit('applyColor', color.value)"
        class="w-6 h-6 m-0.5 border border-gray-700 rounded cursor-pointer"
        :style="{ backgroundColor: color.value }"
        :title="color.name">
      </button>
    </div>
    <div class="flex items-center mr-5">
      <label class="mr-2">Custom: </label>
      <input 
        type="color" 
        v-model="customColorValue" 
        @change="applyCustomColor"
        class="w-8 h-8 border-none cursor-pointer">
    </div>
    <button 
      @click="$emit('resetFormatting')"
      class="px-3 py-1 bg-red-500 text-white rounded border-none cursor-pointer hover:bg-red-600">
      Reset Formatting
    </button>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { MinecraftColor } from '../helpers/minecraftColors';

type Props = {
  minecraftColors: MinecraftColor[]
}

defineProps<Props>();

const emit = defineEmits<{
  (e: 'applyColor', color: string): void;
  (e: 'resetFormatting'): void;
}>();

const customColorValue = ref('#FFFFFF');

const applyCustomColor = () => {
  emit('applyColor', customColorValue.value);
};
</script>
