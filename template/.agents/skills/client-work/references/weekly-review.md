# Weekly review rhythm (teams, employers, several products)

One meeting, one card format and one log, so anyone can follow anyone's work and good ideas aren't lost. Solo owners use it too, as 20 minutes on Monday.

## Rules

- No IDEAS.md ID, no presentation. No owner and date, no recorded verdict.
- The goal isn't a high approval rate; it's tests that moved a metric. Report both numbers.
- Cards and the log stay internal. The decision maker gets the exec-pack versions.

## 1. Proposal cards (≤ 3 per product, ready the day before)

A card only exists for an idea that already has a row in `docs/product/IDEAS.md`, so it carries an ID, Advantage and Evidence. Write it beneath that row in exactly this shape (≤ 180 words):

```
**<ID> — <one-line suggestion>**
Product: <name> · Presenter: <name> · Source: <teardown / user panel / audit / metrics / watch / request>
Problem: two lines on how today goes wrong for the running example user.
Proposal: the build or change, shown with one concrete example.
Why now: evidence (Guess / Some / Strong) and the dated signal behind it.
Advantage: Parity / Differentiator / Leapfrog (novelty lines if Leapfrog). Size: S / M / L effort. Value: estimated low–high range.
Already planned or decided? the matching IDEAS.md or PLAN.md entry, or "new".
Roadmap fit: its slot in Now / Next / Later and what it displaces.
Cheap test first: a 2–4 week test and its pass mark.
Panel: n of m would use it · main blocker · verdict.
Biggest risk: the single most likely reason it fails (from the devils-advocate).
Ask for the room: Approve to test / Need input on X / Kill it.
```

Before the meeting, run a short `devils-advocate` pass over the whole set and repair weak cards.

## 2. The review log (`docs/product/REVIEW_LOG.md` per product, or one per team; keep 12 months, then archive)

| Week of | Product | ID | Suggestion | Presenter | Verdict (Approved to test / Rework / Dropped) | Next step | Owner | Due | Status (Open / Done / Late) | Decision maker's decision |
|---|---|---|---|---|---|---|---|---|---|---|

Enter this week's cards as rows ahead of the meeting, verdict left empty.

## 3. The meeting (30 minutes)

1. **Summary on one screen**, built from the log: last week's next steps (done or late), approved ideas the decision maker hasn't answered, decisions that came back, and per-product totals (presented → approved → tested → shipped → moved the metric). Flag anything more than two weeks late.
2. **Cards**, 5 minutes each. The presenter reads; the room sets a verdict and one next step with an owner and a date.
3. **Leadership decisions**: gather what needs their call for the next exec brief or stakeholder update.

Afterwards (10 minutes), write verdicts and next steps into the log and into each idea's IDEAS.md row (Internal review, date). Approved ideas go into the next before-the-call note. When the decision maker replies, record it in both places with its source.

## 4. Once a month: shortlist test (optional, needs build capacity)

Choose the 3 strongest new ideas, at least one a Leapfrog. Give each a one-day prototype or scripted demo, then judge with the anchored scores, the persona panel and a devils-advocate challenge. The winner moves to a 2–4 week trial. Record all three with reasons; it keeps the "shipped and moved the metric" count honest.
