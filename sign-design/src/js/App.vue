<template>
  <div class="relative mx-auto max-w-3xl flex flex-col gap-5 p-5 font-sans transition-all-200">
    <div id="top-fadeout" class="transition-all-200" />
    <div class="flex items-center justify-between">
      <h1 class="select-none text-2xl font-bold transition-all-200">
        Minecraft Sign Editor
      </h1>
      <Settings />
    </div>
    <SignTypeSelect
      :model-value="signType"
      :options="MC_SIGNS_ARRAY"
      placeholder="Select a sign type"
      @update:model-value="signType = $event" />
    <SignEditors
      ref="signEditor"
      v-model="formattedLines"
      :default-color="DEFAULT_COLOR"
      :max-line-width-px="200"
      :minecraft-colors="MC_COLORS_ARRAY"
      :sign-type-details="selectedSignDetails" />
    <CommandOutput
      :default-color="DEFAULT_COLOR"
      :formatted-lines
      :sign-type />
    <div id="bottom-fadeout" class="transition-all-200" />
  </div>
</template>

<script setup lang="ts">
import type { FormattedLines } from '@@/interfaces';
import SignEditors from '@/js/components/SignEditors.vue';
import { MC_COLORS_ARRAY, MC_SIGNS_ARRAY } from 'minecraft';

const DEFAULT_COLOR = 'black';

const signType = ref<string>('oak_sign');
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
  background: linear-gradient(to bottom, rgb(var(--bg-rgb)), transparent);
}
#bottom-fadeout {
  bottom: 0;
  background: linear-gradient(to top, rgb(var(--bg-rgb)), transparent);
}
</style>
