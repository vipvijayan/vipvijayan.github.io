import { memo } from 'react'
import type { Certification as CertificationType } from '../types'

interface CertificationProps {
  certification: CertificationType
}

const Certification = memo(function Certification({ certification }: CertificationProps) {
  return (
    <section id="certification" className="py-20">
      <div className="mx-auto max-w-6xl px-6">
        <div data-aos="fade-up" className="text-center mb-12">
          <span className="inline-block text-xs font-semibold uppercase tracking-wider text-[var(--color-primary)] mb-3">AI Certification</span>
          <h2 className="text-3xl md:text-4xl font-bold mb-4">{certification.title}</h2>
          <p className="text-[var(--color-text-soft)] max-w-2xl mx-auto">{certification.subtitle}</p>
        </div>

        <div className="bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-2xl overflow-hidden grid md:grid-cols-2 gap-0">
          <div data-aos="fade-right" className="p-6 flex items-center justify-center bg-[var(--color-bg-soft)]">
            <img src={certification.image} alt={certification.imageAlt} width="400" height="300" className="rounded-lg max-h-80 w-auto" loading="lazy" />
          </div>
          <div data-aos="fade-left" className="p-8">
            <div className="inline-block bg-[var(--color-success)]/10 text-[var(--color-success)] text-sm font-semibold px-3 py-1 rounded-full mb-4">{certification.badge}</div>
            <h3 className="text-xl font-bold mb-2">{certification.heading}</h3>
            <p className="text-sm text-[var(--color-text-muted)] mb-3">{certification.issuer}</p>
            <a href={certification.link} target="_blank" rel="noopener" className="text-[var(--color-primary)] text-sm font-medium hover:underline mb-4 block">{certification.linkText}</a>
            <ul className="space-y-2 mb-6">
              {certification.highlights.map((h, i) => (
                <li key={i} className="text-sm text-[var(--color-text-soft)] flex gap-2" dangerouslySetInnerHTML={{ __html: '• ' + h }} />
              ))}
            </ul>
            {certification.demoLink && (
              <a href={certification.demoLink} target="_blank" rel="noopener" className="text-[var(--color-primary)] text-sm font-medium hover:underline flex items-center gap-1 mb-4">
                {certification.demoLinkText || '📄 View School Assistant Demo →'}
              </a>
            )}
            <a href={certification.link} target="_blank" rel="noopener" className="inline-block border border-[var(--color-border)] text-[var(--color-text)] px-4 py-2 rounded-lg text-sm font-medium hover:bg-[var(--color-bg-soft)] transition-colors">
              Visit AI Makerspace →
            </a>
          </div>
        </div>
      </div>
    </section>
  )
})

export default Certification
