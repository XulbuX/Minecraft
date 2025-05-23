<template>
  <div v-on-click-outside="closePicker" class="relative" :title>
    <div
      ref="colorPickerRef"
      class="inset-border h-6 flex cursor-pointer select-none items-center justify-center rounded-md px-1.5 font-mono"
      :style="colorPickerButtonStyle(modelValue)"
      @click="togglePicker">
      {{ modelValue }}
    </div>
    <Teleport to="body">
      <AnimatePresence>
        <motion.div
          v-if="isOpen"
          ref="popupRef"
          :animate="{ opacity: 1, y: 0 }"
          class="widget-shadow absolute z-50 border border-black/5 rounded-lg bg-gray-2/80 p-3 backdrop-blur-5 dark:border-white/10 dark:bg-gray-7/80"
          :exit="{ opacity: 0, y: -10, scale: 0.95 }"
          :initial="{ opacity: 0, y: -10 }"
          :style="popupPosition"
          :transition="{ duration: 0.2, ease: 'easeOut' }">
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
            <!-- UNIVERSAL TEXT INPUT -->
            <div class="relative mb-3 flex items-center rounded bg-black/5! dark:bg-white/8!">
              <input
                ref="universalInputRef"
                v-model="textInputValue"
                class="flex-1 rounded bg-white/50 px-1.5 py-1 text-black font-mono outline-1 outline-black/5 transition-all-200 dark:bg-black/30 dark:text-white dark:outline-white/10"
                type="text"
                @blur="isTextInputFocused = false"
                @focus="isTextInputFocused = true"
                @input="parseTextInput"
                @keydown.enter="handleInputEnterKey">
              <button
                class="absolute bottom-0 right-0 top-0 flex items-center justify-center bg-transparent px-1.5 py-1"
                title="Change input color type"
                @click="toggleInputColorFormat">
                <svg class="mr-9 size-3 min-w-3 color-black/16 dark:color-white/40" fill="currentColor" stroke="none" viewBox="0 0 448 512">
                  <path d="M244 7c-11.7-9.3-28.3-9.3-40 0L44 135c-13.8 11-16 31.2-5 45s31.2 16 45 5L224 73l140 112c13.8 11 33.9 8.8 45-5s8.8-33.9-5-45L244 7zm160 370c13.8-11 16-31.2 5-45s-31.2-16-45-5L224 439 84 327c-13.8-11-33.9-8.8-45 5s-8.8 33.9 5 45l160 128c11.7 9.3 28.3 9.3 40 0l160-128z" />
                </svg>
              </button>
              <div class="w-9 flex items-center justify-center text-sm text-black/25 font-jetbrains dark:text-white/40">
                {{ currentFormat }}
              </div>
            </div>
            <!-- PREVIEW AND ACTIONS -->
            <div class="flex select-none items-center">
              <div class="inset-border mr-3 size-6 rounded" :style="{ backgroundColor: HEX }" />
              <button
                class="mr-1 cursor-pointer rounded bg-white/40 p-1 px-2 text-black transition-all-200 transition-all-200 dark:bg-gray-5/40 hover:bg-white/60 dark:text-white dark:hover:bg-gray-4/40"
                @click="applyColor">
                Apply
              </button>
              <button
                class="mr-1 cursor-pointer rounded bg-white/40 p-1 px-2 text-black/50 transition-all-200 transition-all-200 dark:bg-gray-5/40 dark:text-white/50"
                @click="closePicker">
                Cancel
              </button>
            </div>
          </div>
        </motion.div>
      </AnimatePresence>
    </Teleport>
  </div>
</template>

<script setup lang="ts">
import { vOnClickOutside } from '@vueuse/components';
import { AnimatePresence, motion } from 'motion-v';

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
const isTextInputFocused = ref(false);

const popupRef = ref<HTMLElement | null>(null);
const popupPosition = ref({ left: '0px', top: '0px' });
const colorPickerRef = ref<HTMLElement | null>(null);
const satValAreaRef = ref<HTMLElement | null>(null);
const hueSliderRef = ref<HTMLElement | null>(null);
const universalInputRef = ref<HTMLInputElement | null>(null);

const HUE = ref(0);
const SAT = ref(100);
const VAL = ref(100);
const HEX = ref('');
const textInputValue = ref('');

