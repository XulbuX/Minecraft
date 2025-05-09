<template>
  <div v-on-click-outside="closeDropdown" class="relative z-10 max-w-70 min-w-40 w-1/2 select-none">
    <div
      class="flex cursor-pointer items-center justify-between rounded-lg p-3 transition-all-200"
      :class="{
        'rounded-b-0': isOpen,
        'text-white!': selectedOption?.isDark,
        'text-black!': !selectedOption?.isDark,
      }"
      :style="{ backgroundColor: selectedOption?.rgb }"
      @click="toggleDropdown">
      <span class="truncate">{{ selectedOption ? selectedOption.label : placeholder }}</span>
      <motion.svg
        :animate="{ rotate: isOpen ? 180 : 0 }"
        class="ml-2 size-4 min-w-4"
        fill="currentColor"
        :initial="{ rotate: 0 }"
        stroke="none"
        :transition="{ duration: 0.3 }"
        viewBox="0 0 448 512">
        <path d="M201.4 374.6c12.5 12.5 32.8 12.5 45.3 0l160-160c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L224 306.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l160 160z" />
      </motion.svg>
    </div>
    <AnimatePresence>
      <motion.div
        v-if="isOpen"
        :animate="{ opacity: 1, y: 0 }"
        class="absolute max-h-62 w-full flex flex-col overflow-y-auto rounded-b-lg bg-gray-200/90 shadow-lg ring-0.5 ring-black/10 backdrop-blur-5 transition-background-color-200 dark:bg-gray-800/90 dark:ring-white/20"
        :exit="{ opacity: 0, y: -10 }"
        :initial="{ opacity: 0, y: -10 }"
        :transition="{ duration: 0.2 }">
        <div
          v-for="option in options"
          :key="option.value"
          class="cursor-pointer transition-all-200"
          :class="{ 'font-bold bg-black/5! dark:bg-white/10!': modelValue === option.value }"
          @click="selectOption(option)"
          @mouseout="hoveredOption = null"
          @mouseover="hoveredOption = option">
          <div class="flex flex-row">
            <div class="w-2" :style="{ backgroundColor: option.rgb }" />
            <div class="px-2.5 py-2">
              {{ option.label }}
            </div>
          </div>
        </div>
      </motion.div>
    </AnimatePresence>
  </div>
</template>

<script setup lang="ts">
import { vOnClickOutside } from '@vueuse/components';
import { AnimatePresence, motion } from 'motion-v';

type Option = {
  [key: string]: any;
  isDark: boolean;
  label: string;
  rgb: string;
  value: string;
};

const { modelValue, options } = defineProps<{
  options: Option[];
  modelValue: string;
  placeholder?: string;
}>();

const emit = defineEmits<{
  (e: 'update:modelValue', value: string): void;
}>();

const isOpen = ref(false);
const hoveredOption = ref<Option | null>(null);
const selectedOption = computed(() => options.find(option => option.value === modelValue));

const toggleDropdown = () => isOpen.value = !isOpen.value;
const closeDropdown = () => isOpen.value = false;

function selectOption(option: Option) {
  emit('update:modelValue', option.value ?? '');
  closeDropdown();
}
</script>
