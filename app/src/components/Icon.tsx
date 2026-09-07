interface IconProps {
  icon: string
  className?: string
}

/**
 * Renders a skill/section icon.
 * Accepts either an inline SVG string (rendered as markup, sized to the wrapper
 * and inheriting `currentColor`) or a plain emoji/text value.
 */
const Icon = function Icon({ icon, className = '' }: IconProps) {
  const base =
    'inline-flex items-center justify-center shrink-0 [&>svg]:h-full [&>svg]:w-full [&>svg]:stroke-current'

  if (icon.trimStart().startsWith('<svg')) {
    return (
      <span
        className={`${base} ${className}`}
        dangerouslySetInnerHTML={{ __html: icon }}
      />
    )
  }

  return <span className={`${base} ${className}`}>{icon}</span>
}

export default Icon
