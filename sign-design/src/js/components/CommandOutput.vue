<template>
  <div class="shadow-x relative flex items-center justify-end overflow-clip border border-black/5 rounded-lg bg-gray-200 transition-all-200 dark:border-white/10 dark:bg-gray-800">
    <Command :generated-command />
    <button
      class="absolute right-0 top-0 z-10 m-1 size-8 flex select-none items-center justify-center border border-black/5 rounded p-1 backdrop-blur-5 transition-all-200 dark:border-white/10"
      :class="buttonClass"
      @click="copyCommand">
      <motion.svg
        :animate="iconState"
        class="size-4"
        fill="currentColor"
        :initial="{ scale: 1, rotate: 0 }"
        :transition="{ duration: 0.5, type: 'spring' }"
        viewBox="0 0 512 512">
        <path v-if="!copied" d="M288 448L64 448l0-224 64 0 0-64-64 0c-35.3 0-64 28.7-64 64L0 448c0 35.3 28.7 64 64 64l224 0c35.3 0 64-28.7 64-64l0-64-64 0 0 64zm-64-96l224 0c35.3 0 64-28.7 64-64l0-224c0-35.3-28.7-64-64-64L224 0c-35.3 0-64 28.7-64 64l0 224c0 35.3 28.7 64 64 64z" />
        <path v-else-if="copySuccess" d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z" />
        <path v-else d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm121.6 313.1c4.7 4.7 4.7 12.3 0 17L338 377.6c-4.7 4.7-12.3 4.7-17 0L256 312l-65.1 65.6c-4.7 4.7-12.3 4.7-17 0L134.4 338c-4.7-4.7-4.7-12.3 0-17l65.6-65-65.6-65.1c-4.7-4.7-4.7-12.3 0-17l39.6-39.6c4.7-4.7 12.3-4.7 17 0l65 65.7 65.1-65.6c4.7-4.7 12.3-4.7 17 0l39.6 39.6c4.7 4.7 4.7 12.3 0 17L312 256l65.6 65.1z" />
      </motion.svg>
    </button>
    <button
      v-if="generatedCommand.length > 256"
      v-tooltip="tooltipOptions"
      class="absolute right-0 top-9 z-10 m-1 size-8 flex select-none items-center justify-center border border-black/5 rounded bg-yellow-400/50 p-1 color-yellow-600 backdrop-blur-5 transition-all-200 dark:border-white/10 dark:bg-yellow-600/50 dark:color-yellow">
      <svg class="size-4.5" fill="currentColor" viewBox="0 0 128 512">
        <path d="M96 64c0-17.7-14.3-32-32-32S32 46.3 32 64l0 256c0 17.7 14.3 32 32 32s32-14.3 32-32L96 64zM64 480a40 40 0 1 0 0-80 40 40 0 1 0 0 80z" />
      </svg>
    </button>
  </div>
</template>

<script setup lang="ts">
import type { FormattedLines, TextSegment } from '@@/interfaces';
import { fixTablesKey } from '@tiptap/pm/tables';
import { getMinecraftColorFormat } from 'minecraft';
import { motion } from 'motion-v';
import 'floating-vue/dist/style.css';

const { defaultColor, formattedLines, signType } = defineProps<{
  formattedLines: FormattedLines;
  signType: string;
  defaultColor: string;
}>();

const copied = ref(false);
const copySuccess = ref(false);
const animationTimer = ref<number | null>(null);

const tooltipOptions = computed(() => ({
  content: 'This command must be run in a command block as it is too long for chat.',
  placement: 'left',
  popperTriggers: ['hover', 'click'],
  theme: 'warning-tooltip',
  triggers: ['hover', 'click'],
}));

const generatedCommand = computed(() => {
  const signFrontMsgs = formatSignMessages(formattedLines.front);
  const signBackMsgs = formatSignMessages(formattedLines.back);
  const frontText = `front_text:{color:"${defaultColor}",messages:[${signFrontMsgs.join(',')}]}`;
  const backText = `back_text:{color:"${defaultColor}",messages:[${signBackMsgs.join(',')}]}`;
  return `/give @p ${signType}[block_entity_data={${frontText},${backText},id:"minecraft:sign"}] 1`;
});

const buttonClass = computed(() => {
  if (!copied.value) return 'color-black/50 dark:color-white bg-gray-400/30 dark:bg-gray-600/50 hover:bg-gray-400/50 dark:hover:bg-gray-500/50';
  return copySuccess.value ? 'color-teal-600 dark:color-teal-300 bg-teal-300/40 dark:bg-teal-400/40' : 'color-red-600 dark:color-red-300 bg-red-300/40 dark:bg-red-400/40';
});

const iconState = computed(() => {
  if (!copied.value) return { rotate: 0, scale: 1 };
  if (copySuccess.value) return { rotate: 0, scale: 1.2 };
  else return { rotate: 15, scale: 1.1 };
});

function formatSignMessages(lines: TextSegment[][]): string[] {
  return lines.map((line) => {
    if (line.length === 0 || (line.length === 1 && line[0].text === '\n')) return `'""'`;

    let segments = line.map((segment: TextSegment) => {
      const text = segment.text.replace(/\n/g, '').replace(/"/g, '\\"');
      const parts = [];
      if (segment.color) {
        const formattedSegmentColor = getMinecraftColorFormat(segment.color);
        if (formattedSegmentColor !== defaultColor) parts.push(`"color":"${formattedSegmentColor}"`);
      }
      if (segment.bold) parts.push('"bold":true');
      if (segment.italic) parts.push('"italic":true');
      if (segment.underline) parts.push('"underlined":true');
      if (text.length === 0 && parts.length === 0) return '""';
      if (parts.length === 0) return `"${text}"`;
      return `{"text":"${text}",${parts.join(',')}}`;
    });

    if (segments.length > 1) segments = segments.filter(s => s !== '""');
    if (segments.length === 0 || (segments.length === 1 && segments[0] === '""')) return `'""'`;
    if (segments.length > 1) return `'[${segments.join(',')}]'`;
    return `'${segments[0]}'`;
  });
}

function copyCommand(): void {
  if (animationTimer.value) clearTimeout(animationTimer.value);
  navigator.clipboard.writeText(generatedCommand.value)
    .then(() => {
      copied.value = true;
      copySuccess.value = true;
      animationTimer.value = window.setTimeout(() => copied.value = false, 2000);
    })
    .catch(() => {
      copied.value = true;
      copySuccess.value = false;
      animationTimer.value = window.setTimeout(() => copied.value = false, 2000);
    });
}
</script>

<style scoped>
.shadow-x::before,
.shadow-x::after {
  content: '';
  top: 0;
  bottom: 0;
  z-index: 1;
  width: 12px;
  position: absolute;
  pointer-events: none;
  transition: all 300ms ease-in-out;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}

.shadow-x::before {
  left: 0;
  background: linear-gradient(to right, rgb(var(--bg-800-rgb)), transparent);
}

.shadow-x::after {
  right: 0;
  background: linear-gradient(to left, rgb(var(--bg-800-rgb)), transparent);
}
</style>
