import type {
  ClassifyRequest,
  ClassifyResponse,
  MultiModelRequest,
  MultiModelResponse,
  RouterClientConfig,
} from './types'

const DEFAULT_BASE_URL = 'https://api.morphllm.com/v1'

async function request<T>(
  path: string,
  body: ClassifyRequest | MultiModelRequest,
  config: RouterClientConfig,
): Promise<T> {
  const res = await fetch(`${config.baseUrl ?? DEFAULT_BASE_URL}${path}`, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${config.apiKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(body),
  })

  if (!res.ok) {
    const text = await res.text()
    throw new Error(`Morph Router ${res.status}: ${text}`)
  }

  return res.json()
}

export function createMorphRouter(config: RouterClientConfig) {
  return {
    /** Classify a prompt's difficulty, ambiguity, and domain (~50ms, $0.005). */
    classify(req: ClassifyRequest) {
      return request<ClassifyResponse>('/router/classify', req, config)
    },

    /** Pick the cheapest model that can handle a prompt. */
    multimodel(req: MultiModelRequest) {
      return request<MultiModelResponse>('/router/multimodel', req, config)
    },
  }
}

export type MorphRouter = ReturnType<typeof createMorphRouter>
