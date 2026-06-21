import { memo } from 'react'
import type { About as AboutType } from '../types'

interface AboutProps {
  about: AboutType
  yearsExperience: number
}

const About = memo(function About({ about, yearsExperience }: AboutProps) {
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

            <div className="grid sm:grid-cols-2 gap-4 mt-8">
              <div data-aos="fade-up" data-aos-delay="0" className="flex items-start gap-3 p-4 rounded-xl bg-[var(--color-bg-card)] border border-[var(--color-border)]">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--color-primary)" strokeWidth="2" className="shrink-0 mt-0.5"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
                <div>
                  <div className="text-xs font-medium text-[var(--color-text-muted)] uppercase tracking-wide">Location</div>
                  <div className="text-sm font-medium">{about.location}</div>
                </div>
              </div>
              <div data-aos="fade-up" data-aos-delay="50" className="flex items-start gap-3 p-4 rounded-xl bg-[var(--color-bg-card)] border border-[var(--color-border)]">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--color-primary)" strokeWidth="2" className="shrink-0 mt-0.5"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"/><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/></svg>
                <div>
                  <div className="text-xs font-medium text-[var(--color-text-muted)] uppercase tracking-wide">Experience</div>
                  <div className="text-sm font-medium">{yearsExperience}+ years in Software Engineering</div>
                </div>
              </div>
              <div data-aos="fade-up" data-aos-delay="100" className="flex items-start gap-3 p-4 rounded-xl bg-[var(--color-bg-card)] border border-[var(--color-border)]">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--color-primary)" strokeWidth="2" className="shrink-0 mt-0.5"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
                <div>
                  <div className="text-xs font-medium text-[var(--color-text-muted)] uppercase tracking-wide">Visa</div>
                  <div className="text-sm font-medium">{about.visa}</div>
                </div>
              </div>
              <div data-aos="fade-up" data-aos-delay="150" className="flex items-start gap-3 p-4 rounded-xl bg-[var(--color-bg-card)] border border-[var(--color-border)]">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--color-primary)" strokeWidth="2" className="shrink-0 mt-0.5"><path d="M22 12h-4l-3 9L9 3l-3 9H2"/></svg>
                <div>
                  <div className="text-xs font-medium text-[var(--color-text-muted)] uppercase tracking-wide">Focus</div>
                  <div className="text-sm font-medium">{about.focus}</div>
                </div>
              </div>
            </div>
          </div>

          <div className="lg:col-span-2 space-y-4">
            {about.highlights.map((h, i) => (
              <div key={i} data-aos="fade-left" data-aos-delay={i * 80} className="flex items-start gap-4 p-4 rounded-xl bg-[var(--color-bg-card)] border border-[var(--color-border)]">
                <span className="text-2xl">{h.icon}</span>
                <div>
                  <h3 className="font-semibold text-sm">{h.title}</h3>
                  <p className="text-sm text-[var(--color-text-soft)]">{h.text}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  )
})

export default About
