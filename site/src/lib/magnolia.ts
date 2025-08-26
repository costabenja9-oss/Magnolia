const { MAGNOLIA_PUBLIC } = import.meta.env

export default {
  async get<T = any>(
    path: string,
    params?: Record<string, string>
  ): Promise<T> {
    const searchParams = new URLSearchParams(params).toString()

    const response = await fetch(
      `${MAGNOLIA_PUBLIC}/.rest/delivery${path}` +
        (searchParams && `?${searchParams}`)
    )

    const data = await response.json()

    return data
  }
}
