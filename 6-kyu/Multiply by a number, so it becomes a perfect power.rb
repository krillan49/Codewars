#===============================================================================================================
#                                               Description
#===============================================================================================================

# Let's say we have a positive integer, n. You have to find the smallest possible positive integer that when multiplied by
# n, becomes a perfect power of integer k. A perfect power of k is any positive integer that can be represented as a**k. For example if k=2, then 36 is a perfect power of k, but 27 isn't.
#
# Examples
# [n, k] = [100, 3]  return  10, #because 10*100 becomes 1000, and 1000 = 10**3
# [n, k] = [36, 2]   return   1, #because 36 is already a perfect square 6**2
# [n, k] = [72, 4]   return  18, #because 18*72 = 1296 = 6**4
#
# Notes: k,n∈N and 1<n<10**6, 1<k<10
# However, the output may be way larger than 10**6
#
# If you have trouble seeing the numbers, refresh your page ;-) Please rate this kata. All translations are welcome.
#
# ABOVE: If you see this:, refresh your page.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def mul_power(n, k)
  n.prime_division.map{|m, d| m**((d / k.to_f).ceil * k - d)}.inject(:*)
end
