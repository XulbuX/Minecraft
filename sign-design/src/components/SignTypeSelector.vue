<template>
  <div class="mb-5">
    <label class="mr-2 font-medium">Sign Type:</label>
    <select
      class="min-w-50 border border-gray-3 rounded px-3 py-2 focus:border-blue-5 focus:outline-none focus:ring-2 focus:ring-blue-2"
      :value="modelValue"
      @input="$emit('update:modelValue', ($event.target as HTMLSelectElement).value)">
      <option v-for="(signType, idx) in signTypes" :key="idx" :value="signType.value">
        {{ signType.label }}
      </option>
    </select>
  </div>
</template>

<script setup lang="ts">
import type { SignType } from 'helpers/minecraftColors';

type Props = {
  signTypes: SignType[];
  modelValue: string;
};

defineProps<Props>();
defineEmits<{
  (e: 'update:modelValue', value: string): void;
}>();
</script>
