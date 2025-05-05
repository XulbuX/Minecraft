export interface MinecraftColor {
  idx: number;
  isDark: boolean;
  label: string;
  rgb: string;
  value?: string;
};

export interface SignType {
  idx: number;
  isDark: boolean;
  label: string;
  rgb: string;
  value?: string;
};

export interface MinecraftColors {
  [key: string]: MinecraftColor;
};

export interface SignTypes {
  [key: string]: SignType;
};
