## ----setup, eval = TRUE, include = FALSE, cache = FALSE------------------------------------------------
library(countdown)
library(tidyverse)
library(knitr)

# setting up knitr options
knitr::opts_chunk$set(
  cache = TRUE, echo = TRUE,
  warning = FALSE, message = FALSE,
  fig.align = "center", dev = "svg"
  )

# setting up ggplot theme
theme_set(theme_bw(base_size = 16, base_family = "Open Sans") )


## ----frequency, fig.width = 7.5, fig.height = 5, `code-line-numbers` = "|3"----------------------------
library(tidyverse)

sample(x = c(0, 1), size = 500, prob = c(0.5, 0.5), replace = TRUE) %>%
        data.frame() %>%
        mutate(x = seq_along(.), y = cummean(.) ) %>%
        ggplot(aes(x = x, y = y) ) +
        geom_line(lwd = 1) +
        geom_hline(yintercept = 0.5, lty = 3) +
        labs(x = "Nombre de lancers", y = "Proportion de faces") +
        ylim(0, 1)


## ----message = FALSE, echo = FALSE, fig.align = "center", fig.width = 7.5, fig.height = 5--------------
set.seed(1111)

x <- sort(runif(10, -2, 2) )
y <- 3 * x^3 + 5 * x^2 + 0.5 * x + 20 + rnorm(10, sd = 3)

data.frame(x, y) %>%
        ggplot(aes(x = x, y = y) ) +
        geom_point(size = 3)

nterm <- c(1, 2, 3, 9)

PAL <- colorRampPalette(c("black", "chartreuse3", "gold", "dodgerblue") )
COLS <- PAL(length(nterm) )


## ----echo = FALSE, fig.align = "center", fig.width = 7.5, fig.height = 5-------------------------------
data.frame(x, y) %>%
        ggplot(aes(x = x, y = y) ) +
        geom_point(size = 3) +
        geom_smooth(method = "lm", se = FALSE, col = COLS[1])


## ----echo = FALSE, fig.align = "center", fig.width = 7.5, fig.height = 5-------------------------------
data.frame(x, y) %>%
        ggplot(aes(x = x, y = y) ) +
        geom_point(size = 3) +
        geom_smooth(method = "lm", se = FALSE, col = COLS[1]) +
        stat_smooth(
                method = "lm", se = FALSE,
                formula = y ~ poly(x, 2),
                col = COLS[2]
                )


## ----echo = FALSE, fig.align = "center", fig.width = 7.5, fig.height = 5-------------------------------
data.frame(x, y) %>%
        ggplot(aes(x = x, y = y) ) +
        geom_point(size = 3) +
        geom_smooth(method = "lm", se = FALSE, col = COLS[1]) +
        stat_smooth(
                method = "lm", se = FALSE,
                formula = y ~ poly(x, 2),
                col = COLS[2]) +
        stat_smooth(
                method = "lm", se = FALSE,
                formula = y ~ poly(x, 3),
                col = COLS[3]) +
        stat_smooth(
                method = "lm", se = FALSE,
                formula = y ~ poly(x, 9),
                col = COLS[4]
                )


## ----countown, echo = FALSE, cache = FALSE-------------------------------------------------------------
countdown(
    minutes = 2,
    warn_when = 30,
    left = 0, right = 0,
    padding = "10px",
    margin = "5%",
    font_size = "5em",
    color_border = "#1c5253",
    color_text = "#1c5253"
    )


## ---- echo = FALSE, eval = TRUE, fig.height = 10, fig.width = 10, fig.align = "center"-----------------
library(rethinking)
source("./code/forking_data_McElreath.R")

dat <- c(1)
arc <- c(0, pi)

garden(
    arc = arc,
    possibilities = c(0, 0, 0, 1),
    data = dat,
    hedge = 0.05,
    ring_dist = ring_dist,
    alpha.fade = 1
    )


## ---- echo = FALSE, eval = TRUE, fig.height = 10, fig.width = 10, fig.align = "center"-----------------
dat <- c(1, 0)
arc <- c(0, pi)

garden(
    arc = arc,
    possibilities = c(0, 0, 0, 1),
    data = dat,
    hedge = 0.05,
    ring_dist = ring_dist,
    alpha.fade = 1
    )


## ---- echo = FALSE, eval = TRUE, fig.height = 10, fig.width = 10, fig.align = "center"-----------------
dat <- c(1, 0, 1)
arc <- c(0, pi)

garden(
    arc = arc,
    possibilities = c(0, 0, 0, 1),
    data = dat,
    hedge = 0.05,
    ring_dist = ring_dist,
    alpha.fade = 1
    )


## ---- echo = FALSE, eval = TRUE, fig.height = 10, fig.width = 10, fig.align = "center"-----------------
dat <- c(1, 0, 1)
arc <- c(0, pi)

garden(
    arc = arc,
    possibilities = c(0, 0, 0, 1),
    data = dat,
    hedge = 0.05,
    ring_dist = ring_dist,
    alpha.fade = 0.3
    )


## ---- echo = FALSE, eval = TRUE, fig.height = 7, fig.width = 7, fig.align = "center"-------------------
dat <- c(1, 0, 1)
ac <- c(1.2, 0.9, 0.6)

arc <- c( pi / 2, pi / 2 + (2 / 3) * pi)

