# Handoff spec: one screen, ready for any AI tool to build

Write before building a designed screen (or after design QA finds drift), so Cursor, Codex or Claude build what was designed instead of guessing. One block per screen in `docs/product/specs/<screen-id>.md`, ≤ 250 words, tables over prose. Link the Figma frame; never paste screenshots of other products.

## Spec

| Part | What to write |
|---|---|
| **Screen** | ID and name (from DESIGN_DIRECTION's screen inventory), user story `US-xx`, Figma link |
| **Layout** | regions top to bottom; spacing and sizes as **token names** (`space-4`, `radius-md`), never raw pixels or hex |
| **Components** | each existing component with its props and variant; anything new is flagged for design-system first |
| **States** | default · loading · empty (with its copy) · error (with its copy and recovery) · offline · success; disabled controls and why |
| **Interactions** | tap/click targets, what each does, focus order, keyboard shortcuts, gestures with a non-gesture alternative |
| **Responsive** | what changes at each breakpoint or size class; Dynamic Type / 200% text behaviour |
| **Accessibility** | names and roles for icon buttons, headings order, live regions for async results, contrast-checked tokens, touch targets ≥ 44pt / 48dp |
| **Motion** | duration and easing tokens; the reduced-motion alternative |
| **Content** | final microcopy from the UX copy checklist (`../../design-direction/references/ux-copy-checklist.md`); max lengths and truncation |
| **Edge cases** | longest name, zero/one/many items, slow network, permission denied, other languages |
| **Done when** | the acceptance criteria and the design-QA checks that will be run |

Design QA then checks the built screen against this spec as well as the frame.
