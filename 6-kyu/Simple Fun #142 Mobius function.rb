#===============================================================================================================
#                                               Description
#===============================================================================================================

# Compute the Mobius function μ(n) for a given value of n.
#
# For a given n, the Mobius function is equal to:
#
# 0 if n is divisible by the square of any prime number. For example n = 4, 8, 9 are all divisible by the square of at least one prime number.
#
# 1 if n is not divisible by the square of any prime numbers, and has an even number of prime factors. For example n = 6, 10, 21 satisfy these conditions (e.g. 21 = 3 * 7 so it has an even number (2) of distinct prime factors and is not divisible by the square of any prime numbers).
#
# -1 otherwise. For example n = 3, 5, 7, 30.
#
# Input/Output
# You will be given an integer n; you must return an integer - the Mobius function of n.
#
# Performance requirements:
#
# 2 <= n <= 1e12

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def mobius(n)
  r = n.prime_division
  r.map{|a| a[1]}.any?{|e| e > 1} ? 0 : r.size.even? ? 1 : -1
end
