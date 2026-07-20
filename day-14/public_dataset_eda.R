# ============================================
#  Public Dataset EDA  —  Day 14 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: dplyr, tidyr, data profiling, datasets, na.omit
# ============================================

# install.packages("dplyr")
# install.packages("tidyr")

library(dplyr)
library(tidyr)

# 1. Load the built-in airquality dataset
cat("Loading built-in 'airquality' dataset...\n")
data(airquality)

cat("=========================================\n")
cat("          PUBLIC DATASET EDA (AIRQUALITY)\n")
cat("=========================================\n\n")

cat("Original Dataset Summary:\n")
print(summary(airquality))

# 2. Check and report missing value frequencies per variable
cat("\nMissing value (NA) counts per column:\n")
na_counts <- colSums(is.na(airquality))
print(na_counts)

# 3. Data Cleaning Pipeline:
# - Drop rows where Ozone or Solar.R is missing
# - Add a full Date column by combining Month and Day (assuming year 1973)
# - Convert temperature from Fahrenheit to Celsius
cleaned_air <- airquality %>%
  drop_na(Ozone, Solar.R) %>%
  mutate(
    Date = as.Date(paste("1973", Month, Day, sep = "-")),
    Temp_C = round((Temp - 32) * 5/9, 1)
  )

cat(sprintf("\nRows before cleaning: %d | Rows after dropping NAs: %d\n", nrow(airquality), nrow(cleaned_air)))

# 4. Grouped Summaries (Produce exactly 5 grouped summary metrics)
cat("\nGrouped Summaries (Monthly Performance Metrics):\n")
cat("----------------------------------------------\n")

monthly_eda <- cleaned_air %>%
  group_by(Month) %>%
  summarise(
    # Metric 1: Observations Count
    Obs_Count = n(),
    # Metric 2: Mean Ozone concentration
    Mean_Ozone = round(mean(Ozone), 1),
    # Metric 3: Max Solar Radiation recorded
    Max_Solar = max(Solar.R),
    # Metric 4: Mean Wind speed
    Mean_Wind = round(mean(Wind), 1),
    # Metric 5: Average Temperature in Celsius
    Avg_Temp_C = round(mean(Temp_C), 1),
    .groups = "drop"
  )

print(monthly_eda)

# 5. Write cleaned dataset to CSV
output_csv <- "airquality_cleaned.csv"
cat(sprintf("\nWriting cleaned airquality dataset to '%s'...\n", output_csv))
write.csv(cleaned_air, file = output_csv, row.names = FALSE)

# Clean up local file for idempotency
if (file.exists(output_csv)) {
  file.remove(output_csv)
  cat(sprintf("Cleaned up local file '%s'\n", output_csv))
}
cat("EDA finished!\n")
