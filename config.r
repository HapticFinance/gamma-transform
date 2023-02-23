#!/usr/bin/env Rscript
path = getwd()
source(paste(path, "/install.r", sep=""))

# Initial parameters 

# Number of single tick positions
N <- 8

# Initial price
S0 <- 1000

# Tick base
tick_base <- 1.0001

# Tick spacing (0.3% fees)
tick_spacing <- 60

# Tick index
tick_index <- floor(log(S0, base = tick_base))

# Min tick dollar value
min_tick_dollar_value <- 30