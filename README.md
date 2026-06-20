# Vipin Vijayan Nair — Portfolio

A modern, professional portfolio website for a **Lead II Mobile Software Engineer & AI Engineer**. Built as a fully static site (HTML, CSS, vanilla JavaScript) — no build step required.

## Live Site

Once deployed, the site is available at: `https://<your-github-username>.github.io/<repo-name>/`

## Features

- **Modern dark theme** with gradient accents (indigo + cyan)
- **Responsive** — looks great on mobile, tablet, and desktop
- **Animated hero** with a 3D phone mockup and floating tech tags
- **Typed role effect** that cycles through Mobile Engineer / iOS & Android / AI Engineer (LLMs & RAG) / Tech Lead
- **Smooth scroll** navigation with active section highlighting
- **Scroll-triggered reveal animations** on every section
- **Accessible** — semantic HTML, ARIA labels, reduced-motion support
- **Fast** — single page, no frameworks, ~50KB total

## Sections

1. **Hero** — Name, role, key stats, animated phone mockup
2. **About** — Bio, location, AI engineering journey
3. **Skills** — 9 skill categories including a featured **AI Engineering** track (LLMs, RAG, LangGraph, MCP, Qdrant, Tavily, RAGAS, LangSmith, FastAPI)
4. **AI Engineering** — Featured AI projects: School Events Multi-Agent RAG (capstone), Vibe-Coded LLM Chat App
5. **Learning** — 14 modules of the AI Makerspace Bootcamp grouped into 4 tracks + capstone callout
6. **AI Certification** — Bootcamp certificate (image with lightbox preview)
7. **Experience** — Timeline of 5 roles at UST Global, Zayan, Schogini, etc.
8. **Projects** — Featured apps: ScanIT, Stop & Shop, Michigan VR, Anthem, InjoyGiving, English Grammar, iGenApps
9. **Contact** — Email, phone, LinkedIn, GitHub, Medium, HackerRank

> **Note:** The AI Certification section now highlights the **School Assistant** demo — an AI-powered parent assistant that searches school emails, local files, and the web using a multi-agent RAG workflow. Supporting notes live in `docs/school-assistant-demo.md`.

> **Note:** The certificate image lives at `certifications/ai-makerspace-cert.jpeg`.

## AI Engineering Highlights

- Completed the **AI Makerspace AI Engineering Bootcamp** (Fall 2025 cohort) — 14 modules covering prototyping, RAG, multi-agent systems, MCP, evaluation, and production deployment
- Built **School Events Multi-Agent RAG** as capstone: FastAPI + React + Qdrant + Tavily + LangGraph + Gmail MCP
- Deployed my first LLM-powered chat app to Vercel using Cursor-assisted development
- Coursework repo: <https://github.com/vipvijayan/learn_ai>
- Intro LLM app: <https://github.com/vipvijayan/The-AI-Engineer-Challenge>

## Project Structure

```
.
├── index.html                       # Main page (single-page site)
├── styles.css                       # All styles (Material 3 light + dark themes)
├── script.js                        # Navigation, scroll effects, typed effect
├── certifications/                  # Certificate images
├── docs/                            # Demo notes and supporting content
├── instructions.md                  # Original project brief
├── docs/                            # Demo notes and supporting content
├── Vipin_Resume.pdf                 # Resume (downloaded from the header button)
└── README.md                        # This file
```

## Local Preview

```bash
# Option 1: Python (built-in)
python3 -m http.server 8000

# Option 2: Node.js
npx http-server -p 8000
```

Then open <http://localhost:8000> in your browser.

## Deploy to GitHub Pages

1. **Create a new repository** on GitHub (e.g. `portfolio`).
2. **Push the code** to the `main` branch:
   ```bash
   git init
   git add .
   git commit -m "Initial portfolio site"
   git branch -M main
   git remote add origin https://github.com/<your-username>/portfolio.git
   git push -u origin main
   ```
3. **Enable GitHub Pages**:
   - Go to your repo → **Settings** → **Pages**
   - Source: **Deploy from a branch**
   - Branch: `main` / `(root)`
   - Click **Save**
4. Wait ~1 minute, then visit:
   `https://<your-username>.github.io/portfolio/`

### Custom Domain (Optional)

To use a custom domain, add a `CNAME` file in the repo root with your domain, then configure DNS per GitHub's docs.

## Customization

- **Colors**: edit the `--color-*` variables at the top of `styles.css`
- **Content**: edit `index.html` directly — content is all in plain HTML
- **Add a profile photo**: drop an image in the project and replace the phone mockup in `.hero__visual`
- **Add projects**: copy any `<article class="project-card">` block in the Projects section
- **Update AI skills**: edit the `<div class="skill-category skill-category--featured">` block in the Skills section
- **Update learning modules**: edit the `.learning__grid` section in `index.html`

## Browser Support

- Chrome / Edge / Firefox / Safari (latest 2 versions)
- iOS Safari 14+, Android Chrome 90+
- Graceful fallback for older browsers (no JS = no animations, content still readable)

## License

Personal portfolio — all rights reserved by Vipin Vijayan Nair.
