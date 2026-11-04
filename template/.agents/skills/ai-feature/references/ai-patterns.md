# Where could AI help? Scanning workflows against seven patterns

Run this before you pick an AI feature, or inside a Deep `product-opportunity-review`. Take one module at a time. For each real workflow, note who does it, how often, the step count and the minutes. Then hold it against the patterns below. Most wins are quiet time-savers, not chat windows.

## The patterns, from least to most autonomy

Lower rows can go wrong unnoticed, so need more approval.

| Pattern | The job AI takes on | Finance-app example (illustrative) |
|---|---|---|
| **Guide** | Explains a screen or a product rule in the user's words | "Why doesn't my total match the bank statement?" |
| **Capture** | Turns a photo, PDF, email, SMS or voice note into fields | A bill photo becomes amount, payee and due date |
| **Sort** | Tags, groups, routes or de-duplicates records | A card payment at "SWGY*" filed under Food |
| **Draft** | Writes a first version the person edits and sends | A friendly nudge to a flatmate about rent |
| **Spot** | Notices something odd and raises it | A streaming plan that doubled in price |
| **Forecast** | Looks ahead and proposes a next step | "At this pace the grocery budget runs out on the 24th" |
| **Act** | Completes several steps from one request via the product's own API | "Move ₹5,000 to savings every payday", set up in one go |

Voice and chat are channels, not patterns: any row can be spoken or typed.

## Write down for every candidate

- **Where:** module, the workflow now (steps, minutes), pattern.
- **What changes:** what AI does, with one concrete example; the gain (minutes, revenue, retention) as a labelled estimate.
- **Inputs:** the data it needs, and whether the product holds it yet.
- **Exposure:** wrong answers, money moving, personal or health data. Name the person who approves anything that moves money or messages other people.
- **Economics:** cost per run against the gain.
- **The plain fix:** a better form, rule or template, and why AI still beats it.
- **Effort**, and whether PLAN.md or IDEAS.md has it already.

## Turn the list into decisions

| Check | Ask | What it tells you |
|---|---|---|
| **API readiness** | Could an agent run this today through the product's own endpoints? | Gaps are usually the first build. List each missing endpoint |
| **Data readiness** | Is the data clean, labelled and permitted for this purpose (consent, DPDP/GDPR)? | Without the data, it's research, not a feature |
| **Risk class** | Inform, suggest, act after approval, or act alone? Money, health, children or third parties? | Sets the approval step and the row in `ai-risk-register.md` |
| **Cost at scale** | tokens × price × runs per active user per month, against the gain | Some wins become losses at ten times the users |
| **Non-AI first** | Would a rule, template or better form deliver about 80%? | Then take it: cheaper, predictable, offline |

1. Score each 1–5 for value, data readiness and inverse risk. Rank on value × data you hold × low risk. On a tie, the plain fix wins.
2. Shortlist three. At Deep, prototype the top one to three before any spec.
3. Each pick becomes an `AI_FEATURE_<name>.md` through this skill's workflow; the rest go to IDEAS.md.

The same scan, aimed at the team behind the product, is `../../product-audit/references/ops-scan.md`.
