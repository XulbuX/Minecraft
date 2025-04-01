import path from 'node:path';
import vue from '@vitejs/plugin-vue';
import UnoCSS from 'unocss/vite';
import { defineConfig } from 'vite';

// https://vitejs.dev/config/
export default defineConfig({
  clearScreen: false,
  plugins: [
    vue(),
    UnoCSS(),
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
      'minecraft': path.resolve(__dirname, './src/helpers/minecraft.ts'),
    },
  },
  server: {
    port: 1420,
    strictPort: true,
  },
});
