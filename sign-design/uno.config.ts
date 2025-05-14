import { defineConfig, presetTagify, presetWind3 } from 'unocss';

export default defineConfig({
  presets: [
    presetWind3({ darkMode: 'class' }),
    presetTagify(),
  ],
  theme: {
    colors: {
      black: '#020205',
      white: '#FCFCFF',
    },
    fontFamily: {
      jetbrains: ['JetBrains Mono', 'monospace'],
      minecraft: ['Minecraft', 'monospace'],
      montserrat: ['Montserrat', 'sans-serif'],
    },
  },
});
