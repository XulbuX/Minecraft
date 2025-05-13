<template>
  <div class="flex flex-col items-center justify-center gap-3">
    <div
      v-if="!labelBelow"
      class="select-none text-lg font-700"
      :class="signTypeDetails?.isDark ? 'text-black/20 dark:text-white/20' : 'text-black/20'">
      {{ label }}
    </div>
    <EditorContent
      class="tiptap h-19 border-3 rounded p-2 text-center shadow-md transition-all-200"
      :class="signTypeDetails?.isDark ? 'border-white/5' : 'border-black/10'"
      :editor="tiptapEditor"
      :style="textAreaStyle" />
    <div
      v-if="labelBelow"
      class="select-none text-lg font-700"
      :class="signTypeDetails?.isDark ? 'text-black/20 dark:text-white/20' : 'text-black/20'">
      {{ label }}
    </div>
  </div>
</template>

<script setup lang="ts">
import type { TextSegment } from '@@/interfaces';
import type { EditorOptions, Editor as TiptapEditor } from '@tiptap/vue-3';
import type { Node as NodeEditor } from 'prosemirror-model';
import type { EditorView } from 'prosemirror-view';
import Bold from '@tiptap/extension-bold';
import { Color } from '@tiptap/extension-color';
import Italic from '@tiptap/extension-italic';
import TextStyle from '@tiptap/extension-text-style';
import Underline from '@tiptap/extension-underline';
import StarterKit from '@tiptap/starter-kit';
import { EditorContent, useEditor } from '@tiptap/vue-3';
import { AllSelection } from 'prosemirror-state';

const { maxLineWidthPx, defaultColor = 'black', textAreaBg, value } = defineProps<{
  defaultColor?: string;
  label: string;
  labelBelow?: boolean;
  maxLineWidthPx: number;
  signTypeDetails?: any;
  textAreaBg: string;
  value: TextSegment[][];
}>();

const emit = defineEmits<{
  (e: 'update:value', value: TextSegment[][]): void;
  (e: 'editorFocus', editor: TiptapEditor): void;
}>();

const textAreaStyle = computed(() => ({
  width: `${maxLineWidthPx + 4}px`,
  backgroundColor: textAreaBg,
}));

function segmentsToProseMirrorDoc(lines: TextSegment[][]): Record<string, any> {
  const content = lines.map((line) => {
    if (!line || line.length === 0) return { content: [{ marks: [{ attrs: { color: 'black' }, type: 'textStyle' }], text: '\n', type: 'text' }], type: 'paragraph' };
    return {
      content: line.map((segment) => {
        const marks = [];
        if (segment.bold) marks.push({ type: 'bold' });
        if (segment.italic) marks.push({ type: 'italic' });
        if (segment.underline) marks.push({ type: 'underline' });
        if (segment.color) marks.push({ attrs: { color: segment.color || defaultColor }, type: 'textStyle' });
        return {
          marks: marks.length > 0 ? marks : undefined,
          text: segment.text,
          type: 'text',
        };
      }),
      type: 'paragraph',
    };
  });

  while (content.length < 4) content.push({ content: [{ marks: [{ attrs: { color: 'black' }, type: 'textStyle' }], text: '\n', type: 'text' }], type: 'paragraph' });
  return { content: content.slice(0, 4), type: 'doc' };
}

const editorExtensions: EditorOptions['extensions'] = [
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
];

