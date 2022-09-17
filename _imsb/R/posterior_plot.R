#' Plotting posterior samples in the BEST package's style
#'
#' @param samples samples from some distribution
#' @param credmass credibility mass (default to 0.89)
#' @param usemode boolean, using the mean (default) or the mode?
#' @param compval to what value comparing the posterior?
#' @param rope region of practical equivalence (such as c(-0.1, 0.1) )
#' @param histcolour histogram colour
#' @param textsize size of the text elements
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
        samples, credmass = 0.89, usemode = FALSE,
        compval = NULL, rope = NULL,
        histcolour = "steelblue", textsize = 5
        ) {

    # computing the credible interval
    hdis <- bayestestR::hdi(x = samples, ci = credmass) |> data.frame()
    hdi_text <- hdis |> tidyr::pivot_longer(cols = 2:3)

    # computes the density to scale the positions of elements
    densCurve <- stats::density(x = samples, adjust = 2, n = 2048)

    # computes the posterior central tendency (mean or mode)
    if (usemode) central_tendency <- imsb::find_mode(samples)
    if (!usemode) central_tendency <- mean(samples)

    # computing the percentage of samples above the comparison value
    lower_than_compval <- round(x = mean(samples < compval) * 100, digits = 2)
    higher_than_compval <- round(x = mean(samples > compval) * 100, digits = 2)

    # preparing the compval text
    compval_text <- paste0(
        lower_than_compval, "% < ", compval, " < ",
        higher_than_compval, "%"
        )

    # compute the percentage of samples in ROPE
    pc_rope <- round(
        x = mean(samples > rope[1] & samples < rope[2] ) * 100,
        digits = 2
        )

    # plotting it
    samples |>
        data.frame() |>
        ggplot2::ggplot(ggplot2::aes(x = .data$samples, y = .data$..density..) ) +
        ggplot2::geom_histogram(
            bins = sqrt(length(samples) ),
            alpha = 0.4, colour = "white", fill = histcolour
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
            nudge_y = 0.05 * max(densCurve$y),
            size = textsize,
            inherit.aes = FALSE, show.legend = FALSE
            ) +
        ggplot2::geom_text(
            ggplot2::aes(
                x = mean(c(hdis$CI_low, hdis$CI_high) ), y = 0,
                label = paste0(100 * credmass, "% HDI")
                ),
            nudge_y = 0.1 * max(densCurve$y),
            size = textsize,
            inherit.aes = FALSE, show.legend = FALSE
            ) +
        ggplot2::geom_text(
            ggplot2::aes(
                x = central_tendency, y = 0.9 * max(densCurve$y),
                label = ifelse(
                    test = usemode,
                    yes = paste("mode =", round(x = central_tendency, digits = 2) ),
                    no = paste("mean =", round(x = central_tendency, digits = 2) )
                    )
                ),
            size = textsize,
            inherit.aes = FALSE, show.legend = FALSE
            ) +
        {if (!is.null(compval) ) ggplot2::geom_segment(
            ggplot2::aes(
                x = compval[1], xend = compval[1],
                y = 0, yend = 0.7 * max(densCurve$y)
                ),
            linetype = 2,
            colour = "darkgreen"
            )} +
        {if (!is.null(compval) ) ggplot2::geom_text(
            ggplot2::aes(
                x = compval, y = 0.7 * max(densCurve$y),
                label = compval_text
                ),
            colour = "darkgreen",
            size = textsize,
            nudge_y = 0.05 * max(densCurve$y),
            inherit.aes = FALSE, show.legend = FALSE
            )} +
        {if (!is.null(rope) ) ggplot2::geom_segment(
            ggplot2::aes(
                x = rope[1], xend = rope[1],
                y = 0, yend = 0.55 * max(densCurve$y)
                ),
            linetype = 3,
            colour = "darkred"
            )} +
        {if (!is.null(rope) ) ggplot2::geom_segment(
            ggplot2::aes(
                x = rope[2], xend = rope[2],
                y = 0, yend = 0.55 * max(densCurve$y)
                ),
            linetype = 3,
            colour = "darkred"
            )} +
        {if (!is.null(rope) ) ggplot2::geom_text(
            ggplot2::aes(
                x = compval, y = 0.55 * max(densCurve$y),
                label = paste0(pc_rope, "% in ROPE")
                ),
            colour = "darkred",
            size = textsize,
            nudge_y = 0.05 * max(densCurve$y),
            inherit.aes = FALSE, show.legend = FALSE
            )} +
        ggplot2::labs(y = "") +
        ggplot2::theme_classic(base_size = 12) +
        ggplot2::theme(
            axis.text.y = ggplot2::element_blank(),
            axis.ticks.y = ggplot2::element_blank(),
            axis.line.y = ggplot2::element_blank()
            )

}
