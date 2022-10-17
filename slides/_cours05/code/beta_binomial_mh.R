library(tidyverse)

# current = 0.5
# rbeta(1, current * (2 - 2) + 1, (1 - current) * (2 - 2) + 1)

metropolis_hastings <- function (niter = 1e2, startval = 0.5) {
    
    x <- rep(0, niter) # initialises the chain vector
    x[1] <- startval # defines the starting value
    
    for (i in 2:niter) {
        
        current <- x[i - 1] # current value of the parameter
        current_plaus <- dbeta(current, 2, 3) * dbinom(1, 2, current)
        proposal <- runif(n = 1, min = 0, max = 1) # proposed value of the parameter
        proposal_plaus <- dbeta(proposal, 2, 3) * dbinom(1, 2, proposal)
        alpha <- min(1, proposal_plaus / current_plaus) # moving probability ratio
        x[i] <- sample(c(current, proposal), size = 1, prob = c(1 - alpha, alpha) )
        
    }
    
    return (x)
    
}

z1 <- metropolis_hastings(niter = 1e4, startval = 0.5)
z2 <- metropolis_hastings(niter = 1e4, startval = 0.5)

data.frame(z1 = z1, z2 = z2) %>%
    mutate(sample = 1:nrow(.) ) %>%
    pivot_longer(cols = z1:z2) %>%
    ggplot(aes(x = sample, y = value, colour = name) ) +
    geom_line(show.legend = FALSE) +
    labs(x = "Nombre d'itérations", y = expression(theta) )

data.frame(z1 = z1, z2 = z2) %>%
    pivot_longer(cols = z1:z2) %>%
    rownames_to_column() %>%
    mutate(rowname = as.numeric(rowname) ) %>%
    ggplot(aes(x = value) ) +
    geom_histogram(aes(y = ..density..), color = "white") +
    stat_function(fun = dbeta, args = list(3, 4), color = "purple", size = 1) +
    facet_wrap(~name) +
    labs(x = expression(theta) )
