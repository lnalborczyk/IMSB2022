#' Open slides in browser
#'
#' @param cours course number
#'
#' @return nothing but opens the slides in browser
#' @export
#'
#' @examples
#' \dontrun{
#' open_slides(cours = 01)
#' }

open_slides <- function (cours) {

    num <- stringr::str_pad(string = cours, width = 2, pad = "0")

    if (num > 0 & num < 11) {

        utils::browseURL(
            url = paste0("https://www.barelysignificant.com/IMSB2022/slides/html/cours", num)
            )

    } else {

        warning ("I am sorry, I am not aware of this course... I only know Course 01 to 10...")

    }
}

#' Find the mode of a distribution from its samples
#'
#' @param samples samples from some distribution
#' @param ... extra parameters to be passed to the `density` function
#'
#' @return returns the mode of the distribution
#' @export
#'
#' @examples
#' \dontrun{
#' find_mode(sample = rnorm(n = 1e4, mean = 0, sd = 1) )
#' }

find_mode <- function (samples, ...) {

    dd <- stats::density(samples, ...)
    dd$x[which.max(dd$y)]

}
