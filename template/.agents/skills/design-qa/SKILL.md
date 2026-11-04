---
name: design-qa
description: 'Check a built screen against its design (layout, tokens, states, responsive, dark mode, a11y) and write the screen''s handoff spec; fixes by severity.'
argument-hint: "<screen or component name, Figma frame link, or nothing for the current task's screen>"
disable-model-invocation: true
---

# /design-qa

> If you see unfamiliar placeholders or need to check which tools are connected, see [CONNECTORS.md](../../CONNECTORS.md).

Put the design and the build side by side and report every difference that matters, with the file, line and token to fix.

**Why:** a designer-owner spots visual drift instantly; this skill catches it before they have to, and names the fix in code terms.

## Usage

```
/design-qa                                   # screen of the current task
/design-qa Onboarding step 2
/design-qa https://www.figma.com/design/…    # a specific frame
```

## How it works

```
┌──────────────────────────────────────────────────────────────┐
│                        DESIGN QA                             │
├──────────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                                   │
│  ✓ Spec from DESIGN_SYSTEM.md vs a screenshot of the build   │
│  ✓ Fixed compare order: layout → spacing → type → colour →   │
│    components → states → responsive → dark mode → a11y       │
│  ✓ Findings table: Blocker / Visible / Nit, with file:line   │
│    and token name · fixes on request, re-screenshot to confirm│
├──────────────────────────────────────────────────────────────┤
│  SUPERCHARGED (when you connect your tools)                  │
│  + Design: frame screenshot, design context and variables,   │
│    Code Connect mapping to the exact code component          │
└──────────────────────────────────────────────────────────────┘
```

## Inputs

- The design: a Figma frame (start from the kit library file or the product's duplicate) or the spec in `DESIGN_SYSTEM.md`.
- The build: the app running (web or Expo web); for mobile, owner-provided simulator screenshots.
- The token set (`tokens.json` / `DESIGN_SYSTEM.md`) to name semantic tokens in fixes.
- Ask the owner for the frame or screen name if the task doesn't name one, and for simulator screenshots on mobile.

## Workflow

0. **No spec yet for this screen?** Write the handoff spec first (`references/handoff-spec.md`) so any AI tool builds the same thing; then QA against both the frame and the spec.
1. **Get the design.** Start from the kit library file or the product's duplicate; if Code Connect is published, use its component mapping to name the exact code component.
   - Figma frame via Figma MCP (screenshot + design context/variables), or the spec in `DESIGN_SYSTEM.md`.
2. **Get the build.** Run the app (web or Expo web) and screenshot the same screen at the same viewport with Playwright (a Playwright MCP if you've added one; it isn't in the kit's connectors), or ask the owner for a screenshot.
   - Mobile → owner-provided simulator screenshots.
3. **Compare in this order:** layout & hierarchy → spacing (token scale) → typography (style, weight, line height, truncation) → colour (semantic token used, not just similar hex) → components & variants → states (loading/empty/error/disabled/focus) → responsive breakpoints → dark mode → a11y (contrast, targets, focus visible).
4. **Write the findings table** (shape below). Include the two screenshots side by side when possible.
5. **Fix** Blockers/Visible issues if asked; re-screenshot to confirm.

## Output

| Column | Content |
|---|---|
| severity | Blocker / Visible / Nit |
| screen/element | where |
| design | what Figma / the spec shows |
| build | what the app shows |
| fix | file:line, token name |

Present to the owner (≤ 10 lines): the two screenshots side by side (when possible) · count per severity · the Blockers · whether you fixed them and re-screenshotted.

## If connectors available

If **~~design** is connected:
- Pull the frame screenshot, design context and variables for the exact node; use the published Code Connect mapping to name the code component.
- Start from the kit library file or the product's duplicate, never a stray copy.

## Rules

- Compare semantic tokens, not just similar hex values — a near-match colour from the wrong token is still a finding.
- Differences caused by platform conventions (iOS vs Android controls) are not bugs — note them.
- Same screen, same viewport, same state for both screenshots; otherwise the diff is noise.
- Only fix when asked; always re-screenshot after a fix.

## Tips

1. Run it right after `build-feature` for any task with a Figma frame — drift is cheapest to fix on the branch.
2. Check dark mode and the error/empty states; they are where token misuse hides.
3. For mobile, drop simulator screenshots into the chat at the same device size as the Figma frame.

## Related

- Before: `build-feature` (UI task with a Figma frame), `design-system` · After: `quality-review`
- Reads: `DESIGN_SYSTEM.md`, `tokens.json`, `../design-system/references/tokens-figma-sync.md`
