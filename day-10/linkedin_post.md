Connecting database tables in R? Let's join them! 🔗

For Day 10 of my 30-day R learning journey, I tackled relational data merging using the dplyr package. I built a mapping pipeline for Student registrations.

I mapped three synthetic data frames—Students, Registrations, and Course catalogs—using different join strategies:
- inner_join() to match active, valid course registrations
- left_join() to show all student profiles, highlighting who has no classes (returned as NA values)
- anti_join() to isolate and audit student records with zero active classes
- Chained multi-join configurations to build complete transcripts

Here is what I learned today:
- Linking datasets on common keys using inner_join() and left_join()
- Running orphan audits using anti_join()
- Constructing multi-table chains to connect transactional registries to structural lookup tables
- Standardizing join keys explicitly using the by parameter to avoid default console warnings

Understanding joins is essential for relational database work. The tidyverse makes it simple to merge datasets.

Check out the code here:
👉 https://github.com/umeshtharukaofficial/r-30days

#RStats #RProgramming #DataScience #LearningInPublic #100DaysOfCode #DataAnalytics #BuildInPublic
