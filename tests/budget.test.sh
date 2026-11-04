#!/usr/bin/env bash
# Always-loaded text budget: skill and agent descriptions are read in every session,
# so they stay short, and hidden skills (disable-model-invocation) must stay reachable
# through start's route table. See product-standards references/context-budget.md.
set -euo pipefail
KIT="$(cd "$(dirname "$0")/.." && pwd)"
python3 - "$KIT" <<'PY'
import pathlib, re, sys
kit = pathlib.Path(sys.argv[1]); plugin = kit / "plugin"
MAX_WORDS_EACH, MAX_WORDS_TOTAL, MAX_AUTO_SKILLS = 35, 650, 11
errors, total, auto, hidden = [], 0, [], []
files = sorted(plugin.glob("skills/*/SKILL.md")) + sorted(plugin.glob("agents/*.md"))
for f in files:
    fm = f.read_text(encoding="utf-8").split("---")[1]
    m = re.search(r"^description:\s*(.+)$", fm, re.M)
    if not m:
        errors.append(f"{f.relative_to(kit)}: no description"); continue
    raw = m.group(1).strip()
    if ": " in raw and raw[0] not in "'\"":
        errors.append(f"{f.relative_to(kit)}: description has ': ' but isn't quoted (invalid YAML)")
    words = len(raw.strip("'\"").split())
    if words > MAX_WORDS_EACH:
        errors.append(f"{f.relative_to(kit)}: description is {words} words (max {MAX_WORDS_EACH})")
    is_skill = f.name == "SKILL.md"
    if is_skill and re.search(r"^disable-model-invocation:\s*true", fm, re.M):
        hidden.append(f.parent.name)
    else:
        total += words
        if is_skill:
            auto.append(f.parent.name)
start = (plugin / "skills/start/SKILL.md").read_text(encoding="utf-8")
for name in hidden:
    if f"../{name}/SKILL.md" not in start:
        errors.append(f"hidden skill {name} is missing from start's route table")
if len(auto) > MAX_AUTO_SKILLS:
    errors.append(f"{len(auto)} skills trigger on their own (max {MAX_AUTO_SKILLS}): {', '.join(auto)}")
if total > MAX_WORDS_TOTAL:
    errors.append(f"always-loaded descriptions total {total} words (max {MAX_WORDS_TOTAL})")
if errors:
    print("Budget check failed:\n  " + "\n  ".join(errors)); sys.exit(1)
print(f"budget: {len(auto)} auto skills + agents = {total} words always loaded (~{int(total*1.35)} tokens); {len(hidden)} hidden skills routed by start")
PY
