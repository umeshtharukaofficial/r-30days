# Day 06 — CSV Explorer

**What I built:** An R script for reading and writing CSV files, performing statistical summarizing, and executing missing value filters using built-in motor trend car data.

**What broke:** When saving the row names using `write.csv()` and reading them back with `read.csv()`, R added a new column called `X` for row indices instead of converting them back to rownames. Fixed by adding `row.names = 1` inside `read.csv()`.

**What I learned:**
- Exchanging data with local files using `write.csv()` and `read.csv()`
- Inspecting datasets programmatically with `summary()` and `str()`
- Tabulating categorical distributions using `table()`
- Detecting missing entries using `is.na()` and deleting bad rows using `na.omit()`

**Run it:**
```bash
Rscript csv_explorer.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
