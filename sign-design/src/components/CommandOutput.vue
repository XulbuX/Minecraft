<template>
  <div class="bg-gray-800 text-gray-300 p-4 rounded-md font-mono">
    <div class="flex justify-between items-center mb-2.5">
      <h3 class="text-xl text-blue-400 m-0">Command Output</h3>
      <div class="text-white">
        <label class="ml-4 cursor-pointer">
          <input 
            type="radio" 
            value="data" 
            :checked="commandType === 'data'"
            @change="$emit('update:commandType', 'data')" 
            name="commandType"
            class="mr-2">
          /data modify
        </label>
        <label class="ml-4 cursor-pointer">
          <input 
            type="radio" 
            value="give" 
            :checked="commandType === 'give'"
            @change="$emit('update:commandType', 'give')" 
            name="commandType"
            class="mr-2">
          /give
        </label>
      </div>
    </div>
    <div class="p-2.5 bg-gray-900 rounded overflow-x-auto whitespace-nowrap border border-gray-600 mb-2.5 font-minecraft">
      {{ generatedCommand }}
    </div>
    <button 
      @click="copyCommand"
      class="px-2.5 py-1.5 bg-green-600 text-white border-none rounded cursor-pointer float-right hover:bg-green-700">
      Copy to Clipboard
    </button>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue';
import { getMinecraftColorFormat } from 'helpers/minecraftColors';

type TextSegment = {
  text: string;
  color: string | null;
}
type Props = {
  formattedLines: TextSegment[][];
  commandType: string;
  signType: string;
}

const props = defineProps<Props>();

defineEmits<{
  (e: 'update:commandType', value: string): void;
}>();

const generatedCommand = computed(() => {
  if (props.commandType === 'data') {
    return generateDataCommand();
  } else {
    return generateGiveCommand();
  }
});

function generateDataCommand(): string {
  const messages = props.formattedLines.map(line => {
    if (line.length === 0) {
      return '""';
    }
    
    const segments = line.map(segment => {
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
  const messages = props.formattedLines.map(line => {
    if (line.length === 0) {
      return '""';
    }
    
    const segments = line.map(segment => {
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
    .then(() => alert('Command copied to clipboard!'))
    .catch(() => alert('Failed to copy command'));
}
</script>
