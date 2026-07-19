# Day 02 — Marks Analyzer
# An R script that takes 10 subject marks and reports average, median, standard deviation,
# pass/fail counts, letter grades, and a ranked table from highest to lowest.

# 1. Define marks for 10 subjects
marks <- c(85, 92, 45, 64, 78, 50, 38, 88, 72, 60)
names(marks) <- c("Math", "Science", "History", "English", "Geography", 
                  "Art", "Music", "Physics", "Chemistry", "Biology")

cat("--- MARKS ANALYZER ---\n\n")

# 2. Basic Descriptive Statistics
avg_marks <- mean(marks)
med_marks <- median(marks)
sd_marks <- sd(marks)

cat(sprintf("Average Mark:         %.2f\n", avg_marks))
cat(sprintf("Median Mark:          %.2f\n", med_marks))
cat(sprintf("Standard Deviation:   %.2f\n\n", sd_marks))

# 3. Pass/Fail Counts (Pass threshold >= 50)
pass_status <- ifelse(marks >= 50, "Pass", "Fail")
pass_count <- sum(marks >= 50)
fail_count <- sum(marks < 50)

cat(sprintf("Passed Subjects:      %d\n", pass_count))
cat(sprintf("Failed Subjects:      %d\n\n", fail_count))

# 4. Highest and Lowest Marks using which.max / which.min
highest_pos <- which.max(marks)
lowest_pos <- which.min(marks)

cat(sprintf("Highest Mark:         %s (%d)\n", names(marks)[highest_pos], marks[highest_pos]))
cat(sprintf("Lowest Mark:          %s (%d)\n\n", names(marks)[lowest_pos], marks[lowest_pos]))

# 5. Letter Grades using cut()
breaks <- c(0, 35, 50, 65, 75, 85, 100)
labels <- c("F", "S", "C", "B", "A", "A+")
grades <- cut(marks, breaks = breaks, labels = labels, right = FALSE)

# 6. Ranked Table from Highest to Lowest
sort_order <- order(marks, decreasing = TRUE)
ranked_table <- data.frame(
  Subject = names(marks)[sort_order],
  Mark = marks[sort_order],
  Grade = grades[sort_order],
  Status = pass_status[sort_order]
)

cat("--- RANKED TABLE ---\n")
print(ranked_table, row.names = FALSE)
