#!/usr/bin/env bash
# Tests for the safety hooks and gate scripts, using the exact JSON shape Claude Code sends.
# Run: bash tests/hooks.test.sh   (also runs in kit CI)
set -uo pipefail
KIT="$(cd "$(dirname "$0")/.." && pwd)"
H="$KIT/template/.claude/hooks"
pass=0; fail=0
check() { # check <description> <expected-exit> <actual-exit>
  if [ "$2" = "$3" ]; then pass=$((pass+1)); else fail=$((fail+1)); echo "✖ $1 (expected $2, got $3)"; fi
}
bash_json() { python3 -c 'import json,sys;print(json.dumps({"session_id":"s","hook_event_name":"PreToolUse","tool_name":"Bash","tool_input":{"command":sys.argv[1],"description":"Run it"}}))' "$1"; }
edit_json() { python3 -c 'import json,sys;print(json.dumps({"tool_name":sys.argv[3],"tool_input":{"file_path":sys.argv[1],("content" if sys.argv[3]=="Write" else "new_string"):sys.argv[2],"old_string":"x"}}))' "$1" "$2" "$3"; }

# --- guard-bash.sh: 2 = blocked, 0 = allowed
for c in 'rm -rf node_modules' 'rm -fr ~/x' 'git push origin main' 'git push -f' 'git push --force origin feat/x' \
         'cat .env' 'cat .env.local' 'printenv' 'env' 'ls && printenv' 'echo $SUPABASE_SERVICE_ROLE_KEY' \
         'npx supabase db reset --linked' 'psql -c "drop table users"'; do
  bash_json "$c" | "$H/guard-bash.sh" 2>/dev/null; check "block: $c" 2 $?
done
for c in 'npm test' 'git push origin feat/T-01' 'cat .env.example' 'npx cross-env A=1 node x' 'ls -la' 'rm src/old.ts' 'git status'; do
  bash_json "$c" | "$H/guard-bash.sh" 2>/dev/null; check "allow: $c" 0 $?
done

# --- approval-gate.sh
P="$(mktemp -d)"; mkdir -p "$P/docs/product"; cp "$KIT/template/docs/product/STATUS.md" "$P/docs/product/"
gate() { edit_json "$P/$1" "$2" "${3:-Edit}" | CLAUDE_PROJECT_DIR="$P" "$H/approval-gate.sh" 2>/dev/null; echo $?; }
check "app code blocked before approval" 2 "$(gate src/app.tsx 'x')"
check "docs allowed before approval" 0 "$(gate docs/product/PRD.md 'x')"
check "validation landing page allowed" 0 "$(gate validation/index.html 'x')"
check "AI can't self-approve (Edit)" 2 "$(gate docs/product/STATUS.md 'Evaluation: APPROVED (today)')"
check "AI can't self-approve (Write)" 2 "$(gate docs/product/STATUS.md 'Evaluation: APPROVED (today)' Write)"
check "AI may edit STATUS otherwise" 0 "$(gate docs/product/STATUS.md '| 1 | Discovery | Done |')"
sed -i.bak 's/^Evaluation: PENDING.*/Evaluation: APPROVED (2026-01-01)/' "$P/docs/product/STATUS.md"
check "app code allowed after approval" 0 "$(gate src/app.tsx 'x')"
check "editing STATUS after approval ok" 0 "$(gate docs/product/STATUS.md 'Evaluation: APPROVED (2026-01-01)')"

# --- check-gate.sh (git hook / CI)
cp "$KIT/template/docs/product/STATUS.md" "$P/docs/product/STATUS.md"
( cd "$P" && "$KIT/template/scripts/check-gate.sh" "src/my file.ts" >/dev/null ); check "check-gate blocks app file (spaces)" 1 $?
( cd "$P" && "$KIT/template/scripts/check-gate.sh" docs/a.md validation/x.html design/tokens.json README.md >/dev/null ); check "check-gate allows docs/design/validation" 0 $?
rm -rf "$P"

