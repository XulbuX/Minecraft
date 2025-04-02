<template>
  <div
    class="relative mb-5 select-text rounded-md p-4 transition-all duration-200"
    :style="signSpecificStyle"
    @mousedown.prevent="handleEditorMouseDown">
    <div class="flex flex-col gap-2 transition-all duration-200">
      <div v-for="idx in 4" :key="idx" class="flex items-center gap-4">
        <div
          ref="lineEditors"
          class="h-5 w-full cursor-text overflow-clip whitespace-nowrap rounded p-1.5 font-minecraft transition-all duration-200"
          :class="bgBrightness < 127
            ? `backdrop-brightness-107 ${activeLineIndex === idx - 1 ? 'ring-2 ring-white/10' : ''}`
            : `backdrop-brightness-97 ${activeLineIndex === idx - 1 ? 'ring-2 ring-black/8' : ''}`"
          contenteditable="true"
          spellcheck="false"
          @input="handleInput($event, idx - 1)"
          @keydown="handleKeyDown($event, idx - 1)"
          @keyup="onTextSelection(idx - 1)"
          @mousedown="handleLineMouseDown($event, idx - 1)"
          @mouseup="onTextSelection(idx - 1)" />
        <div
          class="select-none text-xs transition-all duration-200"
          :class="isLineTooLong(idx - 1) ? 'text-red-5 font-bold' : (bgBrightness > 127 ? 'text-gray-8' : 'text-white')">
          {{ getLineLength(idx - 1) }}/{{ maxLineLength }}
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { SIGN_TYPES } from 'minecraft';

type TextSegment = {
  text: string;
  color: string | null;
};
type Props = {
  signType: string;
  maxLineLength: number;
  formattedLines: TextSegment[][];
};

const props = defineProps<Props>();
const emit = defineEmits<{
  (e: 'update:formattedLines', lines: TextSegment[][]): void;
}>();

const selectedRange = ref<Range | null>(null);
const selectedLineIndex = ref<number | null>(null);
const activeLineIndex = ref<number | null>(null);
const lineEditors = ref<HTMLElement[]>([]);

const signSpecificStyle = computed(() => {
  return { backgroundColor: SIGN_TYPES[props.signType]?.rgb || SIGN_TYPES.oak_sign.rgb };
});
const bgBrightness = computed(() => {
  const rgbMatch = signSpecificStyle.value.backgroundColor.match(/rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/i) || [];
  const r = Number.parseInt(rgbMatch[1], 10);
  const g = Number.parseInt(rgbMatch[2], 10);
  const b = Number.parseInt(rgbMatch[3], 10);
  return (0.299 * r + 0.587 * g + 0.114 * b);
});

onMounted(() => {
  nextTick(() => {
    if (lineEditors.value) {
      lineEditors.value.forEach((editor, index) => {
        const htmlContent = renderFormattedLine(index);
        if (htmlContent) editor.innerHTML = htmlContent;
      });
    }

    focusLine(0);
  });
});

function focusLine(index: number): void {
  activeLineIndex.value = index;
  if (lineEditors.value && lineEditors.value[index]) {
    lineEditors.value[index].focus();
    setCaretToEnd(lineEditors.value[index]);
  }
}

function handleInput(event: Event, index: number): void {
  const editor = event.target as HTMLElement;
  const plainText = editor.textContent?.replace(/\n/g, '') ?? '';

  if (plainText.length > props.maxLineLength) {
    const selectionStart = getCaretPosition(editor);
    const truncated = plainText.substring(0, props.maxLineLength);
    if (editor.textContent !== truncated) {
      editor.textContent = truncated;
      const newPos = Math.min(selectionStart, truncated.length);
      setCaretToPosition(editor, newPos);
    }
  }

  parseFormattedLine(index, editor.innerHTML);
}

function handleKeyDown(event: KeyboardEvent, index: number): void {
  if (event.key === 'Enter') {
    event.preventDefault();
    if (index < 3) focusLine(index + 1);
    return;
  }

  if (event.key === 'ArrowUp') {
    if (index > 0) {
      event.preventDefault();
      focusLine(index - 1);
    }
  }
  else if (event.key === 'ArrowDown') {
    if (index < 3) {
      event.preventDefault();
      focusLine(index + 1);
    }
  }
}

function handleEditorMouseDown(event: MouseEvent): void {
  if (!(event.target as HTMLElement).classList.contains('sign-line')) {
    event.preventDefault();
  }
}

function handleLineMouseDown(event: MouseEvent, index: number): void {
  activeLineIndex.value = index;
  event.stopPropagation();
}

function setCaretToEnd(element: HTMLElement): void {
  const range = document.createRange();
  const selection = window.getSelection();
  if (!selection) return;

  range.selectNodeContents(element);
  range.collapse(false);
  selection.removeAllRanges();
  selection.addRange(range);
  element.focus();
}

function setCaretToPosition(element: HTMLElement, position: number): void {
  if (!element.childNodes.length) {
    element.focus();
    return;
  }

  const selection = window.getSelection();
  if (!selection) return;

  const range = document.createRange();
  let currentPos = 0;
  let targetNode: Node | null = null;
  let targetOffset = 0;

  const findPosition = (node: Node): boolean => {
    if (node.nodeType === Node.TEXT_NODE) {
      if (currentPos + node.textContent!.length >= position) {
        targetNode = node;
        targetOffset = position - currentPos;
        return true;
      }
      currentPos += node.textContent!.length;
    }
    else if (node.nodeType === Node.ELEMENT_NODE) {
      for (let i = 0; i < node.childNodes.length; i++) {
        if (findPosition(node.childNodes[i])) {
          return true;
        }
      }
    }
    return false;
  };

  findPosition(element);

  if (targetNode) {
    range.setStart(targetNode, targetOffset);
    range.setEnd(targetNode, targetOffset);
    selection.removeAllRanges();
    selection.addRange(range);
  }
  else {
    setCaretToEnd(element);
  }
}