garden(
    arc = arc,
    possibilities = c(1, 0, 0, 0),
    data = dat,
    hedge = 0.05,
    adj.cex = ac
    ) 

arc <- c(arc[2], arc[2] + (2 / 3) * pi)

garden(
    arc = arc,
    possibilities = c(1, 1, 0, 0),
    data = dat,
    hedge = 0.05,
    newplot = FALSE,
    adj.cex = ac
    )

arc <- c(arc[2], arc[2] + (2 / 3) * pi)

garden(
    arc = arc,
    possibilities = c(1, 1, 1, 0),
    data = dat,
    hedge = 0.05,
    newplot = FALSE,
    adj.cex = ac
    )

line.polar(c(0, 2), pi / 2, lwd = 1)
line.polar(c(0, 2), pi / 2 + (2 / 3) * pi, lwd = 1)
line.polar(c(0, 2), pi / 2 + 2 * (2 / 3) * pi, lwd = 1)


## ---- echo = TRUE, eval = TRUE-------------------------------------------------------------------------
ways <- c(0, 3, 8, 9, 0)
ways / sum(ways)


## ----echo = FALSE, fig.align = "center", dev = "svg", fig.width = 6, fig.height = 4, cache = FALSE-----
coin <- dbinom(x = 0:10, size = 10, prob = 0.5)
barplot(coin, names.arg = 0:10, border = NA, axes = FALSE, cex.names = 1.5, col = "grey20")


## ----eval = TRUE, echo = TRUE--------------------------------------------------------------------------
# PMFs sum to 1
dbinom(x = 0:10, size = 10, prob = 0.5) %>% sum


## ----echo = FALSE, fig.align = "center", dev = "svg", fig.width = 6, fig.height = 5--------------------
data.frame(x = c(0, 200) ) %>%
    ggplot(aes(x) ) +
    stat_function(
        fun = dnorm,
        args = list(mean = 100, sd = 15),
        lwd = 1.5
        ) +
    labs(x = "QI", y = "Densit?? de probabilit??")


## ----echo = TRUE---------------------------------------------------------------------------------------
# PDFs integrate to 1
integrate(dnorm, -Inf, Inf, mean = 100, sd = 15)


## ----message = FALSE, echo = FALSE, dev = "svg", fig.align = "center", fig.width = 7, fig.height = 5----
cord.x <- c(90, seq(90, 96, 0.01), 96) 
cord.y <- c(0, dnorm(seq(90, 96, 0.01), 100, 15), 0) 

data.frame(x = c(0, 200) ) %>%
    ggplot(aes(x) ) +
    stat_function(
        fun = dnorm,
        args = list(mean = 100, sd = 15),
        lwd = 2,
        color = "black"
        ) +
    geom_polygon(
        data = data.frame(cord.x, cord.y),
        aes(cord.x, cord.y),
        color = "black"
        ) +
    labs(x = "QI", y = "Densit?? de probabilit??")


## ----message = FALSE, echo = FALSE, fig.align = "center", dev = "svg", fig.width = 7, fig.height = 5----
data.frame(x = c(0, 200) ) %>%
    ggplot(aes(x) ) +
    stat_function(
        fun = dnorm,
        args = list(mean = 100, sd = 15),
        lwd = 2
        ) +
    geom_polygon(
        data = data.frame(cord.x, cord.y),
        aes(cord.x, cord.y)
        ) +
    labs(x = "QI", y = "Densit?? de probabilit??")


## ----eval = TRUE, echo = TRUE, fig.align = "center", fig.width = 8, fig.height = 6---------------------
integrate(dnorm, 90, 96, mean = 100, sd = 15)


## ---- message = FALSE, echo = TRUE---------------------------------------------------------------------
library(tidyverse)

data(HairEyeColor) # data adapted from Snee (1974)

cont <- apply(HairEyeColor, c(1, 2), sum) %>% t 
cont <- round(cont / sum(cont), 2)
cont


## ---- echo = TRUE--------------------------------------------------------------------------------------
cont2 <- cont %>% as.data.frame %>% mutate(marginal_eye = rowSums(cont) )
rownames(cont2) <- row.names(cont)
cont2


## ---- echo = TRUE, eval = TRUE-------------------------------------------------------------------------
cont3 <- rbind(cont2, colSums(cont2) )
rownames(cont3) <- c(row.names(cont2), "marginal_hair")
cont3


## ---- echo = FALSE, eval = TRUE------------------------------------------------------------------------
cont3["Blue", ]


## ---- echo = TRUE, eval = TRUE-------------------------------------------------------------------------
cont3["Blue", "Blond"] / cont3["Blue", "marginal_eye"]  


## ---- echo = TRUE--------------------------------------------------------------------------------------
prior <- c(0.008, 0.992)


## ---- echo = TRUE--------------------------------------------------------------------------------------
like <- rbind(c(0.9, 0.1), c(0.07, 0.93) ) %>% data.frame
colnames(like) <- c("Mam+", "Mam-")
rownames(like) <- c("Cancer+", "Cancer-")
like


## ---- echo = TRUE--------------------------------------------------------------------------------------
(marginal <- sum(like$"Mam+" * prior) )


## ---- echo = TRUE--------------------------------------------------------------------------------------
(posterior <- (like$"Mam+" * prior ) / marginal )


## ----echo = FALSE, fig.align = "center", out.width = "600px"-------------------------------------------
knitr::include_graphics("figures/monty2.png")

