/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#eef3ff',
          100: '#dbe5ff',
          200: '#bdd0ff',
          300: '#8fb1ff',
          400: '#5a88ff',
          500: '#3367ff', // primary
          600: '#1a41ff',
          700: '#0d31ef',
          800: '#0d2acc',
          900: '#102aa2',
        },
        secondary: {
          50: '#ebfffd',
          100: '#d0fbf5',
          200: '#a6f5eb',
          300: '#6aeadb',
          400: '#2dd6c3',
          500: '#06d6a0', // secondary
          600: '#00a082',
          700: '#008067',
          800: '#006554',
          900: '#005346',
        },
        accent: {
          50: '#fff9eb',
          100: '#ffefc6',
          200: '#ffde89',
          300: '#ffc246',
          400: '#ffaf1c',
          500: '#ff9f1c', // accent
          600: '#e17200',
          700: '#bf5000',
          800: '#9c3d08',
          900: '#82340c',
        }
      },
      typography: {
        DEFAULT: {
          css: {
            maxWidth: '65ch',
          },
        },
      },
    },
    fontFamily: {
      sans: ['"Inter"', 'system-ui', 'sans-serif'],
      serif: ['"Merriweather"', 'Georgia', 'serif'],
      mono: ['"Fira Code"', 'monospace'],
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}