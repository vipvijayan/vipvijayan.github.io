import { useState, useEffect, useRef } from 'react'

function Hero({ data }) {
  const { hero } = data
  const [roleIndex, setRoleIndex] = useState(0)
  const [charIndex, setCharIndex] = useState(0)
  const [isDeleting, setIsDeleting] = useState(false)
  const [displayText, setDisplayText] = useState('')
  const timeoutRef = useRef(null)

  useEffect(() => {
    const roles = hero.roles
    const typeSpeed = 25
    const deleteSpeed = 12
    const pauseEnd = 800
    const pauseStart = 200

    function tick() {
      const current = roles[roleIndex]
      if (!isDeleting) {
        if (charIndex < current.length) {
          setDisplayText(current.substring(0, charIndex + 1))
          setCharIndex(charIndex + 1)
          timeoutRef.current = setTimeout(tick, typeSpeed)
        } else {
          timeoutRef.current = setTimeout(() => { setIsDeleting(true); tick() }, pauseEnd)
        }
      } else {
        if (charIndex > 0) {
          setCharIndex(charIndex - 1)
          setDisplayText(current.substring(0, charIndex - 1))
          timeoutRef.current = setTimeout(tick, deleteSpeed)
        } else {
          setIsDeleting(false)
          setRoleIndex((roleIndex + 1) % roles.length)
          timeoutRef.current = setTimeout(tick, pauseStart)
        }
      }
    }

    timeoutRef.current = setTimeout(tick, pauseStart)
    return () => clearTimeout(timeoutRef.current)
  }, [roleIndex, charIndex, isDeleting, hero.roles])

  const years = hero.yearsExperience

  return (
    <section id="home" className="min-h-screen flex items-center pt-24 pb-16">
      <div className="mx-auto max-w-4xl px-6 w-full">
        <h1 className="text-4xl sm:text-5xl md:text-6xl font-extrabold leading-tight mb-8">
          <span className="whitespace-nowrap">Hi, I'm <span className="text-gradient">{hero.name}</span></span>
          <br />
          <span className="hero__role text-3xl md:text-4xl font-bold text-[var(--color-text-soft)] whitespace-nowrap block">{displayText}</span>
        </h1>

        <p className="text-lg md:text-xl text-[var(--color-text-soft)] leading-relaxed max-w-3xl mb-10">
          <strong className="text-[var(--color-text)]">AI Engineer &amp; Lead Software Engineer</strong> with <strong className="text-[var(--color-text)]">{years} years</strong> building production-grade software — from <strong className="text-[var(--color-text)]">multi-agent LLM systems</strong> with RAG, LangGraph, and MCP, to <strong className="text-[var(--color-text)]">native &amp; cross-platform mobile apps</strong> shipped to millions. Currently a <strong className="text-[var(--color-text)]">Staff Design Engineer at Visa</strong>, where I combine deep AI engineering with mobile expertise to build intelligent, scalable products.
        </p>

        <div className="flex flex-wrap gap-4 mb-12">
          <a href="#projects" className="inline-flex items-center gap-2 bg-[var(--color-primary)] text-white px-6 py-3 rounded-lg font-medium hover:bg-[var(--color-primary-hover)] transition-colors duration-200">
            View My Work
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
          </a>
          <a href="#contact" className="inline-flex items-center gap-2 border border-[var(--color-border)] text-[var(--color-text)] px-6 py-3 rounded-lg font-medium hover:bg-[var(--color-bg-soft)] transition-colors duration-200">
            Get in Touch
          </a>
        </div>

        <div className="grid grid-cols-3 gap-8 max-w-xl">
          <div>
            <div className="text-3xl font-bold text-gradient">{years}+</div>
            <div className="text-sm text-[var(--color-text-muted)]">Years Experience</div>
          </div>
          <div>
            <div className="text-3xl font-bold text-gradient">{hero.appsShipped}+</div>
            <div className="text-sm text-[var(--color-text-muted)]">Apps Shipped</div>
          </div>
          <div>
            <div className="text-3xl font-bold text-gradient">{hero.aiModulesCompleted}</div>
            <div className="text-sm text-[var(--color-text-muted)]">AI Modules Completed</div>
          </div>
        </div>
      </div>
    </section>
  )
}

export default Hero
