# Day 13 — Habit Streak Tracker

**What I built:** A habit logging pipeline that uses `lubridate` to parse date structures, extracts calendar components, and computes consecutive completion streaks (current and max) from log vectors.

**What broke:** Attempting to extract dates using standard string slices failed when dates shifted layouts. Fixed by utilizing `lubridate` date helpers like `year()`, `month()`, and `wday()` which dynamically handle date objects regardless of raw formats.

**What I learned:**
- Extracting date sub-units like `year()`, `month()`, and `day()`
- Finding the start of calendar weeks dynamically using `floor_date(Date, unit = "week")`
- Categorizing weekday frequencies with `wday(Date, label = TRUE)`
- Implementing custom logic loop accumulators to trace consecutive run streaks

**Run it:**
```bash
Rscript habit_tracker.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
