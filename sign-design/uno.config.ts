import { defineConfig, presetTagify, presetWind3 } from 'unocss';
import { presetScrollbar } from 'unocss-preset-scrollbar';

export default defineConfig({
  presets: [
    presetScrollbar(),
    presetWind3(),
    presetTagify(),
  ],
  theme: {
    fontFamily: {
      minecraft: ['Minecraft', 'monospace'],
    },
  },
});
