export function useWinSize() {
  const w = ref(window.innerWidth);
  const h = ref(window.innerHeight);

  const update = () => {
    w.value = window.innerWidth;
    h.value = window.innerHeight;
  };

  onMounted(() => window.addEventListener('resize', update));
  onUnmounted(() => window.removeEventListener('resize', update));

  return { h, w };
}
