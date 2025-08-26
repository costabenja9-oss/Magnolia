import { useState } from 'preact/hooks'
import { actions } from 'astro:actions'

export default function usePagination(
  initialCategory: string,
  initialState: { total: number; results: any[] }
) {
  const [currentCategory, setCurrentCategory] = useState(initialCategory)
  const [total, setTotal] = useState<number>(initialState.total)
  const [posts, setPosts] = useState<any[]>(initialState.results)

  async function setCatgory(category: string, params: Record<string, string>) {
    setCurrentCategory(category)

    const { data } = await actions.getPosts(
      category === 'all' ? params : { category, ...params }
    )

    setTotal(data.total)
    setPosts(data.results)
  }

  async function getMorePosts(params: Record<string, string>) {
    const offset = posts.length

    const { data } = await actions.getPosts(
      currentCategory === 'all'
        ? { offset, ...params }
        : { category: currentCategory, offset, ...params }
    )

    setPosts(posts.concat(data.results))
  }

  return { currentCategory, posts, total, setCatgory, getMorePosts }
}
