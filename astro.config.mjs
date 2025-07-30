// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';
import tailwind from '@astrojs/tailwind';
import prefetch from '@astrojs/prefetch';

// https://astro.build/config
export default defineConfig({
  site: 'https://abliskan.github.io',
  base: '/ricky-suhanry.xyz', // Repository name
  integrations: [
    mdx(),
    sitemap(),
    tailwind(),
    prefetch()
  ],
  markdown: {
    shikiConfig: {
      theme: 'github-dark',
      wrap: true
    }
  }
});