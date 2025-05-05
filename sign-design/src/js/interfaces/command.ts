export interface TextSegment {
  bold?: boolean;
  color?: string | null;
  italic?: boolean;
  text: string;
  underline?: boolean;
}

export type FormattedLines = TextSegment[][];

export interface CommandConfiguration {
  options?: {
    [key: string]: any;
  };
  type: string;
}

export type CommandType = 'data' | 'give' | 'setblock';
