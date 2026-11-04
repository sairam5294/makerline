# Real-project trials: which feature is proven on which product

A feature counts as **proven** only after a run on a real product that the owner acted on. Until then it stays "proposed" and is removed if nothing uses it by the next minor release. One row per feature; update the row, don't add new ones.

| Feature | Added | Real run | Product | Result and what changed | Status |
|---|---|---|---|---|---|
| Opportunity review (`product-opportunity-review`) | 0.15 | 2026-10-22, 2026-11-04 | Lekka, Trust Kit, RhythmBuddy, Tindi | decisions taken; roadmap field, tech debt, reuse added from friction | **proven** |
| Context index + pack | 0.15 | 2026-10-22 | Tindi, RhythmBuddy | 10/10 recovery | **proven** |
| Persona panel (`user-panel`) | 0.16 | 2026-11-04 | Lekka review; ai-todo eval | verdict "test with real users"; panel never raised evidence | proven in a review; **still to compare with real interviews** |
| Idea Log, roadmap blend, tech debt | 0.16–0.18 | 2026-11-04 | Lekka | IDEAS.md created; roadmap rendered; 4–8 days of debt found | **proven** |
| Advantage tag + Leapfrog warning | 0.16 | 2026-11-04 | Lekka, client-advisory eval | tagged; eval missed one, templates fixed | **proven** |
| client-work → product-audit → exec-pack | 0.18 | 2026-11-04 (planted case; real intake) | SlotEase (fictional); three agency engagements (intake only; details stay in the owner's private workspace) | 9/10 on the eval; real intakes produced engagement files and day-one questions; template gaps fixed | intake proven; **audits pending the account owners' answers** |
| Switching playbook | 0.16 | — | Lekka (spreadsheet → app); an engagement migrating customers off a legacy product | — | **pending** |
| gtm-pack | 0.18 | 2026-11-04 | Lekka beta invite | invite + landing section written; 6 claims cut; verdict fix first; beta-invite channel added to the skill | first real run; **owner to send after fixes** |
| stakeholder-panel | 0.18 | 2026-11-04 | Lekka (partner as first decision maker) | too few Stated facts → produced 7 interview questions; "interview first" rule added | first real run; **owner to ask the questions** |
| Industry File + industry_check | 0.16–0.19 | 2026-11-04 (built), scoring from 2027-01 | personal finance India | 3 theses open; first scoring due Q1 2027 | **pending scoring** |
| Weekly review rhythm | 0.19 | — | an agency product team | — | **pending** |
| Ops scan, account health | 0.19 | — | the first audited engagement | — | **pending** |
| Agents: data-analyst, privacy-reviewer, research-synthesizer, pricing-analyst | 0.19 | — | Lekka post-launch (data, privacy before DPDP 2027), Lekka beta interviews (synthesis), Lekka pricing | — | **pending** |
| Connectors: PostHog, Sentry, Atlassian, Stripe, Intercom, Canva | 0.19 | — | PostHog + Sentry on Lekka; Atlassian on an agency engagement | — | **pending sign-in check** |

## Schedule (proposed; the owner picks the order)

1. **Lekka, now → beta (Nov–Dec 2026):** switching playbook (spreadsheet → Lekka import), gtm-pack for the invite (done), stakeholder-panel (partner, done), privacy-reviewer before inviting outside households, PostHog + Sentry connectors, data-analyst on the first beta week, research-synthesizer on the first 5 couple interviews, pricing-analyst when the free beta ends.
2. **Agency engagements (Dec 2026 →):** intake done for three on 2026-11-04 (ENGAGEMENT, INTAKE, QUESTIONS, FIRST-AUDIT, kept in the owner's private workspace). Next, per engagement: the first audit journey named in FIRST-AUDIT.md (one starts with a security-focused quality-review), the ops scan, an exec brief for the decision maker, the weekly review rhythm, and the switching playbook where customers move off a legacy product. Needs: each ENGAGEMENT.md agreed with the account owner about what may be read and shared.
3. Dormant or declined engagements are not scheduled.
4. **Quarterly:** industry_check on the personal-finance industry file; score the first due theses in Q1 2027; quarterly evals.

Each run appends a row to `results.md` (tokens, calls, quality, what changed in the kit) and updates the Status column above.
