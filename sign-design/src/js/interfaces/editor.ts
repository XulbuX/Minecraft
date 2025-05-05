export interface EditorProps {
  handleKeyDown?: (view: EditorView, event: KeyboardEvent) => boolean;
  handlePaste?: (view: EditorView, event: ClipboardEvent, slice: EditorSlice) => boolean;
  handleTextInput?: (view: EditorView, from: number, to: number, text: string) => boolean;
}

export interface EditorConfiguration {
  content?: string;
  editorProps?: EditorProps;
  extensions?: any[];
  onUpdate?: () => void;
}

export interface EditorInstance {
  chain: () => EditorChain;
  destroy: () => void;
  getJSON: () => any;
  isActive: (mark: string) => boolean;
}

export interface EditorChain {
  focus: () => EditorChain;
  run: () => void;
  setColor: (color: string) => EditorChain;
  toggleBold: (options?: { keepMarks?: boolean }) => EditorChain;
  toggleItalic: (options?: { keepMarks?: boolean }) => EditorChain;
  toggleUnderline: (options?: { keepMarks?: boolean }) => EditorChain;
  unsetBold: () => EditorChain;
  unsetColor: () => EditorChain;
  unsetItalic: () => EditorChain;
  unsetUnderline: () => EditorChain;
}

export interface EditorContent {
  childCount: number;
  forEach: (callback: (node: EditorNode) => void) => void;
}

export interface EditorView {
  dispatch: (transaction: Transaction) => void;
  state: EditorState;
}

export interface EditorState {
  doc: {
    content: EditorContent;
    resolve: (position: number) => ResolvedPos;
  };
  tr: Transaction;
}

export interface Transaction {
  doc: { content: EditorContent };
  insertText: (text: string, from: number, to: number) => Transaction;
}

export interface ResolvedPos {
  parent: EditorNode;
  parentOffset: number;
}

export interface EditorNode {
  isText: boolean;
  nodesBetween: (from: number, to: number, callback: (node: EditorNode) => void) => void;
  text?: string;
  type: { name: string };
}

export interface EditorSlice {
  content: {
    forEach: (callback: (node: EditorNode) => void) => void;
  };
}
