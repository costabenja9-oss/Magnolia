import type { ComponentChild } from 'preact'
import clsx from 'clsx/lite'
import Card from '@/components/Card'
import usePagination from './usePagination'
import Categories from './Categories'

interface Props {
  categories: string[]
  initialState: { total: number; results: any[] }
  title: string
  labels: string[]
  params: Record<string, string>
  iconFilter?: ComponentChild
  iconArrowRight?: ComponentChild
}

export default function Pagination({
  categories,
  initialState,
  title,
  labels,
  params,
  iconFilter,
  iconArrowRight
}: Props) {
  const { currentCategory, posts, total, setCatgory, getMorePosts } =
    usePagination(categories[0], initialState)

  return (
    <>
      <div class="mt-20 mb-15 flex justify-between gap-8 sm:mt-25 sm:mb-20">
        <h2 class="font-bold text-3xl/none">{title}</h2>
        <Categories
          list={categories}
          iconFilter={iconFilter}
          currentCategory={currentCategory}
          labels={labels}
          handleClick={(category) => setCatgory(category, params)}
        />
      </div>
      <div class="grid gap-y-17 gap-x-5 sm:grid-cols-2 lg:grid-cols-3">
        {posts.map((post) => (
          <Card
            {...post}
            lang={params.lang}
            label={labels.at(-2)}
            key={post.name}
          >
            {iconArrowRight}
          </Card>
        ))}
      </div>
      {posts.length < total && (
        <button
          class={clsx(
            'w-fit mt-20 mx-auto py-2.5 px-5 block rounded bg-orange-600',
            'text-xl text-white transition-colors hover:bg-red-800'
          )}
          onClick={() => getMorePosts(params)}
        >
          {labels.at(-1)}
        </button>
      )}
    </>
  )
}
