#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given integer n determining set S = {1, 2, ..., n}. Determine if the number of k-element subsets of S is ODD or EVEN for given integer k.
#
# Example
# For n = 3, k = 2, the result should be "ODD"
#
# In this case, we have 3 2-element subsets of {1, 2, 3}:
#
# {1, 2}, {1, 3}, {2, 3}
#
# For n = 2, k = 1, the result should be "EVEN".
#
# In this case, we have 2 1-element subsets of {1, 2}:
#
# {1}, {2}
#
# Don't bother with naive solution - numbers here are really big.
#
# Input/Output
# [input] integer n
#
# 1 <= n <= 10^9
#
# [input] integer k
#
# 1 <= k <= n
#
# [output] a string
#
# "EVEN" or "ODD" depending if the number of k-element subsets of S = {1, 2, ..., n} is ODD or EVEN.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# The binomial coefficient is divisible by 2? You can start by counting the number of twos for each of the 3 factors of this formula.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def counter(m) # count the number of twos in each factorial of the formula for the number of combinations
  sum2 = 0
  e = 2
  until m / e == 0
    sum2 += m / e
    e *= 2
  end
  sum2
end

def subsets_parity(n,k) # (1..n).inject(:*)/((1..k).inject(:*)*(1..n-k).inject(:*))
  res=counter(n) - counter(k) - counter(n-k)
  res>0 ? 'EVEN' : 'ODD'
end
