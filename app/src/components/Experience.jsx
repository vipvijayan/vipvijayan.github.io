function Experience({ data }) {
  return (
    <section id="experience" className="py-20 bg-[var(--color-bg-soft)]">
      <div className="mx-auto max-w-6xl px-6">
        <div className="text-center mb-12">
          <span className="inline-block text-xs font-semibold uppercase tracking-wider text-[var(--color-primary)] mb-3">Career Journey</span>
          <h2 className="text-3xl md:text-4xl font-bold">Professional Experience</h2>
        </div>

        <div className="relative max-w-3xl mx-auto">
          <div className="absolute left-4 top-0 bottom-0 w-px bg-[var(--color-border)]"></div>

          {data.experience.map((job, i) => (
            <div key={i} className="relative pl-12 pb-10 last:pb-0">
              <div className="absolute left-2.5 top-1.5 w-3 h-3 rounded-full bg-[var(--color-primary)] border-2 border-[var(--color-bg)] z-10"></div>

              <div className="bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-xl p-5">
                <div className="flex flex-wrap items-start justify-between gap-2 mb-1">
                  <div>
                    <h3 className="font-bold text-[var(--color-text)]">{job.role}</h3>
                    <p className="text-sm text-[var(--color-primary)] font-medium">{job.company}</p>
                  </div>
                  <span className="text-xs font-mono font-medium px-3 py-1 rounded-full bg-[var(--color-bg-soft)] border border-[var(--color-border)] text-[var(--color-text-muted)] whitespace-nowrap">{job.period}</span>
                </div>
                <p className="text-xs text-[var(--color-text-muted)] mb-3">{job.location}</p>

                {job.items.length > 0 && (
                  <ul className="space-y-1.5 mb-3">
                    {job.items.map((item, j) => (
                      <li key={j} className="text-sm text-[var(--color-text-soft)] flex gap-2" dangerouslySetInnerHTML={{ __html: '• ' + item }} />
                    ))}
                  </ul>
                )}

                {job.tags.length > 0 && (
                  <div className="flex flex-wrap gap-1.5">
                    {job.tags.map((tag, j) => (
                      <span key={j} className="text-[10px] font-medium px-2 py-0.5 rounded-md bg-[var(--color-primary)]/10 text-[var(--color-primary)]">{tag}</span>
                    ))}
                  </div>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

export default Experience
