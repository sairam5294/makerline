# Weekly industry watch — scheduled-task prompt (copy, fill the <...>, paste when creating the task)

```
You maintain the Industry Brain for <industry scope> at <path to portfolio/industries/<industry>.md> (repo <owner/repo>, branch main).

Every Monday:
1. Read only the Brain's Players, Rules and Sources tables and the first 20 rows of the Signals log. Do not read anything else and do not use memory tools.
2. Search the last 7 days (≤ 8 searches, ≤ 4 page reads): [Release] changelogs and release notes of the players; [Hiring] their job ads ("Signal: likely building <X>"); [Complaint] themes seen 2+ times in recent 1–2 star reviews (no reviewer names); [Money] funding, acquisitions, pricing changes; [Rule] new laws, standards, platform rules.
3. Append new rows at the TOP of the Signals log: Date | Source (tier) | What happened | Why it matters (one line, plain words) | Thesis affected (ID, supports/weakens) | Verified? (yes only if you opened the primary or company page). Never edit or repeat existing rows. Vendor numbers labelled.
4. If a signal clearly supports or weakens a thesis, add a dated line under the Theses table proposing a confidence change (don't change the number yourself).
5. Commit on a branch watch/<Mon>-<DD> and open a pull request (REST API) titled "watch: <industry> week of <date>" with a 5-line summary: each item in one line, then the 1–2 that matter most, or "No notable industry news this week". Message no one and change nothing else.
```
