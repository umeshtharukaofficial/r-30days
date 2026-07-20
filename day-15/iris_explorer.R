# ============================================
#  Iris Explorer  —  Day 15 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: ggplot2 charts creation, saving images
# ============================================

# install.packages("ggplot2")

library(ggplot2)

# Load the built-in iris dataset
data(iris)

cat("=========================================\n")
cat("            IRIS EXPLORER (GGPLOT2)      \n")
cat("=========================================\n\n")

cat("Loaded Iris dataset details:\n")
print(head(iris))

# Ensure output plots directory matches day-15 folder structure
# Usually runs inside day-15/ or root. We want to save to the current folder where script is.
# Let's save them locally (as script will be executed inside day-15/).
# Under the "EXECUTION RULES": "produce a plot saved to day-XX/plot.png when the day involves visuals".
# Since we are running the scripts from their respective folders, saving to local "plot1.png" etc is correct,
# but to be robust, we'll write them to file.

# 1. Chart 1: Scatter plot (aes, geom_point, labs, theme_minimal)
cat("Generating Plot 1: Petal Length vs Width Scatter Plot...\n")
plot1 <- ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.8) +
  labs(
    title = "Petal Dimensions by Species",
    subtitle = "Iris Dataset Analysis",
    x = "Petal Length (cm)",
    y = "Petal Width (cm)",
    color = "Species Group"
  ) +
  theme_minimal()

ggsave("plot1.png", plot = plot1, width = 6, height = 4, dpi = 150)

# 2. Chart 2: Histogram (geom_histogram, geom_vertical line)
cat("Generating Plot 2: Sepal Length Distribution Histogram...\n")
plot2 <- ggplot(data = iris, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.2, fill = "skyblue", color = "black", alpha = 0.7) +
  geom_vline(aes(xintercept = mean(Sepal.Length)), color = "red", linetype = "dashed", size = 1) +
  labs(
    title = "Distribution of Sepal Lengths",
    subtitle = "Red dashed line marks the mean value",
    x = "Sepal Length (cm)",
    y = "Frequency"
  ) +
  theme_minimal()

ggsave("plot2.png", plot = plot2, width = 6, height = 4, dpi = 150)

# 3. Chart 3: Bar chart (geom_bar or geom_col)
cat("Generating Plot 3: Species Count Bar Chart...\n")
plot3 <- ggplot(data = iris, aes(x = Species, fill = Species)) +
  geom_bar() +
  labs(
    title = "Class Count Frequency",
    subtitle = "Balanced class distribution in iris dataset",
    x = "Species Category",
    y = "Sample Count"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("plot3.png", plot = plot3, width = 6, height = 4, dpi = 150)

# 4. Chart 4: Boxplot (geom_boxplot)
cat("Generating Plot 4: Sepal Width by Species Boxplot...\n")
plot4 <- ggplot(data = iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot(alpha = 0.7) +
  labs(
    title = "Sepal Width Variability Across Species",
    x = "Species Group",
    y = "Sepal Width (cm)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("plot4.png", plot = plot4, width = 6, height = 4, dpi = 150)

cat("\nAll 4 charts (plot1.png ... plot4.png) have been saved successfully!\n")
