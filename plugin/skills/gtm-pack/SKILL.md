---
name: gtm-pack
description: 'Go-to-market and advertising pack: positioning, messaging, launch plan, store listing, landing page copy, social posts and ad variants, checked by a sceptical reader and the persona panel.'
argument-hint: "<product, audience, channel(s), launch date or campaign goal>"
disable-model-invocation: true
---

# /gtm-pack

Help people who would benefit actually hear about the product — honestly. Works for your product, a client's or your employer's (read ENGAGEMENT.md first). Every claim must be true **today** and backed by evidence; no fake reviews, testimonials, scarcity or competitor bashing.

## Inputs

EVALUATION (positioning statement, wedge), COMPETITORS, PERSONAS, DESIGN_DIRECTION voice, AUDIT or METRICS for proof points, the launch markets. Missing positioning → write it first (step 1); don't invent features.

## Steps (Standard; Quick = steps 1, 2 and one channel)

1. **Positioning** (≤ 120 words): for <who> who <need>, <product> is the <category> that <key benefit>; unlike <real alternative>, it <proof-backed difference>. Check it with the differentiator test in `../evaluate-idea/references/competitive-analysis.md`.
2. **Messaging house:** one promise · three proofs (each tied to an evidence ID or a real metric) · objections with honest answers · words to use / avoid (from the voice and the users' own words). → `docs/product/gtm/MESSAGING.md`
3. **Launch plan:** goal and metric, audience segments, channels you can actually reach (owned, earned, paid, communities, partners), sequence (pre-launch → launch week → first 30 days), budget range, and what you'll measure per channel. → `gtm/LAUNCH.md`
4. **Assets** (only the channels in the plan) → `gtm/ASSETS.md`:
   - **Store listing:** title, subtitle, keywords, description, screenshot captions, "What's new"; within each store's limits; accessibility features named only if true.
   - **Landing page:** headline, subhead, 3 benefit blocks, proof, FAQ, one call to action.
   - **Social posts:** 3–5 per platform in the owner's voice (use their writing style if a profile exists), one idea each.
   - **Ad variants:** 3 headlines × 2 descriptions per audience, following the platform's policy (no personal attributes like health or finances targeted or implied).
   - **Email:** announcement and a follow-up.
4b. **Pricing on the page?** Ask the `pricing-analyst` for the comparables and the honest anchor; no fake discounts or countdowns (`../product-standards/references/ux.md` §8b). Images and video: alt text, captions, and a content-credentials or visible label on anything AI-generated.
5. **Check before anything is published:** the `devils-advocate` in **reader mode** (cuts unproven claims, hype, jabs), then the `user-panel` message test (what did they understand, would they click, where did they stop). Fix, then show the owner the final copy; publishing is always the owner's action.

## Rules

- Inclusive and accessible copy: plain language, alt text for every image, captions for video, no colour-only meaning, no ableist or exclusionary phrasing; translations by a fluent reviewer, not only AI.
- Claims about AI, privacy, security, savings or health need a source and must match the product today; regulated categories (finance, health, children) get a compliance line for the owner to check.
- Never imitate another brand's look, names or slogans; never write reviews or testimonials in invented voices.

## Output

`docs/product/gtm/` (MESSAGING, LAUNCH, ASSETS). Present in ≤ 8 lines: the positioning line, the promise, the channels chosen and why, and what to measure in the first 30 days.
