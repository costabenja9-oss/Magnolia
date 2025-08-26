import clsx from 'clsx/lite'
import dayjs from 'dayjs'
import usePagination from './usePagination'
import 'dayjs/locale/es'

interface Props {
  types: string[][]
  initialState: { total: number; results: any[] }
  params: Record<string, string>
  label: string
}

export default function Pagination({
  types,
  initialState,
  params,
  label
}: Props) {
  const { currentType, total, items, setType, getMore } = usePagination(
    types[0][0],
    initialState
  )

  return (
    <>
      <nav class="my-20 flex justify-center gap-5 xl:gap-9">
        {types.map(([id, label]) => (
          <button
            class={clsx(
              'relative text-xs text-neutral-400 uppercase transition-colors',
              id === currentType ? 'text-orange-600' : 'hover:text-neutral-700',
              'sm:text-base xl:text-lg'
            )}
            key={id}
            onClick={() => setType(id, params)}
          >
            {label}
            <span
              class={clsx(
                'absolute top-full inset-x-0 h-px w-3/5 mt-1 mx-auto block',
                'transition-colors',
                id === currentType && 'bg-orange-600'
              )}
            />
          </button>
        ))}
      </nav>
      <div class="grid gap-15 sm:grid-cols-2 lg:gap-x-24 xl:grid-cols-3">
        {items.map(({ '@id': key, date, name, resources }) => (
          <article class="flex flex-col" key={key}>
            <time
              class="font-bold text-xl text-orange-600 uppercase"
              datetime={dayjs(date).format('YYYY-MM-DD')}
            >
              {dayjs(date).locale(params.lang).format('MMMM D, YYYY')}
            </time>
            <h3 class="my-4 text-lg text-pretty">{name}</h3>
            <ul class="mt-auto flex flex-wrap gap-5">
              {resources['@nodes'].map((index: string) => (
                <li key={resources[index]['@id']}>
                  <a
                    class={clsx(
                      'text-orange-600 uppercase8 transition-colors',
                      'hover:text-red-800'
                    )}
                    href={resources[index].link}
                    target="_blank"
                    rel="noreferrer"
                  >
                    {resources[index].label}
                  </a>
                </li>
              ))}
            </ul>
          </article>
        ))}
      </div>
      {items.length < total && (
        <button
          class={clsx(
            'w-fit mt-20 mx-auto py-2.5 px-5 block rounded bg-orange-600',
            'text-xl text-white transition-colors hover:bg-red-800'
          )}
          onClick={() => getMore(params)}
        >
          {label}
        </button>
      )}
    </>
  )
}
