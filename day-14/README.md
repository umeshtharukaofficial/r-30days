# Day 14 — Public Dataset EDA

**What I built:** A data profiling and cleaning pipeline using `dplyr` and `tidyr` on the built-in `airquality` dataset, outputting five distinct monthly aggregated summary metrics and writing a cleaned CSV file.

**What broke:** Standard date constructors in R require years. Concatenating `Month` and `Day` without a year threw syntax issues. Fixed by appending a placeholder year `"1973"` inside `as.Date()` (the actual year the data was collected).

**What I learned:**
- Spotting column-wise missing numbers using `colSums(is.na())`
- Dropping rows with specific target missing fields using `drop_na()`
- Creating fully typed `Date` columns from multiple numerical dimensions
- Performing multi-metric grouped reductions and exporting clean files

**Run it:**
```bash
Rscript public_dataset_eda.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
