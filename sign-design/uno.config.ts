import { defineConfig } from 'unocss'
import { presetAttributify, presetUno, presetIcons } from 'unocss'

export default defineConfig({
  presets: [
    presetUno(),
    presetAttributify(),
    presetIcons({
      scale: 1.2,
    }),
  ],
  theme: {
    colors: {
    },
    fontFamily: {
      minecraft: ['Minecraft', 'monospace'],
    }
  },
  shortcuts: {
    'btn': 'py-2 px-4 font-semibold rounded-lg shadow-md',
    'btn-green': 'text-white bg-green-500 hover:bg-green-700',
  },
  preflights: [
    {
      layer: 'base',
      getCSS: () => `
        @font-face {
          font-family: 'Minecraft';
          src: url('/font/mc-regular.otf') format('opentype');
          font-weight: normal;
          font-style: normal;
          font-display: swap;
        }
      `
    }
  ]
})
