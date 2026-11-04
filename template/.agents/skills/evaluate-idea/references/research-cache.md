# Research cache format — docs/product/research/<topic>.md

Save research once, reuse it across refinement rounds, tools and phases (tech-stack, PRD, post-launch).

```
# <topic>  (e.g. competitors, market-size, pricing, regulations)
| ID | Date checked | Fact | Source URL | Type (evidence/estimate) |
|---|---|---|---|---|
| R1 | 2026-09-28 | Kutuki charges ₹399/month | https://… | evidence |
```
**Type** is one of: **evidence** (a primary or company source: official register, filing, standard, pricing page, changelog, help article) · **reported** (press, analyst, vendor claim, review sites — a theme needs 2+ mentions) · **first-party** (your own interviews, tests, users; role only, never names) · **estimate** (your maths, with inputs) · **thesis** (a dated prediction; see the Industry File). Add `unverified` to a row until someone has opened the source and checked date and claim; unverified rows never reach a public document.

Rules: one fact per row · IDs run R1, R2… across all research files and are what other documents cite · always a URL · re-check facts older than 30 days before relying on them · never store personal data.
