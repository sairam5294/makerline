# Intake: learn their product before advising on it

Goal: in one pass, know what they already know, without re-asking it. Budget: Standard ≤ 15 items opened across connectors and files, ≤ 6 web page reads; Deep adds a 30-minute walkthrough with their product or ops lead.

## 0. Facts already in hand

If someone already gathered facts (a colleague's notes, an earlier session's file), start from that file: cite each fact as `(internal, <file>, <date>)`, for example `(internal, facts.md, 2026-11-04)`, and search connectors only for what it lacks. Word budgets count tables. Never re-ask what it answers.

## 1. Read what exists (search first, ask second)

| Source | Look for | Connector |
|---|---|---|
| Docs | strategy decks, PRDs, research reports, roadmaps, contracts/SOW | `~~cloud storage`, `~~knowledge base` |
| Tickets | open, blocked and most-requested items; bug themes | `~~project tracker` |
| Chat | decisions and reprioritisations in named channels | `~~chat` |
| Designs | designed-but-not-built screens; research boards (affinity maps, survey results) | `~~design` |
| Analytics | activation, retention, funnel drop-offs | `~~product analytics` |
| Code | what's real vs stubbed (`../../product-opportunity-review/references/tech-debt.md`) | `~~source control` |
| Public | their site, store listing, reviews, job ads | web |

Context sweep rules apply (`../../../CONNECTORS.md`): search by product name, open only matches, cite by type/date/role, no personal data.

## 2. Write `docs/product/INTAKE.md` (≤ 600 words, tier: team)

- **What we know** — facts with source labels (evidence / reported / first-party / estimate) and IDs into `research/`.
- **What we assume** — each with how to check it and what it would change.
- **Designed vs built vs planned** — one table by module, with a *Defects seen* column (teams often log defects as labelled subtasks, not Bug issues, so count labels, not issue types).
- **Their current roadmap** — latest version and where it lives (feeds roadmap-blend).
- **Gaps** — what's missing and what it blocks.

## 3. Day-one question list (send before the long analysis)

Only what's needed to judge value: the goal and how they measure it, live and paying users, why users haven't adopted or why they leave, who they lose deals to, revenue streams, what's already planned or ruled out, analytics access, and introductions to 5–8 users. No questions about features or delivery status. ≤ 10 questions, each with why it matters.

When answers come back, save them word for word in `docs/product/research/client-answers-<date>.md` (question · answer · what it changes), mark the goal confirmed by the named person, and turn unclear answers into open questions.
