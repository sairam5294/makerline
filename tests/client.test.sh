#!/usr/bin/env bash
# Client mode: the redaction check strips internal blocks and catches what must not leave the workspace.
set -euo pipefail
KIT="$(cd "$(dirname "$0")/.." && pwd)"
R="$KIT/plugin/skills/exec-pack/scripts/redact_check.py"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
check() { if eval "$2"; then pass=$((pass+1)); else echo "FAIL: $1"; fail=$((fail+1)); fi; }

mkdir -p "$TMP/p/docs/product/exec"
cp "$KIT/plugin/skills/client-work/templates/ENGAGEMENT.md" "$TMP/p/docs/product/ENGAGEMENT.md"
python3 - "$TMP/p/docs/product/ENGAGEMENT.md" <<'PY'
import sys, pathlib
p = pathlib.Path(sys.argv[1]); s = p.read_text()
s = s.replace("- <other client names, codenames>", "- Acme Retail\n- Project Falcon")
p.write_text(s)
PY
B="$TMP/p/docs/product/exec/brief.md"

printf '# Brief\n**Recommendation:** fix onboarding.\n<!-- internal -->\nOur day rate is ₹18,000; margin 30%%.\n<!-- /internal -->\nNext steps.\n' > "$B"
check "make strips internal blocks and passes" 'python3 "$R" make "$B" >/dev/null && ! grep -q "18,000" "$TMP/p/docs/product/exec/brief.client.md"'

printf '# Brief\nLike we did for Acme Retail.\n' > "$B"
check "Do-not-mention term fails" '! python3 "$R" make "$B" >/dev/null 2>&1'

printf '# Brief\nContact priya@example.com or +91 98765 43210.\n' > "$TMP/p/docs/product/exec/c.client.md"
check "email and phone fail" '! python3 "$R" check "$TMP/p/docs/product/exec/c.client.md" >/dev/null 2>&1'

printf '# Brief\nOur margin on this is ₹2 lakh.\n' > "$TMP/p/docs/product/exec/d.client.md"
check "internal money fails" '! python3 "$R" check "$TMP/p/docs/product/exec/d.client.md" >/dev/null 2>&1'

printf '# Brief\nPrice for clinics stays ₹999/month; 14 paying clinics.\n' > "$TMP/p/docs/product/exec/e.client.md"
check "ordinary prices pass" 'python3 "$R" check "$TMP/p/docs/product/exec/e.client.md" >/dev/null'

printf '# Brief\n<!-- internal --> left open\n' > "$TMP/p/docs/product/exec/f.client.md"
check "leftover marker fails" '! python3 "$R" check "$TMP/p/docs/product/exec/f.client.md" >/dev/null 2>&1'

check "client-work routes every client skill" 'for s in product-audit exec-pack gtm-pack product-opportunity-review handoff; do grep -q "../$s/SKILL.md" "$KIT/plugin/skills/client-work/SKILL.md" || exit 1; done'

echo "client: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
