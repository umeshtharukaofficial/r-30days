# Day 04 — Unit Converter Toolkit

**What I built:** A functional utility toolkit in R containing conversions for temperature, distance, weight, currency conversion (with default exchange rates), and BMI calculator.

**What broke:** Attempting to assign variable names inside a function that matched global variable names caused confusion about local vs. global environment scope. Fixed by keeping function assignments strictly local and using explicit `return()` calls.

**What I learned:**
- Defining functions using the `function()` keyword and passing arguments
- Setting up optional parameters with default values (e.g., currency exchange rates)
- Using `return()` to explicitly pass calculations back to the caller
- Ensuring parameter safety checks using control structures like `stop()` to prevent division by zero

**Run it:**
```bash
Rscript unit_converter_toolkit.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
