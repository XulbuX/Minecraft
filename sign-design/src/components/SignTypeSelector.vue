<template>
  <div class="mb-5">
    <label class="mr-2 font-medium">Sign Type:</label>
    <select 
      :value="modelValue" 
      @input="$emit('update:modelValue', ($event.target as HTMLSelectElement).value)"
      class="py-2 px-3 rounded border border-gray-300 min-w-[200px] focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-200">
      <option v-for="(signType, idx) in signTypes" :key="idx" :value="signType.label">
        {{ signType.label }}
      </option>
    </select>
  </div>
</template>

<script setup lang="ts">
import { SignType } from 'helpers/minecraftColors';

type Props = {
  signTypes: SignType[];
  modelValue: string;
}

defineProps<Props>();
defineEmits<{
  (e: 'update:modelValue', value: string): void;
}>();
</script>
