#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given an array (ints) of n integers, find three integers in arr such that the sum is closest to a given number (num), target.
#
# Return the sum of the three integers. You may assume that each input would have exactly one solution.
#
# Example:
#
# closest_sum([-1, 2, 1, -4], 1) # 2 (-1 + 2 + 1 = 2)
# Note: your solution should not modify the input array.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def closest_sum(ints, num)
  ints.clone.combination(3).map(&:sum).sort_by{|s| (s - num).abs}[0]
end
