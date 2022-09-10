########################################################
# Generating pdf from online html slides
####################################################

library(xaringan)

dirs <- list.files(pattern = "Cours", recursive = FALSE)

for (i in dirs) {

  url <- paste0("https://www.barelysignificant.com/IMSB2021/slides/", i)
  output <- paste0(i, "/", i, ".pdf")
  
  # system(paste0("decktape generic ", url, " ", output) )
  # system(paste0("decktape generic --key=ArrowRight ", url, " ", output) )
  
  decktape(
    file = url, output = output,
    args = "generic",
    docker = FALSE
    )
  
}
