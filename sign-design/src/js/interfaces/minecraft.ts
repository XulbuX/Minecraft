export interface MinecraftColor {
  hex: string;
  idx: number;
  isDark: boolean;
  label: string;
  rgb: string;
  value?: string;
};

export interface SignType {
  hex: string;
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
