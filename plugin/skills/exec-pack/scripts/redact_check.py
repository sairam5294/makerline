#!/usr/bin/env python3
"""Make and check client-tier versions of MakerLine documents.

    redact_check.py make  <file.md>          write <file>.client.md without <!-- internal --> blocks
    redact_check.py check <file.client.md>   exit 1 on leftovers that must not leave the workspace

`check` reads the nearest docs/product/ENGAGEMENT.md for its "Do not mention" list.
No network, standard library only.
"""
import pathlib
import re
import sys

INTERNAL = re.compile(r"<!--\s*internal\s*-->.*?<!--\s*/internal\s*-->\s*", re.S | re.I)
EMAIL = re.compile(r"\b[\w.+-]+@[\w-]+\.[\w.-]+\b")
PHONE = re.compile(r"(?<![\w-])\+?\d[\d\s-]{8,}\d\b")
MONEY_WORDS = re.compile(r"(margin|rate card|day rate|hourly rate|salary|salaries|cost to us|our cost|markup)", re.I)
MONEY = re.compile(r"([₹$€£]\s?\d|\d\s?(k|K|lakh|crore|USD|INR|EUR))")


def engagement_terms(start: pathlib.Path) -> list:
    for parent in [start.parent, *start.parents]:
        f = parent / "docs" / "product" / "ENGAGEMENT.md"
        if not f.exists():
            f = parent / "ENGAGEMENT.md"
        if f.exists():
            text = f.read_text(encoding="utf-8")
            m = re.search(r"^## Do not mention.*?\n(.*?)(?=^## |\Z)", text, re.S | re.M)
            if not m:
                return []
            terms = []
            for ln in m.group(1).splitlines():
                t = re.sub(r"^[-*]\s*", "", ln).strip()
                if not t or t.startswith(("<", "(", "#")):
                    continue
                t = re.split(r"\s+[(—–-]\s*|\s*[(—–:]", t, maxsplit=1)[0].strip(" ,;")  # drop "(note)" or "— note"
                terms += [x.strip() for x in t.split(",") if x.strip()]  # "Acme, Project Falcon" → two terms
            return terms
    return []


def make(path: pathlib.Path) -> pathlib.Path:
    out = path.with_name(path.stem + ".client.md")
    out.write_text(INTERNAL.sub("", path.read_text(encoding="utf-8")), encoding="utf-8")
    return out


def check(path: pathlib.Path) -> list:
    text = path.read_text(encoding="utf-8")
    problems = []
    if re.search(r"<!--\s*/?internal\s*-->", text, re.I):
        problems.append("internal marker left in the file")
    for term in engagement_terms(path.resolve()):
        if re.search(re.escape(term), text, re.I):
            problems.append(f"mentions a Do-not-mention term: {term}")
    for n, line in enumerate(text.splitlines(), 1):
        if EMAIL.search(line):
            problems.append(f"line {n}: email address")
        if PHONE.search(line):
            problems.append(f"line {n}: phone number")
        if MONEY_WORDS.search(line) and MONEY.search(line):
            problems.append(f"line {n}: internal money detail ({MONEY_WORDS.search(line).group(0)})")
    return problems


def main() -> None:
    if len(sys.argv) != 3 or sys.argv[1] not in ("make", "check"):
        sys.exit(__doc__)
    path = pathlib.Path(sys.argv[2])
    if sys.argv[1] == "make":
        out = make(path)
        problems = check(out)
        print(f"wrote {out}")
    else:
        problems = check(path)
    if problems:
        print("Not safe to share:\n  " + "\n  ".join(problems))
        sys.exit(1)
    print("redaction check: clean")


if __name__ == "__main__":
    main()
