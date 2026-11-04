# Connectors

## How tool references work

Skill files use `~~category` as a placeholder for whatever tool you connect in that category — `~~source control` means GitHub, GitLab or any other repository host with an MCP server. Every skill works **standalone** without connectors; connectors add live data and let the kit act in your tools.

`.mcp.json` pre-configures the servers below; any MCP server in the same category works. Connecting is your choice, per tool, under the plugin's **Connectors** tab.

## Connectors for this plugin

| Category | Placeholder | Included server | Other options | Used by |
|---|---|---|---|---|
| Source control | `~~source control` | GitHub | GitLab, Bitbucket | build-feature, quality-review, project-setup, ship-checklist, portfolio |
| Design | `~~design` | Figma | Penpot | design-direction, design-system, design-qa, name-product (brand) |
| Hosting | `~~hosting` | Vercel | Netlify, Cloudflare | ship-checklist, post-launch, project-setup (previews, env) |
| Database | `~~database` | Supabase | Neon, Firebase | engineering-docs, build-feature, ship-checklist (RLS, backups) |
| Knowledge base | `~~knowledge base` | Notion | Confluence, Google Drive | evaluate-idea, new-idea, engineering-docs |
| Project tracker | `~~project tracker` | Linear | Jira, Asana, GitHub Issues | plan-build, build-feature, post-launch |
| Chat | `~~chat` | Slack | Microsoft Teams, Discord | new-idea, product-opportunity-review, post-launch, handoff, ship-checklist |
| Email | `~~email` | Gmail | Outlook | new-idea, validate-idea (outreach drafts), product-opportunity-review, post-launch (feedback) |
| Cloud storage | `~~cloud storage` | Google Drive | OneDrive, Dropbox, Box | new-idea, evaluate-idea, product-opportunity-review |
| Calendar | `~~calendar` | Google Calendar | Outlook Calendar | validate-idea (interview slots), post-launch (weekly review), handoff |
| Product analytics | `~~product analytics` | — | PostHog, Amplitude, Mixpanel | evaluate-idea (existing products), post-launch |
| Monitoring | `~~monitoring` | — | Sentry, Datadog | post-launch, ship-checklist |

## Context sweep: look in your own tools before asking you

When email, cloud storage, calendar or chat is connected, a skill that needs background (new-idea, evaluate-idea, validate-idea, product-opportunity-review, post-launch) first searches them **with the product's name and 1–2 key terms**, then pre-fills what it found and asks you only what's still missing.

- **Enterprise Search on?** If Anthropic's Enterprise Search plugin is installed, run the sweep through it as one search across your tools instead of one per connector; same limits and citing rules.
- **Budget:** ≤ 3 searches per connector per run, ≤ 5 items opened in total; skip at Quick depth unless you ask.
- **Read only what matches.** Never browse whole inboxes, drives or DMs; Slack only in channels you name or that match the product.
- **Cite, don't copy.** Facts go to `docs/product/research/` as `first-party` rows (research-cache.md) citing the item by type, date and role ("email from a beta user, 2026-10-12"), never names, addresses or message bodies.
- **Show your sources.** The skill's summary ends with one line: *"Used: 2 Drive docs, 1 email thread, Slack #lekka-beta · Not connected: calendar"*, so you can see where each claim came from.
- **Writes stay drafts:** an email is saved as a draft, a calendar slot as a suggestion, a Slack message only after you approve the exact words.

## What the kit reads and writes — know before you connect

The kit has no servers of its own and sends no telemetry. A connector runs under **your** account and permissions; the kit only asks it to do the things below. Reads happen when a skill needs them; every write waits for you to ask in chat.

| Connector | The kit reads | The kit may write (only when you ask) | Never |
|---|---|---|---|
| GitHub | repo files, branches, PR diffs and comments, CI status, issues | branches, commits, PRs, PR review comments, issues | merge to `main`, change repo settings or branch protection, delete branches, read secrets |
| Figma | frames, components, variables, screenshots of nodes you point to | new files and frames (wireframes, logo, tokens) in a file you name | delete or overwrite your existing frames, change sharing |
| Vercel | projects, deployments, build and runtime logs, env var **names** | a preview deployment, an env var you dictate | promote to production, read env var **values**, change domains or billing |
| Supabase | schema, RLS policies, migrations list, advisors | a migration on a **development** branch/project you confirm | run SQL on production, read user rows, change auth or billing settings |
| Notion | pages and databases you share with the integration | a page you ask for (e.g. the one-pager) | edit or delete existing pages |
| Linear | issues, projects, cycles | issues from PLAN.md tasks or review SHOULDs | close, delete or reassign others' issues |
| Chat (Slack, Teams) | messages in channels you name or that match the product, by search | a message you've approved, word for word | read DMs, browse other channels |
| Gmail | threads that match a search for the product or its users' feedback | a **draft** (interview invite, outreach) you then send yourself | send email, read unrelated mail, store addresses or message bodies |
| Google Drive | docs, sheets and decks that match a search or that you name | a doc you ask for | edit, move, share or delete your files |
| Google Calendar | free/busy and events that match the product | a suggested slot or event you confirm | invite others or change existing events without asking |
| Analytics, monitoring | aggregate metrics and error summaries | — | export or store individual users' events or personal data |

Data that leaves your machine goes only to the service you connected, under its own terms. Revoke a connector anytime in the plugin's **Connectors** tab or the service's settings.

## Rules

- Secrets, keys and users' personal data never go into prompts or documents, whatever is connected.
- A connector reads first; writes (creating tickets, pushing, deploying) happen only when you ask in chat.
- If a connector isn't available, the skill says so once and continues standalone — it never asks you to connect one.
