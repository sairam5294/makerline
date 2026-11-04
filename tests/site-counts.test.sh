#!/usr/bin/env bash
# Hand-written counts on the docs site and in the submission notes must match the plugin.
# The site rebuilds on every merge, but numbers typed into its pages don't, so this catches
# "26 skills" still showing after skills are added.
set -euo pipefail
KIT="$(cd "$(dirname "$0")/.." && pwd)"
python3 - "$KIT" <<'PY'
import pathlib, re, sys
kit = pathlib.Path(sys.argv[1])
skills = len(list((kit / "plugin/skills").glob("*/SKILL.md")))
agents = len(list((kit / "plugin/agents").glob("*.md")))
hidden = sum(1 for p in (kit / "plugin/skills").glob("*/SKILL.md")
             if re.search(r"^disable-model-invocation:\s*true", p.read_text(encoding="utf-8"), re.M))
allowed = {skills, skills - hidden, hidden}  # total, auto-triggering, command-only
errors = []

# Home page stats block, in every language: first <dd> is skills, second is agents.
for page in ["docs/site/index.md", "docs/site/hi/index.md", "docs/site/es/index.md"]:
    text = (kit / page).read_text(encoding="utf-8")
    stats = re.findall(r"<div><dt>[^<]*</dt><dd>(\d+)</dd></div>", text)
    if len(stats) < 2:
        errors.append(f"{page}: stats block not found"); continue
    if int(stats[0]) != skills:
        errors.append(f"{page}: says {stats[0]} skills, plugin has {skills}")
    if int(stats[1]) != agents:
        errors.append(f"{page}: says {stats[1]} agents, plugin has {agents}")

# Prose that names the full kit's skill count (README is left out: it quotes past versions).
for doc in ["docs/INSTALL-AI-TOOLS.md", "docs/kit/DIRECTORY-SUBMISSION-MAKERLINE.md"]:
    text = (kit / doc).read_text(encoding="utf-8")
    for n in re.findall(r"\b(\d+) skills\b", text):
        if int(n) not in allowed:
            errors.append(f"{doc}: says {n} skills, plugin has {skills}")

if errors:
    print("site counts: FAIL"); print("\n".join(errors)); sys.exit(1)
print(f"site counts: ok ({skills} skills, {agents} agents)")
PY
