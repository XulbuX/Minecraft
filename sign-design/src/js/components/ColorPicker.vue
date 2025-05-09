<template>
  <div class="relative" :title>
    <div
      ref="colorPickerRef"
      class="inset-border h-6 flex cursor-pointer select-none items-center justify-center rounded-md px-1.5 font-mono"
      :style="colorPickerButtonStyle(modelValue)"
      @click="togglePicker">
      {{ modelValue }}
    </div>
    <Teleport to="body">
      <div v-if="isOpen" class="fixed inset-0 z-50">
        <div
          ref="popupRef"
          v-on-click-outside="handleClickOutside"
          class="widget-shadow absolute border border-white/10 rounded-lg bg-gray-7/80 p-3 backdrop-blur-5"
          :style="popupPosition">
          <div class="w-60">
            <div class="mb-3 space-y-3">
              <!-- SATURATION-VALUE AREA -->
              <div
                ref="satValAreaRef"
                class="relative h-36 cursor-crosshair rounded"
                :style="{ backgroundColor: `hsl(${HUE}, 100%, 50%)` }"
                @mousedown="startSatValDrag"
                @touchstart="startSatValDrag">
                <div class="absolute inset-0 rounded from-white to-transparent bg-gradient-to-r" />
                <div class="absolute inset-0 rounded from-transparent to-black bg-gradient-to-b" />
                <div
                  class="slider-shadow absolute size-3 rounded-full bg-white/25 outline-2 outline-white/75 backdrop-brightness-80 -translate-x-1/2 -translate-y-1/2"
                  :style="{ left: `${SAT}%`, top: `${100 - VAL}%` }" />
              </div>
              <!-- HUE SLIDER -->
              <div
                ref="hueSliderRef"
                class="relative h-4 cursor-e-resize rounded"
                @mousedown="startHueDrag"
                @touchstart="startHueDrag">
                <div class="hue-gradient absolute inset-0 rounded" />
                <div
                  class="slider-shadow absolute top-0 h-full w-2 rounded bg-white/25 outline-2 outline-white/75 backdrop-brightness-80 -ml-1"
                  :style="{ left: `${HUE / 360 * 100}%` }" />
              </div>
            </div>
            <!-- HEX INPUT -->
            <div class="mb-3 flex items-center">
              <input
                v-model="HEX"
                class="flex-1 rounded bg-gray-9/30 p-1 text-white font-mono outline-1 outline-white/10"
                type="text"
                @input="updateFromHex">
            </div>
            <!-- PREVIEW AND ACTIONS -->
            <div class="flex select-none items-center">
              <div class="inset-border mr-3 h-6 w-6 rounded" :style="{ backgroundColor: HEX }" />
              <button class="mr-1 cursor-pointer rounded border-none bg-gray-5/40 p-1 px-2 text-white duration-200 hover:bg-gray-4/40" @click="applyColor">
                Apply
              </button>
              <button class="mr-1 cursor-pointer rounded border-none bg-gray-5/40 p-1 px-2 text-white/50 duration-200 hover:(border-2 border-white/50)" @click="togglePicker">
                Cancel
              </button>
            </div>
          </div>
        </div>
      </div>
    </Teleport>
  </div>
</template>

<script setup lang="ts">
import { vOnClickOutside } from '@vueuse/components';

const { modelValue } = defineProps<{
  modelValue: string;
  title?: string;
}>();

const emit = defineEmits<{
  (e: 'update:modelValue', value: string): void;
  (e: 'change', value: string): void;
}>();

const isOpen = ref(false);
const isDraggingHue = ref(false);
const isDraggingSatVal = ref(false);
const justFinishedDragging = ref(false);

const popupRef = ref<HTMLElement | null>(null);
const popupPosition = ref({ left: '0px', top: '0px' });
const colorPickerRef = ref<HTMLElement | null>(null);
const satValAreaRef = ref<HTMLElement | null>(null);
const hueSliderRef = ref<HTMLElement | null>(null);

