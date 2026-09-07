import { memo } from 'react'
import type { Skills as SkillsType, SkillCluster } from '../types'
import Icon from './Icon'

interface SkillsProps {
  skills: SkillsType
}

function RenderCluster({ cluster, span }: { cluster: SkillCluster; span: string }) {
  return (
    <div className={span}>
      <div data-aos="fade-up" className="mb-6">
        <h3 className="text-xl font-bold mb-1">{cluster.subheader}</h3>
        <p className="text-sm text-[var(--color-text-soft)]">{cluster.subheaderText}</p>
      </div>

      <div className="border-t border-[var(--color-border)]">
        {cluster.categories.map((cat, i) => (
          <div key={i} data-aos="fade-up" data-aos-delay={i * 50} className="py-4 border-b border-[var(--color-border)]">
            <div className="flex items-center gap-2 mb-1.5">
              <Icon icon={cat.icon} className="h-4 w-4 shrink-0 text-[var(--color-primary)]" />
              <h4 className="font-semibold text-sm">{cat.title}</h4>
              {cat.badge && (
                <span className="text-[10px] font-semibold uppercase tracking-wider text-[var(--color-primary)]">{cat.badge}</span>
              )}
            </div>
            <p className="text-sm text-[var(--color-text-soft)] leading-relaxed">{cat.tags.join(' · ')}</p>
          </div>
        ))}
      </div>
    </div>
  )
}

const Skills = memo(function Skills({ skills }: SkillsProps) {
  return (
    <section id="skills" className="py-20">
      <div className="mx-auto max-w-6xl px-6">
        <div data-aos="fade-up" className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold">Technical Skills</h2>
        </div>

        <div className="grid lg:grid-cols-5 gap-12">
          <RenderCluster cluster={skills.ai} span="lg:col-span-3" />
          <RenderCluster cluster={skills.mobile} span="lg:col-span-2" />
        </div>
      </div>
    </section>
  )
})

export default Skills
