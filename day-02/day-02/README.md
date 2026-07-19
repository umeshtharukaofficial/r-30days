# Day 02 — Marks Analyzer

**What I built:** An R script that takes 10 subject marks and reports average, median, standard deviation, pass/fail counts, letter grades, and a ranked table from highest to lowest.

**What broke:** My grades looked shifted at the boundaries — I didn't realise `cut()` uses `right = TRUE` by default, so 64 was still a B and not a C. Fixed by understanding interval notation `(a, b]`.

**What I learned:**
- Vectors are R's core data structure — `c()`, `length()`, and element-wise arithmetic
- Indexing starts at **1** (not 0), and `marks[marks >= 50]` filters with a logical vector
- `which.max()` returns a **position**, not a value — combine with `names(marks)[...]` to get labels
- `sum(marks >= 50)` counts TRUEs — idiomatic "how many satisfy X?"
- `cut()` bins numbers into named categories (great for grading)
- `order()` gives sort positions so related vectors stay aligned
- `ifelse()` is a vectorised `if` — runs once per element

**Run it:**
```
Rscript marks_analyzer.R
```

**Screenshot:**
![output](screenshot.png)
