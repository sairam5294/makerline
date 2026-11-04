---
name: start
description: 'Start or continue MakerLine: a new idea, the whole Idea Pack, setup after approval, or what''s next; routes every MakerLine job. Trigger: "start", "I have an idea", "continue", "set it all up".'
argument-hint: "<idea + 'everything' | 'set it all up' | 'build it' | nothing to resume>"
---

# /start

**Existing-product decision:** when the owner asks whether to keep investing in a half-built or delayed product, whether a product is ready to launch, or what to improve in a live product, run `../product-opportunity-review/SKILL.md`. This route takes priority over the word "quick". It produces an HTML decision report and reuses existing work.

**Quick new idea** ("quick", "worth a weekend?"): read only `../evaluate-idea/references/quick-run.md` and follow it — it is the whole Quick run in one file; don't open the orchestrator, the phase skills or the rest of this file.

Otherwise this is the short entry point to the kit's orchestrator: read `../product-kickoff/SKILL.md` and follow it exactly, choosing the mode from what the owner said.

## Usage

```
/start                                   # resume: read STATUS.md, say the phase, offer the next step
/start <idea> — give me everything       # full Idea Pack in one go (add "deep" for more)
/start <idea> — quick                    # Quick: one guide (evaluate-idea/references/quick-run.md)
/start set it all up                     # everything after approval, in one go
/start build it                          # plan-build, then one build-feature task per session
```

## Routes to the other skills

Ten MakerLine skills trigger on their own. The other sixteen stay out of every session's context to save tokens: run them by **reading their `SKILL.md` file** (not the Skill tool). The owner can still type any of them as `/makerline:<name>`.

| Owner asks for | Read |
|---|---|
| a brief / "interview me about my idea" | `../new-idea/SKILL.md` |
| names, logo, brand, colours | `../name-product/SKILL.md` |
| which stack / framework, costs | `../tech-stack/SKILL.md` |
| tokens, theme, component list | `../design-system/SKILL.md` |
| architecture, database, project rules docs | `../engineering-docs/SKILL.md` |
| repo setup, README, AI tool rules | `../project-setup/SKILL.md` |
| break into tasks, "what do we build first?" | `../plan-build/SKILL.md` |
| an AI feature | `../ai-feature/SKILL.md` |
| does it match the design? handoff spec | `../design-qa/SKILL.md` |
| test plan, write tests | `../test-plan/SKILL.md` |
| launch / release / store submission | `../ship-checklist/SKILL.md` |
| all my projects, which next, kit activity | `../portfolio/SKILL.md` |
| which AI tool for which job, hitting limits | `../tool-plan/SKILL.md` |
| which rules apply, definition of done | `../product-standards/SKILL.md` |
| are the kit's standards current? | `../standards-refresh/SKILL.md` |
| the whole pack or the whole setup | `../product-kickoff/SKILL.md` |

## Modes

| Owner says | Mode |
|---|---|
| a new idea + "quick" | `../evaluate-idea/references/quick-run.md`: brief → evaluation → one-pager |
| a new idea + "everything" / "all of it" / "the whole pack" (add "deep" for depth) | full Idea Pack in one go: 1 → 2 → 2a → 2b → one-pager |
| "set it all up" / "everything after approval" (STATUS must say APPROVED) | tool-plan → name + brand → stack → design system → full PRD → engineering docs → project setup |
| "build it" / "next task" | plan-build, then one build-feature task per session |
| half-built, delayed, near-launch, or live product decision | `../product-opportunity-review/SKILL.md` and its stage-aware route |
| nothing specific | read STATUS.md, say the current phase in one line, and offer the next step with the one-go option. **No STATUS.md** → show the *Try it* menu below and stop |

## Try it menu (no project yet)

Show exactly this, then wait:

**Try it**
- Evaluate my idea honestly: *a booking app for small physio clinics*
- Give me a quick first look at an idea (about 15 minutes)
- Who are my competitors, and what's my real differentiator?
- Should I keep building this half-built app, launch it, or stop?
- Find where AI could genuinely help my product
- What should I improve next in my live app?

…or type `/makerline:start` with your idea in any chat.

## Rules

- Never write `Evaluation: APPROVED` yourself; the owner approves between the Idea Pack and setup.
- Everything else (depth, gate, checks) lives in `../product-kickoff/SKILL.md`; the owner-unavailable path is kickoff step 8 plus `../new-idea/SKILL.md` → Owner unavailable (Quick: quick-run.md step 3 only) — don't improvise.

## Related

- Runs: `product-kickoff` (the orchestrator) and, through it, every phase skill
