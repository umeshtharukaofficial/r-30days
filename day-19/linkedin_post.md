Want to plot geospatial maps in R? Let's build a choropleth map! 🗺️

For Day 19 of my 30-day R learning journey, I explored spatial data visualization using sf and ggplot2. I built a Sri Lanka District Population Map.

The script constructs spatial polygon objects and renders a population density map:
- Building spatial data frames using sf simple features
- Rendering boundary geometries with geom_sf()
- Applying viridis continuous color scales to map population densities
- Overlaying district labels at geographic coordinates using geom_sf_text()

Here is what I learned today:
- Defining simple feature spatial geometries using sf::st_sf()
- Rendering geographic shapes natively in ggplot2 via geom_sf()
- Customizing map color palettes using scale_fill_viridis_c()
- Providing fallback polygon layers when external shapefile assets are missing

Using sf and ggplot2 makes geographic map rendering seamless.

Source code:
👉 https://github.com/umeshtharukaofficial/r-30days

#RStats #RProgramming #DataScience #LearningInPublic #100DaysOfCode #DataAnalytics #BuildInPublic #SriLanka
