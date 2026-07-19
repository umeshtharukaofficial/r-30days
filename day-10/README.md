# Day 10 — Students x Courses

**What I built:** A relational data joining demo that maps students, course registration logs, and catalog details using various `dplyr` join commands (`inner_join`, `left_join`, `anti_join`).

**What broke:** Attempting to join data frames when columns had different cases (like `studentID` vs `StudentID`) threw errors. Fixed by standardizing on PascalCase schema keys and explicitly setting the `by` parameter.

**What I learned:**
- Merging records with common keys using `inner_join()`
- Finding non-matching rows across datasets using `anti_join()`
- Maintaining left-hand reference tables when mapping optional keys using `left_join()`
- Combining multiple datasets sequentially with chained join pipelines

**Run it:**
```bash
Rscript students_courses.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
