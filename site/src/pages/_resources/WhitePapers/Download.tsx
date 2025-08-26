import type { ComponentChildren } from 'preact'
import { useRef } from 'preact/hooks'
import clsx from 'clsx/lite'

interface Props {
  t: Record<string, string>
  url: string
  children: ComponentChildren
}

export default function Download({ t, url, children }: Props) {
  const ref = useRef<HTMLDialogElement>(null)

  function handleClick() {
    localStorage.getItem('has-white-paper')
      ? window.open(url, '_blank')
      : ref.current?.showModal()
  }

  function handleSubmit(event: Event) {
    event.preventDefault()
    localStorage.setItem('has-white-paper', 'true')
    window.open(url, '_blank')
    ref.current?.close()
  }

  return (
    <>
      <button
        class={clsx(
          'w-fit mt-auto flex gap-1.5 text-orange-600 transition-colors',
          'hover:text-red-800'
        )}
        onClick={handleClick}
      >
        <span class="underline underline-offset-2">
          {t['download_document']}
        </span>
        <svg class="w-2.75" viewBox="0 0 11 9" fill="currentColor">
          <path d="M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z" />
        </svg>
      </button>
      <dialog
        ref={ref}
        class="m-auto p-5 rounded-lg bg-white text-black backdrop:bg-black/50"
      >
        <div class="mb-5 flex items-center justify-between gap-5">
          <h2 class="font-bold text-2xl">{t['download_white_paper']}</h2>
          <button
            class="hover:text-red-800"
            onClick={() => ref.current?.close()}
          >
            <svg class="w-4" viewBox="0 0 26 26" fill="currentColor">
              <path
                fill-rule="evenodd"
                d="M21.647 25.028c-.865 0-1.73-.337-2.39-.997l-6.744-6.73-6.73 6.73a3.398 3.398 0 0 1-4.793 0 3.38 3.38 0 0 1 0-4.78l6.744-6.744L.99 5.777C-1.107 3.668.36.002 3.394.002a3.41 3.41 0 0 1 2.39.983l6.73 6.744L19.257.984c2.11-2.097 5.776-.63 5.776 2.404 0 .894-.352 1.745-.997 2.39l-6.73 6.73 6.73 6.744c2.126 2.126.616 5.776-2.39 5.776Z"
                clip-rule="evenodd"
              />
            </svg>
          </button>
        </div>
        <form onSubmit={handleSubmit}>
          {children}
          <button
            class={clsx(
              'mt-8 w-fit ml-auto block py-2.5 px-5 rounded bg-orange-600',
              'leading-none text-white transition-colors hover:bg-red-800'
            )}
            type="submit"
          >
            {t['download']}
          </button>
        </form>
      </dialog>
    </>
  )
}
