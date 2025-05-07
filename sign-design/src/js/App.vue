<template>
  <div class="relative mx-auto max-w-3xl flex flex-col gap-5 p-5 font-sans">
    <div id="top-fadeout" />
    <h1 class="select-none text-2xl font-bold">
      Minecraft Sign Editor
    </h1>
    <SignTypeSelect
      :model-value="signType"
      :options="MC_SIGNS_ARRAY"
      placeholder="Select a sign type"
      @update:model-value="signType = $event" />
    <SignEditors
      ref="signEditor"
      v-model="formattedLines"
      :max-line-width-px="200"
      :minecraft-colors="MC_COLORS_ARRAY"
      :sign-type-details="selectedSignDetails" />
    <CommandOutput
      :command-type="commandType"
      :formatted-lines
      :sign-type="signType" />
    <div id="bottom-fadeout" />
  </div>
</template>

<script setup lang="ts">
import type { CommandType, FormattedLines } from '@@/interfaces';
import SignEditors from '@/js/components/SignEditors.vue';
import { MC_COLORS_ARRAY, MC_SIGNS_ARRAY } from 'minecraft';

const signType = ref('oak_sign');
const commandType = ref('give' as CommandType);
const signEditor = ref<InstanceType<typeof SignEditors> | null>(null);
const formattedLines = ref<FormattedLines>({ back: [[], [], [], []], front: [[], [], [], []] });

const selectedSignDetails = computed<SignType | undefined>(() => {
  return MC_SIGNS_ARRAY.find(s => s.value === signType.value);
});
</script>

<style scoped>
#top-fadeout,
#bottom-fadeout {
  z-index: 1000;
  content: '';
  left: 0;
  right: 0;
  height: 1.25rem;
  position: fixed;
  pointer-events: none;
}
#top-fadeout {
  top: 0;
  background: linear-gradient(to bottom, #0E131BAA, transparent);
}
#bottom-fadeout {
  bottom: 0;
  background: linear-gradient(to top, #0E131BAA, transparent);
}
</style>