# --- self-approval through the shell: plugin hook (any project) and template guard-bash.sh
SH="$KIT/plugin/hooks/no-self-approval.sh"
Q="$(mktemp -d)"; mkdir -p "$Q/docs/product"; cp "$KIT/template/docs/product/STATUS.md" "$Q/docs/product/"
pj() { python3 -c 'import json,sys;print(json.dumps({"tool_name":"Bash","tool_input":{"command":sys.argv[1]}}))' "$1"; }
for c in "sed -i 's/^Evaluation: .*/Evaluation: APPROVED/' docs/product/STATUS.md" \
         "perl -pi -e 's/PENDING/APPROVED/' docs/product/STATUS.md" \
         "echo 'Evaluation: APPROVED' >> docs/product/STATUS.md" \
         "python3 -c \"open('docs/product/STATUS.md','a').write('APPROVED')\"" \
         'bash scripts/approve.sh' 'echo YES | scripts/approve.sh' './scripts/approve.sh "landing page"'; do
  pj "$c" | CLAUDE_PROJECT_DIR="$Q" bash "$SH" 2>/dev/null; check "plugin hook blocks: $c" 2 $?
  bash_json "$c" | CLAUDE_PROJECT_DIR="$Q" "$H/guard-bash.sh" 2>/dev/null; check "guard-bash blocks: $c" 2 $?
done
for c in 'grep "Evaluation: APPROVED" docs/product/STATUS.md' \
         "perl -pi -e 's/Not started/Waiting for owner/' docs/product/STATUS.md" \
         'mkdir -p scripts && cp /x/skills/evaluate-idea/scripts/approve.sh scripts/approve.sh && chmod +x scripts/approve.sh' \
         'npm test'; do
  pj "$c" | CLAUDE_PROJECT_DIR="$Q" bash "$SH" 2>/dev/null; check "plugin hook allows: $c" 0 $?
  bash_json "$c" | CLAUDE_PROJECT_DIR="$Q" "$H/guard-bash.sh" 2>/dev/null; check "guard-bash allows: $c" 0 $?
done
ej() { python3 -c 'import json,sys;print(json.dumps({"tool_name":sys.argv[3],"tool_input":{"file_path":sys.argv[1],"content":sys.argv[2],"new_string":sys.argv[2]}}))' "$1" "$2" "$3"; }
ej "$Q/docs/product/STATUS.md" 'Evaluation: APPROVED (today)' Edit | CLAUDE_PROJECT_DIR="$Q" bash "$SH" 2>/dev/null; check "plugin hook blocks Edit self-approval" 2 $?
python3 -c 'import json;print(json.dumps({"tool_name":"MultiEdit","tool_input":{"file_path":"'"$Q"'/docs/product/STATUS.md","edits":[{"old_string":"a","new_string":"Evaluation: APPROVED"}]}}))' \
  | CLAUDE_PROJECT_DIR="$Q" bash "$SH" 2>/dev/null; check "plugin hook blocks MultiEdit self-approval" 2 $?
ej "$Q/docs/product/PRD.md" 'Evaluation: APPROVED' Write | CLAUDE_PROJECT_DIR="$Q" bash "$SH" 2>/dev/null; check "plugin hook ignores other files" 0 $?
R="$(mktemp -d)"; pj "sed -i 's/x/APPROVED/' docs/product/STATUS.md" | CLAUDE_PROJECT_DIR="$R" bash "$SH" 2>/dev/null; check "plugin hook ignores projects without STATUS.md" 0 $?
sed -i.bak 's/^Evaluation: PENDING.*/Evaluation: APPROVED (2026-01-01)/' "$Q/docs/product/STATUS.md"
pj "sed -i 's/APPROVED (2026-01-01)/APPROVED (2026-01-01) — note/' docs/product/STATUS.md" | CLAUDE_PROJECT_DIR="$Q" bash "$SH" 2>/dev/null; check "plugin hook quiet after owner approval" 0 $?
python3 -c 'import json;d=json.load(open("'"$KIT"'/plugin/hooks/hooks.json"));assert "no-self-approval.sh" in d["hooks"]["PreToolUse"][0]["hooks"][0]["command"]' ; check "plugin hooks.json wires the hook" 0 $?
cmp -s "$KIT/plugin/skills/evaluate-idea/scripts/approve.sh" "$KIT/template/scripts/approve.sh"; check "approve.sh: one source (run sync.py)" 0 $?
rm -rf "$Q" "$R"

echo "hooks: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
