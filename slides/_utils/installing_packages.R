########################################################
# Installing all packages
####################################################

# checking R version
version

# installing rstan
# https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started.

# installing packages
install.packages(
  c(
    "data.table", "coda", "mvtnorm", "devtools", "MASS", "ellipse", "rstan",
    "BayesFactor", "BEST", "coda", "LearnBayes", "markdown", "mcmc", "MCMCpack",
    "MuMIn", "reshape2", "rmarkdown", "brms", "tidyverse", "tidybayes",
    "bayesplot", "shinystan", "lme4", "patchwork"
    ),
  dependencies = TRUE
  )

# see https://github.com/rmcelreath/rethinking
devtools::install_github("rmcelreath/rethinking")
