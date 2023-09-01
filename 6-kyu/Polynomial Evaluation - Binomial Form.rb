#===============================================================================================================
#                                               Description
#===============================================================================================================

# The Binomial Form of a polynomial has many uses, just as the standard form does. For comparison, if p(x) is in Binomial Form and q(x) is in standard form, we might write
#
# p(x) := a0 * xC0 + a1 * xC1 + a2 * xC2 + ... + aN * xCN
#
# q(x) := b0 + b1 * x + b2 * x2 + ... + bN * xN
#
# Both forms have tricks for evaluating them, but tricks should not be necessary. The most important thing to keep in mind is that aCb can be defined for non-integer values of a; in particular,
#
# aCb := a * (a-1) * (a-2) * ... * (a-b+1) / b!   // for any value a and integer values b
#     := a! / ((a-b)!b!)                          // for integer values a,b
# The inputs to your function are an array which specifies a polynomial in Binomial Form, ordered by highest-degree-first, and also a number to evaluate the polynomial at. An example call might be
#
# value_at([1, 2, 7], 3)
# and the return value would be 16, since 3C2 + 2 * 3C1 + 7 = 16. In more detail, this calculation looks like
#
# 1 * xC2 + 2 * xC1 + 7 * xC0 :: x = 3
# 3C2 + 2 * 3C1 + 7
# 3 * (3-1) / 2! + 2 * 3 / 1! + 7
# 3 + 6 + 7 = 16
# More information can be found by reading about Binomial Coefficients or about Finite Differences.
#
# Note that while a solution should be able to handle non-integer inputs and get a correct result, any solution should make use of rounding to two significant digits (as the official solution does) since high precision for non-integers is not the point here.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def value_at(spec, x)
  xcb = (spec.size-1).downto(0).map do |b|
    if b == 0
      1
    else
      afac = (0...b).map{|e| x - e}.inject(:*)
      bfac = b < 1 ? 1 : (1..b).inject(:*)
      afac / bfac
    end
  end
  spec.zip(xcb).sum{|arr| arr.inject(:*)}.round(2)
end
