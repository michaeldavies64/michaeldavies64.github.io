# Michael Davies: portfolio

The source for my data science portfolio, live at **[michaeldavies64.github.io](https://michaeldavies64.github.io/)**.

I'm a senior data scientist in elite football. The portfolio shows how I take a question from framing to an answer people can use, across three kinds of work.

## What's in it

**[Performance Questions](https://michaeldavies64.github.io/performance-questions.html)**: questions raised by practitioners in their day-to-day work, answered to change how they do their job.
- [Rebuilding match physical insight after relegation](https://michaeldavies64.github.io/projects/performance/rebuilding-match-insight/): a contextualised GPS pipeline that replaced a lost league data feed and cut report turnaround from 10 to 12 hours to within 2.

**[Research Questions](https://michaeldavies64.github.io/research-questions.html)**: questions that start from the data, where the work is choosing and checking the right model.
- Bayesian team ratings and season simulation in rugby (in progress).

**[Products](https://michaeldavies64.github.io/products.html)**: self-serve tools and the systems behind them.
- [Building a player load monitoring tool](https://michaeldavies64.github.io/projects/products/load-monitoring/): an R and Shiny app with adaptive normal ranges. [Open the app](https://connect.posit.cloud/michael-davies-personal/content/01a1595f-e7f0-b63f-d2cf-a1ced13e3f21) · [code](https://github.com/michaeldavies64/load-recovery-monitoring)
- [Slate and Signal](https://michaeldavies64.github.io/projects/products/slate-and-signal/): the design system behind every chart, app and deck here.

## How it's built

Written in R and Quarto and styled with Slate and Signal. Pushing to `main` runs a GitHub Action that renders the site and publishes it to GitHub Pages. R code runs locally only (`freeze: auto`), and the saved results in `_freeze/` are what GitHub uses.

<details>
<summary>Notes for maintaining the site</summary>

- **Publish:** render locally (`quarto render`), commit everything including `_freeze/`, and push to `main`.
- **Add a project:** create `projects/<section>/<name>/index.qmd` with `title`, `description`, `date`, `categories` and `image: thumbnail.png`, and add a `thumbnail.png`. It appears on its section page and the home page automatically. `draft: true` keeps a page off the live site.
- **Charts:** `source("R/theme_md.R")`, then add `theme_md()` and `md_highlight("name")` to any ggplot. Grey for context, teal for the one thing that matters, and titles that state the takeaway.

</details>

Connect on [LinkedIn](https://www.linkedin.com/in/michael-davies-4505b8114).
