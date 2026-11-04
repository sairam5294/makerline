# Ideas Bank: `docs/product/IDEAS.md`

One living file per product that remembers every idea, what you decided, and why, so the same idea isn't re-suggested and the kit learns what you actually build. Created by the first `product-opportunity-review` or `post-launch` run that produces ideas; kept by both.

## Layout (keep this order; ≤ 600 words above the archive)

1. **Scoreboard:** Month | Suggested | Accepted | Declined | Parked | Pending | Already doing, newest first, plus an all-time row.
2. **Waiting on you:** Pending ideas, oldest first, with days waiting. Over 45 days → "decide or close".
3. **Coming back this month:** Parked ideas whose revisit month has arrived.
4. **What your decisions tell us:** patterns with counts and IDs (e.g. "Declined 3 of 3 ideas that need paid APIs: 2611-02, 2612-01, 2612-04"), and what that changes this month.
5. **One table per month** (newest first), then `## Archive <YYYY>` when there are more than 12 months.

## Rows

`ID | Idea (one line + example) | Source | Advantage | Evidence | Effort | Decision | Decided on | Reason | Revisit | Result`

- **ID** = `YYMM-NN`, the month the idea was first suggested (`2611-03` = third idea of Nov 2026). IDs never change; other files cite them.
- **Source:** where it came from — review, teardown, user panel, post-launch metrics, a user request, look-ahead sweep, pattern library.
- **Advantage:** Parity / Differentiator / Leapfrog (scoring-rubric.md).
- **Evidence:** Guess / Some / Strong — from real sources only, never from the persona panel.
- **Decision** (yours): Pending · Accepted · Declined · Parked (set Revisit) · Already doing (fix how it was missed). Record your reason in your words. Never infer a decision from silence.
- **Result** (once built or tested): moved the metric / no effect / too early, with the number.

## Rules

- **Check before suggesting.** Search IDEAS.md (`rg`) and PLAN.md before calling anything new. A match that's planned → "Already planned: <task>"; a match that's declined or parked → apply the re-pitch rule.
- **Re-pitch rule.** A Declined or Parked idea comes back only as a new row with a new ID and the line "Re-pitch of <old ID>: what changed" (new evidence, new angle, or the reason no longer applies). Link both rows.
- **Learn, but don't just please yourself.** Use the decision patterns to frame and time ideas, not to hide hard truths: keep at least one idea per batch that challenges a past decline when evidence supports it. A high acceptance rate is not success; accepted ideas that moved the metric are.
- **Outcomes feed calibration.** When a result lands, add it to the kit's `portfolio/OUTCOMES.md` row for this product (post-launch step 6).
- Cite rows by ID elsewhere; don't copy idea text into other docs (context-budget rule: one home per fact).
