########################################################
# Generating pdf from online html slides
####################################################

library(renderthis)
library(pagedown)
library(xaringan)
library(stringr)

dirs <- list.files(pattern = "_cours", recursive = FALSE) |>
    str_replace_all(pattern = "_", replace = "")

for (i in dirs) {

  input <- paste0("https://www.barelysignificant.com/IMSB2022/slides/html/", i)
  output <- paste0("./pdf/", i, ".pdf")
  
  pagedown::chrome_print(
      input = input,
      # output = output,
      format = "pdf"
      )
  
  renderthis::to_pdf(
      from = paste0(input, ".html"),
      # from = "./html/cours01.html",
      complex_slides = TRUE
      )
  
  xaringan::decktape(
    # file = input,
    file = "./html/cours01.html",
    # output = output,
    output = "./pdf/test_cours01.pdf",
    # args = "generic",
    args = "--key=ArrowRight"
    # docker = TRUE,
    # version = "2.10.0"
    )
  
}
