# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A **Claude Design canvas** project for "Vinotéka u Mazlíka," a wine shop and wine bar in Hradec Králové, Czech Republic. Content is in Czech. There is no build, test, or lint tooling in this repo — it's a set of static, self-contained artboard files that render directly in a browser via a small custom-element runtime.

## Structure

This is deployed on **GitHub Pages** (repo `maxkunc/vinotekaumazlika`, served from `main` / root), so each page lives as `index.html` inside a route directory instead of a bare `*.dc.html` file at repo root — GitHub Pages resolves `/admin`, `/gdpr`, `/kamery` to `<dir>/index.html` automatically:

- `index.html` (repo root) — the marketing homepage at `/` (nav, hero, product category sections, partners, contact/footer).
- `admin/index.html` — admin view at `/admin`.
- `gdpr/index.html` — GDPR/privacy page at `/gdpr`.
- `kamery/index.html` — camera system page at `/kamery`.

Every page still carries the original `.dc.html` scaffolding (`<x-dc>`, `<helmet>`, etc.) — only the filename/location changed, so the runtime and design-system links below still apply. Because the three sub-pages sit one directory deep, their `assets/`, `_ds/`, `support.js`, `image-slot.js` references are prefixed `../`, and cross-page links use relative paths (e.g. `../gdpr/`, `../` back to home) — keep this in mind when copy-pasting markup between pages, and never re-introduce a root-relative (`assets/...` without `../`) or old `*.dc.html` filename link inside a sub-page.

- `support.js` — **generated** runtime for the `<x-dc>` custom element that powers every page. Header comment: `GENERATED from dc-runtime/src/*.ts — do not edit. Rebuild with 'cd dc-runtime && bun run build'.` The `dc-runtime` source isn't part of this repo — treat this file as vendored/read-only.
- `image-slot.js` — the `<image-slot>` custom element (user-fillable image placeholder), copied from a starter scaffold. Marked `@ds-adherence-ignore`; re-running the starter copy overwrites this file, so don't hand-tune it beyond what the component's own usage doc (in its header comment) allows.
- `_ds/vinot-ka-u-mazl-ka-design-system-.../` — the design system consumed by every page:
  - `tokens/` — `colors.css`, `typography.css`, `spacing.css` (incl. radius/shadow/motion), `fonts.css` (`@font-face`), `base.css` (resets).
  - `styles.css` — root stylesheet importing all tokens.
  - `_ds_bundle.js` — compiled component bundle (Button, IconButton, Badge, Input, Select, QuantityStepper, ProductCard, NavBar, Footer — see `_ds_manifest.json` for the full list and `readme.md` in that folder for authored guidance).
  - `_adherence.oxlintrc.json` — lint config used by the design-system tooling to check adherence to tokens (not a general project linter).
  - `readme.md` — the authored design-system brief: brand voice, color/type/spacing rules, iconography, imagery mood. **Read this before making any visual or copy change** — it documents deliberate constraints (e.g. no emoji, pill-only corner radii, wine-red as the only brand hue, Vinoteka script font reserved for accent words only).
- `assets/` — production image/logo assets referenced by the artboards (`src="assets/..."`).
- `uploads/` — original source uploads (mockup reference screenshot, partner logos, price list, a text brief `vinoteka_u_mazlika_web_prompt.txt`) that assets/ was derived from. Treat as reference material, not something the pages load directly.

## Working with `.dc.html` files

- Each file is a full HTML document whose `<body>` is a single `<x-dc>` element; `support.js` parses and renders its contents (including `{{ expression }}` bindings like `{{ toggleMenu }}`, `{{ menuDisplay }}` seen in the nav). Don't rewrite this scaffolding (`<!DOCTYPE html>`, `<script src="./support.js">`, the `<x-dc><helmet>...</helmet>` wrapper) — edit the markup inside it.
- Styling is inline `style="..."` attributes using CSS custom properties from the design system (e.g. `var(--color-brand)`, `var(--space-6)`, `var(--radius-full)`) rather than utility/CSS classes. Follow this pattern for consistency — reach for a design-system token first, a raw value only when the token set has no match.
- Sections carry `id` (anchor targets for nav links, e.g. `#stacena-vina`) and `data-screen-label` (human-readable label) attributes — keep both in sync when adding/renaming sections.
- Icons are Lucide SVGs loaded from `https://unpkg.com/lucide-static@latest/icons/*.svg` (per the design-system readme's substitution note) — follow the same source for new icons unless real brand icon assets are supplied.
- Copy tone (Czech): warm, hospitable, boutique — see the "Content fundamentals" section of `_ds/.../readme.md` before writing new copy (avoid discount/bulk language, no emoji, sentence-case headlines).

## Running / previewing

Opening a page as a bare `file://` URL only renders a static snapshot (the `<x-dc>` runtime needs an HTTP origin). Use the `vinotka-static` launch config (`.claude/launch.json`, a dependency-free PowerShell `HttpListener` script) to serve the project at `http://localhost:8791` with GitHub-Pages-style routing (`/admin`, `/gdpr`, `/kamery` resolve to that directory's `index.html`, with or without a trailing slash).
