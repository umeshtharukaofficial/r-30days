# ============================================
#  Personal Bio Calculator  —  Day 1 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  This include fake details
# ============================================

# ---- 1. Inputs -----------------------------
name       <- "Umesh"
birth_year <- 2001
height_cm  <- 175
weight_kg  <- 68

# ---- 2. Derived values ---------------------
current_year <- as.integer(format(Sys.Date(), "%Y"))
age          <- current_year - birth_year

height_m <- height_cm / 100
bmi      <- round(weight_kg / (height_m ^ 2), 1)

# ---- 3. BMI category -----------------------
if (bmi < 18.5) {
  category <- "Underweight"
} else if (bmi < 25) {
  category <- "Normal weight"
} else if (bmi < 30) {
  category <- "Overweight"
} else {
  category <- "Obese"
}

# ---- 4. Build message ----------------------
message <- paste0(
  "Hi ", name, "!\n",
  "You are ", age, " years old.\n",
  "Your height is ", height_cm, " cm and weight is ", weight_kg, " kg.\n",
  "Your BMI is ", bmi, " (", category, ").\n",
  "Keep learning R every day "
)

# ---- 5. Print report -----------------------
cat("----- Bio Report -----\n")
cat(message, "\n")
cat("----------------------\n")

