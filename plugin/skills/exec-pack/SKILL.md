---
name: exec-pack
description: 'Leadership-ready outputs from the evidence: exec brief, decision memo, deck outline, business case, monthly note — internal and client versions with a redaction check.'
argument-hint: "<which output, for whom (role), and the decision they must make>"
disable-model-invocation: true
---

# /exec-pack

Turn MakerLine's evidence (AUDIT, REVIEW.json, EVALUATION, IDEAS, METRICS) into something a busy decision maker can say yes or no to. **Write from the files, never from memory**; every number keeps its source or "estimate" label.

## Pick the output

| Output | When | Template | Length |
|---|---|---|---|
| **Exec brief** | First read for a leader; "what's going on and what should we do?" | `templates/exec-brief.md` | 1 page (≤ 450 words) |
| **Decision memo** | One decision with options | `templates/decision-memo.md` | ≤ 700 words |
| **Deck** | A meeting | outline from the brief: ≤ 10 slides, one message each; build it with the tool's slides feature or the pptx skill | 6–10 slides |
| **Business case** | Asking for budget or time | `references/business-case.md` | ≤ 900 words |
| **Monthly note** | Ongoing engagement | what changed in the market and the product, decisions made, next month | ≤ 400 words |

## How to write it

1. **Answer first:** the recommendation and the decision needed in the first 3 lines; the evidence after.
2. **Their goal in their words** (ENGAGEMENT.md), and an honest status — never "ready" without live users.
3. One idea per section; tables over prose; plain words; each finding or option with a concrete example.
4. Options always include a non-build move (pricing, process, partner, stop) and "do nothing" with its cost.
5. Before a client-tier version: run the `devils-advocate` in **reader mode** and, for decisions, the `stakeholder-panel` (`docs/product/STAKEHOLDERS.md`); fix what they flag.

## Internal vs client versions (no second rewrite)

Write **one** source file. Wrap anything internal (costs and rates, margins, effort by person, your notes on people, retention concerns) in `<!-- internal -->` … `<!-- /internal -->`. Then:

```bash
python3 <skill>/scripts/redact_check.py make docs/product/exec/<file>.md          # writes <file>.client.md without internal blocks
python3 <skill>/scripts/redact_check.py check docs/product/exec/<file>.client.md  # fails on leftovers
```

`check` fails on: leftover internal markers, any **Do not mention** term from ENGAGEMENT.md, email addresses and phone numbers, and money next to words like margin, rate, salary or cost-to-us. Fix and re-run until it passes; only `*.client.md` files leave your workspace.

## Output

`docs/product/exec/<date>-<output>.md` (+ `.client.md`), sources listed at the end. Present in ≤ 6 lines: what it recommends, the decision asked, what was redacted, and the check result.
