#!/usr/bin/env bash
# Every reference a skill or agent points at must exist, so a renamed or missing
# file fails CI instead of silently costing an AI tool a wasted search.
# Checks Markdown links (x.md) and backticked paths that start with ../ or references/.
# Skips templates/ (their links point into the user's project) and globs. A path
# written as "<skill> `references/x.md`" in prose may resolve in any skill folder.
set -euo pipefail
KIT="$(cd "$(dirname "$0")/.." && pwd)"
python3 - "$KIT" <<'PY'
import pathlib, re, sys
kit = pathlib.Path(sys.argv[1])
plugin = kit / "plugin"
missing = []
link = re.compile(r"\]\(([^)#\s]+\.md)(?:#[^)]*)?\)")
tick = re.compile(r"`((?:\.\./|references/)[^`\s]+\.(?:md|html|py|json))`")
skills = [d for d in (plugin / "skills").iterdir() if d.is_dir()]
for f in sorted(plugin.rglob("*.md")):
    if "templates" in f.parts:
        continue
    text = f.read_text(encoding="utf-8")
    skill_dir = next((p for p in f.parents if p.parent.name == "skills"), None)
    for m in list(link.finditer(text)) + list(tick.finditer(text)):
        ref = m.group(1)
        if ref.startswith(("http:", "https:", "mailto:")) or any(c in ref for c in "<{*") or ref.endswith(("AGENTS.md", "CLAUDE.md")):
            continue
        bases = [f.parent] + ([skill_dir] if skill_dir else [])
        if ref.startswith("references/"):
            bases += skills
        if ref.startswith("../skills/") and f.parent.name == "agents":
            bases.append(plugin / "agents")
        if not any((b / ref).resolve().exists() for b in bases):
            missing.append(f"{f.relative_to(kit)}: {ref}")
if missing:
    print("Missing references:\n  " + "\n  ".join(missing))
    sys.exit(1)
print("references: every linked or backticked kit file exists")
PY
