#===============================================================================================================
#                                               Description
#===============================================================================================================

# Some numbers can be expressed as a difference of two squares, for example, 20 = 62-42 and 21 = 52-22. Many numbers can be written this way, but not all.
#
# Your Task
# Complete the function that takes a positive integer n and returns the amount of numbers between 1 and n (inclusive) that can be represented as the difference of two perfect squares.
#
# Note: Your code should be able to handle n values up to 45000
#
# Examples
# n = 4 ==> 3
# n = 5 ==> 4
# n = 10 ==> 7
# n = 20 ==> 15
# n = 6427 ==> 4820

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def count_squareable(n)
  n/4 + (n.odd? ? n/2+1 : n/2)
end
