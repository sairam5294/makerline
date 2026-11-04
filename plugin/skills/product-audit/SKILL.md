---
name: product-audit
description: 'Audit a live product (URLs, screens or a build): UX heuristics, accessibility and law, performance, copy, funnel, competitor gaps; findings by severity and business impact → AUDIT.md.'
argument-hint: "<URLs or screens, the main user journeys, launch markets, depth>"
disable-model-invocation: true
---

# /product-audit

Judge a product that already exists — yours, a client's or your employer's — the way a senior product designer would, with evidence for every finding. Read-only: never sign up with real data, submit forms that contact people, or change anything.

## Inputs

- `docs/product/ENGAGEMENT.md` (client work) or STATUS/brief; the 2–4 **core journeys** to walk (e.g. sign up → first value; search → book → pay). Ask only if none can be inferred.
- Access: public URLs, a staging login the owner sets up themselves, screenshots, a Figma file, or the repo.
- Depth: **Quick** (1 journey, heuristics + automated accessibility only, ≤ 3 page reads) · **Standard** (2–3 journeys, all lenses below) · **Deep** (+ assistive-tech walk-through, competitor journeys, analytics funnel).

## Lenses (use the kit's standards; don't restate them)

| Lens | Method | Standard file |
|---|---|---|
| Usability | Walk each journey; heuristics (visibility, match, control, consistency, error prevention, recognition, efficiency, minimalism, recovery, help); count steps and decisions to first value | `../product-standards/references/ux.md` |
| Accessibility | Automated scan (axe/Lighthouse) + manual keyboard, focus, contrast, zoom 200%, screen-reader spot checks; WCAG 2.2 AA; the launch markets' law | `accessibility.md`, `accessibility-law-summary.md` |
| Performance | Lighthouse / Core Web Vitals or app start time on a mid-range device | `performance.md` |
| Content | Microcopy against `../design-direction/references/ux-copy-checklist.md` | — |
| Trust and privacy | Consent, permissions, data asks vs need, privacy policy match | `privacy.md` |
| Funnel (if analytics) | Drop-off per journey step; where the biggest loss is | — |
| Operations (Standard: from what you can see; Deep: with their data and a walkthrough) | The company behind the product: support, onboarding, sales, billing (`references/ops-scan.md`) | — |
| Delivery health | DORA metrics from deploys and incidents (`../post-launch/references/heart-metrics.md`) | — |
| Competitors (Deep) | The same journey in 1–2 leaders: steps, time, patterns worth learning | `../evaluate-idea/references/teardown.md` |

Run the `ux-reviewer`, `accessibility-auditor`, `privacy-reviewer` and (with analytics) `data-analyst` agents in parallel where subagents exist (fast model, ≤ 300-word replies); otherwise play them inline.

## Findings → `docs/product/AUDIT.md` (Standard ≤ 1,800 words; tables)

1. **Summary** (≤ 8 lines): overall health per lens (good / needs work / at risk), the 3 findings that matter most, and the cheapest high-impact fix.
2. **Findings table:** `ID (AU-xx) | Journey/screen | Finding | Evidence (screenshot ref, metric, WCAG SC) | Severity | Business impact | Fix | Effort S/M/L`
   - **Severity:** Blocker (users can't complete the journey, or a legal accessibility failure) · Major · Minor.
   - **Business impact:** which metric it hurts and how (labelled estimate), e.g. "≈15% of sign-ups stall here (analytics)".
3. **What works** — keep and protect.
4. **Quick wins** (S effort, Major+) vs **projects**.
5. Feed the next step: findings become options in `product-opportunity-review` or rows in IDEAS.md (Source "Audit"); client-facing summary through `exec-pack`.

Never call a product compliant: say "no failures found in what was tested" and list what wasn't tested. Screenshots of the client's product stay in `team` tier unless they allow sharing.
