import { Suspense, lazy } from 'react'
import portfolioData from './data/portfolio.json'
import Header from './components/Header'
import Hero from './components/Hero'

const Certification = lazy(() => import('./components/Certification'))
const About = lazy(() => import('./components/About'))
const Skills = lazy(() => import('./components/Skills'))
const Experience = lazy(() => import('./components/Experience'))
const AiProjects = lazy(() => import('./components/AiProjects'))
const Learning = lazy(() => import('./components/Learning'))
const Projects = lazy(() => import('./components/Projects'))
const PersonalProjects = lazy(() => import('./components/PersonalProjects'))
const Contact = lazy(() => import('./components/Contact'))
const Footer = lazy(() => import('./components/Footer'))

function App() {
  const data = portfolioData

  return (
    <div className="min-h-screen bg-[var(--color-bg)] text-[var(--color-text)] transition-colors duration-300">
      <Header nav={data.nav} />
      <main>
        <Hero hero={data.hero} />
        <Suspense fallback={null}>
          <Certification certification={data.certification} />
          <About about={data.about} yearsExperience={data.hero.yearsExperience} />
          <Skills skills={data.skills} />
          <Experience experience={data.experience} />
          <AiProjects aiProjects={data.aiProjects} />
          <Learning learning={data.learning} />
          <Projects projects={data.projects} />
          <PersonalProjects personalProjects={data.personalProjects} />
          <Contact contact={data.contact} />
        </Suspense>
      </main>
      <Suspense fallback={null}>
        <Footer footer={data.footer} />
      </Suspense>
    </div>
  )
}

export default App
