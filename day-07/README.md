# Day 07 — Personal Expense Tracker (CLI)

**What I built:** A terminal-based CLI Personal Expense Tracker that reads and writes records to a local CSV database file (`expenses.csv`), with features to log items, aggregate category spending, and ranks top transactions.

**What broke:** If the CSV file was read when empty, the columns lost their data types (like Amount changing from numeric to character), which broke mathematical operations. Fixed by forcing type-casting with `as.numeric()` and initializing headers with empty columns.

**What I learned:**
- Automating database schema creation dynamically using `file.exists()` checks
- Reading, expanding, and flushing datasets back to persistent disk files
- Aggregating numbers by group criteria using R's built-in `aggregate()` tool
- Sorting and ranking rows using multi-column sorting vectors with `order()`

**Run it:**
```bash
Rscript personal_expense_tracker.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
