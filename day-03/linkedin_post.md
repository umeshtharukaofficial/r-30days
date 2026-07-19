Can you guess R's secret number? 🎲

Today for Day 3 of my 30-day R learning journey, I built an interactive Number Guessing Game inside the terminal. 

The game picks a random integer between 1 and 100, and gives the user 7 attempts to guess it. Using R's control flow structures, the game provides real-time feedback on whether the guess is too high or too low.

Here is what I learned today:
- Simulating random events with sample()
- Designing robust game loops using while, repeat, and break
- Accepting dynamic terminal input via readline()
- Writing safe conversion wrapper functions with suppressWarnings()

One key challenge was testing: `readline()` blocks in non-interactive tests. I resolved this by coding a fallback that auto-generates guesses when no interactive terminal is detected.

Follow my daily builds here:
👉 https://github.com/umeshtharukaofficial/r-30days

#RStats #RProgramming #DataScience #LearningInPublic #100DaysOfCode #DataAnalytics #BuildInPublic
