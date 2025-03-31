<template>
  <div class="flex items-center justify-end overflow-clip rounded-lg bg-gray-9">
    <div class="w-full overflow-x-auto whitespace-nowrap p-2.5 text-white font-minecraft">
      {{ generatedCommand }}
    </div>
    <button
      class="m-1 size-8 rounded bg-gray-7 p-1 text-white transition-all duration-200 hover:bg-gray-6"
      @click="copyCommand">
      <img alt="Copy" class="size-4" :src="copyIcon">
    </button>
  </div>
</template>

<script setup lang="ts">
import { getMinecraftColorFormat } from 'helpers/minecraftColors';
import Swal from 'sweetalert2';
import { computed, ref } from 'vue';

type TextSegment = {
  text: string;
  color: string | null;
};
type Props = {
  formattedLines: TextSegment[][];
  signType: string;
};

const props = defineProps<Props>();
const copyIcon = ref('img/copy.svg');

const generatedCommand = computed(() => {
  return generateGiveCommand();
});

function generateGiveCommand(): string {
  const messages = props.formattedLines.map((line) => {
    if (line.length === 0) {
      return '""';
    }

    const segments = line.map((segment) => {
      if (!segment.color) {
        return `{text:"${escapeText(segment.text)}"}`;
      }

      const formattedColor = getMinecraftColorFormat(segment.color);
      return `{text:"${escapeText(segment.text)}",color:"${formattedColor}"}`;
    });

    return `'[${segments.join(',')}]'`;
  });

  return `/give @p ${props.signType ?? 'oak_sign'}{BlockEntityTag:{front_text:{messages:[${messages.join(',')}]}}} 1`;
}

function escapeText(text: string): string {
  return text.replace(/"/g, '\\"');
}

function copyCommand(): void {
  navigator.clipboard.writeText(generatedCommand.value)
    .then(() => Swal.fire('Command copied to clipboard!'))
    .catch(() => Swal.fire('Failed to copy command'));
}
</script>
