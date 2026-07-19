# ============================================
#  Students x Courses  —  Day 10 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: inner_join, left_join, anti_join, semi_join
# ============================================

# install.packages("dplyr")

library(dplyr)

# 1. Define synthetic students and course registrations inline
students_df <- data.frame(
  StudentID = c(101, 102, 103, 104, 105),
  Name = c("Umesh", "Amali", "Kasun", "Ruwan", "Nimal"),
  Major = c("Data Science", "Computer Science", "Information Systems", "Data Science", "Mathematics"),
  stringsAsFactors = FALSE
)

registrations_df <- data.frame(
  RegistrationID = c(1, 2, 3, 4, 5, 6),
  StudentID = c(101, 101, 102, 103, 106, 107), # 106 and 107 are not in students_df
  CourseCode = c("R-101", "STATS-201", "CS-101", "R-101", "CS-102", "ENG-101"),
  Grade = c("A", "A-", "B+", "B", "A", "B"),
  stringsAsFactors = FALSE
)

courses_df <- data.frame(
  CourseCode = c("R-101", "STATS-201", "CS-101", "CS-102"),
  Title = c("Introduction to R", "Applied Statistics", "Computer Science I", "Computer Science II"),
  Credits = c(3, 4, 3, 3),
  stringsAsFactors = FALSE
)

cat("=========================================\n")
cat("          STUDENTS X COURSES JOINS       \n")
cat("=========================================\n\n")

cat("Students Dataset:\n")
print(students_df)
cat("\nRegistrations Dataset:\n")
print(registrations_df)

# 2. INNER JOIN (Find student details for active registrations)
cat("\n1. INNER JOIN (Active registrations matching registered student profiles):\n")
cat("------------------------------------------------------------------------\n")
inner_res <- registrations_df %>%
  inner_join(students_df, by = "StudentID")
print(inner_res)

# 3. LEFT JOIN (Include all students, even those with no course registrations)
cat("\n2. LEFT JOIN (All students, mapping their registrations if they exist):\n")
cat("-----------------------------------------------------------------------\n")
left_res <- students_df %>%
  left_join(registrations_df, by = "StudentID")
print(left_res)

# 4. ANTI JOIN (Find student profiles who have registered for NO classes)
cat("\n3. ANTI JOIN (Students who are registered in system but taking 0 classes):\n")
cat("------------------------------------------------------------------------\n")
anti_res <- students_df %>%
  anti_join(registrations_df, by = "StudentID")
print(anti_res)

# 5. Combining Joins to map Registration -> Student -> Course
cat("\n4. THREE-WAY INNER JOIN (Mapping Registration to Student AND Course details):\n")
cat("-------------------------------------------------------------------------\n")
complete_mapping <- registrations_df %>%
  inner_join(students_df, by = "StudentID") %>%
  inner_join(courses_df, by = "CourseCode") %>%
  select(RegistrationID, Name, Major, Title, Credits, Grade)

print(complete_mapping)