type ColorFormat = 'HEX' | 'RGB' | 'HSL';
const availableFormats: ColorFormat[] = ['HEX', 'RGB', 'HSL'];
const currentFormatIndex = ref(0);
const currentFormat = computed(() => availableFormats[currentFormatIndex.value]);

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

  switch (Math.floor(h / 60)) {
    case 0:
      r = c;
      g = x;
      b = 0;
      break;
    case 1:
      r = x;
      g = c;
      b = 0;
      break;
    case 2:
      r = 0;
      g = c;
      b = x;
      break;
    case 3:
      r = 0;
      g = x;
      b = c;
      break;
    case 4:
      r = x;
      g = 0;
      b = c;
      break;
    case 5:
      r = c;
      g = 0;
      b = x;
      break;
  }
  return {
    b: Math.round((b + m) * 255),
    g: Math.round((g + m) * 255),
    r: Math.round((r + m) * 255),
  };
}

function rgbToHsl(r: number, g: number, b: number) {
  r /= 255;
  g /= 255;
  b /= 255;
  const max = Math.max(r, g, b);
  const min = Math.min(r, g, b);
  const delta = max - min;
  let h = 0;
  let s = 0;
  const l = (max + min) / 2;

  if (delta !== 0) {
    s = delta / (1 - Math.abs(2 * l - 1));
    switch (max) {
      case r:
        h = ((g - b) / delta) % 6;
        break;
      case g:
        h = (b - r) / delta + 2;
        break;
      case b:
        h = (r - g) / delta + 4;
        break;
    }
    h = Math.round(h * 60);
    if (h < 0) h += 360;
  }

  return { h, l: Math.round(l * 100), s: Math.round(s * 100) };
}

function hslToRgb(h: number, s: number, l: number) {
  h = h % 360;
  s = s / 100;
  l = l / 100;
  const c = (1 - Math.abs(2 * l - 1)) * s;
  const x = c * (1 - Math.abs((h / 60) % 2 - 1));
  const m = l - c / 2;
  let r = 0;
  let g = 0;
  let b = 0;

  switch (Math.floor(h / 60)) {
    case 0:
      r = c;
      g = x;
      b = 0;
      break;
    case 1:
      r = x;
      g = c;
      b = 0;
      break;
    case 2:
      r = 0;
      g = c;
      b = x;
      break;
    case 3:
      r = 0;
      g = x;
      b = c;
      break;
    case 4:
      r = x;
      g = 0;
      b = c;
      break;
    case 5:
      r = c;
      g = 0;
      b = x;
      break;
  }
  return {
    b: Math.round((b + m) * 255),
    g: Math.round((g + m) * 255),
    r: Math.round((r + m) * 255),
  };
}

function updateDisplaysFromHsv() {
  const rgbForHex = hsvToRgb(HUE.value, SAT.value, VAL.value);
  const rHex = rgbForHex.r.toString(16).padStart(2, '0').toUpperCase();
  const gHex = rgbForHex.g.toString(16).padStart(2, '0').toUpperCase();
  const bHex = rgbForHex.b.toString(16).padStart(2, '0').toUpperCase();
  if (rHex !== 'NAN' && gHex !== 'NAN' && bHex !== 'NAN') {
    HEX.value = `#${rHex}${gHex}${bHex}`;
  }

  if (isTextInputFocused.value) return;

  switch (currentFormat.value) {
    case 'HEX':
      textInputValue.value = HEX.value;
      break;
    case 'RGB': {
      const { b, g, r } = hsvToRgb(HUE.value, SAT.value, VAL.value);
      textInputValue.value = `rgb(${r},${g},${b})`;
      break;
    }
    case 'HSL': {
      const { b, g, r } = hsvToRgb(HUE.value, SAT.value, VAL.value);
      const hsl = rgbToHsl(r, g, b);
      textInputValue.value = `hsl(${hsl.h},${hsl.s}%,${hsl.l}%)`;
      break;
    }
  }
}

