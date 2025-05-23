<template>
  <div v-on-click-outside="closeSettings" class="relative z-1000 ml-4">
    <button
      class="flex select-none items-center rounded bg-transparent p-1 outline-none transition-all-200 hover:bg-black/5 focus:outline-none dark:hover:bg-white/10"
      title="Settings"
      @click="showPopup = !showPopup">
      <motion.svg
        :animate="{ rotate: showPopup ? 90 : 0 }"
        class="size-6"
        fill="currentColor"
        :initial="{ rotate: 0 }"
        stroke="none"
        :transition="{ duration: 0.3 }"
        viewBox="0 0 512 512">
        <path d="M495.9 166.6c3.2 8.7 .5 18.4-6.4 24.6l-43.3 39.4c1.1 8.3 1.7 16.8 1.7 25.4s-.6 17.1-1.7 25.4l43.3 39.4c6.9 6.2 9.6 15.9 6.4 24.6c-4.4 11.9-9.7 23.3-15.8 34.3l-4.7 8.1c-6.6 11-14 21.4-22.1 31.2c-5.9 7.2-15.7 9.6-24.5 6.8l-55.7-17.7c-13.4 10.3-28.2 18.9-44 25.4l-12.5 57.1c-2 9.1-9 16.3-18.2 17.8c-13.8 2.3-28 3.5-42.5 3.5s-28.7-1.2-42.5-3.5c-9.2-1.5-16.2-8.7-18.2-17.8l-12.5-57.1c-15.8-6.5-30.6-15.1-44-25.4L83.1 425.9c-8.8 2.8-18.6 .3-24.5-6.8c-8.1-9.8-15.5-20.2-22.1-31.2l-4.7-8.1c-6.1-11-11.4-22.4-15.8-34.3c-3.2-8.7-.5-18.4 6.4-24.6l43.3-39.4C64.6 273.1 64 264.6 64 256s.6-17.1 1.7-25.4L22.4 191.2c-6.9-6.2-9.6-15.9-6.4-24.6c4.4-11.9 9.7-23.3 15.8-34.3l4.7-8.1c6.6-11 14-21.4 22.1-31.2c5.9-7.2 15.7-9.6 24.5-6.8l55.7 17.7c13.4-10.3 28.2-18.9 44-25.4l12.5-57.1c2-9.1 9-16.3 18.2-17.8C227.3 1.2 241.5 0 256 0s28.7 1.2 42.5 3.5c9.2 1.5 16.2 8.7 18.2 17.8l12.5 57.1c15.8 6.5 30.6 15.1 44 25.4l55.7-17.7c8.8-2.8 18.6-.3 24.5 6.8c8.1 9.8 15.5 20.2 22.1 31.2l4.7 8.1c6.1 11 11.4 22.4 15.8 34.3zM256 336a80 80 0 1 0 0-160 80 80 0 1 0 0 160z" />
      </motion.svg>
    </button>
    <AnimatePresence>
      <motion.div
        v-if="showPopup"
        ref="popupRef"
        :animate="{ opacity: 1, y: 0, scale: 1 }"
        class="absolute right-0 z-10 mt-2 w-min origin-top-right overflow-clip border border-black/5 rounded-md bg-gray-300/85 shadow-xl backdrop-blur-5 transition-background-color-200 dark:border-white/10 dark:bg-gray-800/85"
        :exit="{ opacity: 0, y: -10, scale: 0.95 }"
        :initial="{ opacity: 0, y: -10, scale: 0.95 }"
        :transition="{ duration: 0.2, ease: 'easeOut' }">
        <div class="flex flex-col p-2">
          <div class="mb-1 text-sm text-black/75 font-semibold transition-all-200 dark:text-white/75">
            App Theme
          </div>
          <div class="flex flex-row overflow-clip border border-black/10 rounded bg-white/50 transition-all-200 dark:border-white/10 dark:bg-black/40">
            <button
              v-for="themeOption in availableThemes"
              :key="themeOption.value"
              class="w-full select-none border-l border-black/10 bg-transparent py-2 pl-3 pr-4 text-left text-sm text-black/75 transition-all-200 transition-background-color-200 dark:border-white/10 first:border-none hover:bg-black/6 dark:text-white/75 dark:hover:bg-white/8"
              :class="{ 'font-semibold text-black! dark:text-white! bg-black/3! dark:bg-white/5!': settings.theme === themeOption.value }"
              @click="setTheme(themeOption.value)">
              {{ themeOption.label }}
            </button>
          </div>
        </div>
      </motion.div>
    </AnimatePresence>
  </div>
</template>

<script setup lang="ts">
import { vOnClickOutside } from '@vueuse/components';
import { AnimatePresence, motion } from 'motion-v';
import { availableThemes, setTheme, settings } from 'settings';

const showPopup = ref(false);
const popupRef = ref(null);

const closeSettings = () => showPopup.value = false;
</script>
