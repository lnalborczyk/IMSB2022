# code to prepare the tartine1 data

tartine1 <- read.csv(file = here("data-raw/tartine1.csv") ) %>%
    select(-X, trial, side = value)

usethis::use_data(tartine1, overwrite = TRUE)

# code to prepare the tartine2 data

tartine2 <- read.csv(file = here("data-raw/tartine2.csv") ) %>%
    select(-X, trial, side = value)

usethis::use_data(tartine2, overwrite = TRUE)

# code to prepare the absence data

absence <- read.csv(file = here("data-raw/absence.csv") )
usethis::use_data(absence, overwrite = TRUE)

# code to prepare the robot data

robot <- read.csv(file = here("data-raw/robot.csv") )
usethis::use_data(robot, overwrite = TRUE)

# code to prepare the unequal robot data

robot_unequal <- read.csv(file = here("data-raw/robot_unequal.csv") )
usethis::use_data(robot_unequal, overwrite = TRUE)

# code to prepare the apples data

apples <- read.csv(file = here("data-raw/apples.csv") )
usethis::use_data(apples, overwrite = TRUE)

# code to prepare the parents data

parents <- read.csv(file = here("data-raw/parents.csv") )
usethis::use_data(parents, overwrite = TRUE)

# code to prepare the parents data

parents <- read.csv(file = here("data-raw/parents.csv") )
usethis::use_data(parents, overwrite = TRUE)

# code to prepare the morale data

morale <- read.csv(file = here("data-raw/morale.csv") )
usethis::use_data(morale, overwrite = TRUE)

# code to prepare the titanic data

titanic <- read.csv(file = here("data-raw/titanic.csv") )
usethis::use_data(titanic, overwrite = TRUE)
