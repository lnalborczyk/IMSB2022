# code to prepare the tartine1 data
tartine1 <- read.csv(file = here::here("data-raw/tartine1.csv") ) |>
    dplyr::select(-X, trial, side = value)

usethis::use_data(tartine1, overwrite = TRUE)

# code to prepare the tartine2 data
tartine2 <- read.csv(file = here::here("data-raw/tartine2.csv") ) |>
    dplyr::select(-X, trial, side = value)

usethis::use_data(tartine2, overwrite = TRUE)

# code to prepare the absence data
absence <- read.csv(file = here::here("data-raw/absence.csv") )
usethis::use_data(absence, overwrite = TRUE)

# code to prepare the absence_multilevel data
absence_multilevel <- read.csv(file = here::here("data-raw/absenteeism.csv"), sep = ",")
usethis::use_data(absence_multilevel, overwrite = TRUE)

# code to prepare the robot data
robot <- read.csv(file = here::here("data-raw/robot.csv") )
usethis::use_data(robot, overwrite = TRUE)

# code to prepare the unequal robot data
robot_unequal <- read.csv(file = here::here("data-raw/robot_unequal.csv") )
usethis::use_data(robot_unequal, overwrite = TRUE)

# code to prepare the apples data
apples <- read.csv(file = here::here("data-raw/apples.csv") )
usethis::use_data(apples, overwrite = TRUE)

# code to prepare the parents data
parents <- read.csv(file = here::here("data-raw/parents.csv") )
usethis::use_data(parents, overwrite = TRUE)

# code to prepare the morale data
morale <- read.csv(file = here::here("data-raw/morale.csv") )
usethis::use_data(morale, overwrite = TRUE)

# code to prepare the titanic data
titanic <- read.csv(file = here::here("data-raw/titanic.csv") )
usethis::use_data(titanic, overwrite = TRUE)

# code to prepare the howell data
howell <- read.csv(file = here::here("data-raw/howell.csv"), sep = ";")
usethis::use_data(howell, overwrite = TRUE)

# code to prepare the waffle data
waffle <- read.csv(file = here::here("data-raw/waffle.csv"), sep = ";")
usethis::use_data(waffle, overwrite = TRUE)

# code to prepare the milk data
milk <- read.csv(file = here::here("data-raw/milk.csv"), sep = ";")
usethis::use_data(milk, overwrite = TRUE)

# code to prepare the tulips data
tulips <- read.csv(file = here::here("data-raw/tulips.csv"), sep = ";")
usethis::use_data(tulips, overwrite = TRUE)

# code to prepare the rugged data
rugged <- read.csv(file = here::here("data-raw/rugged.csv"), sep = ";") |>
    dplyr::select(isocode, country, rugged, cont_africa, rgdppc_2000)

usethis::use_data(rugged, overwrite = TRUE)

# code to prepare the meta data
meta <- read.csv(file = here::here("data-raw/meta.csv"), sep = ",")
usethis::use_data(meta, overwrite = TRUE)

# code to prepare the popular data
popular <- read.csv(file = here::here("data-raw/popular.csv"), sep = ",")
usethis::use_data(popular, overwrite = TRUE)

# code to prepare the admission data
admission <- read.csv(file = here::here("data-raw/UCBadmit.csv"), sep = ";")
usethis::use_data(admission, overwrite = TRUE)
