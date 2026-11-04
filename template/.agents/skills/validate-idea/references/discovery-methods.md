# Discovery methods: Opportunity Solution Tree, JTBD interviews, Kano

## Opportunity Solution Tree (continuous discovery)

One tree per product in `docs/product/OPPORTUNITIES.md` (≤ 400 words, a Mermaid tree plus a table). It links the outcome you're chasing to what you've heard from users to the ideas you're testing, so the Idea Log isn't a flat list.

```
Outcome (north star or one input metric)
└─ Opportunity: a need, pain or desire users told you about (their words, R-id)
   ├─ Opportunity: narrower
   │  ├─ Solution: IDEAS.md ID
   │  └─ Solution: IDEAS.md ID → Assumption test (V-id)
   └─ Opportunity: …
```

Rules: opportunities come only from real users (interviews, support, reviews, analytics), never from the team's wishes; every solution hangs under one opportunity; test the riskiest assumption, not the whole solution; prune branches that stop mattering. Weekly rhythm: one interview, one tree update, one assumption test (see `../../client-work/references/weekly-review.md` for the team version).

## JTBD interview script (45 minutes, one person)

Goal: the story of the last time they did the job or switched tools, not opinions about features. Record roles only.

1. **The last time:** "Tell me about the last time you <did the job>. Walk me through it from the first moment." Dig into timeline: when did you first think about it, what happened next, what did you use.
2. **The push:** what made the old way not good enough? (frustration, a specific event)
3. **The pull:** what made the new way look better? Where did you hear of it?
4. **Anxiety:** what worried you about changing? What almost stopped you?
5. **Habit:** what did you like about the old way that you'd miss?
6. **Hiring criteria:** how did you decide it worked? What would make you drop it?
7. **Workarounds:** what do you still do by hand, in a spreadsheet, on paper or by asking someone?
8. **Money:** what do you pay today, including time? What would feel fair?

Avoid: leading questions, your pitch, "would you use…" (people say yes). After five interviews, count themes (`synthesis` by the `research-synthesizer` agent) and update the tree, the personas (Stated traits) and the Idea Log evidence.

## Kano (which features matter, and how)

Ask about each candidate feature twice: "How would you feel if it had this?" and "…if it didn't?" with the five standard answers (like · expect · neutral · tolerate · dislike). Classify:

| Type | Meaning | Decision |
|---|---|---|
| **Must-be** | its absence angers; presence is unnoticed | parity: build, don't market |
| **Performance** | more is better | compete on it if it's your wedge |
| **Attractive** | delights; absence is fine | your differentiator or Leapfrog candidate |
| **Indifferent** | nobody cares | cut |
| **Reverse** | some dislike it | make it optional or drop |

Record the type next to the Advantage tag in IDEAS.md; "attractive" today becomes "must-be" within a few years, so re-ask yearly.
