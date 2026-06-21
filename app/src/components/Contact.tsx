import { memo } from 'react'
import type { Contact as ContactType } from '../types'

interface ContactProps {
  contact: ContactType
}

const Contact = memo(function Contact({ contact }: ContactProps) {
  return (
    <section id="contact" className="py-20">
      <div className="mx-auto max-w-6xl px-6">
        <div data-aos="fade-up" className="text-center mb-12">
          <span className="inline-block text-xs font-semibold uppercase tracking-wider text-[var(--color-primary)] mb-3">{contact.eyebrow}</span>
          <h2 className="text-3xl md:text-4xl font-bold mb-4">{contact.title}</h2>
          <p className="text-[var(--color-text-soft)] max-w-2xl mx-auto">{contact.description}</p>
        </div>

        <div data-aos="zoom-in" className="max-w-xl mx-auto space-y-6">
          <a href={`mailto:${contact.email}`} className="flex items-center justify-center gap-3 bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-xl px-6 py-4 hover:border-[var(--color-primary)]/30 transition-colors duration-200 group">
            <span className="text-xl">✉️</span>
            <span className="text-lg font-semibold text-[var(--color-text)] group-hover:text-[var(--color-primary)] transition-colors">{contact.email}</span>
          </a>

          <a href={`tel:${contact.phone}`} className="flex items-center justify-center gap-3 bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-xl px-6 py-4 hover:border-[var(--color-primary)]/30 transition-colors duration-200 group">
            <span className="text-xl">📱</span>
            <span className="text-lg font-semibold text-[var(--color-text)] group-hover:text-[var(--color-primary)] transition-colors">{contact.phone}</span>
          </a>

          <div className="flex justify-center gap-3 pt-2">
            {contact.socials.map((item, i) => (
              <a key={i} href={item.url} target="_blank" rel="noopener" className="text-sm text-[var(--color-text-muted)] hover:text-[var(--color-primary)] transition-colors duration-200 underline underline-offset-4" title={item.label}>
                {item.label}
              </a>
            ))}
          </div>
        </div>
      </div>
    </section>
  )
})

export default Contact
