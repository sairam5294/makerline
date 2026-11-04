# Idea Log: `docs/product/IDEAS.md`

One living file per product: every idea, your decision and why, so nothing is suggested twice and the kit learns what you really build. The first `product-opportunity-review` or `post-launch` run with ideas creates it; both keep it.

## Columns (one row per idea)

`ID | Idea (one line + example) | Source | Advantage | Evidence | Effort | Decision | Decided by (role) | Decided on | Decision source | Reason | Revisit | Result`

- **ID**: `YYMM-NN`, from the month the idea first came up (`2611-03` = third idea of Nov 2026). IDs are permanent; other files cite them.
- **Source**: review, teardown, user panel, post-launch metrics, a user request, look-ahead sweep, Cross-industry patterns.
- **Advantage**: Parity / Differentiator / Leapfrog (scoring-rubric.md).
- **Evidence**: Guess / Some / Strong. Only real sources count; the persona panel never does.
- **Decision** is yours: Pending · Accepted · Declined · Parked (fill in Revisit) · Already doing (and fix why it was missed). Write the reason as the decider put it.
- **Client or employer work**: Decided by holds their role. Any decision other than Pending needs a Decision source (meeting notes, email, "told by <role> on <date>"). Silence is never a decision.
- **Result**, after it is built or tested: moved the metric / no effect / too early, with the number.

## How the file is laid out (this order; ≤ 600 words above the archive)

1. **Scoreboard**: a row per month, newest on top, plus an all-time row: Month | Suggested | Pending | Accepted | Declined | Parked | Already doing.
2. **Waiting on you**: Pending ideas, oldest on top, with days waited. Past 45 days → "decide or close".
3. **Due for a second look**: Parked ideas that have reached their Revisit month.
4. **What your decisions tell us**: patterns, with counts and IDs, and what they change this month. Example: "Declined 3 of 3 ideas that need paid APIs: 2611-02, 2612-01, 2612-04".
5. **Monthly tables**, newest first. Past 12 months, older ones move under `## Archive <YYYY>`.

## Rules

- **Search before you suggest.** `rg` IDEAS.md and PLAN.md before calling anything new. Already in the plan → "Already planned: <task>". Declined or Parked → re-pitch rule.
- **Re-pitch rule.** A Declined or Parked idea returns only as a fresh row with a new ID, saying "Re-pitch of <old ID>: what changed": new evidence, a new angle, or the old reason no longer holds. Link the two rows.
- **Learn from decisions without flattering them.** Patterns shape how and when ideas are framed, never which hard truths get said. When evidence backs it, each batch keeps one idea that questions an earlier decline. Success is accepted ideas that moved the metric, not a high acceptance rate.
- **Results feed calibration.** Add each result to this product's row in the kit's `portfolio/OUTCOMES.md` (post-launch step 6).
- Elsewhere, cite ideas by ID and don't repeat their text (context-budget rule: one home per fact).
