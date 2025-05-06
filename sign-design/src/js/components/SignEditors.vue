<template>
  <div class="overflow-clip">
    <EditorToolbar
      :editor="activeEditorInstance"
      :minecraft-colors="minecraftColors"
      @apply-color="applyColorToSelection"
      @reset-formatting="resetFormatting" />
    <div
      class="top-shadow flex flex-col items-center justify-center gap-3 border border-t-0 border-white/10 rounded-b-lg p-3 duration-200 sm:flex-row"
      :style="{ backgroundColor: `${textAreaBg}BB` }">
      <SignEditor
        label="FRONT"
        :label-below="winWidth >= 640"
        :max-line-width-px="maxLineWidthPx"
        :sign-type-details="signTypeDetails"
        :text-area-bg="textAreaBg"
        :value="modelValue.front"
        @editor-focus="handleEditorFocus"
        @update:value="updateFrontValue" />
      <SignEditor
        label="BACK"
        label-below
        :max-line-width-px="maxLineWidthPx"
        :sign-type-details="signTypeDetails"
        :text-area-bg="textAreaBg"
        :value="modelValue.back"
        @editor-focus="handleEditorFocus"
        @update:value="updateBackValue" />
    </div>
  </div>
</template>

<script setup lang="ts">
import type { FormattedLines, TextSegment } from '@@/interfaces';
import type { Editor as TiptapEditor } from '@tiptap/vue-3';
import { useWinSize } from '@@/helpers/win';
import SignEditor from './SignEditor.vue';

const { maxLineWidthPx, minecraftColors, modelValue, signTypeDetails } = defineProps<{
  maxLineWidthPx: number;
  minecraftColors: MinecraftColor[];
  modelValue: FormattedLines;
  signTypeDetails?: any;
}>();

const emit = defineEmits<{ (e: 'update:modelValue', value: FormattedLines): void }>();

const { w: winWidth } = useWinSize();
const activeEditorInstance = ref<TiptapEditor | undefined>();

const textAreaBg = computed(() => signTypeDetails?.hex ?? '#374151');

function handleEditorFocus(editor: TiptapEditor) {
  activeEditorInstance.value = editor;
}

function updateFrontValue(frontValue: TextSegment[][]) {
  emit('update:modelValue', { ...modelValue, front: frontValue });
}

function updateBackValue(backValue: TextSegment[][]) {
  emit('update:modelValue', { ...modelValue, back: backValue });
}

function applyColorToSelection(color: string) {
  const targetEditor = activeEditorInstance.value;
  if (!targetEditor) return;
  if (color) {
    targetEditor.chain().focus().setColor(color).run();
  }
  else {
    targetEditor.chain().focus().unsetColor().run();
  }
}

function resetFormatting() {
  const targetEditor = activeEditorInstance.value;
  if (!targetEditor) return;
  targetEditor.chain().focus().unsetColor().unsetBold().unsetItalic().unsetUnderline().run();
}
</script>

<style>
.top-shadow {
  box-shadow: inset 0 5px 5px 0 #03030520;
}
</style>
