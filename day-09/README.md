# Day 09 — Sales Report

**What I built:** A sales analysis pipeline that generates 200 records of synthetic transactions and aggregates them using `dplyr` grouping, summarizing, and column-wise calculations with `across()`.

**What broke:** R threw a warning about group variables when summarizing without explicitly setting the `.groups` parameter. Fixed by adding `.groups = "drop"` inside the `summarise()` block.

**What I learned:**
- Generating synthetic datasets with random ranges using `set.seed()` and `runif()`
- Grouping metrics by dimensions using `group_by()`
- Running counting operations using `n()` and mathematical aggregations using `summarise()`
- Calculating functions across multiple columns simultaneously using `across()`

**Run it:**
```bash
Rscript sales_report.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
