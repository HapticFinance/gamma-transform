#!/usr/bin/env Rscript
path = getwd()
source(paste(path, "/install.r", sep=""))
source(paste(path, "/config.r", sep=""))


run <- function(N) {
    # Gamma transform
    # From https://lambert-guillaume.medium.com/gamma-transforms-how-to-hedge-squeeth-using-uni-v3-da785cb8b378
   
    Pa <- tick_base^(tick_index)
    Pb <- (tick_base^(tick_index)) + (min_tick_dollar_value)
    
    range_factor <- sqrt(Pb / Pa)
    K <- sqrt(Pb * Pa)

    P <- K

    V_P <- (2 * (sqrt((K * range_factor) * P))) - K - P / range_factor -1
    Delta_P <- sqrt( (K * range_factor) / P) - 1 / range_factor -1
    Gamma_P <- (-sqrt(K * range_factor)) / 2 * (range_factor - 1) * P^(-3/2)
    
    strikes <- c()
    gammas <- c()

    r0 <- range_factor^(1 / N)

    total_gamma <- 0

    for (i in 1:N) {

        strikes[i] <- K / (range_factor * r0^(2 * i - 1))
        position_size <- 2 * strikes[i] * ((r0^2 - 1) / r0)

        liq <- 2 * strikes[i] * ((r0^2 - 1) / r0)
        Delta_P <- (sqrt( (strikes[i] * r0) / P) - 1) / (r0 -1)
        Gamma_P <- -sqrt(K * r0) / (2 * (r0 - 1)) * P^(-3 / 2)
        gammas[i] <- Gamma_P
        total_gamma <- total_gamma + Gamma_P

    }

    return(total_gamma)
}



