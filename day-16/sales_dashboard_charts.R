# ============================================
#  Sales Dashboard Charts  —  Day 16 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: ggplot2, facet_wrap, stacked bar, geom_tile heatmap
# ============================================

# install.packages("ggplot2")
# install.packages("dplyr")

library(ggplot2)
library(dplyr)

# 1. Generate fake sales data (Reusing Day 09 schema)
set.seed(42)
n_records <- 300

regions <- c("North", "East", "South", "West")
categories <- c("Electronics", "Furniture", "Office Supplies", "Clothing")
months <- factor(month.name[1:6], levels = month.name[1:6])

sales_df <- data.frame(
  OrderID = 1000 + 1:n_records,
  Month = sample(months, n_records, replace = TRUE),
  Region = sample(regions, n_records, replace = TRUE),
  Category = sample(categories, n_records, replace = TRUE),
  Quantity = sample(1:10, n_records, replace = TRUE),
  Price = round(runif(n_records, 15.00, 250.00), 2),
  stringsAsFactors = FALSE
) %>%
  mutate(Revenue = Price * Quantity)

cat("=========================================\n")
cat("        SALES DASHBOARD CHARTS (GGPLOT2) \n")
cat("=========================================\n\n")

cat("Generated Sales Data Overview:\n")
print(head(sales_df))

# 2. Plot 1: Stacked Bar Chart (Category Revenue by Region)
cat("\nGenerating Stacked Bar Chart (Category Revenue by Region)...\n")
plot_bar <- ggplot(sales_df, aes(x = Region, y = Revenue, fill = Category)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(
    title = "Total Sales Revenue by Region & Product Category",
    x = "Geographic Region",
    y = "Total Revenue (USD)",
    fill = "Product Category"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")

ggsave("plot_bar.png", plot = plot_bar, width = 7, height = 4.5, dpi = 150)

# 3. Plot 2: Faceted Bar Chart (Monthly Trends across Categories)
cat("Generating Faceted Bar Chart (Month by Category)...\n")
plot_facet <- ggplot(sales_df, aes(x = Month, y = Revenue, fill = Category)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ Category, ncol = 2) +
  labs(
    title = "Monthly Revenue Trends Faceted by Category",
    x = "Month",
    y = "Revenue (USD)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

ggsave("plot_facet.png", plot = plot_facet, width = 7, height = 5, dpi = 150)

# 4. Plot 3: Heatmap using geom_tile (Region vs Category Intensity)
cat("Generating Heatmap Plot (geom_tile)...\n")
tile_data <- sales_df %>%
  group_by(Region, Category) %>%
  summarise(TotalRevenue = sum(Revenue), .groups = "drop")

plot_tile <- ggplot(tile_data, aes(x = Region, y = Category, fill = TotalRevenue)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "#e0f3f8", high = "#075a84") +
  geom_text(aes(label = sprintf("$%.0f", TotalRevenue)), color = "black", size = 3.5) +
  labs(
    title = "Regional Sales Revenue Heatmap",
    x = "Region",
    y = "Category",
    fill = "Revenue"
  ) +
  theme_minimal()

ggsave("plot_tile.png", plot = plot_tile, width = 6.5, height = 4.5, dpi = 150)

cat("\nAll 3 dashboard charts (plot_bar.png, plot_facet.png, plot_tile.png) saved!\n")