const tiptapEditor = useEditor({
  content: segmentsToProseMirrorDoc(value),
  editorProps: {
    handleKeyDown: (view, event) => {
      const { state } = view;
      const { doc, selection } = state;
      const { $from, $to, empty } = selection;
      const isMultiLineOrAllSelection = selection instanceof AllSelection || ($from.pos !== $to.pos && $from.parent !== $to.parent);

      if (isMultiLineOrAllSelection) {
        if (event.ctrlKey && (event.key.toLowerCase() === 'c' || event.key.toLowerCase() === 'x' || event.key.toLowerCase() === 'a')) {
          return false;
        }
        const allowedKeys = ['Control', 'Shift', 'Alt', 'Meta', 'CapsLock', 'Escape'];
        if (!allowedKeys.includes(event.key)) return true;
        return false;
      }

      if (event.key === 'Enter') {
        if (tiptapEditor.value) {
          const currentLineIndex = $from.index($from.depth - 1);
          const totalLines = doc.childCount;
          if (currentLineIndex < totalLines - 1) {
            let nextLineContentStartPosition = 0;
            for (let i = 0; i <= currentLineIndex; i++) {
              nextLineContentStartPosition += doc.child(i).nodeSize;
            }
            const targetPos = nextLineContentStartPosition + 1;
            tiptapEditor.value.chain().focus().setTextSelection(targetPos).run();
          }
        }
        return true;
      }

      if (event.key === 'Backspace' && empty) {
        if ($from.parentOffset === 0 && $from.index($from.depth - 1) > 0) {
          return true;
        }
      }

      if (event.key === 'Delete' && empty) {
        const currentParagraphNode = $from.parent;
        const currentLineIndex = $from.index($from.depth - 1);
        const isNotLastLine = currentLineIndex < doc.childCount - 1;

        if ($from.parentOffset === currentParagraphNode.content.size && currentParagraphNode.content.size > 0 && isNotLastLine) {
          return true;
        }
        if (currentParagraphNode.content.size === 0 && isNotLastLine) {
          return true;
        }
      }

      return false;
    },
    handlePaste: (view, event, slice) => {
      const { state } = view;
      const { selection } = state;
      const { $from, $to } = selection;

      const isMultiLineOrAllSelection = selection instanceof AllSelection || ($from.pos !== $to.pos && $from.parent !== $to.parent);
      if (isMultiLineOrAllSelection || slice.content.childCount > 1) {
        return true;
      }
      return false;
    },
    handleTextInput: (view, from, to, text) => {
      const { state } = view;
      const currentSelection = state.selection;
      const { $from, $to } = currentSelection;

      const isMultiLineOrAllSelection = currentSelection instanceof AllSelection || ($from.pos !== $to.pos && $from.parent !== $to.parent);
      if (isMultiLineOrAllSelection || text.includes('\n') || maxLineWidthExceeded(view, from, text)) {
        return true;
      }
      return false;
    },
  },
  extensions: editorExtensions,
  onFocus: () => {
    if (tiptapEditor.value) emit('editorFocus', tiptapEditor.value);
  },
  onUpdate: ({ editor: updatedEditor }) => {
    const currentData = transformToCustomJson(updatedEditor.getJSON());
    emit('update:value', currentData);
  },
});

watch(() => value, (newValue) => {
  if (tiptapEditor.value) {
    const editorJson = tiptapEditor.value.getJSON();
    const editorContentAsCustomJson = transformToCustomJson(editorJson);
    if (JSON.stringify(editorContentAsCustomJson) !== JSON.stringify(newValue)) {
      tiptapEditor.value.commands.setContent(segmentsToProseMirrorDoc(newValue), false);
    }
  }
}, { deep: true });

onBeforeUnmount(() => tiptapEditor.value?.destroy());

function maxLineWidthExceeded(view: EditorView, pos: number, newText: string): boolean {
  if (!view || !newText) return false;
  const { state } = view;
  const $pos = state.doc.resolve(pos);
  const paragraph = $pos.parent;

  let textBefore = '';
  paragraph.nodesBetween(0, $pos.parentOffset, (node: NodeEditor) => {
    if (node.isText) textBefore += node.text;
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
          if (
            lastSegment
            && !!lastSegment.bold === !!segment.bold
            && !!lastSegment.italic === !!segment.italic
            && !!lastSegment.underline === !!segment.underline
            && lastSegment.color === segment.color
          ) {
            lastSegment.text += segment.text;
          }
          else {
            if (segment.bold === undefined) {
              segment.bold = false;
            }
            if (segment.italic === undefined) {
              segment.italic = false;
            }
            if (segment.underline === undefined) {
              segment.underline = false;
            }
            line.push(segment);
          }
        }
      });
    }
    result.push(line);
  });

  while (result.length < 4) result.push([]);
  return result.slice(0, 4);
}
</script>

<style>
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
