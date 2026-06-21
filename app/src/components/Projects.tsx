import { memo } from 'react'
import type { Project } from '../types'

interface ProjectsProps {
  projects: Project[]
}

const Projects = memo(function Projects({ projects }: ProjectsProps) {
  return (
    <section id="projects" className="py-20">
      <div className="mx-auto max-w-6xl px-6">
        <div data-aos="fade-up" className="text-center mb-12">
          <span className="inline-block text-xs font-semibold uppercase tracking-wider text-[var(--color-primary)] mb-3">Featured Work</span>
          <h2 className="text-3xl md:text-4xl font-bold mb-4">Projects & Impact</h2>
          <p className="text-[var(--color-text-soft)] max-w-2xl mx-auto">A selection of apps I've designed, built, and shipped to production.</p>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
          {projects.map((project, i) => (
            <article key={i} data-aos="fade-up" data-aos-delay={i * 50} className="bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-2xl p-6 hover:border-[var(--color-primary)]/30 transition-colors duration-200">
              <div className="flex flex-wrap gap-1.5 mb-4">
                {project.tags.map((tag, j) => (
                  <span key={j} className={`text-xs font-medium px-2.5 py-1 rounded-full ${tag === 'Featured' ? 'bg-[var(--color-primary)] text-white' : tag === 'Top-Ranked' ? 'bg-[var(--color-success)]/10 text-[var(--color-success)]' : 'bg-[var(--color-bg-soft)] text-[var(--color-text-soft)] border border-[var(--color-border)]'}`}>{tag}</span>
                ))}
              </div>
              <h3 className="text-lg font-bold mb-3">{project.name}</h3>
              <p className="text-sm text-[var(--color-text-soft)] mb-4 leading-relaxed" dangerouslySetInnerHTML={{ __html: project.description }} />
              {project.features && project.features.length > 0 && (
                <ul className="space-y-1.5 mb-4">
                  {project.features.map((f, j) => (
                    <li key={j} className="text-xs text-[var(--color-text-muted)] flex gap-2">
                      <span className="text-[var(--color-success)] shrink-0">✓</span>{f}
                    </li>
                  ))}
                </ul>
              )}
              {project.links && project.links.length > 0 && (
                <div className="flex flex-wrap gap-3 mt-auto">
                  {project.links.map((link, j) => (
                    <a key={j} href={link.url} target="_blank" rel="noopener" className="text-sm text-[var(--color-primary)] font-medium hover:underline">{link.text}</a>
                  ))}
                </div>
              )}
            </article>
          ))}
        </div>
      </div>
    </section>
  )
})

export default Projects
