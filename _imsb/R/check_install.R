#' Check the correct installation of the packages needed for the course
#'
#' This function can be used without argument to check the installation of the
#' correct `R` version, the install of `brms` and `rstan` and
#' to check that `Stan` models can be correctly fitted using a simple example.
#'
#' @param ... The function takes no argument at the moment.
#'
#' @return Returns the status of the installation.
#'
#' @importFrom rstan stan_model
#' @export
#'
#' @examples
#' \dontrun{
#' check_install()
#' }

check_install <- function (...) {

    # checking the R version
    r_version <- paste0(version$major, ".", version$minor)
    if (r_version != "4.2.1") stop ("Please install R version 4.2.1.")

    # checking the brms and rstan install
    if (!requireNamespace("brms", quietly = TRUE) ) stop ("Please install the brms package.")
    if (!requireNamespace("rstan", quietly = TRUE) ) stop ("Please install the rstan package.")

    # testing the rstan installation
    utils::capture.output({
        utils::example(
            stan_model, package = "rstan",
            run.dontrun = TRUE, verbose = FALSE, echo = FALSE
            )
        })

    # if the model did not fit...
    if (!exists(x = "fit") ) stop (
    "Something seems wrong... Please check again your brms and rstan install
    and follow the instructions at:
    https://learnb4ss.github.io/learnB4SS/articles/install-brms.html"
    )

    # otherwise, stating that everything seems fine
    return ("Everything seems fine...")

}
