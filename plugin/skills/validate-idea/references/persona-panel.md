# Persona panel (simulated users and stakeholders)

A low-cost dry run before real people: the `user-panel` agent plays evidence-based personas reacting to an idea, wireframe or message. **The panel may only lower confidence or add a blocker. It never raises an idea's evidence level** — that takes real users (`validate-idea`).

**When:** Standard and Deep only (Quick skips it). Called from `evaluate-idea` on the strongest version, `design-direction` for a wireframe walk-through, `product-opportunity-review` on shortlisted options and `post-launch` on ideas in IDEAS.md.

## Ground rules

- Personas are role composites: no real private people, no personal data.
- Never publish a persona's words as a customer quote; write "our user review suggests" and link the real evidence.
- A real user who contradicts a card wins: fix the card the same day.
- Track accuracy. Wrong on over a third of logged ideas → rebuild the pack from fresh interviews. Three months with no new Stated fact → mark the pack **stale**.

## Build the pack (`docs/product/PERSONAS.md`)

One pack per product, never reused. Sources: the brief, the research file (R-ids), CLARITY, reviews mined in COMPETITORS, support notes, analytics. Refresh after 30 days, or sooner when new interviews, reviews or usage data arrive.

**Who is on it.** Standard: 3 personas. Deep: up to 6. Always cover the buyer, the daily user and a **status-quo sceptic** who is content with the current way (WhatsApp, a notebook, a spreadsheet, or nothing). Deep can add a switcher, a power user or a prospect. If one real person holds two roles, use one card.

**Each card** (≤ 120 words, same layout every time):

- **Label** — a role, never a real name ("Owner of a 2-chef cloud kitchen").
- **Typical day** — 2–3 lines with times and numbers.
- **Jobs, pains, switch triggers and barriers** — tag every item **Stated** (someone said it; date, R-id), **Reported** (reviews, surveys; R-id) or **Assumed**.
- **Money** — who pays, current spend, how price gets judged.
- **Red lines** — instant deal-breakers.
- **Confidence** — High if mostly Stated, Medium, Low if mostly Assumed.

The file closes with two sections: **Hits and misses** (date · idea ID · panel said · real users did) and **Open questions for real users** — the gaps this pack most needs filled.

## Run it

Each persona gets only its card, the idea (one line plus an example) and the true facts about the product today. Run **one subagent per persona, in parallel, blind to the others**. Without subagents, play them inline in turn, ≤ 6 lines each, never editing earlier ones.

Each persona speaks in its own voice about one moment in its day:

1. Gut reaction, in a sentence.
2. How often would I use it — Daily, Sometimes, Rarely or Never — and at what moment?
3. Pull on me to change: Strong reason, Nice to have, No effect, or Worse.
4. Blockers: setup time, trust, price, a missing integration, family or staff.
5. Price I'd pay, or what I'd drop to make room for it.
6. Proof I'd want before trying.
7. Which of these answers come from Stated/Reported traits, and which are guesses?

## Read the results

The lead agent's summary table:

| Idea | Would use (n of m) | Switch power | Top blocker | Who rejects it, why | Backed or guessed | Verdict |
|---|---|---|---|---|---|---|

Verdicts:
- **Pitch** — a majority would use it and nobody hit a red line.
- **Fix first** — name the change.
- **Test with real users** — the verdict leans on guesses.
- **Drop** — the target people would not use it.

**Questions for real users:** turn each guess that swung a verdict into an interview question and add it to `VALIDATION.md` (validate-idea). Log one line per idea in IDEAS.md or the review: *"User panel: verdict y; n of m would use; blocker x"*.

## Other formats

- **Wireframe walk-through** — personas talk through their real task screen by screen and halt where they'd get stuck. Any step where 2+ halt goes to DESIGN_DIRECTION open issues.
- **Message test** — store listing, landing page or launch post: what came across, what you'd do next, where you gave up reading.
- **Ranking** — from 5–10 ideas, each persona keeps 3 and gives one reason each.

## Stakeholder mode (pitching to someone who decides)

Before a proposal, deck or price reaches a decision maker, run the `stakeholder-panel` agent: one card per person in `docs/product/STAKEHOLDERS.md`, built only from their own words and actions. Internal only.
