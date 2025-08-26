import type { ComponentChild } from 'preact'
import { useRef, useState } from 'preact/hooks'
import clsx from 'clsx/lite'

interface Props {
  list: string[]
  iconFilter?: ComponentChild
  currentCategory: string
  labels: string[]
  handleClick: (category: string) => void
}

export default function Categories({
  list,
  iconFilter,
  currentCategory,
  labels,
  handleClick
}: Props) {
  const ref = useRef<HTMLElement>(null)
  const [isOpen, setIsOpen] = useState(false)

  function close({ target }: TouchEvent) {
    if (target !== ref.current) {
      setIsOpen(false)
      document.body.ontouchend = null
    }
  }

  function toggle() {
    if (isOpen) {
      setIsOpen(false)
      document.body.ontouchend = null
    } else {
      setIsOpen(true)
      document.body.ontouchend = close
    }
  }

  return (
    <div class="relative flex">
      <button
        class="text-orange-600 lg:hidden"
        onClick={toggle}
        onTouchEnd={(event) => event.stopPropagation()}
      >
        {iconFilter}
      </button>
      <nav
        ref={ref}
        class={clsx(
          isOpen ? 'flex' : 'hidden',
          'absolute top-full right-0 mt-2 py-5 px-7 flex-col gap-y-4 gap-x-5',
          'shadow bg-white text-neutral-400 lg:static lg:m-0 lg:p-0 lg:flex',
          'lg:flex-row lg:shadow-none lg:text-lg'
        )}
      >
        {list.map((category, index) => (
          <button
            class={clsx(
              'relative uppercase transition-colors',
              category === currentCategory
                ? 'text-orange-600'
                : 'hover:text-neutral-700'
            )}
            key={category}
            onClick={() => handleClick(category)}
          >
            {labels[index]}
            <span
              class={clsx(
                'absolute top-full inset-x-0 h-px w-3/5 mx-auto block',
                'transition-colors',
                category === currentCategory && 'lg:bg-orange-600'
              )}
            />
          </button>
        ))}
      </nav>
    </div>
  )
}
