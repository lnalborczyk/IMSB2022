#' Open slides in browser
#'
#' Opening the slides of the corresponding course (from 01 to 10) in browser.
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

    if (as.numeric(num) > 0 & num < 11) {

        utils::browseURL(
            url = paste0("https://www.barelysignificant.com/IMSB2022/slides/html/cours", num)
            )

    } else {

        stop ("I am sorry, I am not aware of this course... I only know Courses 01 to 10.")

    }
}

#' Find the mode of a distribution from its samples
#'
#' Find the mode of a distribution from its samples.
#'
#' @param samples Numeric, samples from some distribution.
#' @param ... Extra parameters to be passed to the `stats::density()` function.
#'
#' @return Returns the mode of the distribution.
#' @export
#'
#' @examples
#' \dontrun{
#' samples <- rnorm(n = 1e3, mean = 0, sd = 1)
#' find_mode(samples = samples)
#' }

find_mode <- function (samples, ...) {

    dd <- stats::density(samples, ...)
    return (dd$x[which.max(dd$y)])

}
