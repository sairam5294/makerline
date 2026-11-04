#!/usr/bin/env bash
# PreToolUse hook (Edit|Write|MultiEdit) — the MakerLine approval gate, for Claude Code.
#  1. Until docs/product/STATUS.md says "Evaluation: APPROVED", only planning/docs/config files may be
#     edited — not app code.
#  2. The AI may never write "Evaluation: APPROVED" itself: only the owner approves, with
#     scripts/approve.sh. (Stops an agent from approving its own work.)
# Exit 0 = allow. Exit 2 = block (stderr is shown to Claude so it can explain to the owner).
# Same allowlist as scripts/check-gate.sh (git hook + CI) — keep the two in sync.

input="$(cat)"
read_field() { printf '%s' "$input" | "$(dirname "$0")/_read-input.sh" "$1"; }

file="$(read_field tool_input.file_path)"
[ -z "$file" ] && exit 0
root="${CLAUDE_PROJECT_DIR:-$(pwd)}"
rel="${file#"$root"/}"
status="$root/docs/product/STATUS.md"

# --- Rule 2: no self-approval -------------------------------------------------------------
if [ "$rel" = "docs/product/STATUS.md" ]; then
  grep -q "Evaluation: APPROVED" "$status" 2>/dev/null && exit 0
  # Judge the file as it would look after the edit (Write, Edit or MultiEdit), so swapping
  # "PENDING" for "APPROVED (date)" is caught too.
  if command -v python3 >/dev/null 2>&1; then
    printf '%s' "$input" | python3 -c '
import json, sys
d = json.load(sys.stdin); ti = d.get("tool_input") or {}
try: cur = open(sys.argv[1], encoding="utf-8").read()
except OSError: cur = ""
edits = ti.get("edits") if isinstance(ti.get("edits"), list) else [ti]
after = str(ti.get("content") or "") if "content" in ti else cur
added = str(ti.get("content") or "")
for e in edits:
    if not isinstance(e, dict): continue
    old, new = str(e.get("old_string") or ""), str(e.get("new_string") or "")
    added += new
    if old and old in after: after = after.replace(old, new) if e.get("replace_all") else after.replace(old, new, 1)
sys.exit(2 if "Evaluation: APPROVED" in after + added else 0)' "$status"
    [ $? -eq 2 ] && { echo "Blocked: only the owner can approve the evaluation. Ask them to run: scripts/approve.sh" >&2; exit 2; }
  elif printf '%s' "$(read_field tool_input.content)$(read_field tool_input.new_string)" | grep -q "Evaluation: APPROVED"; then
    echo "Blocked: only the owner can approve the evaluation. Ask them to run: scripts/approve.sh" >&2; exit 2
  fi
  exit 0
fi

# --- Rule 1: app code only after approval --------------------------------------------------
case "$rel" in
  docs/*|validation/*|design/*|.agents/*|.claude/*|.cursor/*|.codex/*|.github/*|scripts/*) exit 0 ;;
  *.md|.gitignore|.cursorignore|lefthook.yml|.mcp.json|.product-kit-version) exit 0 ;;
esac
[ -f "$status" ] || exit 0                        # Not a MakerLine project → don't block.
grep -q "Evaluation: APPROVED" "$status" && exit 0

echo "Blocked by the MakerLine approval gate: '$rel' is app code, but the owner hasn't approved the evaluation yet (docs/product/STATUS.md). Finish evaluate-idea; the owner approves with scripts/approve.sh. Landing pages for validation go in a separate project or the validation/ folder." >&2
exit 2