const HUE = ref(0);
const SAT = ref(100);
const VAL = ref(100);
const HEX = ref('');

const cleanHex = (hexStr: string) => hexStr.replace(/^(#+|0x)/i, '').toUpperCase();

function colorPickerButtonStyle(hexStr: string) {
  const hex = cleanHex(hexStr);
  const r = Number.parseInt(hex.substring(0, 2), 16);
  const g = Number.parseInt(hex.substring(2, 4), 16);
  const b = Number.parseInt(hex.substring(4, 6), 16);
  const bright = (r * 0.299 + g * 0.587 + b * 0.114) > 150;
  return {
    backgroundColor: hexStr,
    color: bright ? '#030305' : '#FCFCFF',
  };
}

function rgbToHsv(r: number, g: number, b: number) {
  r /= 255;
  g /= 255;
  b /= 255;
  const max = Math.max(r, g, b);
  const min = Math.min(r, g, b);
  const delta = max - min;
  let h = 0;
  let s = max === 0 ? 0 : delta / max;
  let v = max;

  if (delta === 0) {
    return { h: HUE.value, s: 0, v: v * 100 };
  }
  else if (max === r) {
    h = ((g - b) / delta) % 6;
  }
  else if (max === g) {
    h = (b - r) / delta + 2;
  }
  else {
    h = (r - g) / delta + 4;
  }

  h = Math.round(h * 60);
  if (h < 0) h += 360;

  return { h, s: Math.round(s * 100), v: Math.round(v * 100) };
}

function hsvToRgb(h: number, s: number, v: number) {
  h = h % 360;
  s = s / 100;
  v = v / 100;
  const c = v * s;
  const x = c * (1 - Math.abs((h / 60) % 2 - 1));
  const m = v - c;
  let r = 0;
  let g = 0;
  let b = 0;

  if (h < 60) {
    r = c;
    g = x;
    b = 0;
  }
  else if (h < 120) {
    r = x;
    g = c;
    b = 0;
  }
  else if (h < 180) {
    r = 0;
    g = c;
    b = x;
  }
  else if (h < 240) {
    r = 0;
    g = x;
    b = c;
  }
  else if (h < 300) {
    r = x;
    g = 0;
    b = c;
  }
  else {
    r = c;
    g = 0;
    b = x;
  }
  return {
    b: Math.round((b + m) * 255),
    g: Math.round((g + m) * 255),
    r: Math.round((r + m) * 255),
  };
}

function updateHexFromHsv() {
  const rgb = hsvToRgb(HUE.value, SAT.value, VAL.value);
  const rHex = rgb.r.toString(16).padStart(2, '0');
  const gHex = rgb.g.toString(16).padStart(2, '0');
  const bHex = rgb.b.toString(16).padStart(2, '0');
  HEX.value = `#${rHex}${gHex}${bHex}`.toUpperCase();
}

function initializeFromHex(hexColor: string) {
  const hex = cleanHex(hexColor);
  const hsv = rgbToHsv(
    Number.parseInt(hex.substring(0, 2), 16),
    Number.parseInt(hex.substring(2, 4), 16),
    Number.parseInt(hex.substring(4, 6), 16),
  );

  if (hsv.s === 0 && HUE.value !== 0) {
    SAT.value = hsv.s;
    VAL.value = hsv.v;
  }
  else {
    HUE.value = hsv.h;
    SAT.value = hsv.s;
    VAL.value = hsv.v;
  }
  updateHexFromHsv();
}

initializeFromHex(modelValue);

function calculateAndSetPopupPosition() {
  if (!isOpen.value) return;

  nextTick(() => {
    const buttonRect = colorPickerRef.value?.getBoundingClientRect();
    const popupEl = popupRef.value;

    if (buttonRect && popupEl) {
      const margin = 10;
      const popupWidth = popupEl.offsetWidth;
      const popupHeight = popupEl.offsetHeight;
      const viewportWidth = window.innerWidth;
      const viewportHeight = window.innerHeight;

      let newLeft = buttonRect.left;
      let newTop = buttonRect.bottom + 5;

      if (newLeft + popupWidth > viewportWidth - margin) {
        newLeft = viewportWidth - popupWidth - margin;
      }
      if (newLeft < margin) newLeft = margin;
      if (newTop + popupHeight > viewportHeight - margin) {
        const topAbove = buttonRect.top - popupHeight - 5;
        if (topAbove >= margin) {
          newTop = topAbove;
        }
        else {
          newTop = viewportHeight - popupHeight - margin;
        }
      }
      if (newTop < margin) {
        newTop = margin;
      }

      newLeft = Math.max(margin, Math.min(newLeft, viewportWidth - popupWidth - margin));
      newTop = Math.max(margin, Math.min(newTop, viewportHeight - popupHeight - margin));

      popupPosition.value = { left: `${newLeft}px`, top: `${newTop}px` };
    }
    else if (buttonRect) {
      popupPosition.value = { left: `${buttonRect.left}px`, top: `${buttonRect.bottom + 5}px` };
    }
  });
}

function togglePicker() {
  isOpen.value = !isOpen.value;
  if (isOpen.value) {
    calculateAndSetPopupPosition(); // Calculate position when opening
  }
}

function updateFromHex() {
  let hex = cleanHex(HEX.value);

  if (/^[0-9A-F]{3}|[0-9A-F]{6}$/i.test(hex)) {
    if (hex.length === 3) {
      hex = hex.split('').map(c => c + c).join('');
    }

    const rgb = {
      b: Number.parseInt(hex.substring(4, 6), 16),
      g: Number.parseInt(hex.substring(2, 4), 16),
      r: Number.parseInt(hex.substring(0, 2), 16),
    };
    const hsv = rgbToHsv(rgb.r, rgb.g, rgb.b);

    if (hsv.s !== 0) {
      HUE.value = hsv.h;
    }
    SAT.value = hsv.s;
    VAL.value = hsv.v;
    HEX.value = `#${hex.toUpperCase()}`;
  }
}

function applyColor() {
  updateHexFromHsv();
  emit('update:modelValue', HEX.value);
  emit('change', HEX.value);
  isOpen.value = false;
}

function handleClickOutside() {
  if (!justFinishedDragging.value) {
    isOpen.value = false;
  }
}

function startHueDrag(event: MouseEvent | TouchEvent) {
  event.preventDefault();
  isDraggingHue.value = true;
  updateHueFromEvent(event);

  if (event instanceof MouseEvent) {
    window.addEventListener('mousemove', updateHueFromMouseMove);
    window.addEventListener('mouseup', stopHueDrag);
  }
  else {
    window.addEventListener('touchmove', updateHueFromTouchMove);
    window.addEventListener('touchend', stopHueDrag);
  }
}

function updateHueFromEvent(event: MouseEvent | TouchEvent) {
  if (!hueSliderRef.value) return;

  const rect = hueSliderRef.value.getBoundingClientRect();
  let clientX: number;

  if (event instanceof MouseEvent) {
    clientX = event.clientX;
  }
  else {
    clientX = event.touches[0].clientX;
  }

  const x = Math.max(0, Math.min(clientX - rect.left, rect.width));
  HUE.value = Math.round((x / rect.width) * 360);
}

function updateHueFromMouseMove(event: MouseEvent) {
  if (isDraggingHue.value) updateHueFromEvent(event);
}

function updateHueFromTouchMove(event: TouchEvent) {
  if (isDraggingHue.value) updateHueFromEvent(event);
}

function stopHueDrag() {
  isDraggingHue.value = false;
  justFinishedDragging.value = true;
  setTimeout(() => {
    justFinishedDragging.value = false;
  }, 100);
  window.removeEventListener('mousemove', updateHueFromMouseMove);
  window.removeEventListener('mouseup', stopHueDrag);
  window.removeEventListener('touchmove', updateHueFromTouchMove);
  window.removeEventListener('touchend', stopHueDrag);
}

function startSatValDrag(event: MouseEvent | TouchEvent) {
  event.preventDefault();
  isDraggingSatVal.value = true;
  updateSatValFromEvent(event);

  if (event instanceof MouseEvent) {
    window.addEventListener('mousemove', updateSatValFromMouseMove);
    window.addEventListener('mouseup', stopSatValDrag);
  }
  else {
    window.addEventListener('touchmove', updateSatValFromTouchMove);
    window.addEventListener('touchend', stopSatValDrag);
  }
}

function updateSatValFromEvent(event: MouseEvent | TouchEvent) {
  if (!satValAreaRef.value) return;

  const rect = satValAreaRef.value.getBoundingClientRect();
  let clientX: number, clientY: number;

  if (event instanceof MouseEvent) {
    clientX = event.clientX;
    clientY = event.clientY;
  }
  else {
    clientX = event.touches[0].clientX;
    clientY = event.touches[0].clientY;
  }

  const x = Math.max(0, Math.min(clientX - rect.left, rect.width));
  const y = Math.max(0, Math.min(clientY - rect.top, rect.height));
  SAT.value = Math.round((x / rect.width) * 100);
  VAL.value = Math.round(100 - (y / rect.height) * 100);
}

function updateSatValFromMouseMove(event: MouseEvent) {
  if (isDraggingSatVal.value) updateSatValFromEvent(event);
}

function updateSatValFromTouchMove(event: TouchEvent) {
  if (isDraggingSatVal.value) updateSatValFromEvent(event);
}

function stopSatValDrag() {
  isDraggingSatVal.value = false;
  justFinishedDragging.value = true;
  setTimeout(() => {
    justFinishedDragging.value = false;
  }, 100);

  window.removeEventListener('mousemove', updateSatValFromMouseMove);
  window.removeEventListener('mouseup', stopSatValDrag);
  window.removeEventListener('touchmove', updateSatValFromTouchMove);
  window.removeEventListener('touchend', stopSatValDrag);
}

watch([HUE, SAT, VAL], () => {
  updateHexFromHsv();
}, { immediate: true });

watch(isOpen, (newValue) => {
  if (newValue) {
    initializeFromHex(modelValue);
    window.addEventListener('resize', calculateAndSetPopupPosition);
    calculateAndSetPopupPosition();
  }
  else {
    window.removeEventListener('resize', calculateAndSetPopupPosition);
    stopHueDrag();
    stopSatValDrag();
  }
});

onUnmounted(() => {
  window.removeEventListener('resize', calculateAndSetPopupPosition);
  stopHueDrag();
  stopSatValDrag();
});

watch(() => modelValue, (newValue) => {
  if (!isOpen.value && newValue !== HEX.value) initializeFromHex(newValue);
});
</script>

<style scoped>
.widget-shadow {
  box-shadow: 0 0 10px 2px rgb(var(--shadow-rgb) / 0.4);
}
.slider-shadow {
  box-shadow: 0 0 4px 3px rgb(var(--shadow-rgb) / 0.4);
}

.inset-border {
  box-shadow: inset 0 0 0 0.5px rgb(var(--white-rgb) / 0.5);
}
[data-theme="light"] .inset-border {
  box-shadow: inset 0 0 0 0.5px rgb(var(--white-rgb) / 0.2);
}

.hue-gradient {
  background: linear-gradient(
    to right,
    #FF0000 0%,
    #FFFF00 16.6%,
    #00FF00 33.3%,
    #00FFFF 50%,
    #0000FF 66.6%,
    #FF00FF 83.3%,
    #FF0000 100%
  );
}
</style>
