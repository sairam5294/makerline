#!/usr/bin/env bash
# OWNER ONLY — approve the idea evaluation so building can start.
# In Claude Code, a hook blocks AI tools from writing this approval or running this script; other
# tools (Cursor, Codex) are told not to. It is a guard against accidents, not a security boundary.
# Source: plugin/skills/evaluate-idea/scripts/approve.sh (copied to template/scripts/ by sync.py).
#
#   bash scripts/approve.sh                      → approve after reading docs/product/EVALUATION.md
#   bash scripts/approve.sh "landing page only"  → approve with a note (e.g. a validation landing page)
set -euo pipefail
status="docs/product/STATUS.md"
[ -f "$status" ] || { echo "Run this from the project folder (no $status here)."; exit 1; }
[ -t 0 ] || { echo "Run this yourself in a terminal; it needs you to type YES."; exit 1; }
grep -q "Evaluation: APPROVED" "$status" && { echo "Already approved."; exit 0; }

note="${1:-}"
today="$(date +%Y-%m-%d)"
echo "Verdict in EVALUATION.md:"; grep -m1 -E "^\*\*(Go|Pivot|Drop|Go with changes)" docs/product/EVALUATION.md 2>/dev/null || echo "  (no EVALUATION.md found)"
read -r -p "Type YES to approve building this product: " answer
[ "$answer" = "YES" ] || { echo "Not approved."; exit 1; }

# Replace the gate line (portable sed for macOS + Linux).
sed -i.bak "s/^Evaluation: .*/Evaluation: APPROVED ($today)${note:+ — $note}/" "$status" && rm -f "$status.bak"
printf '| %s | Owner approved the evaluation%s | — | Owner decision | — |\n' "$today" "${note:+ ($note)}" >> docs/product/DECISIONS.md
if git rev-parse >/dev/null 2>&1; then
  git add "$status" docs/product/DECISIONS.md && git commit -q -m "chore: owner approved evaluation${note:+ ($note)}" --no-verify
fi
echo "✅ Approved. AI tools can now start tech-stack, design and build."
