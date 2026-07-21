# Day 19 — Sri Lanka District Map

**What I built:** A spatial data visualization script that uses `sf` and `ggplot2` to render a Sri Lanka district population choropleth map saved to `plot.png`.

**What broke:** Real shapefiles for Sri Lanka districts can be missing in minimal environments, causing script crashes. Fixed by creating a synthetic `sf` spatial polygon feature set using `st_polygon()` and `st_sf()`, with a TODO pointing to data.gov.lk for full GeoJSON downloads.

**What I learned:**
- Constructing spatial simple feature data frames with `sf::st_sf()`
- Layering map polygons using `geom_sf()` inside `ggplot2`
- Applying continuous color scales for population densities using `scale_fill_viridis_c()`
- Overlaying spatial text labels onto district centroids using `geom_sf_text()`

> TODO: Download real Sri Lanka District GeoJSON / Shapefile from https://data.gov.lk and substitute into `sf::read_sf()` for high-precision administrative boundaries.

**Run it:**
```bash
Rscript district_map.R
```

**Screenshot:**
TODO: add screenshot.png after running the script
