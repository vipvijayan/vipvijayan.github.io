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
            <svg className="h-5 w-5 shrink-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
              <rect width="20" height="16" x="2" y="4" rx="2" />
              <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
            </svg>
            <span className="text-lg font-semibold text-[var(--color-text)] group-hover:text-[var(--color-primary)] transition-colors">{contact.email}</span>
          </a>

          <a href={`tel:${contact.phone}`} className="flex items-center justify-center gap-3 bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-xl px-6 py-4 hover:border-[var(--color-primary)]/30 transition-colors duration-200 group">
            <svg className="h-5 w-5 shrink-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
              <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z" />
            </svg>
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
