import { defineConfig, presetTagify, presetWind3 } from 'unocss';

export default defineConfig({
  presets: [
    presetWind3(),
    presetTagify(),
  ],
  theme: {
    fontFamily: {
      minecraft: ['Minecraft', 'monospace'],
    },
  },
});
