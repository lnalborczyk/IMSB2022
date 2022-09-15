#' Check the correct installation of the packages needed for the course
#'
#' @param ... the function takes no argument at the moment
#'
#' @return returns the status of the installation
#' @export
#'
#' @examples
#' \dontrun{
#' check_install()
#' }

check_install <- function (...) {

    # checking the R version
    r_version <- paste0(version$major, ".", version$minor)
    if (r_version != "4.2.1") return (cat("Please install R version 4.2.1") )

    # checking the brms and rstan install
    # if (!require (brms) ) return (cat("Please install the brms package") )
    # if (!require (rstan) ) return (cat("Please install the rstan package") )

    # testing the rstan installation
    utils::capture.output({
        utils::example(
            rstan::stan_model, package = "rstan",
            run.dontrun = TRUE, verbose = FALSE, echo = FALSE
            )
        })

    if (!exists(x = "fit") ) return (cat("
        Something seems wrong... Please check again your brms and rstan install and follow the
        instructions at: https://learnb4ss.github.io/learnB4SS/articles/install-brms.html
        ") )

    # checking the rethinking install
    if (!require (rethinking) ) return (cat("
        Please install the rethinking package from Github:
        https://github.com/rmcelreath/rethinking
        ") )

    # everything seems fine
    return ("Everything seems fine...")

}
