#!/usr/bin/env bash
# Industry Brain check: due theses, stale theses, hit rate and log freshness are read from the tables.
set -euo pipefail
KIT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
cat > "$TMP/b.md" <<'MD'
# Test Brain
## Theses
| ID | Prediction | By when | How we'll know | Confidence % | Status | Last reviewed |
|---|---|---|---|---|---|---|
| TH-T-01 | A | 2026-01-01 | x | 80 | Open | 2026-01-01 |
| TH-T-02 | B | 2027-12-31 | x | 50 | Open | 2026-10-01 |
| TH-T-03 | C | 2025-06-01 | x | 75 | Right | 2026-06-01 |
| TH-T-04 | D | 2025-06-01 | x | 40 | Wrong | 2026-06-01 |
## Patterns that apply here
| Pattern | Status here | Reason | Signals to watch | Idea it suggests |
|---|---|---|---|---|
| Compliance as a product | Not yet | rule lands 2027 | signal: DPDP | x |
| Tool to marketplace | Won't fit | | | |
## Signals log
| Date | Source | What happened | Why it matters | Thesis affected | Verified? |
|---|---|---|---|---|---|
| 2026-10-20 | official | rule published, enforceable 2027-05-13 | | TH-T-02 supports | yes |
MD
out="$(python3 "$KIT/scripts/brain_check.py" "$TMP/b.md" --today 2026-11-04)"
grep -q "last entry 2026-10-20" <<<"$out" || { echo "wrong log date: $out"; exit 1; }
grep -q "TH-T-01: due 2026-01-01" <<<"$out" || { echo "due thesis missed"; exit 1; }
grep -q "no signal in 60 days:
  TH-T-01" <<<"$out" || { echo "stale thesis missed"; exit 1; }
grep -q "hit rate 50% of 2; at 70%+ confidence 100% of 1" <<<"$out" || { echo "hit rate wrong: $out"; exit 1; }
grep -q "Compliance as a product" <<<"$out" || { echo "ready pattern missed"; exit 1; }
if python3 "$KIT/scripts/brain_check.py" "$KIT/README.md" >/dev/null 2>&1; then echo "accepted a file without theses"; exit 1; fi
echo "brain: log date, due, stale, hit rate and pattern checks passed"
