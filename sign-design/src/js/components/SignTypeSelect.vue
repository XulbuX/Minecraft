<template>
  <div class="relative max-w-300px w-full select-none">
    <div
      class="flex cursor-pointer items-center justify-between border border-gray-3 rounded p-3 transition-all duration-200 hover:border-gray-6"
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
        class="absolute z-10 max-h-250px w-full overflow-y-auto border border-t-0 border-gray-3 rounded-b bg-white shadow-md"
        :exit="{ opacity: 0, y: -10 }"
        :initial="{ opacity: 0, y: -10 }"
        :transition="{ duration: 0.2 }">
        <motion.div
          v-for="(option, index) in options"
          :key="option.value"
          :animate="{ opacity: 1, x: 0 }"
          class="cursor-pointer p-3 transition-all duration-200"
          :class="{ 'font-bold': modelValue === option.value }"
          :initial="{ opacity: 0, x: -5 }"
          :style="getOptionStyle(option)"
          :transition="{ delay: index * 0.03, duration: 0.2 }"
          @click="selectOption(option)"
          @mouseout="hoveredOption = null"
          @mouseover="hoveredOption = option">
          {{ option.label }}
        </motion.div>
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

function getOptionStyle(option: Option) {
  const isSelected = option.value === props.modelValue;
  const isHovered = option === hoveredOption.value;

  if (!option.rgb) {
    return {};
  }

  let backgroundColor = option.rgb;

  if (!isSelected) {
    backgroundColor = washOut(option.rgb, 0.8);
  }
  if (isHovered) {
    backgroundColor = darkenColor(backgroundColor, 0.15);
  }

  const textColor = getContrastingTextColor(option.rgb);

  return {
    backgroundColor,
    borderLeft: isSelected ? '4px solid #ffffff' : '4px solid transparent',
    color: textColor,
    fontWeight: isSelected ? 'bold' : 'normal',
  };
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

function darkenColor(color: string, amount: number) {
  const rgbMatch = color.match(/rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/i);
  if (rgbMatch) {
    const r = Math.max(0, Number.parseInt(rgbMatch[1], 10) * (1 - amount));
    const g = Math.max(0, Number.parseInt(rgbMatch[2], 10) * (1 - amount));
    const b = Math.max(0, Number.parseInt(rgbMatch[3], 10) * (1 - amount));
    return `rgb(${Math.round(r)}, ${Math.round(g)}, ${Math.round(b)})`;
  }
  return color;
}

function getContrastingTextColor(color: string) {
  const rgbMatch = color.match(/rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/i);
  if (rgbMatch) {
    const r = Number.parseInt(rgbMatch[1], 10);
    const g = Number.parseInt(rgbMatch[2], 10);
    const b = Number.parseInt(rgbMatch[3], 10);
    const brightness = (0.299 * r + 0.587 * g + 0.114 * b);
    return brightness < 128 ? '#FFFFFF' : '#000000';
  }
  return '#000000';
}
</script>
