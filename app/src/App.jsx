import { useEffect, useState } from 'react'
import Header from './components/Header'
import Hero from './components/Hero'
import Certification from './components/Certification'
import About from './components/About'
import Skills from './components/Skills'
import Experience from './components/Experience'
import AiProjects from './components/AiProjects'
import Learning from './components/Learning'
import Projects from './components/Projects'
import PersonalProjects from './components/PersonalProjects'
import Contact from './components/Contact'
import Footer from './components/Footer'

function App() {
  const [data, setData] = useState(null)

  useEffect(() => {
    fetch('/data/portfolio.json')
      .then(r => r.json())
      .then(setData)
      .catch(err => console.error('Failed to load portfolio data:', err))
  }, [])

  if (!data) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)] text-[var(--color-text)]">
        <div className="text-center">
          <div className="w-10 h-10 border-2 border-[var(--color-border)] border-t-[var(--color-primary)] rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-[var(--color-text-muted)]">Loading portfolio...</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-[var(--color-bg)] text-[var(--color-text)] transition-colors duration-300">
      <Header data={data} />
      <main>
        <Hero data={data} />
        <Certification data={data} />
        <About data={data} />
        <Skills data={data} />
        <Experience data={data} />
        <AiProjects data={data} />
        <Learning data={data} />
        <Projects data={data} />
        <PersonalProjects data={data} />
        <Contact data={data} />
      </main>
      <Footer data={data} />
    </div>
  )
}

export default App
