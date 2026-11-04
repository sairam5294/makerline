# Industry File: what you know about one industry, kept honest

Research you pay for once and reuse across every product you build in the same space (say, personal finance in India or kids' learning apps). It is a working opinion of how the industry behaves, tested against what actually happens, not a news clipping file.

**Where:** `portfolio/industries/<industry>.md` in the kit (OWNER.md records the path). Name the industry narrowly: "UPI-era budgeting apps in India" beats "fintech". Make one only when the owner asks or a Deep review needs it. Keep everything above the signals table under 1,500 words. Every row carries a date and an R-id or URL.

## What goes in it

1. **Summary.** A one-page brief a newcomer could act on.
2. **Map.** Who sells, who buys and who pays whom, with typical prices or fees (labelled as estimates where they are). It also covers what it costs a customer to leave, and who can raise prices without losing them. List the main players with their model, their latest dated moves and their site, pricing and changelog links. List the rules in force and those on the way, with dates and what each forces a product to build. Note which technology shifts are shipping now and which are still talk.
3. **People.** For each segment, who decides and who uses it daily, how they choose, what makes them leave and what they worry about. Add what your own interviews, tests and users showed, by role only, with how many people and whose users they were.
4. **Patterns to borrow.** One row per card in `portfolio/PATTERNS.md`, marked Already happened / Happening now / **Not yet** (say why) / Won't fit. The "Not yet" rows are where leapfrog ideas start.
5. **Predictions.** See below.
6. **Unknowns.** Open questions and the cheapest way to answer each.
7. **Dated signals.** Newest first; rows are never edited. Columns: Date | Source (tier: evidence / reported / own users) | What happened | Why it matters | Prediction affected | Verified?

## Predictions: calls you can be scored on

`ID (P-<code>-NN) | Prediction | Check by | Evidence that settles it | Confidence % | For | Against | Status (Open / Right / Wrong / Partly) | Last reviewed`

Illustrative: "Before 2028, two of the five largest Indian budgeting apps will sort UPI payments on the phone itself; their release notes will show it. 55%."

- Keep 3 to 6 open. At least one should go against what most people in the industry expect.
- Change a confidence only with a reason logged in Dated signals.
- A call that turned out wrong stays in the table, with one line on what you misjudged.
- Every leapfrog idea names the prediction it depends on.

## Keeping it current

- **Monthly**, about 15 minutes, from `post-launch` step 5b: score predictions whose date has passed, refresh the hit rate, add what your own users showed, and move any "Not yet" pattern that has started to arrive. If the owner wants, add a five-line industry note they could post. It uses public facts and their own views only, never private user details, and is checked with the devils-advocate's reader mode.
- **Weekly watch**, optional and only after asking: a scheduled task searches the past 7 days for the listed players and rules and adds verified rows to Dated signals. Every run uses AI credits, so never run it daily. Suggest pausing it after two months with little to show. The prompt to paste is in `watch-prompt.md`; offer it in one line with its cost when the file is created.
- **Before a review or evaluation** in this industry, read only the Summary, Patterns to borrow and Predictions (500 words at most), not the signals table.

## The check script

`python3 <kit>/scripts/industry_check.py portfolio/industries/<industry>.md` reads the Predictions, Patterns to borrow and Dated signals tables. It prints:

- predictions now due for scoring;
- open predictions with no signal in 60 days;
- the hit rate, overall and for calls made at 70% or more;
- "Not yet" patterns that have a recent signal (candidates to move);
- the date of the newest signal (stale after 45 days).

Run it in post-launch step 5b and before any review in the industry. The "This month we learned" lines come from its output, not from rereading the signals.
