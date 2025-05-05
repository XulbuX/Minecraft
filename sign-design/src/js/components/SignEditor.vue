<template>
  <div>
    <EditorToolbar
      :editor="activeEditor"
      :minecraft-colors
      @apply-color="applyColorToSelection"
      @reset-formatting="resetFormatting" />
    <div
      class="top-shadow flex items-center justify-center gap-3 border border-t-0 border-white/10 rounded-b-lg p-3 duration-200"
      :style="{ backgroundColor: `${textAreaBg}CC` }">
      <EditorContent
        class="tiptap h-19 rounded p-2 text-center shadow-md duration-200"
        :class="signTypeDetails?.isDark ? 'border-white/10' : 'border-black/10'"
        :editor-1
        :style="textAreaStyle" />
      <EditorContent
        class="tiptap h-19 rounded p-2 text-center shadow-md duration-200"
        :class="signTypeDetails?.isDark ? 'border-white/10' : 'border-black/10'"
        :editor-2
        :style="textAreaStyle" />
    </div>
  </div>
</template>

<script setup lang="ts">
import type { FormattedLines, TextSegment } from '@@/interfaces';
import type { Editor, EditorOptions } from '@tiptap/vue-3';
import type { Node as EditorNode } from 'prosemirror-model';
import type { EditorView } from 'prosemirror-view';
import Bold from '@tiptap/extension-bold';
import { Color } from '@tiptap/extension-color';
import Italic from '@tiptap/extension-italic';
import TextStyle from '@tiptap/extension-text-style';
import Underline from '@tiptap/extension-underline';
import StarterKit from '@tiptap/starter-kit';
import { EditorContent, useEditor } from '@tiptap/vue-3';
import EditorToolbar from './EditorToolbar.vue';

const { maxLineWidthPx, modelValue, signTypeDetails } = defineProps<{
  modelValue: FormattedLines;
  signTypeDetails?: SignType;
  maxLineWidthPx: number;
  minecraftColors: MinecraftColor[];
}>();

const emit = defineEmits<{ (e: 'update:modelValue', value: FormattedLines): void }>();

const textAreaBg = computed(() => signTypeDetails?.hex ?? '#374151');
const textAreaStyle = computed(() => ({
  width: `${maxLineWidthPx + 4}px`,
  backgroundColor: textAreaBg.value,
}));

const editorConfig: Partial<EditorOptions> = {
  content: '<p></p><p></p><p></p><p></p>',
  editorProps: {
    handleKeyDown: (view, event) => {
      if (event.key === 'Enter' && view.state.doc.content.childCount >= 4) {
        return true;
      }
      return false;
    },
    handlePaste: (view, _, slice) => {
      const { state } = view;
      const currentLineCount = state.doc.content.childCount;
      let pastedLineCount = 0;
      slice.content.forEach((node) => {
        if (node.type.name === 'paragraph') {
          pastedLineCount++;
        }
      });
      const potentialLineCount = currentLineCount + pastedLineCount - (pastedLineCount > 0 ? 1 : 0);
      if (potentialLineCount > 4) {
        return true;
      }
      return false;
    },
    handleTextInput: (view, from, to, text) => {
      const { state } = view;
      const transaction = state.tr.insertText(text, from, to);
      const nodeCount = transaction.doc.content.childCount;

      if (text === '\n' && nodeCount >= 4) {
        return true;
      }

      if (maxLineWidthExceeded(view, from, text)) {
        return true;
      }

      view.dispatch(transaction);
      return true;
    },
  },
  extensions: [
    StarterKit.configure({
      blockquote: false,
      bold: false,
      bulletList: false,
      codeBlock: false,
      dropcursor: false,
      gapcursor: false,
      hardBreak: false,
      heading: false,
      horizontalRule: false,
      italic: false,
      listItem: false,
      orderedList: false,
      paragraph: {},
    }),
    Bold.configure({ HTMLAttributes: { class: 'font-minecraft' } }),
    Italic.configure({ HTMLAttributes: { class: 'font-minecraft' } }),
    Underline.configure({ HTMLAttributes: { class: 'font-minecraft' } }),
    TextStyle,
    Color,
  ],
};

const editor1 = useEditor({
  ...editorConfig,
  onUpdate: ({ editor }) => {
    const frontData = transformToCustomJson(editor.getJSON());
    emit('update:modelValue', { ...modelValue, front: frontData });
  },
});

const editor2 = useEditor({
  ...editorConfig,
  onUpdate: ({ editor }) => {
    const backData = transformToCustomJson(editor.getJSON());
    emit('update:modelValue', { ...modelValue, back: backData });
  },
});

const activeEditor = computed<Editor | undefined>(() => {
  if (editor1.value?.isFocused) return editor1.value;
  if (editor2.value?.isFocused) return editor2.value;
  return editor1.value;
});

function maxLineWidthExceeded(view: EditorView, pos: number, newText: string): boolean {
  if (!view || !newText) return false;

  const { state } = view;
  const $pos = state.doc.resolve(pos);
  const paragraph = $pos.parent;

  let textBefore = '';
  paragraph.nodesBetween(0, $pos.parentOffset, (node: EditorNode) => {
    if (node.isText) {
      textBefore += node.text;
    }
  });

  const testElement = document.createElement('span');
  testElement.className = 'font-minecraft';
  testElement.style.visibility = 'hidden';
  testElement.style.position = 'absolute';
  testElement.style.whiteSpace = 'nowrap';

  testElement.textContent = textBefore + newText;

  document.body.appendChild(testElement);
  const width = testElement.getBoundingClientRect().width;
  document.body.removeChild(testElement);

  return width > maxLineWidthPx;
}

function transformToCustomJson(proseMirrorJson: any): TextSegment[][] {
  const result: TextSegment[][] = [];
  if (!proseMirrorJson || !proseMirrorJson.content) return [[], [], [], []];

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
              if (mark.type === 'underline') segment.underline = true;
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
            && !!lastSegment.underline === !!segment.underline
            && lastSegment.color === segment.color) {
            lastSegment.text += segment.text;
          }
          else {
            if (segment.bold === undefined) segment.bold = false;
            if (segment.italic === undefined) segment.italic = false;
            if (segment.underline === undefined) segment.underline = false;
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

function applyColorToSelection(color: string) {
  const targetEditor = activeEditor.value;
  if (!targetEditor) return;
  if (color) {
    targetEditor.chain().focus().setColor(color).run();
  }
  else {
    targetEditor.chain().focus().unsetColor().run();
  }
}

function resetFormatting() {
  const targetEditor = activeEditor.value;
  if (!targetEditor) return;
  targetEditor.chain().focus().unsetColor().unsetBold().unsetItalic().unsetUnderline().run();
}

onBeforeUnmount(() => {
  editor1.value?.destroy();
  editor2.value?.destroy();
});
</script>

<style>
.top-shadow {
  box-shadow: inset 0 5px 5px 0 #03030520;
}

.tiptap p {
  margin: 0;
  overflow: hidden;
  white-space: nowrap;
  font-family: 'Minecraft', monospace;
}
.tiptap span {
  font-family: 'Minecraft', monospace;
}
.tiptap strong, .format-b {
  font-weight: bold;
  font-family: 'Minecraft', monospace;
}
.tiptap em, .format-i {
  font-style: italic;
  font-family: 'Minecraft', monospace;
}
.tiptap u, .format-u {
  text-decoration: underline 2px;
  font-family: 'Minecraft', monospace;
}
</style>
