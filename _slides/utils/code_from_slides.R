########################################################
# Generating code from slides for each course
####################################################

library(knitr)

dirs <- list.files(pattern = "Cours", recursive = FALSE)

for (i in dirs) {
  
  purl(
    input = paste0(i, "/", i, ".Rpres"),
    output = paste0(i, "/", i, ".R"),
    documentation = 1
    )
  
}
