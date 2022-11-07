library(tidyverse)

p <- c(0.3, 0.7) # distribution cible
q1 <- c(0.25, 0.75) # modèle q1
q2 <- c(0.2, 0.8) # modèle q2
q3 <- c(0.1, 0.9) # modèle q3
q4 <- c(0.15, 0.85) # modèle q4

(div_q1 <- sum(p * log(p / q1) ) ) # divergence modèle q1
(div_q2 <- sum(p * log(p / q2) ) ) # divergence modèle q2
(div_q3 <- sum(p * log(p / q3) ) ) # divergence modèle q3
(div_q4 <- sum(p * log(p / q4) ) ) # divergence modèle q4

sum(p * log(q1) ) # entropie croisée modèle q1
sum(p * log(q2) ) # entropie croisée modèle q2
sum(p * log(q3) ) # entropie croisée modèle q3
sum(p * log(q4) ) # entropie croisée modèle q4

(deviance_q1 <- (- 2) * sum(log(q1) ) ) # déviance modèle q1
(deviance_q2 <- (- 2) * sum(log(q2) ) ) # déviance modèle q2
(deviance_q3 <- (- 2) * sum(log(q3) ) ) # déviance modèle q3
(deviance_q4 <- (- 2) * sum(log(q4) ) ) # déviance modèle q4

# vecteur de divergences
# a <- c(div_q2 - div_q1, div_q3 - div_q1, div_q3 - div_q2)
a <- c(div_q1, div_q2, div_q3, div_q4)

# vecteur de log-score
# b <- c(sum(log(q2) ) - sum(log(q1) ), sum(log(q3) ) - sum(log(q1) ), sum(log(q3) ) - sum(log(q2) ) )
b <- c(sum(log(q1) ), sum(log(q2) ), sum(log(q3) ), sum(log(q4) ) )

# relation entre les deux
data.frame(divergences = a, neglogscore = -b) %>%
    ggplot(aes(x = divergences, y = neglogscore) ) +
    geom_line() +
    geom_point() +
    labs(x = "KL Divergence", y = "Negative log-score")
