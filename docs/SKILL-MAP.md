# What to say → what runs

MakerLine has 30 skills and 20 agents, but you only need to remember one command: `/makerline:start` (or `/makerline:client-work` for someone else's product). Say what you want in plain words and it routes. This page is the map behind that, for when you want a specific skill directly.

## By stage

| You say | Runs | Produces |
|---|---|---|
| "I have an idea…" / "interview me" | `new-idea` | PROJECT_BRIEF, CLARITY |
| "evaluate my idea" / "is this worth building?" / "competitors?" | `evaluate-idea` (+ market-researcher, devils-advocate, idea-champion, accessibility-strategist, user-panel) | EVALUATION, COMPETITORS (+ teardown) |
| "validate" / "interview users" / "here are my notes" | `validate-idea` (+ research-synthesizer) | VALIDATION, VALIDATION_RESULTS, OPPORTUNITIES |
| "wireframes" / "what would it look like" | `design-direction` (+ user-panel walk-through) | DESIGN_DIRECTION, design/wireframes |
| "PRD" / "spec" / "user stories" | `write-prd` | PRD |
| "name" / "brand" / "logo" | `name-product` | NAMING, BRAND |
| "which stack" | `tech-stack` (+ architect) | TECH_STACK |
| "design system" / "tokens" | `design-system` | DESIGN_SYSTEM, tokens.json |
| "engineering docs" / "architecture" | `engineering-docs` | docs/ARCHITECTURE … LIFECYCLE |
| "set up the repo" / "README" / "cursor rules" | `project-setup` | README, SETUP, STRUCTURE, GITHUB, AI-tool rules |
| "plan the build" / "break into tasks" | `plan-build` | PLAN (blended into an existing plan if there is one) |
| "build" / "next task" / "it's broken" / "debug" | `build-feature` (+ web/mobile/backend developers; debug mode) | code, tests, PR |
| "does it match the design" / "handoff spec" | `design-qa` | specs/<screen>.md, fixes |
| "review" / "before I merge" | `quality-review` (+ code, security, privacy, accessibility, UX reviewers) | reviews/<date>.md |
| "test plan" / "write tests" | `test-plan` (+ qa-engineer) | TEST_PLAN |
| "add AI" / "use an LLM" | `ai-feature` (+ ai-patterns scan, risk register) | AI_FEATURE_<name> |
| "ship" / "launch" / "store submission" | `ship-checklist` | RELEASE |
| "how is it doing" / "retro" / "it's down" | `post-launch` (+ data-analyst; when-it-breaks) | METRICS, LESSONS, IDEAS, incident notes |
| "keep building or stop?" / "what to improve next" | `product-opportunity-review` (+ tech-debt, roadmap, user-panel, devils-advocate) | REVIEW.json, index.html, IDEAS |
| "handoff" / "status update" / "hand over to their team" | `handoff` | HANDOFF, stakeholder update, handover pack |
| "my projects" / "which next" | `portfolio` (+ Industry Files, patterns, kit activity) | portfolio/index.html |
| "which tool for which job" | `tool-plan` | TOOL_PLAN |
| "which rules apply" / "are the standards current" | `product-standards`, `standards-refresh` | — / VERSIONS |

## Working on a client's or employer's product

| You say | Runs | Produces |
|---|---|---|
| "for my client" / "our app at work" | `client-work` (+ intake, weekly review, account health) | ENGAGEMENT, INTAKE, question list |
| "audit this product" / "how good is it" | `product-audit` (+ ux-reviewer, accessibility-auditor, privacy-reviewer, data-analyst; ops scan) | AUDIT |
| "brief for my PM" / "decision memo" / "business case" / "action plan" | `exec-pack` (+ stakeholder-panel, devils-advocate reader mode, redaction check) | exec/*.md and *.client.md |
| "launch copy" / "store listing" / "ads" / "positioning" | `gtm-pack` (+ pricing-analyst, user-panel message test) | gtm/MESSAGING, LAUNCH, ASSETS |
| "rehearse the meeting" / "how will they react" | `stakeholder-panel` | changes before sending, prepared answers |

## Agents (never called directly; skills pick them)

`readonly: true` in an agent file makes its Codex copy run in a read-only sandbox. Claude Code doesn't read that field: reviewer agents there are read-only by instruction, not by permission.

Research and judgement: market-researcher · pricing-analyst · data-analyst · research-synthesizer · devils-advocate · idea-champion · product-strategist · user-panel · stakeholder-panel. Reviewers: ux-reviewer · accessibility-auditor · accessibility-strategist · security-reviewer · privacy-reviewer · code-reviewer · qa-engineer. Builders: architect · web-developer · mobile-developer · backend-developer.

## Where the knowledge lives

- `docs/product/` in each project: the product's own files.
- `portfolio/industries/<industry>.md` in the kit: one Industry File per industry (`industry_check.py` keeps it honest); `portfolio/PATTERNS.md`; `portfolio/OUTCOMES.md`.
- `plugin/skills/product-standards/references/`: the standards every skill cites; `VERSIONS.md` says when each was last checked.
