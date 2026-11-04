---
name: start
description: Give me everything for my product idea. Covers discovery, evaluation, competitors, design direction with wireframes, draft PRD and one-pager in one go, or the next phase. Trigger with "/makerline-idea:start", "I have an idea", "start", "run everything", "give me everything for this idea", or "continue".
argument-hint: "<idea + 'everything' (add 'quick' or 'deep'), or nothing to resume>"
---

# /start

**Quick** ("quick", "worth a weekend?"): read only `../evaluate-idea/references/quick-run.md` and follow it — it is the whole Quick run in one file; don't open the orchestrator, the phase skills or the rest of this file.

Otherwise this is the short entry point: read `../idea-pack/SKILL.md` and follow it, choosing the mode from what the owner said.

## Usage

```
/start                                  # resume: read STATUS.md, say where the project is, offer the next step
/start <idea> — give me everything      # all phases in one go (add "deep" for more)
/start <idea> — quick                   # Quick: one guide (evaluate-idea/references/quick-run.md)
```

## Modes

| Owner says | Mode |
|---|---|
| an idea and "everything" (add "quick" or "deep" for depth) | run all phases in one go |
| nothing specific | read STATUS.md, say where the project is in one line and offer the next step. **No STATUS.md** → show: **Try it** — *Evaluate my idea honestly: …* · *Quick first look at an idea* · *Who are my competitors and my real differentiator?* · *Sketch wireframes for my idea* · *Write a draft PRD* — then "…or type `/makerline-idea:start` with your idea in any chat", and wait |

## Related

- Runs: `idea-pack` (the orchestrator) and, through it, every phase skill
