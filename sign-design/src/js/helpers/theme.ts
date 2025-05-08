const THEME_STORAGE_KEY = 'vite-ui-theme';

export type Theme = 'light' | 'dark' | 'system';

export const currentTheme = ref<Theme>((localStorage.getItem(THEME_STORAGE_KEY) as Theme) || 'system');
export const availableThemes: { value: Theme; label: string }[] = [
  { label: 'Light', value: 'light' },
  { label: 'Dark', value: 'dark' },
  { label: 'System', value: 'system' },
];

function applyTheme(theme: Theme) {
  const root = document.documentElement;
  if (theme === 'system') {
    const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    root.setAttribute('data-theme', systemPrefersDark ? 'dark' : 'light');
    if (systemPrefersDark) {
      root.classList.add('dark');
    }
    else {
      root.classList.remove('dark');
    }
  }
  else {
    root.setAttribute('data-theme', theme);
    if (theme === 'dark') {
      root.classList.add('dark');
    }
    else {
      root.classList.remove('dark');
    }
  }
  localStorage.setItem(THEME_STORAGE_KEY, theme);
}

export function setTheme(theme: Theme) {
  currentTheme.value = theme;
}

export function initializeTheme() {
  watchEffect(() => {
    applyTheme(currentTheme.value);
  });

  if (currentTheme.value === 'system') {
    const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
    const handleChange = () => {
      if (currentTheme.value === 'system') {
        applyTheme('system');
      }
    };
    mediaQuery.addEventListener('change', handleChange);
    // Consider returning a cleanup function if the component using this can be unmounted
    // return () => mediaQuery.removeEventListener('change', handleChange);
  }
}

initializeTheme();
