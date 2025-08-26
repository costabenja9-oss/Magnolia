import type { PropsWithChildren } from 'preact/compat'
import clsx from 'clsx'
import { getLocalePath } from '@/lib/utils'
import Image from './Image'

export default function Card({
  image,
  title,
  description,
  name,
  lang,
  label,
  children
}: PropsWithChildren<Record<string, any>>) {
  return (
    <article class="flex flex-col text-pretty">
      <Image
        class="w-full aspect-3/2 object-cover mb-8 rounded-lg"
        data={image}
      />
      <h3
        class={clsx(
          'font-bold text-xl/tight text-orange-600 uppercase',
          'sm:line-clamp-2'
        )}
        title={title}
      >
        {title}
      </h3>
      <p class="mt-3 mb-6 text-lg sm:line-clamp-3" title={description}>
        {description}
      </p>
      <a
        class={clsx(
          'w-fit mt-auto flex gap-1.5 text-orange-600 transition-colors',
          'hover:text-red-800'
        )}
        href={getLocalePath(lang, `blog/${name}`)}
      >
        <span class="underline underline-offset-2">{label}</span>
        {children}
      </a>
    </article>
  )
}
