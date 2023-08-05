#===============================================================================================================
#                                               Description
#===============================================================================================================

# Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.
#
# For example:
#
# greatestProduct("123834539327238239583") // should return 3240
# The input string always has more than five digits.
#
# Adapted from Project Euler.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def greatest_product(n)
  n.chars.map(&:to_i).each_cons(5).map{|a| a.inject(:*)}.max
end
