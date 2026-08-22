# Vinotéka u Mazlíka — Design System

A cozy, wine-red design system for **Vinotéka u Mazlíka**, a curated wine shop and wine bar (Czech: "vinotéka" = wine boutique) offering handpicked wines, tapas, and tasting experiences. 

## Sources
- `uploads/vinoteka_u_mazlika_logo.png` — primary logo lockup (charcoal wordmark + wine-red script "u mazlíka").
- `uploads/Untitled Project - illustrationImage (2).png` — a full homepage mockup (hero, featured wines, story band, tasting experiences, Instagram strip, newsletter, footer). This is the **only source** for the marketing website — no codebase or Figma file was attached, so it is used as ground truth for layout/copy/iconography rather than a lossy high-level guide.
- `uploads/Exo/` — Exo variable + static webfont family (Google Fonts, OFL licensed).
- `uploads/Vinoteka.otf` — Vinoteka, a custom script/display font matching the logo's cursive lettering (replaces the earlier Arabella Pro placeholder).
- User-specified palette: burgundy `#AE2143`, charcoal `#2B2A29`, white `#FFFFFF`.

No GitHub repo or Figma link was provided for this brand.

## Components
`Button`, `IconButton`, `Badge` (core); `Input`, `Select`, `QuantityStepper` (forms); `ProductCard` (commerce); `NavBar`, `Footer` (navigation). See each directory's `.prompt.md` for usage.

## Intentional additions
No component source (codebase/Figma) was attached, so the standard set above was authored from scratch, sized to what the homepage mockup actually shows (wine cards, cart stepper, nav/footer, email capture) — no speculative extras like Toast, Tabs, or Dialog were added since nothing in the source calls for them.

## Index
- `styles.css` — root stylesheet, imports all tokens + fonts.
- `tokens/` — `colors.css`, `typography.css`, `spacing.css` (incl. radius/shadow/motion), `fonts.css` (`@font-face`), `base.css` (resets).
- `components/core/` — Button, IconButton, Badge.
- `components/forms/` — Input, Select, QuantityStepper.
- `components/commerce/` — ProductCard.
- `components/navigation/` — NavBar, Footer.
- `ui_kits/marketing-website/` — homepage recreation (`index.html`, `HomePage.jsx`).
- `guidelines/` — foundation specimen cards (colors, type, spacing, brand).
- `assets/logo/`, `assets/fonts/`, `assets/imagery/` — real brand files.
- `SKILL.md` — portable skill file for use in Claude Code.

## Content fundamentals
- **Voice**: warm, hospitable, second-person-lite. Copy reads like an invitation from a host, not a retailer — "Made with passion, shared with you." / "Sip. Savour. Stay connected."
- **Casing**: sentence case for body copy; short punchy headline fragments often end in a period for emphasis ("Better together.") — a deliberate, confident full stop rather than an exclamation point.
- **Person**: mostly implicit "you" — invites rather than instructs ("join us for experiences that awaken your senses"). Rarely uses "I"; never corporate "we regret to inform".
- **Tone words**: curated, handpicked, cozy, intimate, unforgettable, passion. Avoid: cheap, discount, deal, bulk — this is a boutique, not a supermarket.
- **CTAs**: short verb phrases, sentence case, no exclamation marks — "Explore Our Wines", "Our Story →", "Book Your Experience", "Join Us".
- **Emoji**: not used anywhere in the source mockup. Do not introduce emoji.
- **Vibe**: candlelit, intimate dinner-party energy — evenings shared over wine and small plates, not a big-box liquor store.

## Visual foundations
- **Color**: burgundy/wine red (`--wine-500 #AE2143`) is the singular brand color — used for the header bar, primary buttons, script accents, and banded sections. Near-black charcoal (`--charcoal-900 #2B2A29`) anchors dark surfaces (footer, ink text). A warm off-white cream (`--cream-50`) is the page background, not stark white — white is reserved for cards. No secondary hue; a muted gold (`--gold-500`) is available as a rare tertiary accent (reserva/premium flags) but is not load-bearing.
- **Type**: two-family system. **Exo** (geometric sans) carries all UI text, navigation, body copy and bold display headlines (700–800 weight, tight letter-spacing). **Vinoteka** (script/cursive) is reserved for brand-emotion accent words layered into headlines — "Better *together.*", "*shared with you.*" — never for body text or UI labels. This mirrors the logo itself (sans "VINOTÉKA" + script "u mazlíka").
- **Spacing**: generous, airy — sections use 60–96px side padding and 64px+ vertical rhythm on desktop; a 4px base scale underlies it.
- **Backgrounds**: full-bleed warm, candlelit photography (wine glasses, charcuterie, tabletop) behind hero and story sections, always with a dark gradient scrim for text contrast. No patterns, textures, or illustration beyond the thin line-art flower/bottle sketches used as decorative accents over the wine-red bands.
- **Imagery mood**: warm-toned, low-key lighting, shallow depth of field — candles, wood tables, glassware. No stock-photo brightness, no black-and-white, no heavy grain.
- **Buttons/CTAs**: full pill shape (`--radius-full`), no sharp corners anywhere on interactive controls. Primary = solid wine-red with a soft wine-tinted shadow; secondary = outlined, inverts to solid on hover; ghost = text-only with a tinted hover background.
- **Hover/press**: hover darkens the wine red one step (`--wine-600`) or fills an outline; no lightening. No press/active shrink effects observed — keep motion subtle (a same-speed background swap), not bouncy.
- **Motion**: no animation is visible in the source; treat this as a calm, static brand. Where interaction feedback is needed (toasts, hover), use short 120–200ms ease-standard transitions — never bounce/elastic easing.
- **Cards**: white surface, soft ambient shadow (`--shadow-card`), 8px corner radius, no border by default — product cards float rather than being outlined.
- **Corner radii**: pill (999px) for all buttons/inputs/chips; 8px for cards; 14px for large image/media blocks. Nothing sharp-cornered except full-bleed photo bands.
- **Transparency/blur**: only the gradient scrim over hero photography; no glassmorphism or blur elsewhere.
- **Layout**: centered content column with a sticky wine-red header; alternating full-width color bands (cream / wine-red / cream) break up long scrolls — never more than one loud color band in a row.

## Iconography
The mockup uses simple line-weight utility icons (search, account, cart/bag) in the header and small glass/bottle/charcuterie glyphs as decorative accents — no icon font or SVG sprite was included in the uploaded assets. **Lucide** (CDN, `unpkg.com/lucide-static`) is substituted as the closest same-weight, minimal-line icon set and used for the `NavBar`/`IconButton` utility icons — flagged here as a substitution. Emoji are not used. No unicode glyphs are used as icons. If real product icon assets exist, please share them so this substitution can be replaced with the real set.

## UI kit imagery note
The homepage UI kit uses `<image-slot>` placeholders (not crops of the mockup screenshot) for hero/story/tasting photography — drop real product photography in; `assets/imagery/homepage-mockup-reference.png` remains in the project purely as a layout/copy reference, not a droppable photo source.
Both fonts (Exo, Arabella Pro) were supplied directly by the user as real files — no substitution was needed.
