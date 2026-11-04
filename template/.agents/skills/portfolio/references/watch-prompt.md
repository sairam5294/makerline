# Industry watch prompt (weekly scheduled task)

Fill in each `<...>`, then paste the block as the prompt of a weekly scheduled task.

```
Job: keep the Industry File for <industry scope> up to date. File: <path to portfolio/industries/<industry>.md>. Repo: <owner/repo>, branch main.

Each week:

Read
- From the file, open only these tables: Players, Rules, Sources, and the newest 20 rows of Dated signals. Skip every other file and any memory tools.

Search (news from the past 7 days only; at most 8 searches and 4 full page reads)
- What the players shipped: changelogs, release notes.
- What they are hiring for: if a job post points to a new product, write "Likely building <X>".
- What their users complain about: a theme must show up in at least two recent low-star reviews. Never name a reviewer.
- Money moves: raises, acquisitions, price changes.
- Rule changes: laws, standards, app store or platform policy.

Write
- Add each new finding as a row at the top of Dated signals, in this column order:
  Date | Source (tier: evidence / reported / own users) | What happened | Why it matters | Prediction affected (P-<code>-NN, supports or weakens) | Verified?
- "Why it matters" is one plain sentence. Mark any figure a vendor gives about itself as a vendor claim.
- Verified? is "yes" only when you opened the original page yourself; otherwise "no".
- Leave older rows exactly as they are, and skip anything already logged.
- When a finding clearly moves a prediction, add a dated note below the Predictions table suggesting the new confidence. Do not change the confidence yourself.

Deliver
- Commit on a new branch named watch/<Mon>-<DD> and open a pull request (REST API) titled "watch: <industry> week of <date>".
- Pull request body, five lines at most: one line per finding, then the one or two that matter most. If nothing qualified, write only "Quiet week: nothing worth logging".
- Contact nobody and touch no other file.
```
