# Real-project trials: which feature is proven on which product

A feature counts as **proven** only after a run on a real product that the owner acted on. Until then it stays "proposed" and is removed if nothing uses it by the next minor release. One row per feature; update the row, don't add new ones.

| Feature | Added | Real run | Product | Result and what changed | Status |
|---|---|---|---|---|---|
| Opportunity review (`product-opportunity-review`) | 0.15 | 2026-10-22, 2026-11-04 | Lekka, Trust Kit, RhythmBuddy, Tindi | decisions taken; roadmap field, tech debt, reuse added from friction | **proven** |
| Context index + pack | 0.15 | 2026-10-22 | Tindi, RhythmBuddy | 10/10 recovery | **proven** |
| Persona panel (`user-panel`) | 0.16 | 2026-11-04 | Lekka review; ai-todo eval | verdict "test with real users"; panel never raised evidence | proven in a review; **still to compare with real interviews** |
| Ideas Bank, roadmap blend, tech debt | 0.16–0.18 | 2026-11-04 | Lekka | IDEAS.md created; roadmap rendered; 4–8 days of debt found | **proven** |
| Advantage tag + Leapfrog warning | 0.16 | 2026-11-04 | Lekka, client-advisory eval | tagged; eval missed one, templates fixed | **proven** |
| client-work → product-audit → exec-pack | 0.18 | 2026-11-04 (planted case) | SlotEase (fictional) | 9/10; redaction bug found and fixed | eval-proven; **real run pending: ASI** |
| Switching playbook | 0.16 | — | Lekka (spreadsheet → app), ASI (old PMS → new) | — | **pending** |
| gtm-pack | 0.18 | 2026-11-04 | Lekka beta invite | see results.md | first real run |
| stakeholder-panel | 0.18 | 2026-11-04 | Lekka (partner as first decision maker) | see results.md | first real run |
| Industry Brain + brain_check | 0.16–0.19 | 2026-11-04 (built), scoring from 2027-01 | personal finance India | 3 theses open; first scoring due Q1 2027 | **pending scoring** |
| Weekly review rhythm | 0.19 | — | ASI product team | — | **pending** |
| Ops scan, account health | 0.19 | — | ASI (ops scan); any client engagement (account health) | — | **pending** |
| Agents: data-analyst, privacy-reviewer, research-synthesizer, pricing-analyst | 0.19 | — | Lekka post-launch (data, privacy before DPDP 2027), Lekka beta interviews (synthesis), Lekka pricing | — | **pending** |
| Connectors: PostHog, Sentry, Atlassian, Stripe, Intercom, Canva | 0.19 | — | PostHog + Sentry on Lekka; Atlassian on ASI | — | **pending sign-in check** |

## Schedule (proposed; the owner picks the order)

1. **Lekka, now → beta (Nov–Dec 2026):** switching playbook (spreadsheet → Lekka import), gtm-pack for the invite (done), stakeholder-panel (partner, done), privacy-reviewer before inviting outside households, PostHog + Sentry connectors, data-analyst on the first beta week, research-synthesizer on the first 5 couple interviews, pricing-analyst when the free beta ends.
2. **ASI (employer, hotel management; Dec 2026 →):** `client-work` intake from Atlassian, `product-audit` of one journey (reservation → check-in) including the ops scan, `exec-pack` brief for the product head, the weekly review rhythm with the team, switching playbook for hotels moving from the old PMS. Needs: ENGAGEMENT.md agreed with the employer about what may be read and shared.
3. **Cascaid (to confirm what it is):** once the owner says what Cascaid is and where it lives, slot it into the same path (idea → evaluate, or live → audit).
4. **Quarterly:** brain_check on the personal-finance Brain; score the first due theses in Q1 2027; quarterly evals.

Each run appends a row to `results.md` (tokens, calls, quality, what changed in the kit) and updates the Status column above.
