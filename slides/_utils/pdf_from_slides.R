########################################################
# Generating pdf from quarto (revealjs) slides
####################################################

library(renderthis)
library(pagedown)
library(stringr)

# listing extant .html slides in the /html/ folder
slides <- list.files(
    path = "html", pattern = ".html",
    recursive = TRUE, full.names = TRUE
    )

for (input in slides) { # for each course

    # printing progress
    print(paste0("Printing '", input, "'...") )
    
    # defining the output
    course <- str_extract_all(string = input, pattern = "(?<=html/).+(?=.html)")[[1]]
    output <- paste0("pdf/", course, ".pdf")
    
    if (course == "cours01") {
        
        # printing it using renderthis
        renderthis::to_pdf(
            # from = input,
            from = paste0("_", course, "/", course, ".qmd"),
            # to = output
            complex_slides = FALSE
            )
        
    } else {
        
        # printing it using pagedown
        pagedown::chrome_print(
            input = input,
            output = output,
            format = "pdf"
            )
        
    }
    
}
