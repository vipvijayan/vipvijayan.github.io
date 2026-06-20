function Footer({ data }) {
  return (
    <footer className="py-12 border-t border-[var(--color-border)]">
      <div className="mx-auto max-w-6xl px-6 text-center">
        <p className="text-[var(--color-text-muted)] text-sm mb-4">{data.footer.text}</p>
        <div className="flex justify-center gap-6">
          {data.footer.links.map((link, i) => (
            <a key={i} href={link.href} className="text-[var(--color-text-muted)] text-sm hover:text-[var(--color-primary)] transition-colors">{link.text}</a>
          ))}
        </div>
      </div>
    </footer>
  )
}

export default Footer
