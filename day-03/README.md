# Day 03 — Number Guessing Game

**What I built:** An interactive terminal-based guessing game where the player has 7 attempts to guess a randomly chosen number between 1 and 100, featuring a fallback auto-guesser for non-interactive execution.

**What broke:** The script would hang or error out during automated batch execution because `readline()` was blocked waiting for user input. Fixed by adding a fallback checking if the input is `NA` and auto-generating a random guess instead.

**What I learned:**
- Using `sample(1:100, 1)` to generate a random number within a range
- Iterating with a `while` loop controlled by attempt counters and boolean flags
- Handling input conversion and safe fallback checks with `suppressWarnings(as.integer())`
- Breaking out of a loop immediately using `break` when the correct answer is found

**Run it:**
```bash
Rscript number_guessing_game.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
