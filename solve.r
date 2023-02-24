#!/usr/bin/env Rscript
path = getwd();
source(paste(path, "/install.r", sep=""));
source(paste(path, "/config.r", sep=""));
source(paste(path, "/gamma_transform.r", sep=""));

# define the objective function
obj_fun <- function(N, Y) {
  X <- run(N)
  return(abs(X - Y))
}

# set the target value of Y
Y <- -gamma_hedge

tic("Solve...")
# use the optim function to find the optimal value of N
result <- optim(
    par = 1, 
    fn = obj_fun, 
    Y = Y, 
    lower = 1,
    upper = 100, 
    method = "Brent", 
    control = list(reltol = 1e-9, maxit = 1000)
)
toc()

# print the result
print(glue::glue("Optimal value of N: {result$par}"))

# create a data frame with N and the objective function values
df <- data.frame(N = 1:100, obj_fun = sapply(1:100, obj_fun, Y = Y))

# create the plot
ggplot(df, aes(x = N, y = obj_fun)) +
  geom_line() +
  xlab("N") +
  ylab("Objective Function") +
  ggtitle("Objective Function vs. N")