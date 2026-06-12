# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this project is

Source code for [atelier-ashe.fr](https://atelier-ashe.fr/), the portfolio website of Aurélien SUCHET Architecte. It is a [Hugo](https://gohugo.io/) static site deployed on Netlify, using a custom theme (`themes/suchet`) and managed via Netlify CMS (`static/admin/`).

## Running locally

```bash
hugo server
```

The site is built with Hugo — no npm or build step is required. Hugo must be installed separately.

## Project structure

- `config.toml` — site config: base URL, language (`fr`), title, and theme name (`suchet`)
- `content/posts/` — one Markdown file per architectural project (the portfolio entries)
- `content/` — top-level pages: `_index.md`, `presentation.md`, `contact.md`, `confidentialite.md`
- `themes/suchet/layouts/` — all HTML templates
- `static/img/upload/` — project images, tracked via **Git LFS** (Netlify Large Media)
- `static/admin/` — Netlify CMS configuration and UI

## Content (post) front matter

Every post in `content/posts/` uses these fields (defined in `static/admin/config.yml`):

```yaml
publishdate: YYYY-MM-DD
title: "…"
description: "…"         # shown as subtitle on the project page
location: "City (dept)"
client: "…"
builder: ["Aurélien SUCHET Architecte"]
period: "YYYY"
surface: "NNN m²"
cost: "…"
images:                   # paths relative to /static, e.g. /img/upload/foo.jpg
  - /img/upload/…
featured_image_id: 0      # index into images[] used as the homepage thumbnail
metadesc: "…"             # SEO meta description
```

## Images and Git LFS

Images uploaded under `static/img/upload/` are stored via Git LFS (Netlify Large Media). The LFS endpoint is configured in `.lfsconfig`. Always use `git lfs` when adding new images to that folder; do not commit raw binaries directly.

## Theme architecture

The custom theme (`themes/suchet`) is self-contained:

- `layouts/_default/baseof.html` — base shell (head + header partial + footer partial)
- `layouts/index.html` — homepage: lists the first 20 posts with lazy-loaded thumbnails
- `layouts/posts/single.html` — project detail page: PhotoSwipe image gallery + project metadata
- `layouts/partials/` — `head.html`, `header.html`, `footer.html`

Images on the live site are resized on-the-fly by Netlify's image CDN via query params (`?nf_resize=fit&w=660`). This only works in production; locally images load at full size.

## Netlify CMS

The CMS lives at `/admin` and uses `git-gateway` against the `master` branch. Field definitions in `static/admin/config.yml` must stay in sync with the front matter structure consumed by the Hugo templates.
