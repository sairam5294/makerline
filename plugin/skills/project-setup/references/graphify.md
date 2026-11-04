# Optional: a knowledge graph of the repo (Graphify)

[Graphify](https://github.com/Graphify-Labs/graphify) (Apache-2.0) turns a repo into a queryable graph, so an AI tool can ask "what calls X" or "how does A reach B" instead of reading files. **MakerLine's default stays `CONTEXT_INDEX.md` + the context pack** (measured 17–22k tokens, 10/10 recall in `evals/TOKEN-METRICS.md`). Graphify is an add-on for **code-heavy** projects only.

## When it's worth it

| Project | Use Graphify? | Why |
|---|---|---|
| Mostly docs (an Idea Pack, the kit itself) | **No** | Markdown extraction needs model calls (tokens up front); the index already points at sections. The project itself reports ~1x savings on small corpora. |
| One small app (< ~30 code files) | Not yet | Reading the 2–3 files a task touches is cheaper than building a graph. |
| Several apps or repos, hundreds of code files (e.g. customer + partner + admin apps) | **Trial it** | Code extraction is local and free (tree-sitter, no model calls); the report is a cheap map. |

Measured in the kit (2026-11-03, graphify 0.9.101): 36 code files from `scripts/` + the web starter (~191 KB) → `GRAPH_REPORT.md` of 4 KB, 222 nodes, built in seconds with 0 model tokens; `graphify benchmark` estimated 4.7x fewer tokens per query (2.5x–32x by question) against reading all ~14,800 tokens of that code. That compares with reading everything, not with the index, and says nothing about answer quality — the real test is `evals/GRAPHIFY.md`.

## Setup (owner runs it; needs Python 3.10+)

```bash
pipx install graphifyy        # package name has two y's; the command is `graphify`
graphify install              # adds the /graphify skill for Claude (use --platform cursor|codex too)
graphify update .             # code only, no model calls → graphify-out/
```

- Add `graphify-out/` to `.gitignore` (the graph is rebuilt, not reviewed; `graph.json` is large). Keep secrets out: Graphify skips what `.gitignore` skips by default; add anything else private (exports, data folders) to a `.graphifyignore`.
- Optional: `graphify hook install` rebuilds the code graph after each commit, checkout and merge (`graphify hook status` to check).
- Docs, PDFs and images (`/graphify .` inside the AI tool) use model calls — only when the eval shows it pays.

## How AI tools use it (add to AGENTS.md "Read first" when adopted)

1. `CONTEXT_INDEX.md` row for the task, as always.
2. For "where is / what calls / what breaks if": read `graphify-out/GRAPH_REPORT.md` (never `graph.json` whole), then `graphify explain "<symbol>"` or `graphify path "A" "B"`, then open only the files it names.
3. A stale graph (older than the last commit touching code) → `graphify update .` first.
