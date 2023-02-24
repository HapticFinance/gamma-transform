# Gamma transform

This is an implementation of the gamma transform concept by Guillame Lambert [1]. 

A simple optimization problem to find the amount of Uniswap V3 single tick liquidity position that perfectly hedge the gamma of a long squeeth position.
Squeeth an ETH perpetual by Opyn [2].  

## Why this? 

From [1]
> Why would someone want to hedge a long squeeth? I’m not entirely sure. While holding a squeeth means that one would need to pay a fixed funding rate, a net positive income may result from shorting ETH (if ETH is shorted on a perp futures exchange) and deploying a Uni v3 LP position (by collecting Uni v3 LP fees).

## Requirements

- R

## Installation

- Install R from [here](https://cran.r-project.org/bin/linux/ubuntu/) (Ubuntu)
- Clone this repository

## Usage

- Open a terminal and navigate to the repository
- Check that the file has executable permissions or grant them with `chmod +x solve.r`
- Run `./solve.r`


# References

[1] https://lambert-guillaume.medium.com/gamma-transforms-how-to-hedge-squeeth-using-uni-v3-da785cb8b378

[2] https://medium.com/opyn/squeeth-primer-a-guide-to-understanding-opyns-implementation-of-squeeth-a0f5e8b95684