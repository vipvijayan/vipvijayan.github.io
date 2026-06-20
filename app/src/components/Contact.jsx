function Contact({ data }) {
  const { contact } = data

  return (
    <section id="contact" className="py-20">
      <div className="mx-auto max-w-6xl px-6">
        <div className="bg-[var(--color-bg-card)] border border-[var(--color-border)] rounded-2xl p-8 md:p-12 max-w-2xl mx-auto text-center">
          <span className="inline-block text-xs font-semibold uppercase tracking-wider text-[var(--color-primary)] mb-3">{contact.eyebrow}</span>
          <h2 className="text-2xl md:text-3xl font-bold mb-4">{contact.title}</h2>
          <p className="text-[var(--color-text-soft)] mb-8">{contact.description}</p>

          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-8">
            <a href={`mailto:${contact.email}`} className="inline-flex items-center justify-center gap-2 bg-[var(--color-primary)] text-white px-6 py-3 rounded-lg font-medium hover:bg-[var(--color-primary-hover)] transition-colors duration-200">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
              {contact.email}
            </a>
            <a href={`tel:${contact.phone.replace(/\s/g, '')}`} className="inline-flex items-center justify-center gap-2 border border-[var(--color-border)] text-[var(--color-text)] px-6 py-3 rounded-lg font-medium hover:bg-[var(--color-bg-soft)] transition-colors duration-200">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
              {contact.phone}
            </a>
          </div>

          <div className="flex justify-center gap-4">
            {contact.socials.map((social, i) => (
              <a key={i} href={social.url} target="_blank" rel="noopener" aria-label={social.label} className="w-10 h-10 flex items-center justify-center rounded-full bg-[var(--color-bg-soft)] border border-[var(--color-border)] text-[var(--color-text-soft)] hover:text-[var(--color-primary)] hover:border-[var(--color-primary)]/30 transition-colors duration-200">
                <SocialIcon label={social.label} />
              </a>
            ))}
          </div>
        </div>
      </div>
    </section>
  )
}

function SocialIcon({ label }) {
  const icons = {
    LinkedIn: <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M20.5 2h-17A1.5 1.5 0 002 3.5v17A1.5 1.5 0 003.5 22h17a1.5 1.5 0 001.5-1.5v-17A1.5 1.5 0 0020.5 2zM8 19H5v-9h3zM6.5 8.25A1.75 1.75 0 118.3 6.5a1.78 1.78 0 01-1.8 1.75zM19 19h-3v-4.74c0-1.42-.6-1.93-1.38-1.93A1.74 1.74 0 0013 14.19a.66.66 0 000 .14V19h-3v-9h2.9v1.3a3.11 3.11 0 012.7-1.4c1.55 0 3.36.86 3.36 3.66z"/></svg>,
    GitHub: <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/></svg>,
    Medium: <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M13.54 12a6.8 6.8 0 01-6.77 6.82A6.8 6.8 0 010 12a6.8 6.8 0 016.77-6.82A6.8 6.8 0 0113.54 12zM20.96 12c0 3.54-1.51 6.42-3.38 6.42-1.86 0-3.38-2.88-3.38-6.42s1.51-6.42 3.38-6.42 3.38 2.88 3.38 6.42M24 12c0 3.17-.53 5.75-1.19 5.75-.66 0-1.19-2.58-1.19-5.75s.53-5.75 1.19-5.75C23.47 6.25 24 8.83 24 12z"/></svg>,
    HackerRank: <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0c1.42 0 2.58 1.16 2.58 2.58v6.84h6.84c1.42 0 2.58 1.16 2.58 2.58s-1.16 2.58-2.58 2.58h-6.84v6.84c0 1.42-1.16 2.58-2.58 2.58s-2.58-1.16-2.58-2.58v-6.84H2.58C1.16 14.58 0 13.42 0 12s1.16-2.58 2.58-2.58h6.84V2.58C9.42 1.16 10.58 0 12 0z"/></svg>
  }
  return icons[label] || null
}

export default Contact
