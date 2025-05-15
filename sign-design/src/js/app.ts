import FloatingVue from 'floating-vue';
import { createApp } from 'vue';
import App from './App.vue';
import 'floating-vue/dist/style.css';
import '@/css/main.css';
import '@/css/font.css';
import 'uno.css';

const app = createApp(App);

app.use(FloatingVue, {
  distance: 8,
  themes: {
    'normal-tooltip': { $extend: 'tooltip', $resetCss: true },
    'warning-tooltip': { $extend: 'normal-tooltip' },
  },
});

app.mount('#app');
