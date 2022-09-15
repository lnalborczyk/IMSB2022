# code to prepare the tartine1 data

tartine1 <- read.csv(file = here("data-raw/tartine1.csv") ) %>%
    select(-X, trial, side = value)

usethis::use_data(tartine1, overwrite = TRUE)

# code to prepare the tartine2 data

tartine2 <- read.csv(file = here("data-raw/tartine2.csv") ) %>%
    select(-X, trial, side = value)

usethis::use_data(tartine2, overwrite = TRUE)

# declaring package dependencies
# usethis::use_package(package = "tidyverse")
