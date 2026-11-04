#!/usr/bin/env bash
# PreToolUse hook (Bash). Second safety net behind the "deny" rules in settings.json:
# catches dangerous commands even when they're written in an unusual way.
# Exit 2 blocks the command and tells Claude why.

input="$(cat)"
cmd="$(printf '%s' "$input" | "$(dirname "$0")/_read-input.sh" tool_input.command)"
[ -z "$cmd" ] && exit 0

block() { echo "Blocked by MakerLine safety hook: $1" >&2; exit 2; }

# 1. Recursive force-delete anywhere (rm -rf, rm -fr, rm -r -f …).
printf '%s' "$cmd" | grep -Eq '(^|[;&| ])rm[[:space:]]+(-[a-zA-Z]*r[a-zA-Z]*f|-[a-zA-Z]*f[a-zA-Z]*r|-r[[:space:]]+-f|-f[[:space:]]+-r)' \
  && block "recursive force delete. Delete specific files, or ask the owner."

# 2. Rewriting shared git history.
printf '%s' "$cmd" | grep -Eq 'git[[:space:]]+push.*(--force|[[:space:]]-f([[:space:]]|$))' && block "force push."
printf '%s' "$cmd" | grep -Eq 'git[[:space:]]+push[[:space:]]+[^ ]+[[:space:]]+(main|master)([[:space:]]|$)' \
  && block "pushing straight to main. Push a branch and open a pull request."

# 3. Printing secrets into the conversation (cat .env, echo $SUPABASE_SERVICE_ROLE_KEY …).
#    .env.example is allowed (it only holds placeholder names).
if printf '%s' "$cmd" | grep -Eq '(cat|less|more|head|tail|bat|grep)[[:space:]]+[^|;]*\.env' \
   && ! printf '%s' "$cmd" | grep -Eq '\.env\.example([[:space:]]|$)'; then
  block "reading .env files. Use .env.example to see variable names."
fi
printf '%s' "$cmd" | grep -Eq '(^|[;&|][[:space:]]*)(printenv|env)([[:space:]]|$)|echo[[:space:]]+\$[A-Z_]*(KEY|SECRET|TOKEN|PASSWORD)' && block "printing environment secrets."

# 4. Destroying remote/production data.
printf '%s' "$cmd" | grep -Eqi 'supabase[[:space:]]+db[[:space:]]+reset[[:space:]].*--linked|drop[[:space:]]+(table|database|schema)' \
  && block "destructive database command. Ask the owner first."

# 5. Self-approval through the shell (the Edit/Write route is in approval-gate.sh).
#    Not a security boundary: it stops accidents and the obvious routes.
status="${CLAUDE_PROJECT_DIR:-$(pwd)}/docs/product/STATUS.md"
if [ -f "$status" ] && ! grep -q "Evaluation: APPROVED" "$status"; then
  copy_ok='^[[:space:]]*(mkdir -p [^;&|]+&&[[:space:]]*)?(cp|install|chmod)[[:space:]][^;&|]*approve\.sh[^;&|]*([[:space:]]*&&[[:space:]]*chmod[^;&|]*)?$'
  printf '%s' "$cmd" | grep -Eq '(^|[^[:alnum:]_])approve\.sh' && ! printf '%s' "$cmd" | grep -Eq "$copy_ok" \
    && block "only the owner runs scripts/approve.sh, in their own terminal."
  writes='sed[^|;&]*-i|perl[^|;&]*-[a-zA-Z]*i|>|tee|python|node|ruby|awk|(^|[[:space:]])(cp|mv|ed|ex|dd|truncate)[[:space:]]|git[[:space:]]+(apply|checkout|restore)'
  if printf '%s' "$cmd" | grep -q 'STATUS' && printf '%s' "$cmd" | grep -q 'APPR' && printf '%s' "$cmd" | grep -Eq "$writes"; then
    block "only the owner approves the evaluation (scripts/approve.sh)."
  fi
fi

exit 0
