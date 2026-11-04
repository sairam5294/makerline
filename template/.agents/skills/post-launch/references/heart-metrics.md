# Measuring the product: HEART, the north star and DORA

## HEART (user-experience metrics)

Pick **one or two** categories per product; every category becomes a Goal → Signal → Metric row in `METRICS.md`. Don't track all five.

| Category | Question | Example goal → signal → metric (illustrative) |
|---|---|---|
| **Happiness** | Do people like it? | fewer frustrated users → in-app thumbs, store rating → % thumbs-up after a task; rating trend |
| **Engagement** | How often and how deeply? | logging becomes a habit → entries per active day → median entries / active user / week |
| **Adoption** | Do new people start? | invited households activate → first entry within 24 h → % of sign-ups with 3+ entries in week 1 |
| **Retention** | Do they come back? | both partners keep logging → active days → % of week-1 households active in week 4 |
| **Task success** | Can they do the job? | capture takes seconds → time from open to saved → median seconds; error / undo rate |

Rules: define the metric before building the screen; one metric per core flow; look at the trend, not one week; segment by platform and by new vs returning before acting.

## North star and inputs

One north-star metric (the value users get, not revenue), broken into 3–5 input metrics you can move this month (`docs/product/METRICS.md` tree). Guardrails: the metric that must not get worse (support tickets per user, crash-free %, cost per active user).

## Delivery health (DORA) — for employer, client and team work

| Metric | Elite / good benchmark | Where to read it |
|---|---|---|
| Deployment frequency | daily / weekly | hosting deploys, CI |
| Lead time for changes | < 1 day / < 1 week | PR opened → deployed |
| Change failure rate | < 15% | rollbacks, hotfixes, incidents / deploys |
| Time to restore | < 1 hour / < 1 day | incident log |

Use in `product-audit` to size "how messy is it to ship" with evidence, and in the business case when asking for engineering time.
