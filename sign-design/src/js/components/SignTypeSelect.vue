<template>
  <div v-on-click-outside="closeDropdown" class="relative z-1000 max-w-300px w-full select-none">
    <div
      class="flex cursor-pointer items-center justify-between rounded-lg p-3 outline-1 outline-white/20 duration-200"
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
        class="ml-2 h-4 w-4"
        fill="none"
        :initial="{ rotate: 0 }"
        stroke="currentColor"
        :transition="{ duration: 0.3 }"
        viewBox="0 0 24 24">
        <path d="M19 9l-7 7-7-7" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
      </motion.svg>
    </div>
    <AnimatePresence>
      <motion.div
        v-if="isOpen"
        :animate="{ opacity: 1, y: 0 }"
        class="absolute max-h-62 w-full flex flex-col overflow-y-auto rounded-b-lg bg-gray-8/90 shadow-lg outline-1 outline-white/20 backdrop-blur-5"
        :exit="{ opacity: 0, y: -10 }"
        :initial="{ opacity: 0, y: -10 }"
        :transition="{ duration: 0.2 }">
        <div
          v-for="option in options"
          :key="option.value"
          class="cursor-pointer transition-all duration-200"
          :class="{ 'font-bold bg-white/10!': modelValue === option.value }"
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
