<template>
  <div class="relative max-w-300px w-full select-none">
    <div
      class="flex cursor-pointer items-center justify-between rounded-lg p-3 duration-200"
      :class="{ 'rounded-b-none': isOpen }"
      :style="headerStyle"
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
        v-on-click-outside="closeDropdown"
        :animate="{ opacity: 1, y: 0 }"
        class="absolute z-10 max-h-62 w-full flex flex-col overflow-y-auto border border-t-0 border-gray-6 rounded-b-lg shadow-lg"
        :exit="{ opacity: 0, y: -10 }"
        :initial="{ opacity: 0, y: -10 }"
        :transition="{ duration: 0.2 }">
        <div
          v-for="option in options"
          :key="option.value"
          class="cursor-pointer bg-gray-8 transition-all duration-200"
          :class="{ 'font-bold bg-gray-7!': modelValue === option.value }"
          @click="selectOption(option)"
          @mouseout="hoveredOption = null"
          @mouseover="hoveredOption = option">
          <div class="flex flex-row">
            <div class="w-2" :style="{ backgroundColor: option.rgb }" />
            <div class="p-2">
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
  label: string;
  value?: string;
  rgb?: string;
  [key: string]: any;
};
type Props = {
  options: Option[];
  modelValue: string;
  placeholder?: string;
};

const props = withDefaults(defineProps<Props>(), {
  placeholder: 'Select an option',
});

const emit = defineEmits<{
  (e: 'update:modelValue', value: string): void;
}>();

const isOpen = ref(false);
const hoveredOption = ref<Option | null>(null);

const selectedOption = computed(() => {
  return props.options.find(option => option.value === props.modelValue);
});

const headerStyle = computed(() => {
  if (!selectedOption.value || !selectedOption.value.rgb) {
    return {};
  }

  return {
    backgroundColor: washOut(selectedOption.value.rgb, 0.5),
    borderColor: selectedOption.value.rgb,
  };
});

const toggleDropdown = () => isOpen.value = !isOpen.value;
const closeDropdown = () => isOpen.value = false;

function selectOption(option: Option) {
  emit('update:modelValue', option.value ?? '');
  closeDropdown();
}

function washOut(color: string, strength: number) {
  const rgbMatch = color.match(/rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/i);
  if (rgbMatch) {
    const r = Number.parseInt(rgbMatch[1], 10);
    const g = Number.parseInt(rgbMatch[2], 10);
    const b = Number.parseInt(rgbMatch[3], 10);
    const washedR = Math.round(r * (1 - strength) + 255 * strength);
    const washedG = Math.round(g * (1 - strength) + 255 * strength);
    const washedB = Math.round(b * (1 - strength) + 255 * strength);
    return `rgb(${washedR}, ${washedG}, ${washedB})`;
  }
  return color;
}
</script>
