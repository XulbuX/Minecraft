export interface TextSegment {
  bold?: boolean;
  color?: string | null;
  italic?: boolean;
  text: string;
  underline?: boolean;
}

export interface FormattedLines {
  back: TextSegment[][];
  front: TextSegment[][];
};

export interface CommandConfiguration {
  options?: { [key: string]: any };
  type: string;
}
