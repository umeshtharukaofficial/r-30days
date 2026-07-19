# Day 08 — Titanic Survival Slicer

**What I built:** A data profiling script that uses `dplyr` verbs and piping (`%>%`) to aggregate, filter, and compute survival statistics from the built-in `Titanic` survival database.

**What broke:** The built-in `datasets::Titanic` object is structured as a 4D contingency `table`, which breaks common tabular filter queries. Fixed by converting the table using `as.data.frame()` to flatten the dimensions.

**What I learned:**
- Extracting sub-records from tables using `filter()`
- Renaming and selecting specific columns using `select()`
- Sorting results in ascending or descending sequence using `arrange()`
- Creating custom calculated fields (like percentage rates) using `mutate()`
- Piping multiple operations cleanly from left to right using `%>%`

**Run it:**
```bash
Rscript titanic_survival_slicer.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
