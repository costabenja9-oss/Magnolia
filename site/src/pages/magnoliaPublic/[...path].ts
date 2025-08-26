import type { APIRoute } from 'astro'

export const GET: APIRoute = async ({ params: { path } }) => {
  if (!path) return new Response(null, { status: 404 })

  const response = await fetch(`${import.meta.env.MAGNOLIA_PUBLIC}/${path}`)

  if (!response.ok || response.headers.has('Content-Encoding')) {
    return new Response(null, { status: 404 })
  }

  const buffer = await response.arrayBuffer()

  return new Response(buffer, {
    headers: { 'Content-Type': response.headers.get('Content-Type')! }
  })
}
