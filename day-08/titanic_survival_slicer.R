# ============================================
#  Titanic Survival Slicer  —  Day 8 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: Introduction to dplyr, filters, select, mutate, piping
# ============================================

# install.packages("dplyr")

# Load library
library(dplyr)

# 1. Load dataset (datasets::Titanic is a table class, we convert to data.frame)
cat("Importing built-in 'Titanic' dataset...\n")
titanic_table <- datasets::Titanic
titanic_df <- as.data.frame(titanic_table, stringsAsFactors = FALSE)

# 2. Check structure
cat("Initial dataset structure:\n")
print(head(titanic_df))

# 3. Clean and process using dplyr pipes (%>%)
# In the table structure, "Freq" represents passenger counts. We will slice and expand.
cat("\nAnalyzing survival rates using dplyr methods...\n")

# Process 1: Calculate total passengers by Class and Sex
class_sex_summary <- titanic_df %>%
  group_by(Class, Sex) %>%
  summarise(Total = sum(Freq), .groups = "drop")

# Process 2: Filter survivors and match rates
survival_rates <- titanic_df %>%
  filter(Survived == "Yes") %>%
  group_by(Class, Sex) %>%
  summarise(SurvivedCount = sum(Freq), .groups = "drop") %>%
  inner_join(class_sex_summary, by = c("Class", "Sex")) %>%
  mutate(SurvivalRatePercent = round((SurvivedCount / Total) * 100, 1)) %>%
  arrange(desc(SurvivalRatePercent))

cat("\nSurvival Rate breakdown by Class and Sex (Highest to Lowest):\n")
cat("----------------------------------------------------------------\n")
print(survival_rates)

# Process 3: Filter for children vs adults survival rates
cat("\nAge-based survival metrics (Children vs Adults):\n")
cat("-------------------------------------------------\n")
age_rates <- titanic_df %>%
  group_by(Age, Survived) %>%
  summarise(Count = sum(Freq), .groups = "drop_last") %>%
  mutate(Percent = round((Count / sum(Count)) * 100, 1)) %>%
  filter(Survived == "Yes") %>%
  select(Age, SurvivalRate = Percent)

print(age_rates)
