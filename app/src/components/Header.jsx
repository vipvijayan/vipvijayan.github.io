import { useEffect } from 'react'

function Header({ data }) {
  useEffect(() => {
    const toggle = document.getElementById('theme-toggle')
    if (!toggle) return
    const storageKey = 'portfolio-theme'
    const root = document.documentElement
    const apply = (theme) => {
      root.setAttribute('data-theme', theme)
      toggle.setAttribute('aria-pressed', theme === 'dark' ? 'true' : 'false')
    }
    const saved = localStorage.getItem(storageKey)
    const prefersDark = window.matchMedia?.('(prefers-color-scheme: dark)').matches
    apply(saved || (prefersDark ? 'dark' : 'light'))
    const onClick = () => {
      const next = root.getAttribute('data-theme') === 'dark' ? 'light' : 'dark'
      localStorage.setItem(storageKey, next)
      apply(next)
    }
    toggle.addEventListener('click', onClick)
    return () => toggle.removeEventListener('click', onClick)
  }, [])

  useEffect(() => {
    const toggle = document.getElementById('nav-toggle')
    const menu = document.getElementById('nav-menu')
    if (!toggle || !menu) return
    const onClick = () => {
      toggle.classList.toggle('active')
      menu.classList.toggle('open')
      document.body.style.overflow = menu.classList.contains('open') ? 'hidden' : ''
    }
    const close = (e) => {
      if (!menu.contains(e.target) && !toggle.contains(e.target) && menu.classList.contains('open')) {
        toggle.classList.remove('active')
        menu.classList.remove('open')
        document.body.style.overflow = ''
      }
    }
    toggle.addEventListener('click', onClick)
    document.addEventListener('click', close)
    return () => {
      toggle.removeEventListener('click', onClick)
      document.removeEventListener('click', close)
    }
  }, [])

  return (
    <header id="header" className="fixed top-0 left-0 right-0 z-50 transition-all duration-300">
      <nav className="mx-auto max-w-6xl px-6 py-4 flex items-center justify-between">
        <div id="nav-menu">
          <ul className="flex items-center gap-6 list-none m-0 p-0">
            {data.nav.map((item, i) => (
              <li key={i}>
                <a
                  href={item.href}
                  className={`nav__link text-sm font-medium transition-colors duration-200 ${i === 0 ? 'text-[var(--color-primary)]' : 'text-[var(--color-text-soft)] hover:text-[var(--color-text)]'}`}
                >
                  {item.label}
                </a>
              </li>
            ))}
          </ul>
        </div>

        <div className="flex items-center gap-3">
          <button className="theme-toggle" id="theme-toggle" type="button" aria-label="Toggle theme">
            <span className="theme-toggle__icon theme-toggle__icon--light">☀</span>
            <span className="theme-toggle__icon theme-toggle__icon--dark">☾</span>
          </button>

          <button className="nav__toggle" id="nav-toggle" aria-label="Toggle menu">
            <span></span>
            <span></span>
            <span></span>
          </button>
        </div>
      </nav>
    </header>
  )
}

export default Header
