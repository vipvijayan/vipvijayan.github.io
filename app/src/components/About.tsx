import { memo } from 'react'
import type { About as AboutType } from '../types'
import Icon from './Icon'

interface AboutProps {
  about: AboutType
  yearsExperience: number
}

const About = memo(function About({ about, yearsExperience }: AboutProps) {
  const facts = [
    { label: 'Location', value: about.location },
    { label: 'Experience', value: `${yearsExperience}+ years in Software Engineering` },
    { label: 'Visa', value: about.visa },
    { label: 'Focus', value: about.focus },
  ]

  return (
    <section id="about" className="py-20 bg-[var(--color-bg-soft)]">
      <div className="mx-auto max-w-6xl px-6">
        <div data-aos="fade-up" className="text-center mb-12">
          <span className="inline-block text-xs font-semibold uppercase tracking-wider text-[var(--color-primary)] mb-3">About Me</span>
          <h2 className="text-3xl md:text-4xl font-bold">Engineering AI and mobile experiences that matter</h2>
        </div>

        <div className="grid lg:grid-cols-5 gap-12">
          <div data-aos="fade-up" className="lg:col-span-3">
            {about.paragraphs.map((p, i) => (
              <p key={i} className="text-[var(--color-text-soft)] leading-relaxed mb-4" dangerouslySetInnerHTML={{ __html: p.replace('{yearsExperience}', String(yearsExperience)) }} />
            ))}

            <dl className="mt-8 border-t border-[var(--color-border)]">
              {facts.map((f, i) => (
                <div key={i} className="flex flex-col sm:flex-row sm:gap-4 py-3 border-b border-[var(--color-border)]">
                  <dt className="text-xs font-medium uppercase tracking-wide text-[var(--color-text-muted)] sm:w-32 shrink-0">{f.label}</dt>
                  <dd className="text-sm font-medium">{f.value}</dd>
                </div>
              ))}
            </dl>
          </div>

          <div className="lg:col-span-2">
            <ul className="space-y-5">
              {about.highlights.map((h, i) => (
                <li key={i} data-aos="fade-left" data-aos-delay={i * 80} className="flex items-start gap-3">
                  <Icon icon={h.icon} className="h-5 w-5 shrink-0 mt-0.5 text-[var(--color-primary)]" />
                  <div>
                    <h3 className="font-semibold text-sm">{h.title}</h3>
                    <p className="text-sm text-[var(--color-text-soft)]">{h.text}</p>
                  </div>
                </li>
              ))}
            </ul>
          </div>
        </div>
      </div>
    </section>
  )
})

export default About
