# Day 16 — Sales Dashboard Charts

**What I built:** An advanced business graphics pipeline in `ggplot2` creating 3 sales charts: a stacked bar chart of category revenues, a faceted grid of monthly performance, and a heatmap matrix using `geom_tile()`.

**What broke:** The x-axis month labels on the small subplots overlapped and were unreadable. Fixed by slanting the text labels using `theme(axis.text.x = element_text(angle = 45, hjust = 1))`.

**What I learned:**
- Grouping sub-charts into grids using `facet_wrap()`
- Building multi-variable stacked column visualizations
- Creating density heatmaps using `geom_tile()` and custom color scales with `scale_fill_gradient()`
- Superimposing formatted revenue labels directly on matrix cells using `geom_text()`

**Run it:**
```bash
Rscript sales_dashboard_charts.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
