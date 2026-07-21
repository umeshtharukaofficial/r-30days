# ============================================
#  Sri Lanka District Map  —  Day 19 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: sf, ggplot2, choropleth map visualization
# ============================================

# install.packages("sf")
# install.packages("ggplot2")

library(ggplot2)

cat("=========================================\n")
cat("          SRI LANKA DISTRICT MAP (SF)    \n")
cat("=========================================\n\n")

# 1. Fallback sf polygon generation for Sri Lanka Districts placeholder
# Creates synthetic district boundaries using sf polygons if shapefile is missing
create_district_polygon <- function(name, xmin, xmax, ymin, ymax, pop) {
  coords <- matrix(c(
    xmin, ymin,
    xmax, ymin,
    xmax, ymax,
    xmin, ymax,
    xmin, ymin
  ), ncol = 2, byrow = TRUE)
  
  poly <- sf::st_polygon(list(coords))
  return(list(Name = name, Geometry = poly, Population = pop))
}

if (requireNamespace("sf", quietly = TRUE)) {
  cat("Generating sf spatial polygon objects for Sri Lanka Districts...\n")
  
  p1 <- create_district_polygon("Colombo", 79.8, 80.0, 6.8, 7.0, 2300000)
  p2 <- create_district_polygon("Gampaha", 79.8, 80.1, 7.0, 7.3, 2350000)
  p3 <- create_district_polygon("Kandy", 80.5, 80.8, 7.2, 7.5, 1375000)
  p4 <- create_district_polygon("Galle", 80.1, 80.4, 6.0, 6.3, 1063000)
  p5 <- create_district_polygon("Jaffna", 79.9, 80.3, 9.5, 9.8, 588000)
  
  district_names <- c(p1$Name, p2$Name, p3$Name, p4$Name, p5$Name)
  district_pops <- c(p1$Population, p2$Population, p3$Population, p4$Population, p5$Population)
  geoms <- sf::st_sfc(p1$Geometry, p2$Geometry, p3$Geometry, p4$Geometry, p5$Geometry)
  
  district_sf <- sf::st_sf(
    District = district_names,
    Population = district_pops,
    geometry = geoms
  )
  
  # 2. Render Choropleth Map with ggplot2
  cat("Rendering District Population Choropleth Map (plot.png)...\n")
  p_map <- ggplot(data = district_sf) +
    geom_sf(aes(fill = Population / 1e6), color = "white", size = 0.5) +
    scale_fill_viridis_c(option = "magma", name = "Pop (Millions)") +
    geom_sf_text(aes(label = District), color = "cyan", fontface = "bold", size = 3) +
    labs(
      title = "Sri Lanka District Population Distribution",
      subtitle = "Choropleth Map generated with sf and ggplot2",
      x = "Longitude",
      y = "Latitude"
    ) +
    theme_minimal()
  
  ggsave("plot.png", plot = p_map, width = 7, height = 6, dpi = 150)
  cat("✓ Map successfully rendered and saved to plot.png!\n")
} else {
  cat("[Fallback] sf package unavailable. Saving base plot fallback to plot.png...\n")
  png("plot.png", width = 600, height = 500)
  plot(1:10, 1:10, main = "Sri Lanka District Map Placeholder (sf required)")
  dev.off()
  cat("✓ Created fallback plot.png file.\n")
}
