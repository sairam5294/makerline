# Debug mode: "it's broken"

For when something that worked stops working, or a build fails, and the owner can't read the code. Goal: **a proven fix, not a guess**. Same branch and checks rules as the rest of this skill.

## 1. Write down the symptom (before touching code)

In `docs/product/HANDOFF.md` under *Gotchas*, or the issue: what you expected · what happened · exact error text or screenshot · where (device, browser, local or deployed) · since when · what changed just before (`git log --oneline -10`). Ask the owner only for what you can't see yourself.

## 2. Reproduce

Make it fail on purpose, smallest way first: one command, one test, one URL. No reproduction → collect more evidence (logs below) and say so; don't change code blind.

| Where | Look at |
|---|---|
| Build / tests | the first error in the output, not the last |
| Web app | browser console and network tab; the deployed host's runtime logs (`~~hosting`) |
| Mobile app | Metro / device logs; the error-tracking issue (`~~monitoring`) |
| Database | the failing query or policy; RLS denials show as empty results, not errors |
| Since a deploy | compare with the last good deploy or commit (`git bisect` for anything older than a few commits) |

## 3. Isolate

Narrow to one file and one cause. State it in one sentence: *"Orders list is empty because the RLS policy filters on `owner_id` but the app sends `user_id`."* Two or more plausible causes → test the cheapest one first and write down what you ruled out.

## 4. Fix with a test

Write a **failing test that reproduces the bug** first, then the smallest fix that makes it pass. Never weaken or delete a test to get green. Run the full checks.

## 5. Prove and record

- Show the evidence: the test now passing, plus the original reproduction now working (screenshot or output).
- One line in `docs/product/LESSONS.md` if the cause could happen again elsewhere; a *Gotcha* in HANDOFF if the next tool might repeat it.
- Production was affected (users saw it) → also follow `../../post-launch/references/when-it-breaks.md` for the user-facing side and the short postmortem.

**Stop and ask the owner** after 3 failed fix attempts, or before anything that touches production data, payments, auth settings or secrets.
