# ============================================
#  Tweet Cleaner  —  Day 12 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: stringr, text preprocessing, word counts, regex
# ============================================

# install.packages("stringr")

library(stringr)

# 1. Inline sample vector of 20 realistic tweets
tweets <- c(
  "Learning R is awesome! #RStats #DataScience",
  "R scripting is fun but index starts at 1. Still loving it!",
  "Great tutorial on tidyverse and dplyr pipelines. #rstats",
  "What is the best package for data cleaning? #stringr or #dplyr?",
  "Check out my new repo on GitHub: https://github.com/umesh/r-30days",
  "Is python better than R? No way! #rprogramming is great.",
  "Working on a dataset with missing values. na.omit() saved my day.",
  "Highly recommend learning R for statistical analysis. #DataAnalytics",
  "Just launched Day 12 of my 30-day R challenge! #100DaysOfCode",
  "Regex in R is simpler with stringr package. str_replace_all is cool.",
  "How to convert character to date in R? Use lubridate!",
  "ggplot2 visualizations are stunning. Best plotting package out there.",
  "Simple text mining in R starts with parsing word arrays.",
  "Cleaning tweets for sentiment analysis is a common task. #NLProc",
  "Check my bio calculator from Day 01: https://tinyurl.com/r-bio-calc",
  "Had a strange bug with cut() intervals, fixed it using right=FALSE. #RStats",
  "Functions in R are first-class citizens. Toolkit built!",
  "Combining data frames using inner_join and left_join works like magic.",
  "Tidy data makes plotting and modelling incredibly simple.",
  "Finished writing my Tweet Cleaner script today! #BuildInPublic"
)

cat("=========================================\n")
cat("            TWEET CLEANER (STRINGR)      \n")
cat("=========================================\n\n")

cat("Original Sample Tweets (First 3):\n")
print(head(tweets, 3))

# 2. Cleaning function using stringr string manipulations
clean_tweet <- function(text_vector) {
  cleaned <- text_vector %>%
    # Convert to lowercase
    str_to_lower() %>%
    # Remove URLs
    str_replace_all("https?://\\S+", "") %>%
    # Remove user mentions (@username)
    str_replace_all("@\\w+", "") %>%
    # Remove hashtags (#tag) but keep the word or strip them entirely
    str_replace_all("#\\w+", "") %>%
    # Remove punctuations and digits
    str_replace_all("[[:punct:]|[:digit:]]", "") %>%
    # Strip extra whitespace
    str_squish()
  
  return(cleaned)
}

# 3. Apply cleaning pipeline
cleaned_tweets <- clean_tweet(tweets)

cat("\nCleaned Tweets (First 3):\n")
print(head(cleaned_tweets, 3))

# 4. Tokenization & Word frequency calculations
cat("\nTop 20 Word Counts across all sample tweets:\n")
cat("--------------------------------------------\n")

# Combine all cleaned tweets into a single text block and split by space
words <- str_split(cleaned_tweets, "\\s+") %>% unlist()

# Filter out empty words
words <- words[words != ""]

# Compute word frequencies
word_freq <- data.frame(Word = words, stringsAsFactors = FALSE) %>%
  group_by(Word) %>%
  summarise(Count = n(), .groups = "drop") %>%
  arrange(desc(Count)) %>%
  head(20)

print(word_freq)
