# When it breaks: a calm checklist for a live product

For "it's down", "users can't log in", "payments are failing", a bad review spike. Solo-maker sized: one person, minutes not war rooms.

## 1. Size it (2 minutes)

| Level | Means | Example |
|---|---|---|
| **S1** | Most users blocked, data or money at risk | Sign-in broken; double charges; data leak |
| **S2** | A core flow broken for some users | Android checkout fails; one city's orders don't arrive |
| **S3** | Annoying, has a workaround | Slow list, wrong label, minor crash on an old device |

S1 → do steps 2–4 now. S2 → today. S3 → a task in PLAN.md.

## 2. Stop the harm first, then find the cause

Cheapest safe move first: **roll back** to the last good deploy (`~~hosting` promote previous), turn off a feature flag, pause a broken job or webhook, or put up a status note. Don't debug in production. Never delete data to "fix" it; take a backup or snapshot first.

## 3. Tell people (short, honest, no blame)

One message where your users are (store reply, app banner, email, social): what's affected · that you're on it · workaround if any · when you'll update next. Draft it; the owner sends it. Never promise a time you don't control.

## 4. Fix properly

Follow build-feature's debug mode (`../../build-feature/references/debug.md`): reproduce → isolate → failing test → fix → prove. Deploy, then watch errors and the core metric for an hour.

## 5. Short postmortem (≤ 15 lines, `docs/product/reviews/<date>-incident.md`)

What happened and when (timeline in 3–6 lines) · impact (users, money, duration) · root cause in one sentence · what fixed it · **what will stop it happening again** (a test, an alert, a checklist line, a kit rule) with owner and date · what went well. Blameless: causes, not culprits. Add the prevention to LESSONS.md and, if the kit could have caught it, to the kit's LESSONS.md.

## Runbook for things that repeat

When the same fix is needed twice, write it down once in `docs/RUNBOOK.md`: trigger (how you notice) · exact steps and commands · how to check it worked · how to undo · who to tell. Keep each entry under 15 lines.
