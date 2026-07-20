# Day 12 — Tweet Cleaner

**What I built:** A text pre-processing script using the `stringr` package that cleans a vector of 20 sample tweets by removing URLs, hashtags, punctuation, and converting them to lowercase, then counts the top-20 most common words.

**What broke:** Splitting strings with standard spaces left empty character elements `""` inside the resulting token vector, which ranked as a top word. Fixed by filtering the list with `words[words != ""]` prior to aggregating.

**What I learned:**
- Manipulating character strings using tidyverse's `stringr` functions
- Writing regular expressions (Regex) to strip URLs, mentions, hashtags, and numbers
- Trimming and compressing duplicate spacing inside text blocks using `str_squish()`
- Unlisting list arrays and counting word frequencies using `group_by()` and `n()`

**Run it:**
```bash
Rscript tweet_cleaner.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
