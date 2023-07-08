#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given two numbers x and y. You have to convert x to y using minimum number of operations.
#
# There are two valid operation on the number x:
#
# Multiply x by some prime p
# Divide x by some prime p
# Your task is to find the minimum number of operations.
#
# Note that integer division is NOT allowed. That is, the result of 7 / 2 is 3.5, instead of 3.
#
# Example
# For: x = 2, y = 3, the result should be 2.
#
# 2 -> 2 * 3 -> 6 / 2 -> 3 in 2 moves.
#
# Input/Output
# [input] integer x
# A decimal positive integer. 0 < x <= 10^12
#
# [input] integer y
# A decimal positive integer. 0 < y <= 10^12
#
# [output] an integer
# The minimum number of operations

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def prime_operations(x, y)
  return 0 if x == y
  (x.prime_division + y.prime_division).group_by{|a| a[0]}.map{|k, v| v.size == 2 ? (v[0][1] - v[1][1]).abs : v[0][1]}.sum
end