function parseFormattedLine(lineIndex: number, htmlContent: string): void {
  const formattedLine: TextSegment[] = [];

  if (!htmlContent.trim()) {
    emit('update:formattedLines', updateFormattedLineAt(lineIndex, formattedLine));
    return;
  }

  const tempDiv = document.createElement('div');
  tempDiv.innerHTML = htmlContent;

  processFormattedNodes(tempDiv.childNodes, formattedLine);
  emit('update:formattedLines', updateFormattedLineAt(lineIndex, formattedLine));
}

function updateFormattedLineAt(lineIndex: number, newFormattedLine: TextSegment[]): TextSegment[][] {
  const updatedFormattedLines = [...props.formattedLines];
  updatedFormattedLines[lineIndex] = newFormattedLine;
  return updatedFormattedLines;
}

function processFormattedNodes(nodes: NodeListOf<ChildNode> | Node[], formattedLine: TextSegment[]): void {
  let currentText = '';
  let currentColor: string | null = null;

  const flushSegment = () => {
    if (currentText) {
      formattedLine.push({ color: currentColor, text: currentText });
      currentText = '';
    }
  };

  for (let i = 0; i < nodes.length; i++) {
    const node = nodes[i];

    if (node.nodeType === Node.TEXT_NODE) {
      currentText += node.textContent;
    }
    else if (node.nodeType === Node.ELEMENT_NODE) {
      const elementNode = node as HTMLElement;

      if (currentText && elementNode.style?.color !== currentColor) {
        flushSegment();
      }

      currentColor = elementNode.style?.color || null;

      if (node.hasChildNodes()) {
        for (let j = 0; j < node.childNodes.length; j++) {
          const childNode = node.childNodes[j];

          if (childNode.nodeType === Node.TEXT_NODE) {
            currentText += childNode.textContent;
          }
          else if (childNode.nodeType === Node.ELEMENT_NODE) {
            const childFormattedLine: TextSegment[] = [];
            processFormattedNodes([childNode], childFormattedLine);

            childFormattedLine.forEach((segment) => {
              if (segment.color !== currentColor) {
                flushSegment();
                currentColor = segment.color;
              }
              currentText += segment.text;
            });
          }
        }
      }
      flushSegment();
    }
  }
  flushSegment();
}

function renderFormattedLine(index: number): string {
  if (!props.formattedLines[index] || props.formattedLines[index].length === 0) {
    return '';
  }

  return props.formattedLines[index].map((segment) => {
    if (!segment.color) return segment.text;
    return `<span style="color: ${segment.color}">${segment.text}</span>`;
  }).join('');
}

function onTextSelection(index: number): void {
  const selection = window.getSelection();
  if (!selection || selection.rangeCount <= 0) return;

  const range = selection.getRangeAt(0);
  if (!range.collapsed) {
    selectedRange.value = range.cloneRange();
    selectedLineIndex.value = index;
    activeLineIndex.value = index;
    setTimeout(() => {
      const currentSelection = window.getSelection();
      if (currentSelection && currentSelection.isCollapsed) {
        currentSelection.removeAllRanges();
        currentSelection.addRange(selectedRange.value!);
      }
    }, 0);
  }
}

function applyColorToSelection(color: string): void {
  if (!selectedRange.value || !color) return;

  const currentSelection = window.getSelection();
  if (currentSelection && currentSelection.isCollapsed) {
    currentSelection.removeAllRanges();
    currentSelection.addRange(selectedRange.value);
  }

  const span = document.createElement('span');
  span.style.color = color;

  try {
    selectedRange.value.surroundContents(span);

    if (selectedLineIndex.value !== null && lineEditors.value) {
      const lineEditor = lineEditors.value[selectedLineIndex.value];
      if (lineEditor) {
        const caretPos = getCaretPosition(lineEditor);
        parseFormattedLine(selectedLineIndex.value, lineEditor.innerHTML);
        setCaretToPosition(lineEditor, caretPos);
      }
    }

    selectedRange.value = null;
  }
  catch (e) {
    console.error('Couldn\'t apply formatting:', e);
  }
}

function resetFormatting(): void {
  if (!lineEditors.value) return;

  lineEditors.value.forEach((editor, index) => {
    const plainText = editor.textContent ?? '';
    editor.innerHTML = plainText;
    const formattedLine = plainText ? [{ color: null, text: plainText }] : [];
    emit('update:formattedLines', updateFormattedLineAt(index, formattedLine));
  });
}

function isLineTooLong(index: number): boolean {
  return getLineLength(index) > props.maxLineLength;
}

function getLineLength(index: number): number {
  const line = props.formattedLines[index];
  if (!line || line.length === 0) return 0;
  return line.reduce((total, segment) => total + segment.text.length, 0);
}

function getCaretPosition(element: HTMLElement): number {
  let caretPos = 0;
  const selection = window.getSelection();

  if (selection && selection.rangeCount > 0) {
    const range = selection.getRangeAt(0);
    const preCaretRange = range.cloneRange();
    preCaretRange.selectNodeContents(element);
    preCaretRange.setEnd(range.endContainer, range.endOffset);
    caretPos = preCaretRange.toString().length;
  }

  return caretPos;
}

defineExpose({ applyColorToSelection, resetFormatting });
</script>
