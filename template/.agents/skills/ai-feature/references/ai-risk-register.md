# AI risk register (one table per AI feature, ≤ 250 words)

Kept in `docs/product/AI_FEATURE_<name>.md` under "Risks". Short on purpose: it is read before every change to the feature and shown to buyers who ask "how do you manage AI risk". Maps to NIST AI RMF (Govern · Map · Measure · Manage) and ISO/IEC 42001 so an enterprise or employer reviewer recognises it.

## Header (Map)

Purpose in one line · users and who else is affected · data in and out (categories, never samples) · model and provider · autonomy level: **informs** / **suggests** / **acts with approval** / **acts alone** · markets and the duties that apply (EU AI Act transparency, DPDP, children).

## Table (Map → Measure → Manage)

| ID | Risk (who is harmed, how) | Likelihood | Impact | Control in place | How we measure it | Owner | Review by |
|---|---|---|---|---|---|---|---|
| AIR-01 | Wrong amount parsed → user records false expense | Medium | Medium | amount must appear verbatim in input; else Inbox | % entries corrected within 7 days (target < 3%) | owner | 2027-01 |

Always consider: wrong or made-up output · prompt or tool injection · leaking personal data to the provider or other users · bias against a group · over-reliance (users stop checking) · cost runaway · provider outage · content rights · children.

## Rules (Govern)

- Likelihood and impact are Low / Medium / High; anything High-High needs a control before launch or a decision logged in DECISIONS.md.
- Each control has a measure that the eval set or analytics actually produces; "we're careful" is not a control.
- Review dates: quarterly for features that act, half-yearly for ones that only inform; the register is re-read before any model, prompt or tool change.
- Incidents go to post-launch's when-it-breaks postmortem and update the row that failed.
- Client or employer version: same table, internal cost numbers removed (exec-pack redaction).
