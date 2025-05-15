export type ThemeSetting = 'light' | 'dark' | 'system';
export type Theme = 'light' | 'dark';

const osPrefersDark = ref(false);
const THEME_SETTING_STORAGE_KEY = 'sign_design_theme_setting';

export const availableThemes: { value: ThemeSetting; label: string }[] = [
  { label: 'Light', value: 'light' },
  { label: 'Dark', value: 'dark' },
  { label: 'System', value: 'system' },
];

export const settings = ref<{ theme: ThemeSetting }>({ theme: getInitialThemeSetting() });

export const currentTheme = computed<Theme>(() => {
  if (settings.value.theme === 'system') return osPrefersDark.value ? 'dark' : 'light';
  return settings.value.theme;
});

function getInitialThemeSetting(): ThemeSetting {
  const storedSetting = localStorage.getItem(THEME_SETTING_STORAGE_KEY) as ThemeSetting | null;
  if (availableThemes.some(t => t.value === storedSetting)) return storedSetting as ThemeSetting;
  return 'system';
}

function applyDomTheme(theme: Theme) {
  const root = document.documentElement;
  root.setAttribute('data-theme', theme);
  if (theme === 'dark') {
    root.classList.add('dark');
  }
  else {
    root.classList.remove('dark');
  }
}

export function setTheme(newSetting: ThemeSetting) {
  settings.value.theme = newSetting;
  localStorage.setItem(THEME_SETTING_STORAGE_KEY, newSetting);
}

export function initializeTheme() {
  watchEffect(() => applyDomTheme(currentTheme.value));
  const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
  const handleOsThemeChange = (event: MediaQueryListEvent | { matches: boolean }) => osPrefersDark.value = event.matches;
  osPrefersDark.value = mediaQuery.matches;
  mediaQuery.addEventListener('change', handleOsThemeChange);
}

initializeTheme();
