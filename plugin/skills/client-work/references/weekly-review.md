# Weekly review rhythm (teams, employers, several products)

One meeting, one card format, one log, so anyone can read anyone's work and nothing good is lost. Works for one person too (then it's your Monday 20 minutes).

## Before the meeting: suggestion cards (≤ 3 per product, by the day before)

Each card is an idea already in `docs/product/IDEAS.md` (so it has an ID, Advantage and Evidence). Write it under the idea's row, exactly in this shape (≤ 180 words):

```
**<ID> — <the suggestion in one line>**
Product: <name> · Presenter: <name> · Source: <teardown / user panel / audit / metrics / watch / request>
The problem: what goes wrong today for the running example user, in 2 lines.
The suggestion: what we'd build or change, with one concrete example in use.
Why now: the evidence (Guess / Some / Strong) and the dated signal behind it.
Value: low–high range, labelled estimate. Effort: S / M / L. Advantage: Parity / Differentiator / Leapfrog (novelty lines if Leapfrog).
Already planned or decided? the IDEAS.md or PLAN.md match, or "new".
Roadmap fit: where it slots in Now / Next / Later and what it replaces.
Cheap test first: 2–4 weeks, the pass mark.
User panel: n of m would use · top blocker · verdict.
Biggest risk: the one reason it fails (from the devils-advocate).
Ask for the room: Approve to test / Need input on X / Kill it.
```

Run the `devils-advocate` in short form on the set before the meeting and fix weak cards.

## The review log (`docs/product/REVIEW_LOG.md` per product, or one file per team; ≤ 12 months, then archive)

| Week of | Product | ID | Suggestion | Presenter | Verdict (Approved to test / Rework / Dropped) | Next step | Owner | Due | Status (Open / Done / Late) | Decision maker's decision |
|---|---|---|---|---|---|---|---|---|---|---|

Add the week's cards as rows before the meeting with the verdict blank.

## In the meeting (30 minutes)

1. **One-screen summary** generated from the log: last week's next steps (done / late), approved ideas waiting on the decision maker, decisions that came back, running totals per product (presented → approved → tested → shipped → moved the metric). Flag anything late by more than two weeks.
2. **Cards**, 5 minutes each: the presenter reads the card; the room gives a verdict and one next step with an owner and date.
3. **Decisions needed from leadership** collected into the next exec brief or stakeholder update.

## After the meeting (10 minutes)

Record verdicts and next steps in the log and in each idea's IDEAS.md row (Internal review, date). Approved ideas go into the next before-the-call note; when the decision maker answers, log it in both places with the source.

## Monthly: the shortlist test (optional, for teams with build capacity)

Pick the 3 most promising new ideas (at least one Leapfrog), give each a one-day prototype or scripted demo, judge with the anchored scores, the persona panel and a devils-advocate challenge, and move one winner to a 2–4 week test. Log all three with the reasons; it keeps "shipped and moved the metric" honest.

## Rules

- A card without an IDEAS.md ID isn't presented; a verdict without an owner and date isn't recorded.
- Approval rate is not the goal; tests that moved a metric are. Report both.
- Cards and the log are internal; the decision maker sees the exec-pack versions.
