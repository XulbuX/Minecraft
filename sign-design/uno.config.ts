import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';
import { defineConfig, presetTagify, presetWind3 } from 'unocss';
import { presetScrollbar } from 'unocss-preset-scrollbar';

const fontCss = readFileSync(resolve(__dirname, 'src/css/font.css'), 'utf-8');

export default defineConfig({
  preflights: [
    {
      getCSS: () => fontCss,
      layer: 'base',
    },
  ],
  presets: [
    presetScrollbar(),
    presetWind3(),
    presetTagify(),
  ],
  shortcuts: {
    'btn': 'py-2 px-4 font-semibold rounded-lg shadow-md',
    'btn-green': 'text-white bg-green-500 hover:bg-green-700',
  },
  theme: {
    fontFamily: {
      minecraft: ['Minecraft', 'monospace'],
    },
  },
});
