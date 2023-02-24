# Gamma transform

This is an implementation of the gamma transform concept by Guillame Lambert [1]. 

A simple optimization problem to find the amount of Uniswap V3 single tick liquidity position that perfectly hedge the gamma of squeeth, an ETH perpetual by Opyn [2]. It will plot the positions info and convexity of the objective function to a pdf.

## Requirements

- R

## Installation

- Install R from [here](https://cran.r-project.org/bin/linux/ubuntu/) (Ubuntu)
- Clone this repository

## Usage

- Open a terminal and navigate to the repository
- Check that gen_pdf has executable permissions and grant them with `chmod +x solve.r`
- Run `./solve.r`


# References
[1] https://lambert-guillaume.medium.com/gamma-transforms-how-to-hedge-squeeth-using-uni-v3-da785cb8b378
[2] https://medium.com/opyn/squeeth-primer-a-guide-to-understanding-opyns-implementation-of-squeeth-a0f5e8b95684