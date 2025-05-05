import { defineConfig, presetTagify, presetWind3 } from 'unocss';

export default defineConfig({
  presets: [
    presetWind3(),
    presetTagify(),
  ],
  theme: {
    colors: {
      black: '#020205',
      white: '#FCFCFF',
    },
    fontFamily: {
      minecraft: ['Minecraft', 'monospace'],
      montserrat: ['Montserrat', 'sans-serif'],
    },
  },
});
