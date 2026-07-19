# ============================================
#  Unit Converter Toolkit  —  Day 4 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: functions, default arguments, return, scope
# ============================================

# install.packages("base")

# 1. Celsius to Fahrenheit
c_to_f <- function(celsius) {
  fahrenheit <- (celsius * 9/5) + 32
  return(fahrenheit)
}

# 2. Kilometers to Miles
km_to_miles <- function(km) {
  miles <- km * 0.621371
  return(miles)
}

# 3. Kilograms to Pounds
kg_to_lb <- function(kg) {
  lb <- kg * 2.20462
  return(lb)
}

# 4. Sri Lankan Rupee to US Dollar with default conversion rate
lkr_to_usd <- function(lkr, rate = 300) {
  usd <- lkr / rate
  return(usd)
}

# 5. Body Mass Index (BMI)
bmi <- function(weight_kg, height_m) {
  if (height_m <= 0) {
    stop("Height must be greater than zero.")
  }
  bmi_val <- weight_kg / (height_m ^ 2)
  return(bmi_val)
}

# 6. Demonstrating the Toolkit
cat("=========================================\n")
cat("          UNIT CONVERTER TOOLKIT         \n")
cat("=========================================\n\n")

# Conversions
test_c <- 25
cat(sprintf("%.1f °C is %.1f °F\n", test_c, c_to_f(test_c)))

test_km <- 10
cat(sprintf("%.1f km is %.2f miles\n", test_km, km_to_miles(test_km)))

test_kg <- 70
cat(sprintf("%.1f kg is %.2f lbs\n", test_kg, kg_to_lb(test_kg)))

# Using default arg
test_lkr <- 3000
cat(sprintf("%.1f LKR is %.2f USD (at default rate of 300)\n", test_lkr, lkr_to_usd(test_lkr)))
cat(sprintf("%.1f LKR is %.2f USD (at custom rate of 310)\n", test_lkr, lkr_to_usd(test_lkr, rate = 310)))

# BMI Calc
w <- 68
h <- 1.75
cat(sprintf("BMI for %.1f kg and %.2fm is %.2f\n", w, h, bmi(w, h)))
