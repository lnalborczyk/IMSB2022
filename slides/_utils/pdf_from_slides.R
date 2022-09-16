########################################################
# Generating pdf from online html slides
####################################################

library(xaringan)
library(stringr)

dirs <- list.files(pattern = "_cours", recursive = FALSE)
dirs <- str_replace_all(string = dirs, pattern = "_", replace = "")

for (i in dirs) {

  url <- paste0("https://www.barelysignificant.com/IMSB2022/slides/html/", i)
  output <- paste0("/pdf/", i, ".pdf")
  
  # system(paste0("decktape generic ", url, " ", output) )
  # system(paste0("decktape generic --key=ArrowRight ", url, " ", output) )
  
  decktape(
    file = url, output = output,
    args = "generic",
    # args = "generic --key=ArrowRight",
    docker = FALSE
    )
  
}
