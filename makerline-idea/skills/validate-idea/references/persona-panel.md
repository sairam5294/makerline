# Persona panel (simulated users and stakeholders)

A cheap rehearsal before real users: personas built from evidence react to an idea, wireframe or message. Run by the `user-panel` agent. **A simulation can lower confidence or add a blocker; it can never raise an idea's evidence level.** Only real users do that (`validate-idea`).

Use at Standard and Deep depth: `evaluate-idea` (the strongest version), `design-direction` (wireframe walk-through), `product-opportunity-review` (shortlisted options), `post-launch` (ideas from IDEAS.md). Quick runs skip it.

## The pack: `docs/product/PERSONAS.md`

Build it once from the brief, research file (R-ids), CLARITY, reviews mined in COMPETITORS, support notes and analytics. Refresh when it is over 30 days old or new interviews, reviews or usage data land. One pack per product; never reuse another product's pack.

Pick **3 personas at Standard, up to 6 at Deep**, covering: the person who **pays**, the person who **uses it daily**, and always a **status-quo sceptic** (happy with today's way: WhatsApp, a notebook, a spreadsheet, doing nothing). Add a switcher, a power user or a prospect at Deep. Merge roles one person really holds.

**Card (keep this layout, ≤ 120 words each):**

- **Label:** role, not a real name (e.g. "Owner of a 2-chef cloud kitchen").
- **A normal day:** 2–3 lines with times and numbers.
- **Top jobs · pains · what makes them switch / stop them:** each tagged **Stated** (a real person said it; date, R-id), **Reported** (reviews, surveys; R-id) or **Assumed**.
- **Money:** who pays, what they pay today, how they judge price.
- **Red lines:** things that make them say no on the spot.
- **Confidence:** High (mostly Stated) / Medium / Low (mostly Assumed).

End the file with **Hits and misses** (date · idea ID · panel said · real users did) and **Questions this pack most needs real answers to**.

## Running the panel

Brief each persona with only: its card, the idea (one line + example), and the true facts about the product today. **One subagent per persona, run in parallel; none sees another's answer.** No subagents → play each inline, ≤ 6 lines, in turn, without revising earlier answers.

Each persona answers, in its own words, about one moment in its day:

1. First reaction (one sentence).
2. Would I use it? Daily / Sometimes / Rarely / Never — when?
3. Would it make me switch or stay? Strong reason / Nice to have / No effect / Worse.
4. What would stop me? (setup time, trust, price, a missing integration, family or staff)
5. What would I pay or give up for it?
6. What would I need to see first?
7. Which answers rest on Stated/Reported traits, and which are guesses?

Synthesis (the lead agent, one table):

| Idea | Would use (n of m) | Switch power | Top blocker | Who rejects it, why | Backed or guessed | Verdict |
|---|---|---|---|---|---|---|

**Verdict:** **Pitch** (most would use it, no red line hit) · **Fix first** (name the change) · **Test with real users** (the verdict rests on guesses) · **Drop** (the people it's for wouldn't use it).

Then **Questions for real users**: every guessed answer that changed a verdict, written as an interview question. Add them to `VALIDATION.md` (validate-idea). One line per idea goes into IDEAS.md or the review: *"User panel: n of m would use; top blocker x; verdict y"*.

## Other uses

- **Wireframe walk-through:** each persona narrates doing its real task screen by screen and stops where it would get stuck. Output: steps where 2+ personas stall → DESIGN_DIRECTION open issues.
- **Message test:** store listing, landing page, launch post. What did you understand, what would you do next, where did you stop reading?
- **Ranking:** 5–10 ideas; each persona picks its top 3 with one reason.

## Stakeholder mode (pitching to someone who decides)

For a pitch to a partner, investor, client or your own employer: one card per decision maker (e.g. founder, finance, tech lead), built **only from what they have said or done** (Stated / Observed, with date and where) — never guesses about their personality or private life. Each reads the document and gives: first 30 seconds, what they like (the line), what worries them (the line), the first question they'd ask, what would make them say yes, the likely counter-offer. Output: changes before sending, prepared answers, questions to ask the real person. Internal only; never quote it back to them. When the real person disagrees, the real person wins and the card is updated.

## Keep it honest

- Never present a persona's words as a customer quote in anything public; say "our user review suggests" and link real evidence.
- Personas are composites by role; no real private people, no personal data.
- When a real user contradicts a card, update it that day. If the panel is wrong on more than a third of logged ideas, rebuild it from fresh interviews. No Stated update for 3 months → mark the pack **stale**.
