#===============================================================================================================
#                                               Description
#===============================================================================================================

# Each composed integer may have a prime factorization. If n is the integer, it will be:
#
# https://imgur.com/M5n0WCg
#
# and k1, k2, k3....., kn are the exponents corresponding to each prime in the factorization.
#
# The radical of n, Rad(n), will be the product of all the prime factors of the number, (without the exponents), so:
#
# Rad(n) = p1 . p2 . p3 .....pn
#
# Let's see an example for a number, if n = 172800
#
# its prime factorization will be
#
# n = 2^8 . 3^3 . 5^2,
#
# Rad(172800) = 2 . 3 . 5 = 30
#
# Many numbers, smaller than 172800, may have a radical considerably higher than 30, for example:
#
# Rad(9305) = 5 . 1861 = 9305
#
# Primes are a particular case, the value of its radical coincides with the value of the prime itself
#
# Rad(31) = 31
#
# Rad(57) = 57
#
# To number 1 it's assigned, Rad(1) = 1
#
# Let's see the comparison between numbers and radicals for the first 10 numbers
#
#    n       Prime Descomposition    Prime Factors     Radical(n)
#    1                                                         1
#    2               2                       2                 2
#    3               3                       3                 3
#    4              2, 2                     2                 2
#    5               5                       5                 5
#    6              2, 3                    2, 3               6
#    7               7                       7                 7
#    8              2, 2, 2                  2                 2
#    9              3, 3                     3                 3
#   10              2, 5                    2, 5               10
# The list above may be sorted by the value of the radicals and the order changes having another sequence. We add a new column that gives the ordinal number of different values
#
# k- Term        n       Radical(n)
# 1              1            1
# 2              2            2
# 3              4            2
# 4              8            2
# 5              3            3
# 6              9            3
# 7              5            5
# 8              6            6
# 9              7            7
# 10            10            10
# We have some numbers that have the same value for its radical, the smaller numbers are selected to go first. For example, n = 2, 4, 8 have Radical(n) = 2, these numbers should be ordered by their own value.
#
# Create a function hash_radSeq() that receives two arguments:
#
# nMax is the upper bound such that all values of n are in the interval (1, nMax) (1 <= n <= nMax)
#
# the number k, which is the ordinal number of a certain term in a sequence sorted by the values of the radicals
#
# the function should ouput the value of n, for the corresponding ordinal number k (k-th), in a sequence sorted bby the values of Rad(n) Let's see some examples:
#
# hash_radSeq(10, 4) ------> 8
# hash_radSeq(10, 6) ------> 9
# hash_radSeq(10, 9) ------> 7
# If we increase of the number of nMax to 20, the sequence changes
#
# hash_radSeq(20, 4) ------> 8
# hash_radSeq(20, 6) ------> 3
# hash_radSeq(20, 9) ------> 6
# (Your code will be tested for values of nMax up to 60000 and values of k up to 11000, so try to think in some data structure, useful for fast hashing)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

RADS = {1=>1}

def hash_radSeq(n, k)
  m = RADS.keys.max || 0
  (m+1..n).each{|e| RADS[e] = e.prime_division.map{|a| a[0]}.inject(:*)} if n > m
  RADS.keys.select{|key| key <= n}.map{|key| [key, RADS[key]]}.sort_by{|a| [a[1], a[0]]}[k-1][0]
end
