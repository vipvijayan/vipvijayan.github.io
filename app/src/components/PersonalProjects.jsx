function PersonalProjects({ data }) {
  return (
    <section id="personal-projects" className="py-20 bg-[var(--color-bg-soft)]">
      <div className="mx-auto max-w-6xl px-6">
        <div className="text-center mb-12">
          <span className="inline-block text-xs font-semibold uppercase tracking-wider text-[var(--color-primary)] mb-3">Personal Projects</span>
          <h2 className="text-3xl md:text-4xl font-bold">Personal Projects</h2>
        </div>

        <div className="grid md:grid-cols-2 gap-6">
          {data.personalProjects.map((project, i) => (
            <article key={i} className="bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-2xl p-6 hover:border-[var(--color-primary)]/30 transition-colors duration-200">
              <div className="flex flex-wrap gap-1.5 mb-4">
                {project.tags.map((tag, j) => (
                  <span key={j} className={`text-xs font-medium px-2.5 py-1 rounded-full ${tag === 'Featured' ? 'bg-[var(--color-primary)] text-white' : 'bg-[var(--color-bg-soft)] text-[var(--color-text-soft)] border border-[var(--color-border)]'}`}>{tag}</span>
                ))}
              </div>
              <h3 className="text-lg font-bold mb-3">{project.name}</h3>
              <p className="text-sm text-[var(--color-text-soft)] mb-4 leading-relaxed">{project.description}</p>
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
}

export default PersonalProjects
