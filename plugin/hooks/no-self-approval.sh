#!/usr/bin/env bash
# MakerLine plugin hook (PreToolUse: Edit|Write|MultiEdit|Bash).
# Only the owner approves an evaluation. This blocks an AI tool from:
#   - writing "Evaluation: APPROVED" into docs/product/STATUS.md (Edit/Write/MultiEdit), and
#   - doing the same through the shell (sed -i, perl -pi, echo >>, python …) or running approve.sh.
# It catches accidents and the obvious routes; it is not a security boundary.
# Projects without docs/product/STATUS.md are never affected. Exit 2 = block.

input="$(cat)"
read_field() {
  printf '%s' "$input" | python3 -c '
import json, sys
d = json.load(sys.stdin)
for k in sys.argv[1].split("."):
    d = d.get(k, "") if isinstance(d, dict) else ""
if isinstance(d, list):
    d = "\n".join(e.get("new_string", "") for e in d if isinstance(e, dict))
print(d if isinstance(d, str) else "")' "$1" 2>/dev/null
}

root="${CLAUDE_PROJECT_DIR:-$(pwd)}"
status="$root/docs/product/STATUS.md"
[ -f "$status" ] || exit 0
grep -q "Evaluation: APPROVED" "$status" && exit 0   # already approved by the owner

msg="Blocked: only the owner approves the evaluation. Ask them to run 'bash scripts/approve.sh' in their own terminal (no terminal: they edit the Evaluation line in docs/product/STATUS.md themselves)."

tool="$(read_field tool_name)"
case "$tool" in
  Bash)
    cmd="$(read_field tool_input.command)"
    copy_ok='^[[:space:]]*(mkdir -p [^;&|]+&&[[:space:]]*)?(cp|install|chmod)[[:space:]][^;&|]*approve\.sh[^;&|]*([[:space:]]*&&[[:space:]]*chmod[^;&|]*)?$'   # copying the script into the project is fine; running it is not
    if printf '%s' "$cmd" | grep -Eq '(^|[^[:alnum:]_])approve\.sh' && ! printf '%s' "$cmd" | grep -Eq "$copy_ok"; then
      echo "$msg" >&2; exit 2
    fi
    writes='sed[^|;&]*-i|perl[^|;&]*-[a-zA-Z]*i|>|tee|python|node|ruby|awk|(^|[[:space:]])(cp|mv|ed|ex|dd|truncate)[[:space:]]|git[[:space:]]+(apply|checkout|restore)'
    if printf '%s' "$cmd" | grep -q 'STATUS' && printf '%s' "$cmd" | grep -q 'APPR' \
       && printf '%s' "$cmd" | grep -Eq "$writes"; then
      echo "$msg" >&2; exit 2
    fi
    ;;
  Edit|Write|MultiEdit)
    file="$(read_field tool_input.file_path)"
    case "$file" in */docs/product/STATUS.md|docs/product/STATUS.md) ;; *) exit 0 ;; esac
    new="$(read_field tool_input.content)$(read_field tool_input.new_string)$(read_field tool_input.edits)"
    if printf '%s' "$new" | grep -q "Evaluation: APPROVED"; then echo "$msg" >&2; exit 2; fi
    ;;
esac
exit 0
