import { defineMiddleware } from 'astro:middleware'
import { getEntry } from 'astro:content'

export const onRequest = defineMiddleware(
  async ({ request, url, currentLocale, params, locals }, next) => {
    if (request.headers.get('accept')?.includes('text/html')) {
      let id: string | undefined

      switch (url.pathname) {
        case '/':
        case `/${currentLocale}`:
        case `/${currentLocale}/`:
          id = `${currentLocale}/home`
          break
        default:
          switch (params.path) {
            case 'platform':
            case 'partners':
            case 'developers':
            case 'resources':
            case 'contact':
              id = `${currentLocale}/${params.path}`
              break
            case `${currentLocale}/platform`:
            case `${currentLocale}/partners`:
            case `${currentLocale}/developers`:
            case `${currentLocale}/resources`:
            case `${currentLocale}/contact`:
              id = params.path
          }
      }

      const translation = await Promise.all([
        getEntry('translations', `${currentLocale}/common`)?.then(
          ({ data }) => data
        ),
        id && getEntry('translations', id)?.then(({ data }) => data)
      ])

      locals.t = Object.assign({}, ...translation)
    }

    return next()
  }
)
