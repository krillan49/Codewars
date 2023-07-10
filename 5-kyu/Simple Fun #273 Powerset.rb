#===============================================================================================================
#                                               Description
#===============================================================================================================

# For the given set S its powerset is the set of all possible subsets of S.
#
# Given an array of integers nums, your task is to return the powerset of its elements.
#
# Implement an algorithm that does it in a depth-first search fashion. That is, for every integer in the set, we can either choose to take or not take it. At first, we choose NOT to take it, then we choose to take it(see more details in exampele).
#
# Example
# For nums = [1, 2], the output should be [[], [2], [1], [1, 2]].
#
# Here's how the answer is obtained:
#
# don't take element 1
# ----don't take element 2
# --------add []
# ----take element 2
# --------add [2]
# take element 1
# ----don't take element 2
# --------add [1]
# ----take element 2
# --------add [1, 2]
# For nums = [1, 2, 3], the output should be
#
# [[], [3], [2], [2, 3], [1], [1, 3], [1, 2], [1, 2, 3]].
#
# Input/Output
# [input] integer array nums
#
# Array of positive integers, 1 ≤ nums.length ≤ 10.
#
# [output] 2D integer array
#
# The powerset of nums.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def powerset(nums)
  inds = (0...nums.size).to_a
  (0..inds.size).map{|n| inds.combination(n).to_a}.flatten(1).map{|a| a + [Float::INFINITY] * (10 - a.size)}
  .sort_by{|a| [*(0..9).map{|e| -a[e]}, a.reject{|e| e == Float::INFINITY}.size]}
  .map{|a| a.reject{|e| e == Float::INFINITY}.map{|e| nums[e]}}
end
