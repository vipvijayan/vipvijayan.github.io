import { memo, useState } from 'react'
import type { Project } from '../types'

interface ProjectsProps {
  projects: Project[]
}

const VISIBLE_FEATURES = 2

function ProjectCard({ project }: { project: Project }) {
  const [expanded, setExpanded] = useState(false)

  const features = project.features ?? []
  const hidden = features.length - VISIBLE_FEATURES
  const shown = expanded ? features : features.slice(0, VISIBLE_FEATURES)

  return (
    <article className="flex flex-col h-full bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-2xl p-6 hover:border-[var(--color-primary)]/30 transition-colors duration-200">
      <div className="flex flex-wrap gap-1.5 mb-4">
        {project.tags.map((tag, j) => (
          <span key={j} className={`text-xs font-medium px-2.5 py-1 rounded-full ${tag === 'Featured' ? 'bg-[var(--color-primary)] text-white' : tag === 'Top-Ranked' ? 'bg-[var(--color-success)]/10 text-[var(--color-success)]' : 'bg-[var(--color-bg-soft)] text-[var(--color-text-soft)] border border-[var(--color-border)]'}`}>{tag}</span>
        ))}
      </div>

      <h3 className="text-lg font-bold mb-3">{project.name}</h3>

      <p
        className={`text-sm text-[var(--color-text-soft)] mb-4 leading-relaxed ${expanded ? '' : 'line-clamp-3'}`}
        dangerouslySetInnerHTML={{ __html: project.description }}
      />

      {features.length > 0 && (
        <ul className="space-y-1.5 mb-3">
          {shown.map((f, j) => (
            <li key={j} className="text-xs text-[var(--color-text-muted)] flex gap-2">
              <span className="text-[var(--color-success)] shrink-0">✓</span>{f}
            </li>
          ))}
        </ul>
      )}

      {hidden > 0 && (
        <button
          type="button"
          onClick={() => setExpanded(v => !v)}
          aria-expanded={expanded}
          className="self-start text-sm text-[var(--color-primary)] font-medium hover:underline mb-4"
        >
          {expanded ? 'Show less \u2191' : `Show ${hidden} more \u2193`}
        </button>
      )}

      {project.links && project.links.length > 0 && (
        <div className="flex flex-wrap gap-3 mt-auto pt-2">
          {project.links.map((link, j) => (
            <a key={j} href={link.url} target="_blank" rel="noopener" className="text-sm text-[var(--color-primary)] font-medium hover:underline">{link.text}</a>
          ))}
        </div>
      )}
    </article>
  )
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

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6 items-stretch">
          {projects.map((project, i) => (
            <div key={i} data-aos="fade-up" data-aos-delay={i * 50} className="h-full">
              <ProjectCard project={project} />
            </div>
          ))}
        </div>
      </div>
    </section>
  )
})

export default Projects
