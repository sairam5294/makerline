# Blend, don't bolt on: re-planning a product that already has a plan

For `partial`, `delayed` and `live` products with an existing `PLAN.md`, task list or roadmap. New ideas never arrive as a separate wishlist beside the old plan: every planned item is reviewed, the time it frees is filled, and the result is one roadmap.

## 1. Label every planned item

Find the latest plan first (PLAN.md, STATUS, HANDOFF, issues, the last 30 commits). For each item record: status (done / in flight / not started) and three questions — does it move the goal, what evidence says users want it, what does it cost and what depends on it. Then one label with a one-line reason:

| Label | Meaning | Example (illustrative) |
|---|---|---|
| **Keep** | Stays where it is | Offline capture: 4 of 5 interviewees asked for it |
| **Trim** | Keep, but cut scope to free time | A full analytics screen when a weekly summary would do |
| **Move up** | Unblocks the goal; bring it forward | Data export that the first outside users can't trust you without |
| **Hold** | Pause until a named signal | Multi-currency until a user outside India signs up |
| **Drop** | Remove, reason kept in DECISIONS.md | A third login method nobody asked for |

Rules: in-flight work is Keep unless there's a strong reason (half-built work is sunk cost only if it can't be finished cheaply). Before Hold or Drop, check who asked for it and why (DECISIONS.md, issues). Sum the time freed by Trim / Hold / Drop (estimate) and fill it with the strongest new options and blocker fixes, so the total effort roughly stays inside the owner's hours (OWNER.md).

## 2. One roadmap: Now / Next / Later

| When | From the existing plan | Added from this review (IDEAS.md IDs) | Move on when (measurable) |
|---|---|---|---|
| Now (0–4 weeks) | Keep / Trim / Move up items | tests and fixes | e.g. 5 outside users finish setup |
| Next (1–3 months) | … | … | … |
| Later (3–6+ months) | … | bets | … |
| On hold | Hold items | | the signal that brings each back |

- Mark every row "existing" or "new". Include at least one Leapfrog item (scoring-rubric.md) somewhere; at Standard and Deep, one per horizon where a plausible one exists.
- **Weak demand evidence (the evidence gate) or Quick depth → a learning roadmap**, labelled *provisional*: Now = the tests, interviews and data requests; Next = build candidates that start only if named tests pass; Later = bets.
- Prerequisites first (including any API an AI idea needs).
- Write the table into REVIEW.json's `roadmap` field (review-data.md), which the HTML report renders; `plan-build` turns the Now row into tasks after the owner agrees. The owner decides the final order.
