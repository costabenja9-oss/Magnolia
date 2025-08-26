export function getLocalePath(locale: string, path = '') {
  return locale === 'en' ? `/${path}` : `/${locale}${path && `/${path}`}`
}
