#!/usr/bin/env Rscript
path = getwd()
source(paste(path, "/install.r", sep=""))
source(paste(path, "/config.r", sep=""))

run <- function(P, Pa, Pb) {

    # Gamma transform
    # From https://lambert-guillaume.medium.com/gamma-transforms-how-to-hedge-squeeth-using-uni-v3-da785cb8b378

    range_factor <- sqrt(Pb / Pa)
    K <- sqrt(Pb * Pa)

    V_P <- (2 * (sqrt((K * range_factor) * P))) - K - P / range_factor -1
    Delta_P <- sqrt( (K * range_factor) / P) - 1 / range_factor -1
    Gamma_P <- (-sqrt(K * range_factor)) / 2 * (range_factor - 1) * P^(-3/2)
    
    strikes <- c()
    gammas <- c()

    r0 <- range_factor^(1/N)


    for (i in 1:N) {

        strikes[i] <- K / (range_factor * r0^(2*i-1))
        position_size <- 2 * strikes[i] * ((r0^2 - 1) / r0)

        liq <- 2 * strikes[i] * ((r0^2 - 1) / r0)
        Delta_P <- (sqrt( (strikes[i] * r0) / P) - 1) / (r0 -1)
        Gamma_P <- -sqrt(K * r0) / (2 * (r0 - 1)) * P^(-3/2)
        gammas[i] <- Gamma_P

        print(glue::glue("Position {i}: {liq} Delta_P: {Delta_P} Gamma_P: {formatC(Gamma_P, digits=9, format='f')}"))
    }

    print(glue::glue("Gamma sum: {sum(gammas)}"))
    
}


run(
    S0,
    min_tick^(tick_index),
    (min_tick^(tick_index)) - (30)
)

# 1651.8,
# 1671.8

