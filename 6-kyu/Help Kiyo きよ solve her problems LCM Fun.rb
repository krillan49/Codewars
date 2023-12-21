#===============================================================================================================
#                                               Description
#===============================================================================================================

# Kiyo has been given a series of problems and she needs your help to solve them!
#
# You will be given a two-dimensional array such as the one below.
#
# a =
# [
#   [1, 2, 3, 4, 5, 6, 7, 8, 9],
#   [1, 2, 3, 4, 5, 6, 7, 8, 9],
#   [1, 2, 3, 4, 5, 6, 7, 8, 9],
#   [1, 2, 3, 4, 5, 6, 7, 8, 9],
#   [1, 2, 3, 4, 5, 6, 7, 8, 9],
#   [1, 2, 3, 4, 5, 6, 7, 8, 9],
#   [1, 2, 3, 4, 5, 6, 7, 8, 9],
#   [1, 2, 3, 4, 5, 6, 7, 8, 9],
#   [1, 2, 3, 4, 5, 6, 7, 8, 9]
# ]
#
# Remove everything but odd integers from each sub-array.
#
# Sum the remaining odd integers of each sub-array.
#
# Sum of odds ( a[0] = 1 + 3 + 5 + 7 + 9 ) = 25
#
# Find the Least common multiple of the arrays.
#
#  (25, 25, 25, 25, 25, 25, 25, 25, 25)
#   ^                                ^
#   |                                |
# a[0]-----------------------------a[8]
#
# example : lcm( 25, 25, 25, 25, 25, 25, 25, 25, 25 ) = 25
#
# example : lcm( 37, 29, 19, 38, 31, 28, 15, 24, 9 ) = 1592632440
# Integers are between 0 and 9. Sub-array size is always 9. The number of sub-arrays varies between 9 and 18.
#
# Watch out for non-integers mixed in the arrays. If all arrays are empty return 0.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def kiyo_lcm(arr)
  r = arr.map{|a| a.select{|n| n.class == Integer && n.odd?}}
  return 0 if r.any?(&:empty?)
  r.map(&:sum).reduce(1, :lcm)
end
