# Tech debt check (half-built, delayed and live products)

"How messy is it to finish?" changes the decision as much as demand does. A quick, evidence-based scan, not a code audit. Standard: 30 minutes, ≤ 8 files opened; Deep: add the build and tests run.

## Look (cite file paths and commands as `repo` sources)

| Signal | How to check |
|---|---|
| Does it build and pass? | the project's check command (`npm run check` or equivalent); count failures |
| Tests | how many exist, what they cover; core flows with no test |
| Stubs and TODOs | `rg -c "TODO\|FIXME\|notImplemented\|stub" -g '!node_modules'`, top folders |
| Dependencies | outdated majors and known vulnerabilities (`npm outdated`, `npm audit --omit=dev`) |
| Docs vs code | features the PRD or STATUS calls done that the code stubs |
| Hot spots | files changed most in the last 3 months (`git log --format= --name-only --since=3.months \| sort \| uniq -c \| sort -rn \| head`) |
| Security basics | secrets in the repo, RLS on every table, auth on every server function |

## Rate each finding

| Item | Impact on the goal (H/M/L) | Effort to fix (S/M/L) | Risk if left | Do when |
|---|---|---|---|---|

- **Fix now:** blocks the goal or risks users' data or money.
- **Fix with the feature:** pay it down inside the next task that touches that area.
- **Live with it:** low impact; write the reason in DECISIONS.md.

## Feed the decision

Add the total "make it shippable" effort (estimate range) to the review's options. Fix-now items go to the Now row of the blended roadmap (`roadmap-blend.md`); never hide debt inside a feature estimate. Plain words in the report: "about 2 weeks of fixes before new features are safe", not lint counts.
