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

open_slides <- function(cours) {

    num <- stringr::str_pad(string = cours, width = 2, pad = "0")

    if (num > 0 & num < 11) {

        utils::browseURL(
            url = paste0("https://www.barelysignificant.com/IMSB2022/slides/html/cours", num)
            )

    } else {

        warning("I am sorry, I am not aware of this course... I only know Course 01 to 10...")

    }
}
