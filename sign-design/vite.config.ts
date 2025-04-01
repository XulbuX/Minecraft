import path from 'node:path';
import Vue from '@vitejs/plugin-vue';
import UnoCSS from 'unocss/vite';
import AutoImport from 'unplugin-auto-import/vite';
import { VueUseComponentsResolver, VueUseDirectiveResolver } from 'unplugin-vue-components/resolvers';
import Components from 'unplugin-vue-components/vite';
import { defineConfig } from 'vite';

const host = process.env.TAURI_DEV_HOST;

// https://vitejs.dev/config/
export default defineConfig({
  clearScreen: false,
  envPrefix: ['VITE_', 'TAURI_ENV_*'],
  plugins: [
    AutoImport({
      dts: './src/types/auto-imports.d.ts',
      imports: ['vue', '@vueuse/core'],
    }),
    Vue(),
    UnoCSS(),
    Components({
      deep: true,
      dirs: ['./src/components'],
      dts: './src/types/components.d.ts',
      resolvers: [VueUseComponentsResolver(), VueUseDirectiveResolver()],
    }),
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
      'minecraft': path.resolve(__dirname, './src/helpers/minecraft.ts'),
    },
  },
  server: {
    hmr: host ? { host, port: 1421, protocol: 'ws' } : undefined,
    host: host || false,
    port: 1420,
    strictPort: true,
    watch: { ignored: ['**/src-tauri/**'] },
  },
});
