function Learning({ data }) {
  const { learning } = data

  return (
    <section id="learning" className="py-20 bg-[var(--color-bg-soft)]">
      <div className="mx-auto max-w-6xl px-6">
        <div className="text-center mb-12">
          <span className="inline-block text-xs font-semibold uppercase tracking-wider text-[var(--color-primary)] mb-3">{learning.eyebrow}</span>
          <h2 className="text-3xl md:text-4xl font-bold mb-4">{learning.title}</h2>
          <p className="text-[var(--color-text-soft)] max-w-2xl mx-auto">{learning.subtitle}</p>
        </div>

        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">
          {learning.tracks.map((track, i) => (
            <div key={i} className="bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-xl p-5">
              <h3 className="font-bold mb-3 flex items-center gap-2">
                <span>{track.icon}</span> {track.title}
              </h3>
              <ul className="space-y-2">
                {track.items.map((item, j) => (
                  <li key={j} className="text-sm text-[var(--color-text-soft)]" dangerouslySetInnerHTML={{ __html: '• ' + item }} />
                ))}
              </ul>
            </div>
          ))}
        </div>

        <div className="bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-xl p-6 mb-8">
          <h3 className="font-bold mb-4">{learning.skillsTitle}</h3>
          <ul className="grid sm:grid-cols-2 gap-3">
            {learning.skills.map((skill, i) => (
              <li key={i} className="text-sm">
                <strong className="text-[var(--color-text)]">{skill.title}</strong>
                <span className="text-[var(--color-text-muted)]"> — {skill.text}</span>
              </li>
            ))}
          </ul>
        </div>

        <div className="flex items-start gap-4 bg-[var(--color-bg-card)] border border-[var(--color-primary)]/20 rounded-xl p-6">
          <span className="text-3xl">{learning.capstone.icon}</span>
          <div>
            <h3 className="font-bold mb-1">{learning.capstone.title}</h3>
            <p className="text-sm text-[var(--color-text-soft)]" dangerouslySetInnerHTML={{ __html: learning.capstone.text }} />
          </div>
        </div>
      </div>
    </section>
  )
}

export default Learning
