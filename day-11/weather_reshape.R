# ============================================
#  Weather Wide to Long  —  Day 11 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: tidyr, pivot_longer, pivot_wider, separate, unite
# ============================================

# install.packages("tidyr")

library(tidyr)
library(dplyr)

# 1. Define messy wide weather table inline
# Rows contain multiple values and columns are pivoted by days
messy_weather <- data.frame(
  Location_Year = c("Colombo_2026", "Kandy_2026", "Galle_2026"),
  Temp_Day1 = c("31.2/24.5", "26.4/19.1", "29.8/23.0"),
  Temp_Day2 = c("32.0/24.0", "25.8/18.5", "30.1/22.8"),
  Temp_Day3 = c("30.5/25.1", "27.1/19.4", "29.5/23.5"),
  stringsAsFactors = FALSE
)

cat("=========================================\n")
cat("          WEATHER WIDE TO LONG (TIDYR)   \n")
cat("=========================================\n\n")

cat("Original Messy Wide Dataset:\n")
print(messy_weather)

# 2. Pivot Longer (Convert day columns into single Day variable)
cat("\n1. Pivoting Longer (Columns Day1, Day2, Day3 -> Day & TempValue):\n")
cat("--------------------------------------------------------------------\n")
long_weather <- messy_weather %>%
  pivot_longer(
    cols = starts_with("Temp_Day"),
    names_to = "Day",
    values_to = "TempRange"
  ) %>%
  mutate(Day = gsub("Temp_", "", Day))
print(long_weather)

# 3. Separate (Split Location_Year into City and Year, and TempRange into Min/Max)
cat("\n2. Separate Location into City/Year, and TempRange into MaxTemp/MinTemp:\n")
cat("-----------------------------------------------------------------------\n")
tidy_weather <- long_weather %>%
  separate(Location_Year, into = c("City", "Year"), sep = "_") %>%
  separate(TempRange, into = c("MaxTemp", "MinTemp"), sep = "/") %>%
  mutate(
    MaxTemp = as.numeric(MaxTemp),
    MinTemp = as.numeric(MinTemp)
  )
print(tidy_weather)

# 4. Unite (Combine City and Year back together, for demo purposes)
cat("\n3. Uniting City and Year back into LocationYear:\n")
cat("-----------------------------------------------\n")
united_weather <- tidy_weather %>%
  unite("LocationYear", City, Year, sep = "-")
print(united_weather)

# 5. Pivot Wider (Pivot MaxTemp values back by Day)
cat("\n4. Pivoting MaxTemp values back to Wide layout:\n")
cat("----------------------------------------------\n")
wide_max_temps <- tidy_weather %>%
  select(City, Year, Day, MaxTemp) %>%
  pivot_wider(
    names_from = Day,
    values_from = MaxTemp,
    names_prefix = "MaxTemp_"
  )
print(wide_max_temps)
