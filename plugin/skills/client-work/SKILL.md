---
name: client-work
description: 'Work on a client''s or employer''s product: set up the engagement, intake their material, audit, advise leadership, keep clients apart. Trigger: "for my client", "our app at work".'
argument-hint: "<client or employer, product, the decision they need, or nothing to resume>"
---

# /client-work

MakerLine assumes the owner decides. Here **someone else decides** — a client, a manager, a founder — and some outputs leave your workspace. This skill sets that up once, then routes to the right MakerLine skill. Same honesty, budgets and standards as the rest of the kit.

## 1. Engagement file (once, ≤ 60 lines)

No `docs/product/ENGAGEMENT.md` → copy `templates/ENGAGEMENT.md` and fill what you can from the request; ask only for the decision maker, the goal and what may be shared. Every later skill reads it **once per session**.

- **Goal in their words**, marked *proposed* until a named person confirms it (quote and date in DECISIONS.md).
- **Approval gate:** STATUS `Evaluation: APPROVED (by <role/name>, <date>)` only after that person says so — never on your own say-so and never inferred from silence.
- **Sharing tier** for every output: `internal` (you only) · `team` (your colleagues) · `client` (leaves your workspace). External outputs go through the redaction check (exec-pack).

**Your own role is unclear?** (You were added to an engagement without a brief.) Fill only the Who, Product and Regulated data rows, then ask whoever added you three things: who decides on this product (client and agency side), what your role and limits are, and what the client has said they want this year; after that, `references/intake.md` §3 for the rest; don't audit or advise until a decision maker and a goal exist.

## 2. Intake before analysis

Follow `references/intake.md`: read what they already have (docs, tickets, chat, designs, analytics) through connectors or files they give you, write *what we know / what we assume / what to ask*, and send the question list on day one. Save their answers word for word.

## 3. Route

| They need | Run |
|---|---|
| "How good is our live product?" / UX, accessibility, performance review | `../product-audit/SKILL.md` |
| "What should we do next?" / roadmap, invest or stop | `../product-opportunity-review/SKILL.md` (stage from the audit) |
| A brief, decision memo, deck, business case or monthly note for leadership | `../exec-pack/SKILL.md` |
| Positioning, launch, store listing, landing page, ads, posts | `../gtm-pack/SKILL.md` |
| Rehearse a meeting or predict pushback | `stakeholder-panel` agent (cards in `docs/product/STAKEHOLDERS.md`) |
| Users' reactions to an idea or screen | `user-panel` agent (`../validate-idea/references/persona-panel.md`) |
| A new feature to spec or build | the normal phases through `/makerline:start`, with ENGAGEMENT.md as the owner file |
| Wrap up, weekly update, or hand over to their team | `../handoff/SKILL.md` (stakeholder update; handover pack) |
| A team that pitches weekly, or several products | `references/weekly-review.md` (proposal cards, review log, monthly shortlist) |
| The client seems to be drifting away | `references/account-health.md` (internal only) |
| A first conversation about money, tiers or price | `pricing-analyst` agent |

## 4. Keep clients apart (MUST)

- One workspace (folder or repo) per client or employer. Never read, quote or reuse another engagement's files, personas, numbers or names — not even "anonymised" — unless the owner explicitly moves a lesson into the kit's `portfolio/PATTERNS.md` with names removed.
- `ENGAGEMENT.md` lists **Do not mention** terms (other clients, codenames, internal rates); the redaction check fails on them.
- Confidential material stays in `internal` docs; cite it by type, date and role, never paste it into client-tier outputs.

## Output

`docs/product/ENGAGEMENT.md`, `docs/product/INTAKE.md`, the client question list, then whatever the routed skill produces. Present in ≤ 8 lines: the goal (proposed/confirmed), the decision maker, the first thing you'll deliver and when, and the questions you're waiting on.
