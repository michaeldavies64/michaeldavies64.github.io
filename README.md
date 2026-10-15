# Michael Davies — portfolio

Personal portfolio built with R and Quarto, styled with the Slate and Signal design system, and published with GitHub Pages at **https://michaeldavies64.github.io**.

## Before the first publish

Replace `YOUR-LINKEDIN` with your LinkedIn profile URL in `_quarto.yml` (navbar icon) and `about.qmd` ("Get in touch").

## Publish to GitHub Pages

1. Open `michaeldavies64.github.io.Rproj` in RStudio and render once: **Build → Render Website**, or `quarto render` in the terminal. This updates `_freeze/`, which holds the results of the R code.
2. Commit everything (including `_freeze/`) and push to the `main` branch of `michaeldavies64/michaeldavies64.github.io`.
3. The GitHub Action in `.github/workflows/publish.yml` renders the site and pushes it to a `gh-pages` branch.
4. First time only: in the repository, go to **Settings → Pages**, set **Source** to "Deploy from a branch", choose `gh-pages` and `/ (root)`, and save.

The site is live at https://michaeldavies64.github.io a minute or two later. Every push to `main` republishes it.

## How R code is handled

`freeze: auto` means R chunks run only on your machine, when the page changes. GitHub uses the saved results in `_freeze/`, so it never needs R or your packages. **After editing a page with R code, render locally and commit `_freeze/` too.**

## Structure

```
├── _quarto.yml                 # site settings, navbar, theme
├── index.qmd                   # home
├── about.qmd                   # about / CV
├── performance-questions.qmd   # section page with a listing of projects/performance/
├── research-questions.qmd      # section page with a listing of projects/research/
├── products.qmd                # section page with a listing of projects/products/
├── projects/
│   ├── performance/optical-to-gps/   # draft
│   ├── research/rugby-ratings/       # draft
│   └── products/
│       ├── player-profile/           # draft
│       └── slate-and-signal/         # published case study
├── R/
│   ├── theme_md.R              # ggplot2 theme: theme_md(), md_highlight(), scales
│   └── make_thumbnails.R       # regenerates listing thumbnails
├── styles/                     # Slate and Signal light and dark themes
└── images/                     # logo mark and favicon
```

## Adding a project

1. Create a folder under the right section, e.g. `projects/research/my-project/`, with an `index.qmd`.
2. Give it `title`, `description`, `date`, `categories` and `image: thumbnail.png` in the header, and put a `thumbnail.png` in the folder.
3. It appears automatically on its section page and on the home page.

Pages marked `draft: true` are left off the published site. The three unfinished projects are drafts with a section skeleton; fill them in and delete the `draft: true` line to publish. When you publish one, remove its "In progress" card from the section page.

## Style rules

Grey (`context`) for everything except the one thing that matters, which is signal teal. Chart titles state the takeaway. In R, `source("R/theme_md.R")` then add `theme_md()` and `md_highlight("name")` to any ggplot.
