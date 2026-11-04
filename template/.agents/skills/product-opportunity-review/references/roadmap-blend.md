# Blend, don't bolt on: re-planning a product that already has a plan

For `partial`, `delayed` and `live` products that already have a `PLAN.md`, task list or roadmap. New ideas never sit in a wishlist beside the old plan: each planned item is reviewed, freed time is refilled, and one roadmap comes out.

## 1. Review the existing plan, item by item

Start from the newest plan (PLAN.md, STATUS, HANDOFF, issues, the last 30 commits). For each item note its status (done / in flight / not started), then ask: does it move the goal, what evidence shows users want it, how much effort is it and what waits on it? Give it one label and a one-line reason.

| Label | Meaning | Example (illustrative) |
|---|---|---|
| **Keep** | Stays where it is | Offline capture: 4 of 5 interviewees asked for it |
| **Trim** | Stays, with less scope, to free time | A full analytics screen when a weekly summary would do |
| **Move up** | Unblocks the goal, so it comes sooner | Data export that the first outside users can't trust you without |
| **Hold** | Paused until a named signal | Multi-currency until a user outside India signs up |
| **Drop** | Removed; the reason goes in DECISIONS.md | A third login method nobody asked for |

Work in flight is Keep without a strong reason (half-built work is sunk cost only when finishing it is expensive). Before any Hold or Drop, find who requested it and why (DECISIONS.md, issues). Estimate the hours Trim, Hold and Drop release and spend them on the best new options and blocker fixes, so total effort stays near the owner's hours (OWNER.md).

## 2. Write one roadmap: Now / Next / Later

| When | From the existing plan | Added from this review (IDEAS.md IDs) | Move on when (measurable) |
|---|---|---|---|
| Now (0–4 weeks) | Keep / Trim / Move up items | tests and fixes | e.g. 5 outside users finish setup |
| Next (1–3 months) | … | … | … |
| Later (3–6+ months) | … | bets | … |
| On hold | Hold items | | what would bring each one back |

- Tag every row "existing" or "new".
- At least one Leapfrog item (scoring-rubric.md); at Standard and Deep, one per horizon where a believable one exists.
- Prerequisites go first, including any API an AI idea depends on.

**Weak demand evidence (fails the evidence gate) or Quick depth** → a *provisional* learning roadmap: Now = the checks to run (tests, user interviews, data requests); Next = features gated on a named test passing; Later = bets.

Put the table in REVIEW.json's `roadmap` field (review-data.md); the HTML report draws it. Once the owner agrees, `plan-build` turns the Now row into tasks. The final order is the owner's call.
