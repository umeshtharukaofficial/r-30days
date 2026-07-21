# ============================================
#  Stock Price Viewer  —  Day 17 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: ggplot2, dplyr, zoo, moving averages, annotations
# ============================================

# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("zoo")

library(ggplot2)
library(dplyr)

# Fallback implementation for moving average in case zoo is not installed on system
calc_ma <- function(x, n) {
  if (requireNamespace("zoo", quietly = TRUE)) {
    return(zoo::rollmean(x, k = n, fill = NA, align = "right"))
  } else {
    # Base R moving average fallback using stats::filter
    res <- stats::filter(x, rep(1/n, n), sides = 1)
    return(as.numeric(res))
  }
}

# 1. Simulate 1 year of stock prices for 3 tickers (AAPL, GOOGL, MSFT)
set.seed(123)
days_count <- 252 # Trading days in a year
dates_seq <- seq(as.Date("2026-01-01"), by = "1 day", length.out = days_count)

generate_ticker <- function(ticker, start_price) {
  changes <- rnorm(days_count, mean = 0.0005, sd = 0.02)
  prices <- start_price * cumprod(1 + changes)
  data.frame(
    Date = dates_seq,
    Ticker = ticker,
    Price = round(prices, 2),
    stringsAsFactors = FALSE
  )
}

stocks_df <- rbind(
  generate_ticker("AAPL", 180),
  generate_ticker("GOOGL", 140),
  generate_ticker("MSFT", 400)
)

cat("=========================================\n")
cat("          STOCK PRICE VIEWER             \n")
cat("=========================================\n\n")

cat("Generated Stock Data Overview:\n")
print(head(stocks_df))

# 2. Calculate 7-day and 30-day moving averages
cat("\nComputing 7-day and 30-day Moving Averages...\n")
stocks_df <- stocks_df %>%
  group_by(Ticker) %>%
  mutate(
    MA7 = calc_ma(Price, 7),
    MA30 = calc_ma(Price, 30)
  ) %>%
  ungroup()

# 3. Find global max and min prices for annotations
max_point <- stocks_df %>% filter(Price == max(Price)) %>% slice(1)
min_point <- stocks_df %>% filter(Price == min(Price)) %>% slice(1)

cat(sprintf("Highest Recorded Price: $%.2f (%s on %s)\n", max_point$Price, max_point$Ticker, max_point$Date))
cat(sprintf("Lowest Recorded Price:  $%.2f (%s on %s)\n\n", min_point$Price, min_point$Ticker, min_point$Date))

# 4. Plot Stock Prices + Moving Averages + Annotations
cat("Generating Stock Price Chart (plot.png)...\n")

# Filter for AAPL to make visualization clean
aapl_df <- stocks_df %>% filter(Ticker == "AAPL")

p <- ggplot(aapl_df, aes(x = Date)) +
  geom_line(aes(y = Price, color = "Daily Price"), size = 0.8) +
  geom_line(aes(y = MA7, color = "7-Day MA"), size = 1, linetype = "dashed") +
  geom_line(aes(y = MA30, color = "30-Day MA"), size = 1.2) +
  # Annotate Max
  annotate("point", x = max_point$Date, y = max_point$Price, color = "darkgreen", size = 3) +
  annotate("text", x = max_point$Date, y = max_point$Price + 5, label = paste("Peak:", max_point$Price), color = "darkgreen", fontface = "bold") +
  # Annotate Min
  annotate("point", x = min_point$Date, y = min_point$Price, color = "red", size = 3) +
  annotate("text", x = min_point$Date, y = min_point$Price - 5, label = paste("Trough:", min_point$Price), color = "red", fontface = "bold") +
  scale_color_manual(values = c("Daily Price" = "gray60", "7-Day MA" = "blue", "30-Day MA" = "darkred")) +
  labs(
    title = "AAPL Stock Performance & Technical Indicators",
    subtitle = "Includes 7-day & 30-day Moving Averages with Peak/Trough Annotations",
    x = "Date",
    y = "Price ($ USD)",
    color = "Series"
  ) +
  theme_minimal()

ggsave("plot.png", plot = p, width = 8, height = 4.5, dpi = 150)
cat("Stock chart saved successfully as plot.png!\n")
