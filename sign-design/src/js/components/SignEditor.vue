<template>
  <div>
    <EditorToolbar
      v-if="editor"
      :editor="editor"
      :minecraft-colors="minecraftColors"
      @apply-color="handleApplyColor"
      @reset-formatting="handleResetFormatting" />
    <EditorContent class="tiptap font-minecraft" :editor="editor" :style="editorStyle" />
  </div>
</template>

<script setup lang="ts">
import { Color } from '@tiptap/extension-color';
import TextStyle from '@tiptap/extension-text-style';
import StarterKit from '@tiptap/starter-kit';
import { EditorContent, useEditor } from '@tiptap/vue-3';
import EditorToolbar from './EditorToolbar.vue';

type TextSegment = {
  text: string;
  bold?: boolean;
  italic?: boolean;
  color?: string | null;
};
type FormattedLines = TextSegment[][];

const { signTypeDetails } = defineProps<{
  modelValue: FormattedLines;
  maxLineLength?: number;
  signTypeDetails?: SignType;
  minecraftColors: MinecraftColor[];
}>();

const emit = defineEmits<{ (e: 'update:modelValue', value: FormattedLines): void }>();

const editor = useEditor({
  content: '<p></p><p></p><p></p><p></p>',
  extensions: [
    StarterKit.configure({
      blockquote: false,
      bulletList: false,
      codeBlock: false,
      hardBreak: false,
      heading: false,
      horizontalRule: false,
      listItem: false,
      orderedList: false,
    }),
    TextStyle,
    Color,
  ],
  onUpdate: () => {
    emit('update:modelValue', transformToCustomJson(editor.value?.getJSON()));
  },
});

const editorStyle = computed(() => ({
  backgroundColor: signTypeDetails?.rgb ?? '#333',
}));

function transformToCustomJson(proseMirrorJson: any): FormattedLines {
  const result: FormattedLines = [];
  if (!proseMirrorJson || !proseMirrorJson.content) {
    return [[], [], [], []];
  }

  proseMirrorJson.content.forEach((paragraphNode: any) => {
    const line: TextSegment[] = [];
    if (paragraphNode.type === 'paragraph' && paragraphNode.content) {
      paragraphNode.content.forEach((node: any) => {
        if (node.type === 'text' && node.text) {
          const segment: TextSegment = { text: node.text };
          if (node.marks) {
            let hasColorMark = false;
            node.marks.forEach((mark: any) => {
              if (mark.type === 'bold') segment.bold = true;
              if (mark.type === 'italic') segment.italic = true;
              if (mark.type === 'textStyle' && mark.attrs?.color) {
                segment.color = mark.attrs.color;
                hasColorMark = true;
              }
            });
            if (!hasColorMark) segment.color = null;
          }
          else {
            segment.color = null;
          }

          const lastSegment = line[line.length - 1];
          if (lastSegment
            && !!lastSegment.bold === !!segment.bold
            && !!lastSegment.italic === !!segment.italic
            && lastSegment.color === segment.color) {
            lastSegment.text += segment.text;
          }
          else {
            if (segment.bold === undefined) segment.bold = false;
            if (segment.italic === undefined) segment.italic = false;
            line.push(segment);
          }
        }
      });
    }
    result.push(line);
  });

  while (result.length < 4) {
    result.push([]);
  }

  return result.slice(0, 4);
}

function handleApplyColor(color: string) {
  applyColorToSelection(color);
}

function handleResetFormatting() {
  resetFormatting();
}

function applyColorToSelection(color: string) {
  if (!editor.value) return;
  if (color) {
    editor.value.chain().focus().setColor(color).run();
  }
  else {
    editor.value.chain().focus().unsetColor().run();
  }
}

function resetFormatting() {
  if (!editor.value) return;
  editor.value.chain().focus().unsetColor().unsetBold().unsetItalic().run();
}

onBeforeUnmount(() => {
  if (editor.value) {
    editor.value.destroy();
  }
});
</script>

<style>
.tiptap {
  border: 1px solid #666;
  padding: 0.5rem;
  min-height: 100px;
  color: #eee;
  border-radius: 0 0 0.5rem 0.5rem;
}
.tiptap p {
  margin: 0;
  min-height: 1.2em;
}
.tiptap:focus {
  outline: none;
  border-color: #888;
}
</style>
