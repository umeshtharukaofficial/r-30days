Is your data too wide? Let's make it tidy! 🌡️

For Day 11 of my 30-day R learning journey, I focused on reshaping messy data using the tidyr package. I built a Weather Wide to Long parser.

My script takes a wide table of daily weather measurements with compounded keys and handles the transformation:
- pivot_longer() to fold separate day columns into clean row-based observations
- separate() to unpack combined identifiers (like Colombo_2026 into City and Year) and composite ranges (like 31.2/24.5 into Max and Min temperatures)
- unite() to link separate dimensions back into single attributes
- pivot_wider() to pivot key values back into column formats

Here is what I learned today:
- Converting columns to rows using pivot_longer() and reversing it with pivot_wider()
- Unpacking compound keys using separate() and joining keys using unite()
- Managing character-to-numeric type conversions immediately after separations
- Adhering to tidy data rules where each variable has its own column and each observation has its own row

Reshaping data is a crucial step before modeling or plotting. Learning to use tidyr makes this process painless.

Check out the code here:
👉 https://github.com/umeshtharukaofficial/r-30days

#RStats #RProgramming #DataScience #LearningInPublic #100DaysOfCode #DataAnalytics #BuildInPublic
