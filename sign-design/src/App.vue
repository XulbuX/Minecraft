<template>
  <div class="mx-auto max-w-3xl p-5 font-sans">
    <h1 class="mb-4 text-2xl font-bold">
      Minecraft Sign Editor
    </h1>
    <SignTypeSelector
      v-model="signType"
      :sign-types="SIGN_TYPES_ARRAY" />
    <SignEditor
      ref="signEditor"
      v-model:formatted-lines="formattedLines"
      :max-line-length="MAX_LINE_LENGTH"
      :sign-type="signType" />
    <ColorControls
      :minecraft-colors="MC_COLORS_ARRAY"
      @apply-color="applyColor"
      @reset-formatting="resetFormatting" />
    <CommandOutput
      v-model:command-type="commandType"
      :formatted-lines="formattedLines"
      :sign-type="signType" />
  </div>
</template>

<script setup lang="ts">
import { MC_COLORS_ARRAY, SIGN_TYPES_ARRAY } from 'helpers/minecraftColors';
import { ref } from 'vue';
import ColorControls from './components/ColorControls.vue';
import CommandOutput from './components/CommandOutput.vue';
import SignEditor from './components/SignEditor.vue';
import SignTypeSelector from './components/SignTypeSelector.vue';

const signType = ref('oak_sign');
const formattedLines = ref<any[][]>([[], [], [], []]);
const MAX_LINE_LENGTH = 15;
const commandType = ref('data');
const signEditor = ref<InstanceType<typeof SignEditor> | null>(null);

function applyColor(color: string) {
  signEditor.value?.applyColorToSelection(color);
}
function resetFormatting() {
  signEditor.value?.resetFormatting();
}
</script>
