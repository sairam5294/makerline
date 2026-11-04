# Where could AI help? A workflow scan with seven patterns

Use before choosing an AI feature, or in a Deep `product-opportunity-review`. Go module by module through the product's real workflows (who does it, how often, how many steps, how long) and check each against the seven patterns. Most good findings are boring time-savers, not chatbots.

| Pattern | What AI does | Example (illustrative: a personal finance app) |
|---|---|---|
| **Do it for me** (agent) | Carries out a multi-step task from one instruction, through the app's own APIs | "Split last night's dinner bill with Ravi and remind him Friday" |
| **Answer and explain** | Answers how-to and policy questions inside the product | "Why is this month's total different from my bank's?" |
| **Read and fill** | Pulls data out of photos, PDFs, emails, SMS into forms | Snap a receipt → amount, shop, category filled in |
| **Predict and suggest** | Forecasts and recommends an action | "You usually overspend on food in the last week; ₹2,400 left" |
| **Write for me** | Drafts text a person approves | A polite payment reminder to a friend |
| **Watch and alert** | Spots unusual patterns and flags them | A subscription price went up; a duplicate charge |
| **Talk** | Voice or chat with the end user | Log an expense by voice while driving |

## For each opportunity, record

Module · workflow today (steps, time) · pattern · what AI does, with an example · value (time saved, revenue, retention; labelled estimate) · **data needed and whether the product already has it** · risk (wrong answers, money movement, personal or health data) and the **human approval step** for anything that moves money or speaks to other people · **running cost per use** vs value · **the non-AI alternative** (a better form, a rule, a template) and why AI beats it · effort · already in PLAN.md or IDEAS.md?

## Readiness and scoring (so the scan ends in decisions, not a list)

| Check | Question | Why |
|---|---|---|
| **API readiness** | Can an agent do this through the product's own APIs today? | Missing endpoints are usually the real first build; list them |
| **Data readiness** | Is the data clean, labelled and allowed for this use (consent, DPDP/GDPR)? | A pattern without its data is a research project |
| **Risk class** | Does it inform, suggest, act with approval, or act alone? Money, health, children or other people involved? | Sets the approval step and the risk register (`ai-risk-register.md`) |
| **Cost at scale** | tokens × price × uses per active user per month, vs the value | Some "wins" lose money at 10× users |
| **Non-AI first** | Would a rule, template or better form get 80% of the value? | Cheaper, predictable, offline |

Score each opportunity 1–5 on value, data readiness and inverse risk; shortlist the top 3; each becomes an `AI_FEATURE_<name>.md` through this skill. The same scan runs on the company's own operations in `../../product-audit/references/ops-scan.md`.

## Rules

- **AI-readiness:** an agent can only do what the product's APIs allow. List which workflows have the APIs an agent needs; missing APIs are often the real first build.
- The non-AI fix wins ties: cheaper, predictable, works offline.
- Rank by value × data you already have × low risk. Prototype the top 1–3 (Deep) before spec'ing any of them with the rest of this skill.
- Every chosen opportunity becomes an `AI_FEATURE_<name>.md` through this skill's workflow; the rest go to IDEAS.md.
