#===============================================================================================================
#                                               Description
#===============================================================================================================

# Consider the array [3,6,9,12]. If we generate all the combinations with repetition that sum to 12, we get 5 combinations: [12], [6,6], [3,9], [3,3,6], [3,3,3,3]. The length of the sub-arrays (such as [3,3,3,3] should be less than or equal to the length of the initial array ([3,6,9,12]).
#
# Given an array of positive integers and a number n, count all combinations with repetition of integers that sum to n. For example:
#
# find([3,6,9,12],12) = 5.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find(arr,n)
  (1..arr.size).map{|k| arr.repeated_combination(k).select{|a| a.sum == n}}.flatten(1).size
end
