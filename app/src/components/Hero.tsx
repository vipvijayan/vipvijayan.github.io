import { useState, useEffect, useRef, memo } from 'react'
import type { Hero as HeroType } from '../types'

interface HeroProps {
  hero: HeroType
}

const Hero = memo(function Hero({ hero }: HeroProps) {
  const [displayText, setDisplayText] = useState('')
  const stateRef = useRef({ roleIndex: 0, charIndex: 0, isDeleting: false })

  useEffect(() => {
    const roles = hero.roles
    const typeSpeed = 25
    const deleteSpeed = 12
    const pauseEnd = 800
    const pauseStart = 200
    let timeoutId: ReturnType<typeof setTimeout>

    function tick() {
      const s = stateRef.current
      const current = roles[s.roleIndex]

      if (!s.isDeleting) {
        if (s.charIndex < current.length) {
          s.charIndex++
          setDisplayText(current.substring(0, s.charIndex))
          timeoutId = setTimeout(tick, typeSpeed)
        } else {
          timeoutId = setTimeout(() => {
            s.isDeleting = true
            tick()
          }, pauseEnd)
        }
      } else {
        if (s.charIndex > 0) {
          s.charIndex--
          setDisplayText(current.substring(0, s.charIndex))
          timeoutId = setTimeout(tick, deleteSpeed)
        } else {
          s.isDeleting = false
          s.roleIndex = (s.roleIndex + 1) % roles.length
          timeoutId = setTimeout(tick, pauseStart)
        }
      }
    }

    timeoutId = setTimeout(tick, pauseStart)
    return () => clearTimeout(timeoutId)
  }, [hero.roles])

  const years = hero.yearsExperience

  return (
    <section id="home" className="min-h-screen flex items-center pt-24 pb-16">
      <div className="mx-auto max-w-4xl px-6 w-full">
        <h1 data-aos="fade-up" className="text-4xl sm:text-5xl md:text-6xl font-extrabold leading-tight mb-8">
          <span className="whitespace-nowrap">Hi, I'm <span className="text-gradient">{hero.name}</span></span>
          <br />
          <span className="hero__role text-3xl md:text-4xl font-bold text-[var(--color-text-soft)] whitespace-nowrap block mt-5">{displayText}</span>
        </h1>

        <p data-aos="fade-up" data-aos-delay="100" className="text-lg md:text-xl text-[var(--color-text-soft)] leading-relaxed max-w-3xl mb-10">
          <strong className="text-[var(--color-text)]">Staff Design Engineer at Visa</strong> with <strong className="text-[var(--color-text)]">{years} years</strong> shipping production mobile apps to millions and building <strong className="text-[var(--color-text)]">enterprise AI systems</strong> — from <strong className="text-[var(--color-text)]">RAG-powered document analysis</strong> and <strong className="text-[var(--color-text)]">multi-agent workflow orchestrators</strong> to <strong className="text-[var(--color-text)]">payment validation engines</strong> and <strong className="text-[var(--color-text)]">computer vision pipelines</strong>. Previously built fintech apps at Fidelity, e-commerce at Wayfair, and security tools at Rapid7.
        </p>

        <div data-aos="fade-up" data-aos-delay="200" className="flex flex-wrap gap-4 mb-12">
          <a href="#projects" className="inline-flex items-center gap-2 bg-[var(--color-primary)] text-white px-6 py-3 rounded-lg font-medium hover:bg-[var(--color-primary-hover)] transition-colors duration-200">
            View My Work
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
          </a>
          <a href="#contact" className="inline-flex items-center gap-2 border border-[var(--color-border)] text-[var(--color-text)] px-6 py-3 rounded-lg font-medium hover:bg-[var(--color-bg-soft)] transition-colors duration-200">
            Get in Touch
          </a>
        </div>

        <div data-aos="fade-up" data-aos-delay="300" className="grid grid-cols-3 gap-8 max-w-xl">
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
})

export default Hero
