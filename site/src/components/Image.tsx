interface Props {
  class?: string
  data?: { '@link': string; metadata: { width: number; height: number } }
  src?: string
  alt?: string
  width?: number
  height?: number
  loading?: 'eager' | 'lazy'
}

export default function Image({
  class: className,
  src,
  data,
  alt = '',
  width,
  height,
  loading = 'lazy'
}: Props) {
  return (
    <img
      class={className}
      src={src || data?.['@link']}
      alt={alt}
      width={width || data?.metadata.width || undefined}
      height={height || data?.metadata.height || undefined}
      loading={loading}
      decoding="async"
    />
  )
}
