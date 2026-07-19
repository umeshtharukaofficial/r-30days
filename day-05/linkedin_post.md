Who says R is only for statistics? Let's build a database application! 📇

For Day 5 of my 30-day R learning journey, I implemented a terminal-based Contact Book Manager to dive deep into R's rectangular data structure: the data.frame.

My app supports four key management operations:
- Adding contacts safely with data frame binding
- Dynamic searches using case-insensitive regex pattern matches
- Removing contacts using negative logical indices
- Summarizing lists using table aggregation and structural inspections

Here is what I learned today:
- Constructing typed, empty data.frame schemas
- Binding records using rbind() and removing them safely via row slicing
- Using $ and [[ ]] notation to reference tabular columns
- Preventing matrix-to-vector collapse with drop = FALSE

A common gotcha when slicing a single row from a data.frame is that R attempts to simplify it into a vector. Setting `drop = FALSE` ensures it retains its 2D table structure, preserving application compatibility.

Check out the code and run it yourself:
👉 https://github.com/umeshtharukaofficial/r-30days

#RStats #RProgramming #DataScience #LearningInPublic #100DaysOfCode #DataAnalytics #BuildInPublic
