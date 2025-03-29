export type MinecraftColor = {
  label: string;
  value: string;
}

export type SignType = {
  label: string;
  style: string[];
}

export type MCColors = {
  [key: string]: MinecraftColor;
}

export type SignTypes = {
  [key: string]: SignType;
}

export const MC_COLORS: MCColors = {
  black: { label: 'Black', value: 'rgb(0, 0, 0)' },
  dark_blue: { label: 'Dark Blue', value: 'rgb(0, 0, 170)' },
  dark_green: { label: 'Dark Green', value: 'rgb(0, 170, 0)' },
  dark_aqua: { label: 'Dark Aqua', value: 'rgb(0, 170, 170)' },
  dark_red: { label: 'Dark Red', value: 'rgb(170, 0, 0)' },
  dark_purple: { label: 'Dark Purple', value: 'rgb(170, 0, 170)' },
  gold: { label: 'Gold', value: 'rgb(255, 170, 0)' },
  gray: { label: 'Gray', value: 'rgb(170, 170, 170)' },
  dark_gray: { label: 'Dark Gray', value: 'rgb(85, 85, 85)' },
  blue: { label: 'Blue', value: 'rgb(85, 85, 255)' },
  green: { label: 'Green', value: 'rgb(85, 255, 85)' },
  aqua: { label: 'Aqua', value: 'rgb(85, 255, 255)' },
  red: { label: 'Red', value: 'rgb(255, 85, 85)' },
  light_purple: { label: 'Light Purple', value: 'rgb(255, 85, 255)' },
  yellow: { label: 'Yellow', value: 'rgb(255, 255, 85)' },
  white: { label: 'White', value: 'rgb(255, 255, 255)' }
};

export const SIGN_TYPES: SignTypes = {
  oak_sign: { label: 'Oak Sign', style: ['bg-#97714A', 'border-#97714A'] },
  spruce_sign: { label: 'Spruce Sign', style: ['bg-#624B2E', 'border-#624B2E'] },
  birch_sign: { label: 'Birch Sign', style: ['bg-#D1BC8A', 'border-#D1BC8A'] },
  jungle_sign: { label: 'Jungle Sign', style: ['bg-#B1753A', 'border-#B1753A'] },
  acacia_sign: { label: 'Acacia Sign', style: ['bg-#B15635', 'border-#B15635'] },
  dark_oak_sign: { label: 'Dark Oak Sign', style: ['bg-#492F17', 'border-#492F17'] },
  mangrove_sign: { label: 'Mangrove Sign', style: ['bg-#7F3325', 'border-#7F3325'] },
  cherry_sign: { label: 'Cherry Sign', style: ['bg-#ECCECF', 'border-#ECCECF'] },
  bamboo_sign: { label: 'Bamboo Sign', style: ['bg-#D8C166', 'border-#D8C166'] },
  crimson_sign: { label: 'Crimson Sign', style: ['bg-#7E3A55', 'border-#7E3A55'] },
  warped_sign: { label: 'Warped Sign', style: ['bg-#366B66', 'border-#366B66'] },
};

export const MC_COLORS_ARRAY = Object.entries(MC_COLORS).map(([mcName, color]) => ({
  ...color,
  mcName
}));

export const SIGN_TYPES_ARRAY = Object.entries(SIGN_TYPES).map(([value, type]) => ({
  ...type,
  value
}));

export const RGB_TO_MC_COLOR: Record<string, string> = {};
Object.entries(MC_COLORS).forEach(([mcName, color]) => {
  RGB_TO_MC_COLOR[color.value.toLowerCase()] = mcName;
});

/**
 * Convert any color format to proper Minecraft color name or hex format
 * @param color The color to convert (hex or rgb format)
 * @returns The Minecraft color name or formatted hex color
 */
export function getMinecraftColorFormat(color: string): string {
  if (!color) return 'white';
  
  if (RGB_TO_MC_COLOR[color.toLowerCase()]) {
    return RGB_TO_MC_COLOR[color.toLowerCase()];
  }
  
  if (color.startsWith('rgb')) {
    return rgbToHex(color);
  }

  if (color.startsWith('#')) {
    return color.toUpperCase();
  }
  
  return color;
}

/**
 * Convert RGB color to HEX
 * @param rgb RGB color string in format rgb(r, g, b)
 * @returns HEX color string in format #RRGGBB
 */
export function rgbToHex(rgb: string): string {
  const rgbMatch = rgb.match(/rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/i);
  if (rgbMatch) {
    const r = parseInt(rgbMatch[1], 10);
    const g = parseInt(rgbMatch[2], 10);
    const b = parseInt(rgbMatch[3], 10);

    const toHex = (c: number): string => {
      const hex = c.toString(16);
      return hex.length === 1 ? '0' + hex : hex;
    };
    
    return `#${toHex(r)}${toHex(g)}${toHex(b)}`.toUpperCase();
  }
  
  return rgb;
}
