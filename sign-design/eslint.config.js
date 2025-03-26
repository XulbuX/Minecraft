import antfu from '@antfu/eslint-config';

export default antfu({
  ignores: ['public/**', 'resources/json/icons/**/*.json', 'composer.json', 'composer.lock', 'package-lock.json', 'storage/**'],
  rules: {
    'antfu/if-newline': 'off',
    'n/prefer-global/process': ['error', 'always'],
    'perfectionist/sort-interfaces': [
      'error',
      {
        order: 'asc',
        type: 'natural',
      },
    ],
    'perfectionist/sort-objects': [
      'error',
      {
        customGroups: {
          top: ['id'],
        },
        groups: [
          'top',
          'unknown',
        ],
        order: 'asc',
        type: 'natural',

      },
    ],
    'prefer-const': 'off',
    'unused-imports/no-unused-imports': 'off',
  },

  stylistic: {
    semi: true,
  },
  typescript: {
    overrides: {
      'ts/consistent-type-definitions': ['off'],
      'ts/consistent-type-imports': ['error', { fixStyle: 'inline-type-imports', prefer: 'type-imports' }],
    },
  },
  unocss: true,
  vue: {
    overrides: {
      'vue/attributes-order': ['error', {
        alphabetical: true,
        order: [
          'DEFINITION',
          'LIST_RENDERING',
          'CONDITIONALS',
          'RENDER_MODIFIERS',
          'GLOBAL',
          ['UNIQUE', 'SLOT'],
          'TWO_WAY_BINDING',
          'OTHER_DIRECTIVES',
          'OTHER_ATTR',
          'EVENTS',
          'CONTENT',
        ],
      }],
      'vue/block-order': ['error', {
        order: ['template', 'script', 'style'],
      }],
      'vue/html-closing-bracket-newline': ['error', {
        multiline: 'never',
        singleline: 'never',
      }],
      'vue/max-attributes-per-line': ['error', {
        multiline: { max: 1 },
        singleline: { max: 5 },

      }],
    },
  },
});
