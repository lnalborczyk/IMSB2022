#' Plotting posterior samples in Kruschke's style
#'
#' @param samples samples from some distribution
#' @param credmass credibility mass (default to 0.89)
#' @param compval to what value comparing the posterior?
#' @param rope region of practical equivalence (such as c(-0.1, 0.1) )
#'
#' @return a ggplot of some (posterior) samples
#'
#' @importFrom rlang .data
#' @export
#'
#' @examples
#' \dontrun{
#' samples <- rnorm(n = 1e3, mean = 0, sd = 1)
#' posterior_plot(samples) + labs(x = expression(theta) )
#' }

posterior_plot <- function (
        samples, credmass = 0.89, compval = NULL, rope = NULL
        ) {

    # https://cran.r-project.org/web/packages/ggplot2/vignettes/ggplot2-in-packages.html
    # computing the credible interval
    hdis <- bayestestR::hdi(x = samples, ci = credmass) |> data.frame()
    hdi_text <- hdis |> tidyr::pivot_longer(cols = 2:3)

    # computes the density to scale the positions of elements
    densCurve <- stats::density(x = samples, adjust = 2, n = 2048)

    # computes the posterior mode
    posterior_mode <- imsb::find_mode(samples)

    # plotting it
    samples |>
        data.frame() |>
        ggplot2::ggplot(ggplot2::aes(x = .data$samples, y = .data$..density..) ) +
        {if (!is.null(rope) ) ggplot2::annotate(
            geom = "rect", xmin = rope[1], xmax = rope[2],
            ymin = 0, ymax = Inf,
            fill = "orangered", alpha = 0.5
            )} +
        ggplot2::geom_histogram(
            bins = sqrt(length(samples) ),
            alpha = 0.5, size = 0.5,
            colour = "white", fill = "steelblue"
            ) +
        ggplot2::geom_errorbarh(
            data = hdis,
            ggplot2::aes(xmin = .data$CI_low, xmax = .data$CI_high, y = 0),
            height = 0, size = 2,
            inherit.aes = FALSE, show.legend = FALSE
            ) +
        ggplot2::geom_text(
            data = hdi_text,
            ggplot2::aes(
                x = .data$value, y = 0,
                label = round(x = .data$value, digits = 2)
                ),
            nudge_y = 0.05 * max(densCurve$y), size = 5,
            inherit.aes = FALSE, show.legend = FALSE
            ) +
        ggplot2::geom_text(
            ggplot2::aes(
                x = posterior_mode, y = 0.9 * max(densCurve$y),
                label = paste("mode =", round(x = posterior_mode, digits = 2) )
                ),
            size = 5,
            inherit.aes = FALSE, show.legend = FALSE
            ) +
        {if (!is.null(compval) ) ggplot2::geom_vline(
            xintercept = compval,
            linetype = 2,
            colour = "darkgreen"
            )} +
        ggplot2::labs(y = "") +
        ggplot2::theme_classic() +
        ggplot2::theme(
            axis.text.y = ggplot2::element_blank(),
            axis.ticks.y = ggplot2::element_blank(),
            axis.line.y = ggplot2::element_blank()
            )

}
