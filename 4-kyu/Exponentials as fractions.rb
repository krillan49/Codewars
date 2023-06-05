#===============================================================================================================
#                                               Description
#===============================================================================================================

# The aim is to calculate exponential(x) (written exp(x) in most math libraries) as an irreducible fraction, the numerator of this fraction having a given number of digits.
#
# We call this function expand, it takes two parameters, x of which we want to evaluate the exponential, digits which is the required number of digits for the numerator.
#
# The function expand will return an array of the form [numerator, denominator]; we stop the loop in the Taylor expansion (see references below) when the numerator has a number of digits >= the required number of digits
#
# Examples:
# expand(1, 2) --> 65/24 (we will write this [65, 24] or (65, 24) in Haskell;
# 65/24 ~ 2.708...)
#
# expand(2, 5) --> [20947, 2835]
#
# expand(3, 10) --> [7205850259, 358758400]
#
# expand(1.5, 10) --> [36185315027,8074035200]
# Note expand(1,5) = [109601, 40320] is the same as expand(1, 6)
#
# #Method: As said above the way here is to use Taylor expansion of the exponential function though it is not always the best approximation by a rational.
#
# #References: https://en.wikipedia.org/wiki/Exponential_function#Formal_definition
#
# http://www.efunda.com/math/taylor_series/exponential.cfm

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def expand(x, digit)
  x = x.to_s.to_r
  res, k = 1, 1
  until res.to_s.split('/')[0].size >= digit
    res += x**k / (1..k).inject(:*)
    k += 1
  end
  res.to_s.split('/').map(&:to_i)
end
