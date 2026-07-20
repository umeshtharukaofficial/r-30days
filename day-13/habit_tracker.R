# ============================================
#  Habit Streak Tracker  —  Day 13 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: lubridate, date calculations, intervals, streaks
# ============================================

# install.packages("lubridate")
# install.packages("dplyr")

library(lubridate)
library(dplyr)

# 1. Define synthetic habit-completion data for "Coding in R"
# We generate log dates with some breaks to simulate habits
set.seed(123)

start_date <- as.Date("2026-06-01")
days_seq <- seq(start_date, by = "1 day", length.out = 30)

# Simulate log completions (TRUE = completed, FALSE = missed)
# Setting higher probability for TRUE to create streaks
completion_status <- sample(c(TRUE, FALSE), 30, replace = TRUE, prob = c(0.75, 0.25))

habit_logs <- data.frame(
  Date = days_seq,
  Completed = completion_status,
  stringsAsFactors = FALSE
)

cat("=========================================\n")
cat("          HABIT STREAK TRACKER           \n")
cat("=========================================\n\n")

cat("Habit Log (First 10 Days):\n")
print(head(habit_logs, 10))

# 2. Date parsing and component extractions using lubridate
habit_logs <- habit_logs %>%
  mutate(
    Year = year(Date),
    Month = month(Date, label = TRUE),
    DayOfMonth = day(Date),
    DayOfWeek = wday(Date, label = TRUE, abbr = FALSE),
    WeekStart = floor_date(Date, unit = "week")
  )

# 3. Calculate metrics: Completed days count & Completion Rate
total_completed <- sum(habit_logs$Completed)
completion_rate <- round((total_completed / nrow(habit_logs)) * 100, 1)

cat(sprintf("\nTotal Days Monitored: %d\n", nrow(habit_logs)))
cat(sprintf("Total Days Completed: %d\n", total_completed))
cat(sprintf("Overall Completion Rate: %.1f%%\n", completion_rate))

# 4. Extracting current & longest streak (consecutive TRUEs)
calculate_streak <- function(df) {
  streak <- 0
  max_streak <- 0
  
  for (i in 1:nrow(df)) {
    if (df$Completed[i]) {
      streak <- streak + 1
      if (streak > max_streak) {
        max_streak <- streak
      }
    } else {
      streak <- 0
    }
  }
  return(list(CurrentStreak = streak, LongestStreak = max_streak))
}

streaks <- calculate_streak(habit_logs)
cat(sprintf("Longest Active Coding Streak: %d days\n", streaks$LongestStreak))
cat(sprintf("Current Streak at end of month: %d days\n\n", streaks$CurrentStreak))

# 5. Group completions by Day of Week
cat("Completion Breakdown by Day of Week:\n")
cat("------------------------------------\n")
weekday_summary <- habit_logs %>%
  group_by(DayOfWeek) %>%
  summarise(
    Logged = n(),
    Done = sum(Completed),
    Rate = round((Done / Logged) * 100, 1),
    .groups = "drop"
  )
print(weekday_summary)
