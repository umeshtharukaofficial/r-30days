# Day 05 — Contact Book

**What I built:** An in-memory CLI Contact Book Manager in R capable of adding, searching, removing, and summarizing personal and work contacts within structured `data.frame` objects.

**What broke:** When deleting the only contact remaining in a data frame, R subsetting would default to dropping the dimensions and converting it into a vector. Fixed by specifying `drop = FALSE` inside the brackets (e.g., `book[-match_idx, , drop = FALSE]`).

**What I learned:**
- Initializing empty typed `data.frame` tables and using `stringsAsFactors = FALSE` to prevent unexpected character-to-factor conversions
- Appending rows using `rbind()` and removing rows using negative indexing (`-index`)
- Subsetting data frames using logical expressions and dollar sign syntax (`$`)
- Leveraging structural summaries like `str()`, `head()`, and category counts with `table()`

**Run it:**
```bash
Rscript contact_book.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
