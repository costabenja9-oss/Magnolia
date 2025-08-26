import { useState } from 'preact/hooks'
import { actions } from 'astro:actions'

export default function usePagination(
  initialType: string,
  initialState: { total: number; results: any[] }
) {
  const [currentType, setCurrentType] = useState(initialType)
  const [total, setTotal] = useState(initialState.total)
  const [items, setItems] = useState(initialState.results)

  async function setType(type: string, params: Record<string, string>) {
    setCurrentType(type)

    const { data } = await actions.getPressResources({ type, params })

    setTotal(data.total)
    setItems(data.results)
  }

  async function getMore(params: Record<string, string>) {
    const offset = items.length

    const { data } = await actions.getPressResources({
      type: currentType,
      params: { offset, ...params }
    })

    setItems(items.concat(data.results))
  }

  return { currentType, total, items, setType, getMore }
}
