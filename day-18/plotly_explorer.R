# ============================================
#  Plotly Explorer  —  Day 18 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: plotly, ggplotly, htmlwidgets, interactive charts
# ============================================

# install.packages("plotly")
# install.packages("ggplot2")
# install.packages("htmlwidgets")

library(ggplot2)

cat("=========================================\n")
cat("          PLOTLY EXPLORER (INTERACTIVE)  \n")
cat("=========================================\n\n")

# 1. Recreate ggplot 1 (Iris Scatter Plot)
cat("Recreating Iris Scatter Plot with ggplot2...\n")
p1 <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 2.5, alpha = 0.8) +
  labs(
    title = "Interactive Iris Petal Dimensions",
    x = "Petal Length (cm)",
    y = "Petal Width (cm)"
  ) +
  theme_minimal()

# 2. Recreate ggplot 2 (Mtcars Fuel Efficiency Boxplot)
cat("Recreating Mtcars Boxplot with ggplot2...\n")
mtcars_df <- mtcars
mtcars_df$cyl <- as.factor(mtcars_df$cyl)

p2 <- ggplot(mtcars_df, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot(alpha = 0.7) +
  labs(
    title = "Interactive MPG Breakdown by Cylinder",
    x = "Cylinders",
    y = "Miles Per Gallon (MPG)"
  ) +
  theme_minimal()

# 3. Convert ggplots to Plotly interactive web widgets
cat("\nConverting ggplots to interactive Plotly widgets...\n")

if (requireNamespace("plotly", quietly = TRUE) && requireNamespace("htmlwidgets", quietly = TRUE)) {
  plotly_1 <- plotly::ggplotly(p1)
  plotly_2 <- plotly::ggplotly(p2)
  
  # Combine into subplots or save single widget
  combined_widget <- plotly::subplot(plotly_1, plotly_2, nrows = 1, titleX = TRUE, titleY = TRUE)
  
  output_html <- "interactive.html"
  cat(sprintf("Saving interactive Plotly widget to '%s'...\n", output_html))
  htmlwidgets::saveWidget(combined_widget, file = output_html, selfcontained = TRUE)
  cat("✓ Successfully saved interactive.html widget!\n")
} else {
  cat("[Fallback] Plotly/htmlwidgets packages not installed. Generating static html placeholder...\n")
  placeholder_content <- "<html><body><h1>Interactive Plotly Chart Placeholder</h1><p>Install 'plotly' and 'htmlwidgets' to view interactive elements.</p></body></html>"
  writeLines(placeholder_content, "interactive.html")
  cat("✓ Created fallback interactive.html file.\n")
}
