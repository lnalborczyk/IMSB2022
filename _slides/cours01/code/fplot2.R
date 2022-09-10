# fplot2(
#     d, mod4, level = 0.95, sort_estimates = FALSE,
#     dens_fill = "dodgerblue", dens_col = NA, scale_method = "width"
# )
# 
# data <- d; model <- mod4; level = 0.95; sort_estimates = FALSE; dens_fill = "dodgerblue"; dens_col = NA; scale_method = "area";
# 

fplot2 <- function(data, model, level = 0.95, sort_estimates = FALSE,
    dens_fill = "dodgerblue", dens_col = NA, scale_method = "area", ...) {
    
    source("geom_flat_violin.R")
    
    samps <- brms::posterior_samples(model, pars = c("b_") )
    samps2 <- predict(model, summary = FALSE) %>% data.frame
    samps <- cbind(samps, samps2)
    data$label <- paste0(data$study, data$experiment)
    names(samps) <- c("ME", data$label)
    
    samps.l <-
        gather_(
            samps, key_col = quote(label),
            value_col = "value", gather_cols = names(samps)
            )
    
    samples_s <- group_by_(samps.l, "label")
    
    samples_s <-
        summarise_(
            samples_s,
            mean = ~mean(value),
            lwr = ~quantile(value, probs = 0.5 - level / 2),
            upr = ~quantile(value, probs = 0.5 + level / 2)
            )
    
    samples_s$s <-
        paste0(
            round(samples_s$mean, 2), " [",
            round(samples_s$lwr, 2), ", ",
            round(samples_s$upr, 2), "]"
            )
    
    samples_s <- full_join(data, samples_s, by = "label")
    
    ylim <-
        c(
            min(samples_s$yi, na.rm = TRUE) - max(samples_s$vi, na.rm = TRUE),
            max(samples_s$yi, na.rm = TRUE) + 6 * max(samples_s$vi, na.rm = TRUE)
            )
    
    if (sort_estimates) {
        
        samples_s <- arrange_(samples_s, "mean")
        samples_s$order <- 1:nrow(samples_s)
        samples_s$order <- ifelse(samples_s$study == "ME", -Inf, samples_s$order)
        samples_s$study <- reorder(samples_s$study, samples_s$order)
        
    }
    
    else {
        
        samples_s <- arrange_(samples_s, "label")
        samples_s$order <- rev(1:nrow(samples_s) )
        samples_s$order <- ifelse(samples_s$label == "ME", -Inf, samples_s$order)
        samples_s$label <- reorder(samples_s$label, samples_s$order)
    }
    
    ggplot(samples_s, aes_(quote(label), quote(mean) ) ) + 
        
        # model estimates
        geom_linerange(aes_(ymin = quote(lwr), ymax = quote(upr) ) ) + 
        geom_flat_violin(
            data = samps.l, fill = dens_fill, col = dens_col, 
            width = 0.95, alpha = 0.4, aes_(y = quote(value) ), scale = scale_method
            ) +
        
        geom_point(aes_(y = quote(mean) ) ) +
        geom_vline(xintercept = 1.5) + 
        geom_hline(yintercept = 0, lty = 2, size = 0.25, alpha = 0.6) +
        coord_flip() +
        
        # raw data
        geom_point(size = 1.2, aes_(y = quote(yi) ), shape = 4, position = position_nudge(x = - 0.2), na.rm = T) +
        geom_linerange(
            size = 0.2,
            aes_(ymin = quote(yi - vi * 1.96), ymax = quote(yi + vi * 1.96) ),
            position = position_nudge(x = - 0.2), na.rm = TRUE
            ) +

        # add text estimates
        geom_text(
            data = filter_(samples_s, quote(label != "ME") ),
            hjust = "inward", vjust = "middle",
            aes_(label = quote(s), y = quote(ylim[2]) )
            ) +
        
        # add ME estimate
        geom_text(
            data = filter_(samples_s, quote(label == "ME") ),
            hjust = "inward", vjust = "middle",
            aes_(label = quote(s), y = quote(ylim[2]) ),
            fontface = "bold"
            ) +
        
        # aesthetics
        theme_bw(base_size = 16) +
        xlab("") +
        ylab("Effect size (Hedge's g)")
    
}
