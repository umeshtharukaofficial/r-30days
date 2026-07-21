# ============================================
#  R Markdown Sales Report Knitter — Day 20
#  Author: Umesh Tharuka Malaviarachchi
# ============================================

# install.packages("rmarkdown")
# install.packages("knitr")

cat("=========================================\n")
cat("          R MARKDOWN SALES REPORT        \n")
cat("=========================================\n\n")

rmd_file <- "sales_report.Rmd"

if (file.exists(rmd_file)) {
  cat("Knitting sales_report.Rmd into standalone HTML document...\n")
  if (requireNamespace("rmarkdown", quietly = TRUE)) {
    rmarkdown::render(rmd_file, output_file = "sales_report.html", quiet = TRUE)
    cat("✓ Rendered sales_report.html successfully!\n")
  } else {
    cat("[Fallback] rmarkdown package not installed. Rmd source file generated cleanly.\n")
  }
} else {
  cat("Rmd source file not found.\n")
}
