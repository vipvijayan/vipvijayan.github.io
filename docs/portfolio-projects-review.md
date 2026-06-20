# Portfolio Projects — Extracted Content

> Extracted from 25 WhatsApp screenshots using Tesseract OCR.
> Most images are chat UI screenshots where project descriptions are embedded as smaller images inside chat bubbles — those embedded images could not be OCR'd reliably at this resolution.

---

## Extracted Text Blocks

### Block 1 — Engineering Philosophy / Stack Overview (from screenshot 23.30.44)

validation.

- The pattern is consistent: cookies > JWTs, sessionStorage > localStorage, server-side state > stateless verification. Auth done right is invisible; auth done wrong is the only thing users notice.

- **Production-grade polyglot**
  - Python with SQLAlchemy 2 async, Alembic, Hazelcast, OpenTelemetry, and resilience patterns like circuit breakers and exponential-backoff retries.
  - Go with chi, sqlx, MinIO, and JWT.
  - TypeScript everywhere on the web.
  - Dart for everything that touches a phone — the right tool for the job, not a one-size-fits-all.
  - BLoC, Provider, NFC, mobile scanning, FIDO2, MDL, multi-flavor builds.
  - Flutter isn't a side project here — it's a serious surface area where I've been the lead or sole developer on most of the apps.

- **Quality is enforced, not optional**
  - Every project ships with tests: Vitest, Jest, Pytest, Karma, flutter_test, Playwright E2E.
  - Every project enforces style: Husky, lint-staged, CI gates.

---

### Block 2 — Visa MCP Test Project (from screenshot 23.30.58(6))

## Visa MCP Test — A Clean Room for Model Context Protocol

- **The role**
  - A small but strategically useful project: a minimal Angular 20 sandbox built specifically to validate Model Context Protocol (MCP) integrations against the Visa MCP Hub.

- **Why it exists**
  - When you're testing how AI agents talk to enterprise tool servers, you don't want noise from a complex application getting in the way.
  - This is the noise-free environment for proving out integration patterns and validating tool behavior before they get rolled into production apps.

- **My contribution**
  - **Sole author** — created the scaffold and used it as my own testbed for evaluating MCP server behavior and tool-call patterns before bringing them into production apps.

- **Tech**
  - Angular 20, TypeScript, Karma, Jasmine.

---

## Unreadable Screenshots (23 of 25)

The remaining 23 screenshots are WhatsApp chat UI captures. They appear to contain additional project descriptions shared as embedded images within the chat, but the text within those embedded images could not be extracted with local OCR at this resolution.

**Recommendation:** If you have the original text or can share these as plain text/PDF instead of chat screenshots, I can reconstruct the full project list cleanly.

---

## Known Projects (from portfolio site)

For reference, the portfolio site already includes these projects:

1. **School Assistant** — AI-powered chat app for parents; multi-agent RAG (local files + Gmail + web); OpenAI GPT-4, FastAPI, React, Qdrant, LangGraph, RAGAS; deployed on Railway + Vercel
2. **Visa MCP Test** — Minimal Angular 20 sandbox for validating MCP integrations against Visa MCP Hub
3. **ScanIT** — Barcode/QR scanner app
4. **Stop & Shop** — Retail grocery app (720K+ monthly shoppers, 420+ stores)
5. **Michigan VR** — Virtual reality app
6. **Anthem** — Healthcare app
7. **InjoyGiving** — Donation/giving platform
8. **English Grammar** — Educational app
9. **iGenApps** — App generation platform
