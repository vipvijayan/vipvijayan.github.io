function Skills({ data }) {
  const { skills } = data

  const renderCluster = (cluster, featured = false) => (
    <div className={`mb-12${featured ? ' bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-2xl p-6' : ''}`}>
      <div className="mb-6">
        <h3 className="text-xl font-bold mb-1">{cluster.subheader}</h3>
        <p className="text-sm text-[var(--color-text-soft)]">{cluster.subheaderText}</p>
      </div>
      <div className="grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
        {cluster.categories.map((cat, i) => (
          <div key={i} className={`p-4 rounded-xl border ${cat.featured ? 'border-[var(--color-primary)]/30 bg-[var(--color-primary)]/5' : 'border-[var(--color-border)] bg-[var(--color-bg-card)]'}`}>
            <div className="flex items-center gap-2 mb-3">
              <span className="text-lg">{cat.icon}</span>
              <h4 className="font-semibold text-sm">{cat.title}</h4>
              {cat.badge && (
                <span className="text-[10px] font-bold uppercase tracking-wider bg-[var(--color-primary)] text-white px-2 py-0.5 rounded-full">{cat.badge}</span>
              )}
            </div>
            <div className="flex flex-wrap gap-1.5">
              {cat.tags.map((tag, j) => (
                <span key={j} className="text-xs px-2 py-1 rounded-md bg-[var(--color-bg-soft)] text-[var(--color-text-soft)] border border-[var(--color-border)]">{tag}</span>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  )

  return (
    <section id="skills" className="py-20">
      <div className="mx-auto max-w-6xl px-6">
        <div className="text-center mb-12">
          <span className="inline-block text-xs font-semibold uppercase tracking-wider text-[var(--color-primary)] mb-3">Technical Skills</span>
        </div>
        {renderCluster(skills.ai, true)}
        {renderCluster(skills.mobile)}
      </div>
    </section>
  )
}

export default Skills
