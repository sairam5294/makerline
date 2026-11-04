# Industry File (light): one shared file per industry

Expertise you keep, not news you collect. One file per industry, shared by every product of yours in it (e.g. personal finance, food delivery, kids' learning), so research is paid for once and tested against what happens.

**Where:** the kit's `portfolio/industries/<industry>.md` (path in OWNER.md). Define the industry tightly ("UPI-era personal finance apps in India", not "fintech"). Created on request or by a Deep review; ≤ 1,500 words above the dated signals.

## Sections (tables, every row with a date and R-id or URL)

1. **Scope and "the industry in 10 minutes":** one page a newcomer could read.
2. **How money flows:** who pays whom, typical prices or cuts (labelled), switching costs, who has pricing power.
3. **Buyers and jobs:** buyer vs daily user per segment, how they choose, what makes them switch, what they fear.
4. **Players:** incumbents, challengers, platforms, adjacent giants — model, recent dated moves, URLs (site, help, pricing, changelog).
5. **Rules and standards:** current and coming, with dates and what each forces products to build.
6. **Technology shifts:** what is shipping vs hype, with evidence.
7. **Patterns to borrow:** each card in `portfolio/PATTERNS.md` marked Already happened / Happening now / **Not yet** (with reason) / Won't fit. "Not yet" rows are where leapfrog ideas come from.
8. **Theses** (see below).
9. **What our own users told us:** what your own interviews, tests and users taught you about the market — by role only, with how many people and whose users they were.
10. **Open questions** and how you'd find out.
11. **Dated signals** (newest first, never edit rows): Date | Source (tier: evidence / reported / first-party) | What happened | Why it matters | Thesis affected | Verified?

## Theses: opinions with a track record

`ID (TH-<code>-NN) | Prediction | By when | How we'll know | Confidence % | For | Against | Status (Open / Right / Wrong / Partly) | Last reviewed`

Example (illustrative): "By end of 2027, at least two top Indian budgeting apps will auto-categorise UPI transactions on-device; we'll know from their release notes. 55%."

Rules: 3–6 open at a time; at least one **contrarian** (most people believe the opposite); confidence changes only with a logged reason; wrong theses stay visible with one line on what you misread. Every Leapfrog idea links to the thesis it bets on.

## Keeping it alive (cheap by default)

- **Monthly** (from `post-launch` step 5b, ~15 minutes): score due theses, update the hit rate, add what our own users told us, move any "Not yet" pattern that is now arriving. Optional: a 5-line "state of the industry" note that can become a newsletter or LinkedIn post — public facts and your opinions only, no private user details, checked with the devils-advocate's reader mode.
- **Watch (optional, ask first):** a weekly scheduled task that searches the last 7 days for the player and rule list and appends verified rows to the dated signals. It uses AI usage on every run; suggest pausing it if two months produce little. Never daily by default.
- Before a review or evaluation in this industry, read sections 1, 7 and 8 only (≤ 500 words) — not the log.

## The loop, in code

`python3 <kit>/scripts/industry_check.py portfolio/industries/<industry>.md` reads the Theses and Dated signals tables and prints: theses due for scoring, open theses with no signal in 60 days, the hit rate (all, and for calls at 70%+ confidence), patterns marked "Not yet" with recent signals (candidates to move), and the log's last date (stale after 45 days). Run it in post-launch step 5b and at the start of any review in that industry; the "This month we learned" lines come from its output, not from re-reading the log.

## Setting up the watch (opt-in, asked once)

When an industry file is created, offer the weekly watch in one line with its cost: "a scheduled task every Monday that searches the last 7 days for your player and rule list and appends verified rows; roughly one short run a week". The prompt to paste is in `watch-prompt.md`. Never daily; suggest pausing after two quiet months.
