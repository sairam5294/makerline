#!/usr/bin/env bash
# MakerLine plugin hook (PreToolUse: Edit|Write|MultiEdit|Bash).
# Only the owner approves an evaluation. This blocks an AI tool from:
#   - writing "Evaluation: APPROVED" into a docs/product/STATUS.md (Edit/Write/MultiEdit), judged on the
#     file as it would look after the edit, so swapping "PENDING" for "APPROVED (date)" is caught too, and
#   - doing the same through the shell (sed -i, perl -pi, echo >>, python …) or running approve.sh.
# STATUS.md is looked for at the project root and one or two folders down (a product workspace keeps
# the repo in 04_repos/<slug>/). It catches accidents and the obvious routes; it is not a security
# boundary. Projects without a docs/product/STATUS.md are never affected. Exit 2 = block.

command -v python3 >/dev/null 2>&1 || { echo "MakerLine: python3 not found, so the self-approval check is off." >&2; exit 0; }

python3 -c '
import glob, json, os, re, sys

MSG = ("Blocked: only the owner approves the evaluation. Ask them to run \"bash scripts/approve.sh\" in their "
       "own terminal (no terminal: they edit the Evaluation line in docs/product/STATUS.md themselves).")
MARK = "Evaluation: APPROVED"

def block():
    print(MSG, file=sys.stderr)
    sys.exit(2)

def read(path):
    try:
        with open(path, encoding="utf-8", errors="replace") as f:
            return f.read()
    except OSError:
        return ""

try:
    data = json.load(sys.stdin)
except ValueError:
    sys.exit(0)
tool = data.get("tool_name") or ""
ti = data.get("tool_input") or {}
if not isinstance(ti, dict):
    sys.exit(0)
root = os.environ.get("CLAUDE_PROJECT_DIR") or os.getcwd()

if tool in ("Edit", "Write", "MultiEdit"):
    path = str(ti.get("file_path") or "")
    if not re.search(r"(^|/)docs/product/STATUS\.md$", path):
        sys.exit(0)
    if not os.path.isabs(path):
        path = os.path.join(root, path)
    current = read(path)
    if MARK in current:
        sys.exit(0)                          # already approved by the owner
    edits = ti.get("edits") if tool == "MultiEdit" else [ti]
    edits = [e for e in (edits or []) if isinstance(e, dict)]
    if tool == "Write":
        after = str(ti.get("content") or "")
    else:
        after = current
        for e in edits:
            old, new = str(e.get("old_string") or ""), str(e.get("new_string") or "")
            if old and old in after:
                after = after.replace(old, new) if e.get("replace_all") else after.replace(old, new, 1)
    added = " ".join(str(e.get("new_string") or "") for e in edits) + str(ti.get("content") or "")
    if MARK in after or MARK in added:
        block()
    sys.exit(0)

if tool == "Bash":
    statuses = [p for p in [os.path.join(root, "docs/product/STATUS.md")]
                + glob.glob(os.path.join(root, "*/docs/product/STATUS.md"))
                + glob.glob(os.path.join(root, "*/*/docs/product/STATUS.md")) if os.path.isfile(p)]
    if not any(MARK not in read(p) for p in statuses):
        sys.exit(0)                          # no STATUS.md, or the owner already approved
    cmd = str(ti.get("command") or "")
    copy_ok = (r"^\s*(mkdir -p [^;&|]+&&\s*)?(cp|install|chmod)\s[^;&|]*approve\.sh[^;&|]*"
               r"(\s*&&\s*chmod[^;&|]*)?$")   # copying the script into the project is fine; running it is not
    # Running the script (as a command, after bash/sh/source, or after ; && | ( ) is blocked; naming it in
    # grep, cat or cp is not.
    runs = (r"(^|[;&|(`]|\$\()\s*(\w+=\S*\s+)*(((ba|z|da)?sh|source|exec)\s+(-\w+\s+)*|\.\s+)?"
            r"[\w./~-]*approve\.sh\b")
    if re.search(runs, cmd) and not re.search(copy_ok, cmd):
        block()
    writes = (r"sed[^|;&]*-i|perl[^|;&]*-[a-zA-Z]*i|>|tee|python|node|ruby|awk|(^|\s)(cp|mv|ed|ex|dd|truncate)\s"
              r"|git\s+(apply|checkout|restore)")
    target = re.search(r"STATUS|docs/product|ST\*|ST\?", cmd)
    if target and "APPR" in cmd and re.search(writes, cmd):
        block()
sys.exit(0)
' <<<"$(cat)"
