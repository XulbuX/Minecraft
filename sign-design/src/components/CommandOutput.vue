<template>
  <div class="rounded-md bg-gray-8 p-4 text-white font-mono">
    <div class="mb-2.5 flex items-center justify-between">
      <h3 class="m-0 text-xl text-blue">
        Command Output
      </h3>
      <div class="text-white">
        <label class="ml-4 cursor-pointer">
          <input
            :checked="commandType === 'data'"
            class="mr-2"
            name="commandType"
            type="radio"
            value="data"
            @change="$emit('update:commandType', 'data')">
          /data modify
        </label>
        <label class="ml-4 cursor-pointer">
          <input
            :checked="commandType === 'give'"
            class="mr-2"
            name="commandType"
            type="radio"
            value="give"
            @change="$emit('update:commandType', 'give')">
          /give
        </label>
      </div>
    </div>
    <div class="mb-2.5 overflow-x-auto whitespace-nowrap border border-gray-6 rounded bg-gray-9 p-2.5 font-minecraft">
      {{ generatedCommand }}
    </div>
    <button
      class="float-right cursor-pointer rounded border-none bg-green-6 px-2.5 py-1.5 text-white transition-all duration-200 hover:bg-green-7"
      @click="copyCommand">
      Copy to Clipboard
    </button>
  </div>
</template>

<script setup lang="ts">
import { getMinecraftColorFormat } from 'helpers/minecraftColors';
import Swal from 'sweetalert2';
import { computed } from 'vue';

type TextSegment = {
  text: string;
  color: string | null;
};
type Props = {
  formattedLines: TextSegment[][];
  commandType: string;
  signType: string;
};

const props = defineProps<Props>();

defineEmits<{
  (e: 'update:commandType', value: string): void;
}>();

const generatedCommand = computed(() => {
  if (props.commandType === 'data') {
    return generateDataCommand();
  }
  else {
    return generateGiveCommand();
  }
});

function generateDataCommand(): string {
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

  return `/data modify block ~ ~-2 ~ front_text set value {messages:[${messages.join(',')}]}`;
}

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
