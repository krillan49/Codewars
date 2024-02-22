#===============================================================================================================
#                                               Description
#===============================================================================================================

# Upside-Down Pyramid Addition is the process of taking a list of numbers and consecutively adding them together until you reach one number.
#
# When given the numbers 2, 1, 1 the following process occurs:
#
#  2   1   1
#    3   2
#      5
# This ends in the number 5.
#
# YOUR TASK
# Given the right side of an Upside-Down Pyramid (Ascending), write a function that will return the original list.
#
# EXAMPLE
# reverse_pyramid([5, 2, 1]) == [2, 1, 1]
# NOTE: The Upside-Down Pyramid will never be empty and will always consist of positive integers ONLY.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def reverse_pyramid(r)
  r.map!{|n| [n]}
  r.each_with_index do |a, i|
    a.each_with_index{|n, j| r[i+1].push(n - r[i+1][j])} if i < r.size - 1
  end
  r[-1].reverse
end
