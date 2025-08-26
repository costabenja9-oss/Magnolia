import { defineAction } from 'astro:actions'
import magnolia from './lib/magnolia'

export const server = {
  getPosts: defineAction({
    async handler(params) {
      const data = await magnolia.get('/posts', params)

      return data
    }
  }),
  getPressResources: defineAction({
    async handler({ type, params }) {
      const data = await magnolia.get(`/${type}`, params)

      return data
    }
  })
}
