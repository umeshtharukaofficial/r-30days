# Day 20 — R Markdown Sales Report

**What I built:** An automated document reporting pipeline centered around `sales_report.Rmd` that knits data summaries, Markdown text, YAML metadata headers, and 3 embedded `ggplot2` graphics into HTML using `knitr` and `rmarkdown`.

**What broke:** Code chunks were throwing output warnings and verbose message logs directly into the rendered report layout. Fixed by declaring chunk options `{r setup, include=FALSE}` and setting `knitr::opts_chunk_set(echo = TRUE, warning = FALSE, message = FALSE)`.

**What I learned:**
- Setting up YAML document header options like themes and floating tables of contents
- Controlling code execution output behavior using `knitr` chunk flags
- Formatting structured summary tables in Markdown with `knitr::kable()`
- Rendering dynamic Markdown documents programmatically using `rmarkdown::render()`

**Run it:**
```bash
Rscript render_report.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
