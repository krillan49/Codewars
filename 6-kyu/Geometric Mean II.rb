#===============================================================================================================
#                                               Description
#===============================================================================================================

# If you did Geometric Mean I ( http://www.codewars.com/kata/geometric-mean-i), you may continue with this second part.
#
# We have seen the formula:
#
# https://imgur.com/tD9bZui
#
# This expression is not convenient to apply to statistical researches, specially when we have high values of the variable x and/or many entries of it, because the value of the product will be huge and an error message will appear in our codes for the calculation of the geometric mean.
#
# In real life, most of the researches will not have so many values of a variable but each one repeated with a certain specific frequency.
#
# This would be our situation using the above formula:
#
# https://imgur.com/UXxrzTi
#
# Implementing logarithms we have:
#
# https://imgur.com/onWZA4H
#
# The logarithms more suitable for this formula are the ones with base 10.
#
# Our task is to implement the function geometric_meanII()(geometricMeanII, Javascript), that should be able to make the calculations of the geometric mean from pretty much longer arrays than the ones used for Goemetric Mean I.
#
# The function will output the value of the geometric mean without roundings.
#
# We will use the same criteria for invalid entries than the previous kata. (strings and negative values of x)
#
# amount of entries      maximum invalid entries
#   2 - 10                       1
#   From 11 and above      <10 % of total of entries
# If the limit of bad entries is exceeded, the function should output 0 (When you finish this kata, Geometric Mean III will be waiting you)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def geometric_meanII(arr)
  c = arr.count{|e| e.class.superclass != Numeric or e < 0}
  return 0 if (c > 1 && arr.size < 11) or (arr.size > 10 && arr.size / c.to_f <= 10)
  a = arr.reject{|e| e.class.superclass != Numeric or e < 0}
  a.map{|e| e**(1.0 / a.size)}.inject(:*)
end
