export const MC_COLORS: MinecraftColors = {
  aqua: { idx: 11, label: 'Aqua', rgb: 'rgb(85, 255, 255)' },
  black: { idx: 0, label: 'Black', rgb: 'rgb(0, 0, 0)' },
  blue: { idx: 13, label: 'Blue', rgb: 'rgb(85, 85, 255)' },
  dark_aqua: { idx: 12, label: 'Dark Aqua', rgb: 'rgb(0, 170, 170)' },
  dark_blue: { idx: 14, label: 'Dark Blue', rgb: 'rgb(0, 0, 170)' },
  dark_gray: { idx: 1, label: 'Dark Gray', rgb: 'rgb(85, 85, 85)' },
  dark_green: { idx: 10, label: 'Dark Green', rgb: 'rgb(0, 170, 0)' },
  dark_purple: { idx: 16, label: 'Dark Purple', rgb: 'rgb(170, 0, 170)' },
  dark_red: { idx: 6, label: 'Dark Red', rgb: 'rgb(170, 0, 0)' },
  gold: { idx: 7, label: 'Gold', rgb: 'rgb(255, 170, 0)' },
  gray: { idx: 2, label: 'Gray', rgb: 'rgb(170, 170, 170)' },
  green: { idx: 9, label: 'Green', rgb: 'rgb(85, 255, 85)' },
  light_purple: { idx: 15, label: 'Light Purple', rgb: 'rgb(255, 85, 255)' },
  red: { idx: 5, label: 'Red', rgb: 'rgb(255, 85, 85)' },
  white: { idx: 3, label: 'White', rgb: 'rgb(255, 255, 255)' },
  yellow: { idx: 8, label: 'Yellow', rgb: 'rgb(255, 255, 85)' },
};

export const MC_SIGNS: SignTypes = {
  acacia_sign: { idx: 4, label: 'Acacia Sign', rgb: 'rgb(165, 88, 49)' },
  bamboo_sign: { idx: 8, label: 'Bamboo Sign', rgb: 'rgb(207, 186, 87)' },
  birch_sign: { idx: 2, label: 'Birch Sign', rgb: 'rgb(190, 174, 118)' },
  cherry_sign: { idx: 7, label: 'Cherry Sign', rgb: 'rgb(228, 180, 173)' },
  crimson_sign: { idx: 9, label: 'Crimson Sign', rgb: 'rgb(103, 49, 72)' },
  dark_oak_sign: { idx: 5, label: 'Dark Oak Sign', rgb: 'rgb(66, 42, 20)' },
  jungle_sign: { idx: 3, label: 'Jungle Sign', rgb: 'rgb(167, 120, 83)' },
  mangrove_sign: { idx: 6, label: 'Mangrove Sign', rgb: 'rgb(116, 53, 48)' },
  oak_sign: { idx: 0, label: 'Oak Sign', rgb: 'rgb(163, 133, 79)' },
  pale_oak_sign: { idx: 11, label: 'Pale Oak Sign', rgb: 'rgb(222, 210, 209)' },
  spruce_sign: { idx: 1, label: 'Spruce Sign', rgb: 'rgb(114, 85, 49)' },
  warped_sign: { idx: 10, label: 'Warped Sign', rgb: 'rgb(34, 109, 103)' },
};

export const MC_COLORS_ARRAY = Object.entries(MC_COLORS)
  .map(([mcName, color]) => ({
    ...color,
    mcName,
  }))
  .sort((a, b) => a.idx - b.idx);

export const MC_SIGNS_ARRAY = Object.entries(MC_SIGNS)
  .map(([value, type]) => ({
    ...type,
    value,
  }))
  .sort((a, b) => a.idx - b.idx);

export const RGB_TO_MC_COLOR: Record<string, string> = {};
Object.entries(MC_COLORS).forEach(([mcName, color]) => {
  RGB_TO_MC_COLOR[color.rgb.toLowerCase()] = mcName;
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
    const r = Number.parseInt(rgbMatch[1], 10);
    const g = Number.parseInt(rgbMatch[2], 10);
    const b = Number.parseInt(rgbMatch[3], 10);

    const toHex = (c: number): string => {
      const hex = c.toString(16);
      return hex.length === 1 ? `0${hex}` : hex;
    };

    return `#${toHex(r)}${toHex(g)}${toHex(b)}`.toUpperCase();
  }

  return rgb;
}
