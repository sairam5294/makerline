# Graphify trial protocol

Question: on a code-heavy project, does adding a Graphify code graph to the shared context lower MakerLine's token share **without** losing recall? Adopt it in `project-setup` as recommended only if both hold. Setup and when to use it: `plugin/skills/project-setup/references/graphify.md`.

## Run

Use the context-recovery setup (`context-recovery/README.md`): a fresh tool, the same 10 questions, the same model, one product with several apps or repos.

| Arm | Context given |
|---|---|
| A | `CONTEXT_INDEX.md` only (today's default) |
| B | `CONTEXT_INDEX.md` + `graphify-out/GRAPH_REPORT.md` + the `graphify` CLI |

Add 3–5 code-navigation questions to the 10 (e.g. "which function writes the order status?", "what breaks if the payments table renames a column?", "where is the partner app's auth handled?"), answered from the code by hand first.

Record per arm, in `results.md`: total tokens, harness, MakerLine's share, tool calls, files read, time, score out of 13, wrong claims, plus the one-off graph build cost (tokens, minutes).

## Decision rule

- Adopt (Graphify recommended for multi-app projects) if arm B's share is ≥ 20% lower **and** its score is equal or higher with 0 new wrong claims.
- Otherwise keep it optional and log the result here.

## Results

| Date | Project | Arm | Share | Calls | Score /13 | Wrong | Build cost | Notes |
|---|---|---|---|---|---|---|---|---|
| 2026-11-04 | Tindi monorepo (3 apps, 66 Edge Functions, 129 code files) | A: index | 81.6k total | 7 | 5/5 | 0 | — | 21 s |
| 2026-11-04 | same | B: index + graph | 94.7k total (+16%) | 7 | 5/5 | 0 | 2 s, 0 model tokens (1,241 nodes; 27 KB report) | 19 s; read the 27 KB report up front |

**Verdict (2026-11-04): not adopted.** Same accuracy, same tool calls, 16% *more* tokens: reading `GRAPH_REPORT.md` cost more than the few `rg` searches the index-led arm needed. `graphify benchmark` claimed 41x on this repo, but that compares with reading all the code, which no MakerLine run does. Ran 5 code-navigation questions only (the 10 context questions don't touch code, and a code-only graph can't change them); one run per arm, Sonnet-class model, same harness — treat as a first signal. Re-test when a repo is about 10x bigger, or by skipping the report and calling `graphify query` directly.

Earlier proxy (2026-11-03): 36 kit code files → 4 KB report, 0 model tokens; `graphify benchmark` 4.7x vs reading all the code.
