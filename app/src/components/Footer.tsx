import { memo } from 'react'
import type { Footer as FooterType } from '../types'

interface FooterProps {
  footer: FooterType
}

const Footer = memo(function Footer({ footer }: FooterProps) {
  return (
    <footer data-aos="fade-up" className="py-8 border-t border-[var(--color-border)]">
      <div className="mx-auto max-w-6xl px-6 text-center">
        <p className="text-sm text-[var(--color-text-muted)]">{footer.text}</p>
      </div>
    </footer>
  )
})

export default Footer
