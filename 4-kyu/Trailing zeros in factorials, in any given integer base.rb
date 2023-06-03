#===============================================================================================================
#                                               Description
#===============================================================================================================

# A factorial (of a large number) will usually contain some trailing zeros. Your job is to make a function that calculates the number of trailing zeros, in any given base.
#
# Factorial is defined like this: n! = 1 * 2 * 3 * 4 * ... * n-2 * n-1 * n
#
# Here's two examples to get you started:
#
# trailing_zeros(15, 10) == 3
# #15! = 1307674368000, which has 3 zeros at the end
#
# trailing_zeros(7, 2) == 4
# #7! = 5030 = 0b1001110110000, which has 4 zeros at the end
# Your code should be able to handle some very large numbers, so write some smart code.
#
# Note: num will be a non-negative integer, base will be an integer larger or equal to two.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def trailing_zeros(n, base)
  base.prime_division.map do |d, num|
    m = d
    counter = 0
    while n >= m
      counter += n / m
      m *= d
    end
    counter / num
  end.min
end
