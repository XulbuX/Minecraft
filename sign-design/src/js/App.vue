<template>
  <div class="mx-auto max-w-3xl flex flex-col gap-5 p-5 text-white font-sans">
    <h1 class="select-none text-2xl font-bold">
      Minecraft Sign Editor
    </h1>
    <SignTypeSelect
      :model-value="signType"
      :options="SIGN_TYPES_ARRAY"
      placeholder="Select a sign type"
      @update:model-value="signType = $event" />
    <SignEditor
      ref="signEditor"
      v-model="formattedLines"
      :max-line-length="15"
      :minecraft-colors="MC_COLORS_ARRAY"
      :sign-type-details="selectedSignDetails" />
    <CommandOutput
      v-model:command-type="commandType"
      :formatted-lines="formattedLines"
      :sign-type="signType" />
  </div>
</template>

<script setup lang="ts">
import SignEditor from '@@/components/SignEditor.vue';
import { MC_COLORS_ARRAY, SIGN_TYPES_ARRAY } from 'minecraft';

const signType = ref('oak_sign');
const formattedLines = ref<any[][]>([[], [], [], []]);
const commandType = ref('data');
const signEditor = ref<InstanceType<typeof SignEditor> | null>(null);

const selectedSignDetails = computed<SignType | undefined>(() => {
  return SIGN_TYPES_ARRAY.find(s => s.value === signType.value);
});
</script>
