What does the Titanic dataset tell us about survival bias? Let's query it! 🚢

For Day 8 of my 30-day R learning journey, I moved from base R to the tidyverse. I built a Titanic Survival Slicer using the powerful dplyr package.

Rather than writing nested, hard-to-read commands, I used R's piping operator (%>%) to combine data actions. The analysis slices the built-in Titanic data frame by Class, Sex, and Age to calculate percentage survival rates:
- Filtering records matching specific query criteria
- Selecting target dimensions
- Creating survival percentage columns on the fly
- Sorting outputs to highlight demographics with the highest survival rates

Here is what I learned today:
- Converting multi-dimensional table arrays into data frames with as.data.frame()
- Applying the core dplyr verbs: filter(), select(), mutate(), and arrange()
- Joining intermediate aggregations with inner_join()
- Constructing readable pipelines using %>%

A common stumbling block when starting with the tidyverse is that built-in R datasets like `Titanic` are stored as tables, not data frames. Flattening the table first makes it easy to process.

Check out the code here:
👉 https://github.com/umeshtharukaofficial/r-30days

#RStats #RProgramming #DataScience #LearningInPublic #100DaysOfCode #DataAnalytics #BuildInPublic
