library(hexSticker)
library(tidyverse)

thetaSize    = 100      # number of trial
a            = 4        # beta first parameter
b            = 16       # beta second parameter
N            = 40       # Specify the total number of flips, denoted N.
z            = 24        # number of 'Face'

p <- tibble(
    theta = seq(from = 0, to = 1, length.out = thetaSize),
    prior = dbeta(theta, a, b),
    likelihood = (theta^(z) ) * (1 - theta)^(N - z)
    ) %>%
    mutate(prior = prior / sum(prior) ) %>%
    mutate(likelihood = likelihood / sum(likelihood) ) %>%
    mutate(posterior = prior * likelihood / sum(prior * likelihood) ) %>%
    ggplot(aes(x = theta) ) +
    geom_area(
        aes(y = prior, fill = "prior"),
        color = "white", show.legend = FALSE, alpha = 0.8
    ) +
    geom_area(
        aes(y = likelihood, fill = "likelihood"),
        color = "white", show.legend = FALSE, alpha = 0.8
    ) +
    geom_area(
        aes(y = posterior, fill = "posterior"),
        color = "white", show.legend = FALSE, alpha = 0.8
    ) +
    # geom_line(aes(y = prior, color = "prior"), show.legend = FALSE) +
    # geom_line(aes(y = likelihood, color = "likelihood"), show.legend = FALSE) +
    # geom_line(aes(y = posterior, color = "posterior"), show.legend = FALSE) +
    scale_fill_manual(values = c("orangered", "magenta4","steelblue") )
    # theme_void(base_size = 12)

p <- p + theme_void(base_family = "Open Sans") + theme_transparent()

sticker(
    subplot = p,
    package = "IMSB2022",
    p_size = 20, s_x = 1, s_y = 0.75, s_width = 1.3, s_height = 1,
    filename = "files/hex.png"
    )
