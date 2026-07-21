# Day 18 — Plotly Explorer

**What I built:** An interactive graphics pipeline using `plotly` and `htmlwidgets` that converts static `ggplot2` charts into interactive web widgets saved as `day-18/interactive.html`.

**What broke:** Standard `ggsave()` only outputs static image files (`.png`, `.jpg`). Fixed by leveraging `plotly::ggplotly()` to transform static ggplots and exporting them via `htmlwidgets::saveWidget()`.

**What I learned:**
- Converting static ggplot charts to HTML widgets using `ggplotly()`
- Bundling multiple interactive charts together into side-by-side grids using `plotly::subplot()`
- Saving standalone HTML files with embedded dependencies using `htmlwidgets::saveWidget()`
- Providing fallback checks for non-interactive server environments

**Run it:**
```bash
Rscript plotly_explorer.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
