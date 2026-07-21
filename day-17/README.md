# Day 17 — Stock Price Viewer

**What I built:** A time-series financial analysis script that simulates 1 year of daily stock prices for 3 tickers, computes 7-day and 30-day moving averages, and generates an annotated `ggplot2` chart saved to `plot.png`.

**What broke:** Environments lacking the `zoo` package would fail on `zoo::rollmean()`. Fixed by writing a safe wrapper `calc_ma()` with a base R fallback using `stats::filter()`.

**What I learned:**
- Generating geometric random walks for price simulations with `cumprod()` and `rnorm()`
- Computing rolling averages using `zoo::rollmean()` or base R `stats::filter()`
- Adding callout points and labels to specific coordinates using `annotate()`
- Structuring multi-line series legends using `scale_color_manual()`

**Run it:**
```bash
Rscript stock_price_viewer.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
