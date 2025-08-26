import { defineCollection } from 'astro:content'
import { glob } from 'astro/loaders'

export const collections = {
  translations: defineCollection({
    loader: glob({ pattern: '**/*.json', base: './src/i18n' })
  })
}
