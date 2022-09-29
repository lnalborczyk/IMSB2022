#' Check the correct installation of the packages needed for the course
#'
#' This function can be used without argument to check the installation of the
#' correct `R` version, the installation of `brms`, and to check that `brms`
#' models can be correctly fitted using a simple example.
#'
#' @param ... The function takes no argument.
#'
#' @return Returns the status of the installation.
#'
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

    # checking the brms install
    if (!requireNamespace("brms", quietly = TRUE) ) stop ("Please install the brms package.")

    # checking the rstan install
    # if (!requireNamespace("rstan", quietly = TRUE) ) stop ("Please install the rstan package.")

    # testing the rstan installation
    # utils::capture.output({
    #     utils::example(
    #         stan_model, package = "rstan",
    #         run.dontrun = TRUE, verbose = FALSE, echo = FALSE
    #         )
    #     })

    # loading the "howell" dataset
    df <- imsb::howell

    # testing the brms install
    fit <- utils::capture.output({
        brms::brm(formula = height ~ 1 + weight, data = df)
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
