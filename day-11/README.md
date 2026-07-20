# Day 11 — Weather Wide to Long

**What I built:** A weather reshaping script that converts wide multi-metric datasets into tidy, long-form tables using the `tidyr` package.

**What broke:** When running `separate()` on temperature ranges (e.g. `31.2/24.5`), separating them split them into text strings instead of numbers. Fixed by appending a `mutate()` step that explicitly casts the character splits to numeric using `as.numeric()`.

**What I learned:**
- Pivoting columns to rows with `pivot_longer()` and back with `pivot_wider()`
- Splitting compound variables using `separate()`
- Concatenating multiple attributes using `unite()`
- Building clean data frames adhering to "tidy data" principles (one observation per row, one variable per column)

**Run it:**
```bash
Rscript weather_reshape.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
