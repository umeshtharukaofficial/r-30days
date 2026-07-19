# ============================================
#  Number Guessing Game  —  Day 3 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: control flow, loops, inputs
# ============================================

# install.packages("base")

run_game <- function() {
  set.seed(NULL) # Ensure true randomness each run
  
  # 1. Setup secret number
  secret_number <- sample(1:100, 1)
  max_attempts <- 7
  attempts <- 0
  guessed_correctly <- FALSE
  
  cat("=========================================\n")
  cat("Welcome to the Number Guessing Game! (1-100)\n")
  cat("Can you guess the secret number in 7 tries?\n")
  cat("=========================================\n\n")
  
  # 2. Main game loop
  while (attempts < max_attempts && !guessed_correctly) {
    attempts <- attempts + 1
    cat(sprintf("Attempt %d of %d. Enter your guess: ", attempts, max_attempts))
    
    # Read user input
    input_str <- readline()
    
    # Safe convert input to integer
    guess <- suppressWarnings(as.integer(input_str))
    
    if (is.na(guess)) {
      # Fallback/default logic for automated runs
      cat("[Non-interactive fallback] Auto-generating guess...\n")
      guess <- sample(1:100, 1)
      cat(sprintf("Auto-guess selected: %d\n", guess))
    }
    
    # 3. Check guess with control flow
    if (guess == secret_number) {
      guessed_correctly <- TRUE
      cat(sprintf("\n🎉 Congratulations! You guessed it in %d attempts!\n", attempts))
      break
    } else if (guess < secret_number) {
      cat("Too low! Try a higher number.\n\n")
    } else {
      cat("Too high! Try a lower number.\n\n")
    }
  }
  
  # 4. Handle loss
  if (!guessed_correctly) {
    cat(sprintf("\n😢 Game Over! The secret number was %d.\n", secret_number))
  }
  
  cat("Thanks for playing!\n")
}

# Run the game
run_game()
