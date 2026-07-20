Trying to keep a daily streak alive? Let's write code to audit it! 📅

For Day 13 of my 30-day R learning journey, I explored date-time manipulation using the lubridate package. I built a Habit Streak Tracker.

The script simulates 30 days of habit data and extracts performance summaries:
- Unpacking years, month names, and day numbers
- Identifying start-of-week boundaries using floor_date() to analyze weekly volume
- Grouping success distributions by day of the week (e.g. are weekends harder for habits?)
- Calculating consecutive active streaks using a custom tracking function

Here is what I learned today:
- Extracting specific date intervals and metadata using year(), month(), and wday()
- Snapping timelines to start-of-week frames using floor_date()
- Working with base Date object classes in R
- Coding robust custom loop counters to compute streaks

Dates are notoriously difficult to parse in code, but lubridate handles them elegantly.

Check out the code here:
👉 https://github.com/umeshtharukaofficial/r-30days

#RStats #RProgramming #DataScience #LearningInPublic #100DaysOfCode #DataAnalytics #BuildInPublic
