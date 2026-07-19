# ============================================
#  Personal Expense Tracker  —  Day 7 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: Integration of CLI files, reading/writing tables, summaries
# ============================================

# install.packages("base")

db_file <- "expenses.csv"

# 1. Initialize DB file if not exists
init_db <- function(file_path) {
  if (!file.exists(file_path)) {
    dummy_df <- data.frame(
      Date = character(),
      Category = character(),
      Amount = numeric(),
      Description = character(),
      stringsAsFactors = FALSE
    )
    write.csv(dummy_df, file = file_path, row.names = FALSE)
    cat("✓ Created new database file:", file_path, "\n")
  }
}

# 2. Add Expense record
add_expense <- function(file_path, date, category, amount, description) {
  # Load existing
  db <- read.csv(file_path, stringsAsFactors = FALSE)
  
  # Append new
  new_row <- data.frame(
    Date = date,
    Category = category,
    Amount = as.numeric(amount),
    Description = description,
    stringsAsFactors = FALSE
  )
  
  db <- rbind(db, new_row)
  
  # Save
  write.csv(db, file = file_path, row.names = FALSE)
  cat(sprintf("✓ Successfully added expense: %.2f LKR in '%s'\n", amount, category))
}

# 3. Summarise Expenses per category & top 3
summarise_expenses <- function(file_path) {
  if (!file.exists(file_path)) {
    cat("No database file found.\n")
    return(NULL)
  }
  
  db <- read.csv(file_path, stringsAsFactors = FALSE)
  
  if (nrow(db) == 0) {
    cat("No expenses recorded yet!\n")
    return(NULL)
  }
  
  cat("\n=========================================\n")
  cat("           EXPENSE TRACKER SUMMARY        \n")
  cat("=========================================\n\n")
  
  # Total Spending
  total_spend <- sum(db$Amount, na.rm = TRUE)
  cat(sprintf("Total Expenditure: %.2f LKR\n\n", total_spend))
  
  # Summarise per category (aggregate)
  cat("Spending by Category:\n")
  cat("--------------------\n")
  category_sums <- aggregate(Amount ~ Category, data = db, FUN = sum)
  print(category_sums, row.names = FALSE)
  
  # Show top 3 largest transactions
  cat("\nTop 3 Largest Transactions:\n")
  cat("---------------------------\n")
  sorted_db <- db[order(db$Amount, decreasing = TRUE), ]
  print(head(sorted_db, 3), row.names = FALSE)
  cat("=========================================\n\n")
}

# 4. Running the demonstration (Idempotent execution checks)
init_db(db_file)

# Seed sample transactions
cat("Adding sample expenses...\n")
add_expense(db_file, "2026-07-15", "Food", 1200, "Dinner with friends")
add_expense(db_file, "2026-07-16", "Transport", 450, "Tuk ride to office")
add_expense(db_file, "2026-07-17", "Bills", 8500, "Electricity bill")
add_expense(db_file, "2026-07-18", "Food", 650, "Lunch packet")
add_expense(db_file, "2026-07-19", "Entertainment", 2500, "Movie tickets")

# Run summary report
summarise_expenses(db_file)

# Clean up database file to remain idempotent
if (file.exists(db_file)) {
  file.remove(db_file)
  cat("Cleaned up local file db database.\n")
}
