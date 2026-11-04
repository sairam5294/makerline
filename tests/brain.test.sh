#!/usr/bin/env bash
# Industry File check: due and quiet predictions, hit rate, patterns and signal freshness are read from the tables.
set -euo pipefail
KIT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
cat > "$TMP/b.md" <<'MD'
# Test industry
## Predictions
| ID | Prediction | Check by | Evidence that settles it | Confidence % | Status | Last reviewed |
|---|---|---|---|---|---|---|
| P-T-01 | A | 2026-01-01 | x | 80 | Open | 2026-01-01 |
| P-T-02 | B | 2027-12-31 | x | 50 | Open | 2026-10-01 |
| P-T-03 | C | 2025-06-01 | x | 75 | Right | 2026-06-01 |
| P-T-04 | D | 2025-06-01 | x | 40 | Wrong | 2026-06-01 |
## Patterns to borrow
| Pattern | Status here | Reason | Signals to watch | Idea it suggests |
|---|---|---|---|---|
| Compliance as a product | Not yet | rule lands 2027 | signal: DPDP | x |
| Tool to marketplace | Won't fit | | | |
## Dated signals
| Date | Source | What happened | Why it matters | Prediction affected | Verified? |
|---|---|---|---|---|---|
| 2026-10-20 | official | rule published, enforceable 2027-05-13 | | P-T-02 supports | yes |
MD
out="$(python3 "$KIT/scripts/industry_check.py" "$TMP/b.md" --today 2026-11-04)"
grep -q "last entry 2026-10-20" <<<"$out" || { echo "wrong log date: $out"; exit 1; }
grep -q "P-T-01: due 2026-01-01" <<<"$out" || { echo "due thesis missed"; exit 1; }
grep -q "no signal in 60 days:
  P-T-01" <<<"$out" || { echo "stale thesis missed"; exit 1; }
grep -q "hit rate 50% of 2; at 70%+ confidence 100% of 1" <<<"$out" || { echo "hit rate wrong: $out"; exit 1; }
grep -q "Compliance as a product" <<<"$out" || { echo "ready pattern missed"; exit 1; }
if python3 "$KIT/scripts/industry_check.py" "$KIT/README.md" >/dev/null 2>&1; then echo "accepted a file without predictions"; exit 1; fi
sed -e 's/## Predictions/## Theses/' -e 's/P-T-/TH-T-/g' "$TMP/b.md" > "$TMP/old.md"
python3 "$KIT/scripts/industry_check.py" "$TMP/old.md" --today 2026-11-04 | grep -q "TH-T-01: due 2026-01-01" || { echo "older Theses file not read"; exit 1; }
echo "industry: signal date, due, quiet, hit rate, pattern and older-file checks passed"
