# Day 15 — Iris Explorer

**What I built:** A statistical graphics pipeline using `ggplot2` to analyze the classic `iris` flowers database, exporting 4 distinct diagnostic plots: a scatter plot, histogram, bar chart, and boxplot.

**What broke:** Visualizations wouldn't render or save properly because `ggplot2` outputs are abstract objects. Fixed by wrapping the calls with `ggsave()` and explicitly specifying parameters like dimensions and resolution (DPI).

**What I learned:**
- Mapping coordinates and categories using aesthetic definitions with `aes()`
- Adding geometric shapes like `geom_point()`, `geom_histogram()`, `geom_bar()`, and `geom_boxplot()`
- Customizing legend elements, titles, and layout grids with `labs()` and `theme_minimal()`
- Exporting plots to file folders programmatically using `ggsave()`

**Run it:**
```bash
Rscript iris_explorer.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
