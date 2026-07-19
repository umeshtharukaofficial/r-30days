# ============================================
#  Contact Book Manager  —  Day 5 of R 30-day plan
#  Author: Umesh Tharuka Malaviarachchi
#  Learning Goal: list, data.frame, indexing, list exploration
# ============================================

# install.packages("base")

# 1. Initialize Contact Book as a data.frame
contact_book <- data.frame(
  Name = character(),
  Phone = character(),
  Email = character(),
  Category = character(),
  stringsAsFactors = FALSE
)

# 2. Add Contact Function
add_contact <- function(book, name, phone, email, category = "Personal") {
  if (name == "" || phone == "") {
    warning("Name and Phone are required to add a contact.")
    return(book)
  }
  
  new_contact <- data.frame(
    Name = name,
    Phone = phone,
    Email = email,
    Category = category,
    stringsAsFactors = FALSE
  )
  
  updated_book <- rbind(book, new_contact)
  cat(sprintf("✓ Contact '%s' added successfully.\n", name))
  return(updated_book)
}

# 3. Remove Contact Function
remove_contact <- function(book, name) {
  match_idx <- which(tolower(book$Name) == tolower(name))
  
  if (length(match_idx) == 0) {
    cat(sprintf("✗ Contact '%s' not found.\n", name))
    return(book)
  }
  
  updated_book <- book[-match_idx, , drop = FALSE]
  cat(sprintf("✓ Contact '%s' removed successfully.\n", name))
  return(updated_book)
}

# 4. Search Contacts Function
search_contacts <- function(book, query) {
  match_mask <- grepl(tolower(query), tolower(book$Name)) | 
                 grepl(tolower(query), tolower(book$Category))
  
  results <- book[match_mask, , drop = FALSE]
  return(results)
}

# 5. Display Contact Book Summary
summarize_book <- function(book) {
  cat("\n--- CONTACT BOOK SUMMARY ---\n")
  cat(sprintf("Total Contacts: %d\n", nrow(book)))
  if (nrow(book) > 0) {
    cat("\nBreakdown by Category:\n")
    print(table(book$Category))
    cat("\nDetailed View (head):\n")
    print(head(book))
  }
  cat("----------------------------\n\n")
}

# 6. Demonstration
cat("=========================================\n")
cat("          CONTACT BOOK MANAGER           \n")
cat("=========================================\n\n")

contact_book <- add_contact(contact_book, "Umesh Tharuka", "+94771234567", "umesh@example.com", "Work")
contact_book <- add_contact(contact_book, "Amali Silva", "+94778901234", "amali@example.com", "Personal")
contact_book <- add_contact(contact_book, "John Doe", "+1555019283", "john@work.com", "Work")
contact_book <- add_contact(contact_book, "Family Doctor", "+94112233445", "doctor@health.lk", "Services")

summarize_book(contact_book)

cat("Searching contacts matching 'Work':\n")
print(search_contacts(contact_book, "Work"))
cat("\n")

contact_book <- remove_contact(contact_book, "John Doe")
summarize_book(contact_book)
