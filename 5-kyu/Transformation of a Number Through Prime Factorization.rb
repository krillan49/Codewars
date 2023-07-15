#===============================================================================================================
#                                               Description
#===============================================================================================================

# Every natural number, n, may have a prime factorization like:
#
# https://imgur.com/1M2nwjh
#
# We define the geometric derivative of n, as a number with the following value:
#
# https://imgur.com/dMNPsIx
#
# For example: calculate the value of n* for n = 24500.
#
# 24500 = 2²5³7²
# n* = (2*2) * (3*5²) * (2*7) = 4200
# Make a function, f that can perform this calculation
#
# f(n) ----> n*
# Every prime number will have n* = 1.
#
# Every number that does not have an exponent ki, higher than 1, will give a n* = 1, too
#
# f(24500) == 4200
#
# f(997) == 1

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def f(n)
  n.prime_division.map{|p, k| k * p**(k - 1)}.inject(:*)
end
