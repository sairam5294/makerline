# Connectors

## How tool references work

Skill files use `~~category` as a placeholder for whatever tool you connect in that category. Every Idea Pack skill works **standalone** — your words and the web are enough. Connectors are optional; connecting is your choice, per tool, under the plugin's **Connectors** tab. `.mcp.json` switches on GitHub and Figma only. For the others below, add the server to your project's `.mcp.json` (URLs are in the full kit's CONNECTORS.md) or, for Gmail, Google Calendar and Google Drive, use the Claude app's own Google connectors. Any MCP server in the same category works.

**Context sweep:** with email, cloud storage or chat connected, new-idea and evaluate-idea first search them for the idea's name (≤ 3 searches each, ≤ 5 items opened), pre-fill what they find, cite items by type, date and role (never names or message bodies), and end with a *"Used: …"* line.

## Connectors the Idea Pack can use

| Category | Placeholder | Suggested server | Used by | The kit reads | The kit may write (only when you ask) | Never |
|---|---|---|---|---|---|---|
| Knowledge base | `~~knowledge base` | Notion | new-idea, evaluate-idea | pages you share with the integration (prior research, notes) | a page you ask for (e.g. the one-pager) | edit or delete existing pages |
| Design | `~~design` | Figma | design-direction | frames and screenshots you point to | a new wireframe file you name | change or delete your existing frames |
| Source control | `~~source control` | GitHub | evaluate-idea (existing product) | the README and STATUS of a repo you name | — | push, open PRs, change settings |
| Email | `~~email` | Gmail | new-idea, validate-idea | threads matching the idea's name (notes, feedback) | an interview-invite **draft** | send email, store addresses or message bodies |
| Cloud storage | `~~cloud storage` | Google Drive | new-idea, evaluate-idea | docs and decks matching the idea or that you name | — | edit, share or delete files |
| Calendar | `~~calendar` | Google Calendar | validate-idea | free/busy for interview slots | a suggested slot you confirm | invite people without asking |
| Chat | `~~chat` | Slack | new-idea | channels you name or that match the idea | — | read DMs, post anything |

Placeholders other skills mention (hosting, database, project tracker, analytics) belong to the full MakerLine's build phases; the Idea Pack never uses them.

## What the Idea Pack runs and sends

- **Files:** reads and writes only `docs/product/` and `design/` in the folder you connect.
- **Web:** search queries about your idea's market and competitors go to the search tool built into Claude.
- **Shell:** one local script, `check_idea_pack.py`, which checks the documents it wrote. No network access.
- **No servers of its own, no telemetry, no accounts.** Connectors run under your own account, with the limits above.

## Rules

- Secrets, keys and anyone's personal data never go into prompts or documents.
- If a connector isn't available, the skill says so once and continues standalone — it never asks you to connect one.
