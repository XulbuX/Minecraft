<template>
  <div class="flex items-center justify-end overflow-clip rounded-lg bg-gray-8">
    <div class="w-full overflow-x-auto whitespace-nowrap p-2.5 font-minecraft">
      {{ generatedCommand }}
    </div>
    <button
      class="absolute right-5 m-1 size-8 select-none border border-white/8 rounded p-1 backdrop-blur-5 transition-all duration-200"
      :class="buttonClass"
      @click="copyCommand">
      <motion.svg
        :animate="iconState"
        class="size-4 focus:outline-none"
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
import type { CommandType, FormattedLines } from '@@/interfaces';
import { getMinecraftColorFormat } from 'minecraft';
import { motion } from 'motion-v';

const props = defineProps<{
  formattedLines: FormattedLines;
  signType: string;
  commandType: CommandType;
}>();

const copied = ref(false);
const copySuccess = ref(false);
const animationTimer = ref<number | null>(null);

const generatedCommand = computed(() => {
  switch (props.commandType) {
    case 'give':
      return generateGiveCommand();
    case 'setblock':
      return generateSetBlockCommand();
    default:
      return generateDataCommand();
  }
});

const buttonClass = computed(() => {
  if (!copied.value) return 'bg-gray-6/50 hover:bg-gray-5/50';
  return copySuccess.value ? 'bg-teal-4/40' : 'bg-red-4/40';
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

function generateGiveCommand(): string {
  const messages = props.formattedLines.map((line) => {
    if (line.length === 0) {
      return '""';
    }

    const segments = line.map((segment) => {
      const parts = [`text:"${escapeText(segment.text)}"`];
      if (segment.color) {
        const formattedColor = getMinecraftColorFormat(segment.color);
        parts.push(`color:"${formattedColor}"`);
      }
      if (segment.bold) {
        parts.push('bold:true');
      }
      if (segment.italic) {
        parts.push('italic:true');
      }
      if (segment.underline) {
        parts.push('underlined:true');
      }
      return `{${parts.join(',')}}`;
    });

    return `'[${segments.join(',')}]'`;
  });

  const blockEntityTag = `{BlockEntityTag:{front_text:{messages:[${messages.join(',')}]}}}`;

  return `/give @p ${props.signType ?? 'oak_sign'}${blockEntityTag} 1`;
}

function generateSetBlockCommand(): string {
  const messages = formatSignMessages();
  const blockEntityTag = `{BlockEntityTag:{front_text:{messages:[${messages.join(',')}]}}}`;

  return `/setblock ~ ~ ~ ${props.signType ?? 'oak_sign'}${blockEntityTag}`;
}

function generateDataCommand(): string {
  const messages = formatSignMessages();

  return `/data merge block ~ ~ ~ {front_text:{messages:[${messages.join(',')}]}}`;
}

function formatSignMessages(): string[] {
  return props.formattedLines.map((line) => {
    if (line.length === 0) {
      return '""';
    }

    const segments = line.map((segment) => {
      const parts = [`text:"${escapeText(segment.text)}"`];
      if (segment.color) {
        const formattedColor = getMinecraftColorFormat(segment.color);
        parts.push(`color:"${formattedColor}"`);
      }
      if (segment.bold) {
        parts.push('bold:true');
      }
      if (segment.italic) {
        parts.push('italic:true');
      }
      if (segment.underline) {
        parts.push('underlined:true');
      }
      return `{${parts.join(',')}}`;
    });

    return `'[${segments.join(',')}]'`;
  });
}

function escapeText(text: string): string {
  return text.replace(/"/g, '\\"');
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
