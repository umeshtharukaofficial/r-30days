# ============================================
#  Sales Report  —  Day 9 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: group_by, summarise, counts, across metrics
# ============================================

# install.packages("dplyr")

library(dplyr)

# 1. Generate fake sales data
set.seed(42)
n_records <- 200

regions <- c("North", "East", "South", "West")
categories <- c("Electronics", "Furniture", "Office Supplies", "Clothing")

sales_df <- data.frame(
  OrderID = 1000 + 1:n_records,
  Date = seq(as.Date("2026-01-01"), by = "1 day", length.out = n_records),
  Region = sample(regions, n_records, replace = TRUE),
  Category = sample(categories, n_records, replace = TRUE),
  Quantity = sample(1:10, n_records, replace = TRUE),
  Price = round(runif(n_records, 15.00, 250.00), 2),
  stringsAsFactors = FALSE
)

# 2. Mutate to compute Revenue (Price * Quantity)
sales_df <- sales_df %>%
  mutate(Revenue = Price * Quantity)

cat("=========================================\n")
cat("            SALES REPORT PIPELINE        \n")
cat("=========================================\n\n")

cat("Generated Sales Dataset Dimensions:", dim(sales_df)[1], "records\n")
print(head(sales_df, 5))

# 3. Summarise total sales metrics by Region
cat("\nSpending and Sales Summary by Region:\n")
cat("--------------------------------------\n")
region_summary <- sales_df %>%
  group_by(Region) %>%
  summarise(
    TotalOrders = n(),
    TotalQuantity = sum(Quantity),
    AverageRevenue = round(mean(Revenue), 2),
    TotalRevenue = sum(Revenue),
    .groups = "drop"
  ) %>%
  arrange(desc(TotalRevenue))

print(region_summary)

# 4. Summarise metrics by Category using across()
cat("\nSales Statistics across categories:\n")
cat("--------------------------------------\n")
category_summary <- sales_df %>%
  group_by(Category) %>%
  summarise(
    TotalOrders = n(),
    # Using across() to sum up both Quantity and Revenue
    across(c(Quantity, Revenue), list(Sum = sum, Avg = mean), .names = "{.col}_{.fn}"),
    .groups = "drop"
  )

# Format summary columns for display
category_summary <- category_summary %>%
  mutate(
    Quantity_Sum = round(Quantity_Sum, 0),
    Quantity_Avg = round(Quantity_Avg, 1),
    Revenue_Sum = round(Revenue_Sum, 2),
    Revenue_Avg = round(Revenue_Avg, 2)
  )

print(category_summary)
