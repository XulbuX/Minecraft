<template>
  <div class="shadow-x relative flex items-center justify-end overflow-clip border border-black/5 rounded-lg bg-gray-200 transition-all-200 dark:border-white/10 dark:bg-gray-800">
    <Command :generated-command />
    <button
      class="absolute right-0 top-0 z-10 m-1 size-8 select-none border border-black/5 rounded p-1 backdrop-blur-5 transition-all-200 dark:border-white/10"
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
  </div>
</template>

<script setup lang="ts">
import type { FormattedLines, TextSegment } from '@@/interfaces';
import { getMinecraftColorFormat } from 'minecraft';
import { motion } from 'motion-v';

const { formattedLines } = defineProps<{ formattedLines: FormattedLines }>();

const copied = ref(false);
const copySuccess = ref(false);
const animationTimer = ref<number | null>(null);

// /data merge block ~ ~ ~ {front_text:{messages:["",'[{text:"Hello world!",color:"green",italic:false}]',"",""]},back_text:{messages:["","",'[{text:"VERY ",color:"red",bold:true,italic:false},{text:"COOL ",color:"aqua",italic:true},{text:"TEXT",color:"blue",italic:false,underlined:true}]',""]}}
// /data merge block ~ ~ ~ {front_text:{messages:['{"text":"THIS SIGN","color":"#FF0000"}','{"text":"HAS","color":"#0000FF"}','{"text":"COLORED","color":"#FFFF00"}','{"text":"TEXT","color":"#00FF00"}']},back_text:{messages:['{"text":"THE BACK","color":"#00FFFF"}','{"text":"OF THIS","color":"#FFFFFF"}','{"text":"IS","color":"#FFA500"}','{"text":"FORBIDDEN","color":"#52307C"}']}}

const generatedCommand = computed(() => {
  const frontMessages = formatSignMessages(formattedLines.front);
  const backMessages = formatSignMessages(formattedLines.back);
  const frontTextTag = `front_text:{messages:[${frontMessages.join(',')}]}`;
  const backTextTag = `back_text:{messages:[${backMessages.join(',')}]}`;
  const backTagPart = formattedLines.back.some(line => line.length > 0) ? `,${backTextTag}` : '';
  return `/data merge block ~ ~ ~ {${frontTextTag}${backTagPart}}`;
});

const buttonClass = computed(() => {
  if (!copied.value) return 'color-black/50 dark:color-white bg-gray-400/30 dark:bg-gray-600/50 hover:bg-gray-400/50 dark:hover:bg-gray-500/50';
  return copySuccess.value ? 'color-teal-600 dark:color-teal-300 bg-teal-300/40 dark:bg-teal-400/40' : 'color-red-600 dark:color-red-300 bg-red-300/40 dark:bg-red-400/40';
});

const iconState = computed(() => {
  if (!copied.value) return { rotate: 0, scale: 1 };
  if (copySuccess.value) {
    return { rotate: 0, scale: 1.2 };
  }
  else {
    return { rotate: 15, scale: 1.1 };
  }
});

const escapeText = (text: string): string => text.replace(/"/g, '\\"');

function formatSignMessages(lines: TextSegment[][]): string[] {
  return lines.map((line) => {
    if (line.length === 0) return '""';

    const segments = line.map((segment: TextSegment) => {
      const parts = [`text:"${escapeText(segment.text)}"`];
      if (segment.color) {
        const formattedColor = getMinecraftColorFormat(segment.color);
        parts.push(`color:"${formattedColor}"`);
      }
      if (segment.bold) parts.push('bold:true');
      if (segment.italic) {
        parts.push('italic:true');
      }
      else {
        parts.push('italic:false');
      };
      if (segment.underline) parts.push('underlined:true');
      return `{${parts.join(',')}}`;
    });

    return `'[${segments.join(',')}]'`;
  });
}

function copyCommand(): void {
  if (animationTimer.value) {
    clearTimeout(animationTimer.value);
  }

  navigator.clipboard.writeText(generatedCommand.value)
    .then(() => {
      copied.value = true;
      copySuccess.value = true;
      animationTimer.value = window.setTimeout(() => {
        copied.value = false;
      }, 2000);
    })
    .catch(() => {
      copied.value = true;
      copySuccess.value = false;
      animationTimer.value = window.setTimeout(() => {
        copied.value = false;
      }, 2000);
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
