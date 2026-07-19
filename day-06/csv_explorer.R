# ============================================
#  CSV Explorer  —  Day 6 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: reading/writing CSV, basic descriptive summaries, filters
# ============================================

# install.packages("base")

# 1. Generate local copy of built-in mtcars dataset
cat("Loading built-in 'mtcars' dataset...\n")
data(mtcars)

# 2. Write dataset to CSV in local directory
csv_path <- "mtcars_raw.csv"
cat(sprintf("Writing mtcars dataset to '%s'...\n", csv_path))
write.csv(mtcars, file = csv_path, row.names = TRUE)

# 3. Read dataset back from CSV
cat(sprintf("Re-reading dataset from '%s'...\n", csv_path))
cars_data <- read.csv(csv_path, row.names = 1, stringsAsFactors = FALSE)

# 4. Exploratory Data Analysis (EDA)
cat("\n=========================================\n")
cat("          EXPLORATORY DATA ANALYSIS      \n")
cat("=========================================\n\n")

# Summary metrics
cat("Dataset structure summary:\n")
str(cars_data)
cat("\nDescriptive statistics summary:\n")
print(summary(cars_data[, c("mpg", "hp", "wt")]))

# Distribution counts using table()
cat("\nFrequency count of gears:\n")
print(table(cars_data$gear))

# 5. Handling Missing Data (Simulation)
cat("\nSimulating and handling missing value (NA) detection...\n")
# Inject a dummy NA
cars_data[5, "mpg"] <- NA
cat(sprintf("Injected NA value into row 5 mpg: is.na count = %d\n", sum(is.na(cars_data$mpg))))

# Clean missing values using na.omit
clean_cars <- na.omit(cars_data)
cat(sprintf("Rows before cleaning: %d | Rows after na.omit(): %d\n", nrow(cars_data), nrow(clean_cars)))

# Cleanup generated csv
if (file.exists(csv_path)) {
  file.remove(csv_path)
  cat(sprintf("\nCleaned up local file '%s'\n", csv_path))
}
cat("Done!\n")