function parseTextInput() {
  const input = textInputValue.value.trim();
  let r: number | undefined, g: number | undefined, b: number | undefined;
  let h: number | undefined, s: number | undefined, l: number | undefined;

  try {
    switch (currentFormat.value) {
      case 'HEX': {
        let hex = cleanHex(input);
        if (/^[0-9A-F]{3}|[0-9A-F]{6}$/i.test(hex)) {
          if (hex.length === 3) hex = hex.split('').map(c => c + c).join('');
          r = Number.parseInt(hex.substring(0, 2), 16);
          g = Number.parseInt(hex.substring(2, 4), 16);
          b = Number.parseInt(hex.substring(4, 6), 16);
        }
        else {
          return;
        }
        break;
      }
      case 'RGB': {
        const match = input.match(/^(?:rgb\s*\(\s*)?(\d{1,3})[,\s]+(\d{1,3})[,\s]+(\d{1,3})\s*\)?$/i);
        if (match) {
          r = Number.parseInt(match[1]);
          g = Number.parseInt(match[2]);
          b = Number.parseInt(match[3]);
          if (r > 255 || g > 255 || b > 255) return;
        }
        else {
          return;
        }
        break;
      }
      case 'HSL': {
        const match = input.match(/^(?:hsl\s*\(\s*)?(\d{1,3})[,\s]+(\d{1,3})%?[,\s]+(\d{1,3})%?\s*\)?$/i);
        if (match) {
          h = Number.parseInt(match[1]);
          s = Number.parseInt(match[2]);
          l = Number.parseInt(match[3]);
          if (h > 360 || s > 100 || l > 100) {
            return;
          }
          else {
            const rgbFromHsl = hslToRgb(h, s, l);
            r = rgbFromHsl.r;
            g = rgbFromHsl.g;
            b = rgbFromHsl.b;
          }
        }
        else {
          return;
        }
        break;
      }
    }

    if (r !== undefined && g !== undefined && b !== undefined
      && !Number.isNaN(r) && !Number.isNaN(g) && !Number.isNaN(b)) {
      const hsv = rgbToHsv(r, g, b);
      if (hsv.s !== 0 || VAL.value === 0 || VAL.value === 100 || (hsv.s === 0 && hsv.h === HUE.value)) {
        HUE.value = hsv.h;
      }
      SAT.value = hsv.s;
      VAL.value = hsv.v;
      updateDisplaysFromHsv();
    }
  }
  catch (error) {
    console.warn('Color parsing error:', error);
  }
}

function handleInputEnterKey() {
  if (universalInputRef.value) {
    universalInputRef.value.blur();
  }
  applyColor();
}

function initializeFromHex(hexColor: string) {
  const hex = cleanHex(hexColor);
  const r = Number.parseInt(hex.substring(0, 2), 16);
  const g = Number.parseInt(hex.substring(2, 4), 16);
  const b = Number.parseInt(hex.substring(4, 6), 16);

  if (!Number.isNaN(r) && !Number.isNaN(g) && !Number.isNaN(b)) {
    const hsv = rgbToHsv(r, g, b);
    HUE.value = hsv.h;
    SAT.value = hsv.s;
    VAL.value = hsv.v;
    updateDisplaysFromHsv();
  }
}

initializeFromHex(modelValue);

function calculateAndSetPopupPosition() {
  if (!isOpen.value) return;
  nextTick(() => {
    const buttonRect = colorPickerRef.value?.getBoundingClientRect();
    const motionComponentInstance = popupRef.value;
    const popupEl = (motionComponentInstance as any)?.$el as HTMLElement | undefined;

    if (buttonRect && popupEl && popupEl instanceof HTMLElement) {
      let popupWidth = popupEl.offsetWidth;
      let popupHeight = popupEl.offsetHeight;

      if (popupWidth === 0 && popupEl.firstElementChild) popupWidth = (popupEl.firstElementChild as HTMLElement).offsetWidth;
      if (popupHeight === 0 && popupEl.firstElementChild) popupHeight = (popupEl.firstElementChild as HTMLElement).offsetHeight;
      if (typeof popupWidth !== 'number' || popupWidth === 0 || typeof popupHeight !== 'number' || popupHeight === 0) {
        console.error('ColorPicker Position Debug: Invalid or zero popup dimensions after .$el access and fallback.', { popupWidth, popupHeight });
        setTimeout(calculateAndSetPopupPosition, 50);
        return;
      }

      const margin = 10;

      let newLeft = buttonRect.left;
      if (newLeft + popupWidth > window.innerWidth - margin) newLeft = window.innerWidth - popupWidth - margin;
      if (newLeft < margin) newLeft = margin;
      newLeft = Math.max(margin, Math.min(newLeft, window.innerWidth - popupWidth - margin));
      let newTop = buttonRect.bottom + 5;
      if ((buttonRect.bottom + 5 + popupHeight) > (window.innerHeight - margin)) newTop = buttonRect.top - popupHeight - 5;
      const finalLeft = newLeft + window.scrollX;
      const finalTop = newTop + window.scrollY;
      popupPosition.value = { left: `${finalLeft}px`, top: `${finalTop}px` };
    }
    else {
      if (buttonRect) popupPosition.value = { left: `${buttonRect.left + window.scrollX}px`, top: `${buttonRect.bottom + 5 + window.scrollY}px` };
    }
  });
}

