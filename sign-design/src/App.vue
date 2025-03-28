<template>
  <div class="max-w-3xl mx-auto p-5 font-sans">
    <h1 class="text-2xl font-bold mb-4">Minecraft Sign Editor</h1>
    <SignTypeSelector 
      :signTypes="SIGN_TYPES_ARRAY" 
      v-model="signType" />
    <SignEditor 
      :signType="signType" 
      :maxLineLength="MAX_LINE_LENGTH"
      v-model:formattedLines="formattedLines" 
      ref="signEditor" />
    <ColorControls 
      :minecraftColors="MC_COLORS_ARRAY"
      @applyColor="applyColor"
      @resetFormatting="resetFormatting" />
    <CommandOutput 
      :formattedLines="formattedLines"
      :signType="signType"
      v-model:commandType="commandType" />
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import SignTypeSelector from './components/SignTypeSelector.vue'
import SignEditor from './components/SignEditor.vue'
import ColorControls from './components/ColorControls.vue'
import CommandOutput from './components/CommandOutput.vue'
import { MC_COLORS_ARRAY, SIGN_TYPES_ARRAY } from './helpers/minecraftColors';

const signType = ref('oak_sign');
const formattedLines = ref<any[][]>([[], [], [], []]);
const MAX_LINE_LENGTH = 15;
const commandType = ref('data');
const signEditor = ref<InstanceType<typeof SignEditor> | null>(null);

const applyColor = (color: string) => {
  signEditor.value?.applyColorToSelection(color);
};

const resetFormatting = () => {
  signEditor.value?.resetFormatting();
};
</script>
