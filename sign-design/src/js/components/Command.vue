<template>
  <div
    class="command-display-container w-full overflow-x-auto px-3 py-2.5"
    :class="{ 'hide-scrollbar': hideScrollbar }">
    <pre class="command-text text-sm" v-html="formattedDisplayCommand" />
  </div>
</template>

<script setup lang="ts">
const { hideScrollbar, generatedCommand } = defineProps<{
  generatedCommand: string;
  hideScrollbar?: boolean;
}>();

function escapeHtml(unsafe: string): string {
  return unsafe
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

const formattedDisplayCommand = computed(() => {
  const command = generatedCommand;
  if (!command) return '';

  let htmlResult = '';
  let indentLevel = 0;
  const indentSize = 2;
  let inStringChar: '\'' | '"' | null = null;
  let currentWord = '';

  function classifyAndAppendWord(word: string) {
    if (!word) return;

    let escapedWord = escapeHtml(word);

    const commandRegex = /^\/(?:give|data|setblock)$/i;
    const selectorRegex = /^@[aenpr](?:\[.*\])?$/i;
    const booleanRegex = /^(?:true|false)$/i;
    const keywordRegex = /^[a-z_]\w*$/i;
    const numberRegex = /^[~^]?-?\d+(?:\.\d+)?[esfdlb]?$/i;

    if (commandRegex.test(word)) {
      htmlResult += `<span class="token-command">${escapedWord}</span>`;
    }
    else if (selectorRegex.test(word)) {
      htmlResult += `<span class="token-selector">${escapedWord}</span>`;
    }
    else if (booleanRegex.test(word)) {
      htmlResult += `<span class="token-boolean">${escapedWord}</span>`;
    }
    else if (numberRegex.test(word)) {
      htmlResult += `<span class="token-number">${escapedWord}</span>`;
    }
    else if (keywordRegex.test(word)) {
      htmlResult += `<span class="token-keyword">${escapedWord}</span>`;
    }
    else {
      htmlResult += escapedWord;
    }
    currentWord = '';
  }

  for (let i = 0; i < command.length; i++) {
    const char = command[i];
    const prevChar = i > 0 ? command[i - 1] : null;

    if ((char === '"' || char === '\'') && (prevChar === null || prevChar !== '\\')) {
      if (inStringChar === null) {
        classifyAndAppendWord(currentWord);
        currentWord = char;
        inStringChar = char;
      }
      else if (inStringChar === char) {
        currentWord += char;
        htmlResult += `<span class="token-string">${escapeHtml(currentWord)}</span>`;
        currentWord = '';
        inStringChar = null;
      }
      else {
        currentWord += char;
      }
      continue;
    }

    if (inStringChar !== null) {
      currentWord += char;
      continue;
    }

    if (char === '{' || char === '[' || char === '}' || char === ']' || char === ',' || char === ':' || char === '=' || char === ' ') {
      classifyAndAppendWord(currentWord);
      currentWord = '';

      const escapedChar = escapeHtml(char);

      if (char === '{' || char === '[') {
        htmlResult += `<span class="token-punctuation">${escapedChar}</span>` + `\n${' '.repeat(++indentLevel * indentSize)}`;
      }
      else if (char === '}' || char === ']') {
        if (indentLevel > 0) indentLevel--;
        htmlResult += `\n${' '.repeat(indentLevel * indentSize)}<span class="token-punctuation">${escapedChar}</span>`;
      }
      else if (char === ',') {
        htmlResult += `<span class="token-punctuation">${escapedChar}</span>` + `\n${' '.repeat(indentLevel * indentSize)}`;
      }
      else if (char === ':') {
        htmlResult += `<span class="token-punctuation">${escapedChar}</span>` + ' ';
      }
      else if (char === '=') {
        htmlResult += `<span class="token-punctuation">${escapedChar}</span>`;
      }
      else if (char === ' ') {
        htmlResult += escapedChar;
      }
    }
    else {
      currentWord += char;
    }
  }
  classifyAndAppendWord(currentWord);

  return htmlResult.trim();
});
</script>

<style scoped>
.hide-scrollbar {
  scrollbar-width: none;
  -ms-overflow-style: none;
}
.hide-scrollbar::-webkit-scrollbar {
  display: none;
}

/* SYNTAX HIGHLIGHTING */
.command-text ::v-deep(.token-command) { font-family: 'JetBrains', monospace; color: #569CD6; font-weight: bold; }
.command-text ::v-deep(.token-selector) { font-family: 'JetBrains', monospace; color: #C586C0; }
.command-text ::v-deep(.token-keyword) { font-family: 'JetBrains', monospace; color: #9CDCFE; }
.command-text ::v-deep(.token-string) { font-family: 'JetBrains', monospace; color: #CE9178; }
.command-text ::v-deep(.token-number) { font-family: 'JetBrains', monospace; color: #B5CEA8; }
.command-text ::v-deep(.token-boolean) { font-family: 'JetBrains', monospace; color: #569CD6; }
.command-text ::v-deep(.token-punctuation) { font-family: 'JetBrains', monospace; color: #D4D4D4; }

.command-text {
  margin: 0;
  text-align: left;
  word-break: break-all;
  white-space: pre-wrap;
}
</style>
