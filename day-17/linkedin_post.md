Want to track stock trends like Wall Street? Let me show you how to code technical indicators! 📈

For Day 17 of my 30-day R learning journey, I built a Stock Price Viewer analyzing time-series market data with moving averages and annotations.

I generated daily price simulations for 3 stock tickers (AAPL, GOOGL, MSFT) and built a chart overlaying:
- Daily Closing Prices
- 7-Day Short-Term Moving Average
- 30-Day Long-Term Moving Average
- Dynamic peak and trough annotations using annotate("point") and annotate("text")

Here is what I learned today:
- Simulating price walks using geometric cumulative products with cumprod()
- Calculating rolling window statistics with zoo::rollmean() and base R filters
- Highlighting key metrics directly on plots using annotate()
- Adding multi-line color legends with scale_color_manual()

Rolling moving averages help smooth out daily market noise to highlight underlying trends.

Source code:
👉 https://github.com/umeshtharukaofficial/r-30days

#RStats #RProgramming #DataScience #LearningInPublic #100DaysOfCode #DataAnalytics #BuildInPublic
