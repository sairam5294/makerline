# Project Brief — "Advance" · v1

## One-liner
Deposit and balance tracker for wedding photographers in Telangana and Andhra Pradesh: log each booking's advance, send the couple automatic balance reminders on WhatsApp, and see who still owes what before the season starts.

## Problem
Wedding photographers take a 30–50% advance, then chase the balance after the event. Most track this in a notebook or a Google Sheet. In 22 interviews I ran in September (notes in `research/interviews-sep.md`), 19 said they had lost or delayed at least one balance payment last season; the median amount they said they wrote off was ₹18,000. 17 of 22 already send balance reminders by hand on WhatsApp.

## Evidence so far
- I run a WhatsApp community of ~4,000 wedding photographers in Telangana and AP (admin for 3 years).
- I posted a Google Form describing the tool with a price of ₹299/month. 212 filled it; 41 paid a ₹299 pre-order by UPI (refundable if I don't ship by 15 January). Payments are in my bank statement.
- 6 photographers have shared their real booking sheets (anonymised) for me to test with.

## Goal & success
A small paid business that pays for itself. Success by June 2027: 150 paying photographers (≈ ₹45,000/month), churn under 5%/month through the off-season.

## Audience
Independent wedding photographers and small studios (1–5 people) in Telangana and AP who take advances. Telugu and English.

## Scope (MVP)
Web app (works on phone browsers), one job only: add a booking (couple, date, total, advance), mark payments, see what's owed, and send a balance reminder through a pre-approved WhatsApp template from the photographer's own number. CSV import from Google Sheets. No invoicing, no gallery, no contracts.

## Business
₹299/month or ₹2,499/year, 14-day trial. Payments by Razorpay subscriptions. Marketing: my community, two photographer associations I'm a member of, and referrals.

## Owner
Senior UX designer, light coding, ~15 hours/week, budget ₹8,000/month. Stack: Next.js on Vercel, Supabase (both free tiers), WhatsApp Business Platform via a BSP. Target: pre-order customers using it by 15 January (10 weeks).
