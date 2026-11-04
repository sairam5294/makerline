#!/usr/bin/env python3
"""Check an Industry Brain file: due theses, stale theses, hit rate, patterns ready to move, log freshness.

    python3 scripts/brain_check.py portfolio/industries/<industry>.md [--today YYYY-MM-DD]

Reads Markdown tables; no network. Exit 1 if the file has no Theses table.
"""
import datetime as dt
import pathlib
import re
import sys

DATE = re.compile(r"\b(20\d\d-\d\d-\d\d)\b")


def tables(text: str) -> dict:
    """Return {section heading: list of row dicts} for every Markdown table under a '## ' heading."""
    out, section, header = {}, None, None
    for line in text.splitlines():
        if line.startswith("## "):
            section, header = line[3:].strip(), None
            continue
        if not line.startswith("|") or section is None:
            header = None if not line.startswith("|") else header
            continue
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        if header is None:
            header = [c.lower() for c in cells]
            continue
        if set("".join(cells)) <= set("-: "):
            continue
        out.setdefault(section, []).append(dict(zip(header, cells)))
    return out


def col(row: dict, *names: str) -> str:
    for n in names:
        for k, v in row.items():
            if n in k:
                return v
    return ""


def main() -> int:
    args = sys.argv[1:]
    today = dt.date.today()
    if "--today" in args:
        today = dt.date.fromisoformat(args[args.index("--today") + 1])
        args = [a for a in args if a not in ("--today", today.isoformat())]
    if not args:
        sys.exit(__doc__)
    text = pathlib.Path(args[0]).read_text(encoding="utf-8")
    t = tables(text)
    theses = next((rows for sec, rows in t.items() if "thes" in sec.lower()), None)
    if theses is None:
        print("No Theses table found (a '## Theses' heading with a table).")
        return 1
    log = next((rows for sec, rows in t.items() if "signal" in sec.lower()), [])
    patterns = next((rows for sec, rows in t.items() if "pattern" in sec.lower()), [])

    def row_date(r):
        m = DATE.search(col(r, "date")) or DATE.search(" ".join(r.values()))
        return dt.date.fromisoformat(m.group(1)) if m else None

    log_dates = sorted({d for d in (row_date(r) for r in log) if d and d <= today}, reverse=True)
    last = log_dates[0] if log_dates else None
    recent_ids = set()
    for r in log:
        d = row_date(r)
        if d and 0 <= (today - d).days <= 60:
            recent_ids.update(re.findall(r"TH-[A-Z0-9]+-\d+", " ".join(r.values())))

    due, stale, scored, hi = [], [], [], []
    for r in theses:
        tid, status = col(r, "id"), col(r, "status").lower()
        by = DATE.search(col(r, "by when", "when", "by"))
        conf = re.search(r"\d+", col(r, "confidence"))
        if status.startswith(("right", "wrong", "partly")):
            scored.append(status)
            if conf and int(conf.group()) >= 70:
                hi.append(status)
            continue
        if by and dt.date.fromisoformat(by.group(1)) <= today:
            due.append(f"{tid}: due {by.group(1)} — score it Right / Wrong / Partly")
        if tid and tid not in recent_ids:
            stale.append(tid)

    def rate(xs):
        if not xs:
            return "n/a"
        right = sum(1 for s in xs if s.startswith("right")) + 0.5 * sum(1 for s in xs if s.startswith("partly"))
        return f"{right / len(xs):.0%} of {len(xs)}"

    ready = [col(r, "pattern") for r in patterns if "not yet" in col(r, "status").lower() and any(
        k in " ".join(r.values()).lower() for k in ("2026", "2027", "signal"))]

    print(f"Industry Brain check — {today}")
    print(f"Signals log: {len(log)} rows; last entry {last or 'none'}" + (" — STALE (over 45 days)" if last and (today - last).days > 45 else ""))
    print(f"Theses: {len(theses)} total, {len(theses) - len(scored)} open; hit rate {rate(scored)}; at 70%+ confidence {rate(hi)}")
    print("Due for scoring:\n  " + ("\n  ".join(due) if due else "none"))
    print("Open theses with no signal in 60 days:\n  " + (", ".join(stale) if stale else "none"))
    print("Patterns marked 'Not yet' with a dated signal (candidates for 'Happening now'):\n  " + ("\n  ".join(ready) if ready else "none"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
