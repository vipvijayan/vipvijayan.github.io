export type Difficulty = 'easy' | 'medium' | 'hard' | 'needs_info'
export type Ambiguity = 'low' | 'med' | 'high'
export type Domain = 'general' | 'summary' | 'coding' | 'design' | 'data'
export type Policy = 'balanced' | 'cost_efficient'

export interface ClassifyRequest {
  input: string
  classes?: ('difficulty' | 'ambiguity' | 'domain')[]
}

export interface Classification {
  label: string
  confidence: number
  meets_threshold: boolean
}

export interface ClassifyResponse {
  classifications: {
    difficulty?: Classification
    ambiguity?: Classification
    domain?: Classification
  }
}

export interface MultiModelRequest {
  input: string
  allowed_providers?: string[]
  allowed_models?: string[]
  policy?: Policy
  default_model?: string
}

export interface MultiModelResponse {
  model: string
  provider: string
  difficulty: Difficulty
  confidence: number
  ambiguity?: Ambiguity
  domain?: Domain
}

export interface RouterClientConfig {
  apiKey: string
  baseUrl?: string
}
