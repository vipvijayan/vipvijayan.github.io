export interface NavItem {
  label: string
  href: string
}

export interface Hero {
  name: string
  roles: string[]
  yearsExperience: number
  appsShipped: number
  aiModulesCompleted: number
}

export interface Certification {
  title: string
  subtitle: string
  image: string
  imageAlt: string
  badge: string
  heading: string
  issuer: string
  link: string
  linkText: string
  demoLink: string
  demoLinkText: string
  highlights: string[]
}

export interface AboutHighlight {
  icon: string
  title: string
  text: string
}

export interface About {
  paragraphs: string[]
  location: string
  visa: string
  focus: string
  highlights: AboutHighlight[]
}

export interface SkillCategory {
  title: string
  icon: string
  featured?: boolean
  badge?: string
  tags: string[]
}

export interface SkillCluster {
  subheader: string
  subheaderText: string
  categories: SkillCategory[]
}

export interface Skills {
  ai: SkillCluster
  mobile: SkillCluster
}

export interface Experience {
  role: string
  company: string
  period: string
  location: string
  items: string[]
  tags: string[]
}

export interface AiProject {
  name: string
  hide: boolean
  description: string
  tags: string[]
  features: string[]
  link: string
}

export interface LearningTrack {
  icon: string
  title: string
  items: string[]
}

export interface LearningSkill {
  title: string
  text: string
}

export interface LearningCapstone {
  icon: string
  title: string
  text: string
}

export interface Learning {
  eyebrow: string
  title: string
  subtitle: string
  tracks: LearningTrack[]
  skillsTitle: string
  skills: LearningSkill[]
  capstone: LearningCapstone
}

export interface ProjectLink {
  text: string
  url: string
}

export interface Project {
  name: string
  description: string
  tags: string[]
  features: string[]
  links: ProjectLink[]
}

export interface Social {
  label: string
  url: string
}

export interface Contact {
  eyebrow: string
  title: string
  description: string
  email: string
  phone: string
  socials: Social[]
}

export interface FooterLink {
  text: string
  href: string
}

export interface Footer {
  text: string
  links: FooterLink[]
}

export interface PortfolioData {
  nav: NavItem[]
  hero: Hero
  certification: Certification
  about: About
  skills: Skills
  experience: Experience[]
  aiProjects: AiProject[]
  learning: Learning
  projects: Project[]
  personalProjects: Project[]
  contact: Contact
  footer: Footer
}
