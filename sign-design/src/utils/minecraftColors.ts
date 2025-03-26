export type MinecraftColor = {
  name: string;
  value: string;
}

export type SignType = {
  label: string;
  bgColor: string;
}

export type MCColors = {
  [key: string]: MinecraftColor;
}

export type SignTypes = {
  [key: string]: SignType;
}

export const MC_COLORS: MCColors = {
  black: { name: 'Black', value: 'rgb(0, 0, 0)' },
  dark_blue: { name: 'Dark Blue', value: 'rgb(0, 0, 170)' },
  dark_green: { name: 'Dark Green', value: 'rgb(0, 170, 0)' },
  dark_aqua: { name: 'Dark Aqua', value: 'rgb(0, 170, 170)' },
  dark_red: { name: 'Dark Red', value: 'rgb(170, 0, 0)' },
  dark_purple: { name: 'Dark Purple', value: 'rgb(170, 0, 170)' },
  gold: { name: 'Gold', value: 'rgb(255, 170, 0)' },
  gray: { name: 'Gray', value: 'rgb(170, 170, 170)' },
  dark_gray: { name: 'Dark Gray', value: 'rgb(85, 85, 85)' },
  blue: { name: 'Blue', value: 'rgb(85, 85, 255)' },
  green: { name: 'Green', value: 'rgb(85, 255, 85)' },
  aqua: { name: 'Aqua', value: 'rgb(85, 255, 255)' },
  red: { name: 'Red', value: 'rgb(255, 85, 85)' },
  light_purple: { name: 'Light Purple', value: 'rgb(255, 85, 255)' },
  yellow: { name: 'Yellow', value: 'rgb(255, 255, 85)' },
  white: { name: 'White', value: 'rgb(255, 255, 255)' }
};

export const SIGN_TYPES: SignTypes = {
  oak_sign: { label: 'Oak Sign', bgColor: 'bg-amber-800' },
  spruce_sign: { label: 'Spruce Sign', bgColor: 'bg-amber-900' },
  birch_sign: { label: 'Birch Sign', bgColor: 'bg-amber-200' },
  jungle_sign: { label: 'Jungle Sign', bgColor: 'bg-amber-700' },
  acacia_sign: { label: 'Acacia Sign', bgColor: 'bg-orange-700' },
  dark_oak_sign: { label: 'Dark Oak Sign', bgColor: 'bg-neutral-800' },
  mangrove_sign: { label: 'Mangrove Sign', bgColor: 'bg-red-800' },
  cherry_sign: { label: 'Cherry Sign', bgColor: 'bg-pink-300' },
  bamboo_sign: { label: 'Bamboo Sign', bgColor: 'bg-yellow-700' },
  crimson_sign: { label: 'Crimson Sign', bgColor: 'bg-red-900' },
  warped_sign: { label: 'Warped Sign', bgColor: 'bg-teal-800' }
};

// Create arrays for iteration in templates
export const MC_COLORS_ARRAY = Object.entries(MC_COLORS).map(([mcName, color]) => ({
  ...color,
  mcName
}));

export const SIGN_TYPES_ARRAY = Object.entries(SIGN_TYPES).map(([value, type]) => ({
  ...type,
  value
}));

// RGB to MC color name mapping
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
  
  // Check if it's a standard Minecraft color in rgb format
  if (RGB_TO_MC_COLOR[color.toLowerCase()]) {
    return RGB_TO_MC_COLOR[color.toLowerCase()];
  }
  
  // For custom colors, convert to proper hex format (#RRGGBB)
  if (color.startsWith('rgb')) {
    return rgbToHex(color);
  }
  
  // For colors already in hex format, ensure uppercase
  if (color.startsWith('#')) {
    return color.toUpperCase();
  }
  
  return color;
}

/**
 * Convert RGB color to hex
 * @param rgb RGB color string in format rgb(r, g, b)
 * @returns Hex color string in format #RRGGBB
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

/**
 * Convert RGB to Hex
 * For utility use when needed
 */
export function getRgbToHex(r: number, g: number, b: number): string {
  const toHex = (c: number): string => {
    const hex = c.toString(16);
    return hex.length === 1 ? '0' + hex : hex;
  };
  
  return `#${toHex(r)}${toHex(g)}${toHex(b)}`.toUpperCase();
}
