<template>
  <div class="mx-auto max-w-3xl flex flex-col gap-5 p-5 text-white font-sans">
    <h1 class="select-none text-2xl font-bold">
      Minecraft Sign Editor
    </h1>
    <SignTypeSelect
      :model-value="signType"
      :options="MC_SIGNS_ARRAY"
      placeholder="Select a sign type"
      @update:model-value="signType = $event" />
    <SignEditor
      ref="signEditor"
      v-model="formattedLines"
      :max-line-width-px="200"
      :minecraft-colors="MC_COLORS_ARRAY"
      :sign-type-details="selectedSignDetails" />
    <CommandOutput
      :command-type="commandType"
      :formatted-lines="formattedLines"
      :sign-type="signType" />
  </div>
</template>

<script setup lang="ts">
import type { CommandType } from '@@/interfaces';
import SignEditor from '@@/components/SignEditor.vue';
import { MC_COLORS_ARRAY, MC_SIGNS_ARRAY } from 'minecraft';

const signType = ref('oak_sign');
const formattedLines = ref<any[][]>([[], [], [], []]);
const commandType = ref('give' as CommandType);
const signEditor = ref<InstanceType<typeof SignEditor> | null>(null);

const selectedSignDetails = computed<SignType | undefined>(() => {
  return MC_SIGNS_ARRAY.find(s => s.value === signType.value);
});
</script>