function closePicker() {
  if (!justFinishedDragging.value) isOpen.value = false;
}

function togglePicker() {
  isOpen.value = !isOpen.value;
  if (isOpen.value) calculateAndSetPopupPosition();
}

function toggleInputColorFormat() {
  currentFormatIndex.value = (currentFormatIndex.value + 1) % availableFormats.length;
  isTextInputFocused.value = false;
  updateDisplaysFromHsv();
}

function applyColor() {
  const currentRgb = hsvToRgb(HUE.value, SAT.value, VAL.value);
  const rH = currentRgb.r.toString(16).padStart(2, '0').toUpperCase();
  const gH = currentRgb.g.toString(16).padStart(2, '0').toUpperCase();
  const bH = currentRgb.b.toString(16).padStart(2, '0').toUpperCase();
  const finalHex = `#${rH}${gH}${bH}`;

  if (finalHex !== modelValue) {
    emit('update:modelValue', finalHex);
    emit('change', finalHex);
  }
  closePicker();
}

function blurActiveColorInput() {
  if (universalInputRef.value && document.activeElement === universalInputRef.value) {
    universalInputRef.value.blur();
  }
}

function startHueDrag(event: MouseEvent | TouchEvent) {
  event.preventDefault();
  blurActiveColorInput();
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
  blurActiveColorInput();
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
  const rgbForHex = hsvToRgb(HUE.value, SAT.value, VAL.value);
  const rHex = rgbForHex.r.toString(16).padStart(2, '0').toUpperCase();
  const gHex = rgbForHex.g.toString(16).padStart(2, '0').toUpperCase();
  const bHex = rgbForHex.b.toString(16).padStart(2, '0').toUpperCase();
  HEX.value = `#${rHex}${gHex}${bHex}`;

  if (!isTextInputFocused.value) {
    updateDisplaysFromHsv();
  }
}, { immediate: false });

watch(isOpen, (newValue) => {
  if (newValue) {
    initializeFromHex(modelValue);
    window.addEventListener('resize', calculateAndSetPopupPosition);
    window.addEventListener('scroll', calculateAndSetPopupPosition, true);
    calculateAndSetPopupPosition();
  }
  else {
    window.removeEventListener('resize', calculateAndSetPopupPosition);
    window.removeEventListener('scroll', calculateAndSetPopupPosition, true);
    stopHueDrag();
    stopSatValDrag();
  }
});

onUnmounted(() => {
  window.removeEventListener('resize', calculateAndSetPopupPosition);
  window.removeEventListener('scroll', calculateAndSetPopupPosition, true);
  stopHueDrag();
  stopSatValDrag();
});

watch(() => modelValue, (newValue) => {
  const currentDerivedHex = HEX.value;
  if (!isOpen.value || (newValue !== currentDerivedHex && !isTextInputFocused.value)) {
    initializeFromHex(newValue);
  }
});
</script>

<style scoped>
.widget-shadow {
  box-shadow: 0 0 10px 2px rgb(var(--shadow-rgb) / 0.4);
}
[data-theme="light"] .widget-shadow {
  box-shadow: 0 0 10px 2px rgb(var(--shadow-rgb) / 0.2);
}
.slider-shadow {
  box-shadow: 0 0 4px 3px rgb(var(--shadow-rgb) / 0.3);
}

.inset-border {
  box-shadow: inset 0 0 0 0.5px rgb(var(--white-rgb) / 0.3);
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
