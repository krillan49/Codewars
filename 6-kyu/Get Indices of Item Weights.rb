#===============================================================================================================
#                                               Description
#===============================================================================================================

# Get Indices of Item Weights
#
# Given a package with a weight limit limit and an array arr of item weights, implement a method (ruby)/function (javascript) that finds two items whose sum of weights equals the weight limit limit. Your method/function should return a pair ex. [i, j] of the indices of the item weights. If such a pair doesn’t exist, return nil/null.
#
# Challenge Complete in under O(n^2) a.k.a. quadratic time complexity
#
# Constraints: Returned Array elements could not be the same index position so [1, 1] would not be acceptable...
#
# Return the first pair, a.k.a lexographically speaking, that sums up to the limit
#
# [input] array.integer arr 2 ≤ arr.length ≤ 100
#
# [input] integer limit
#
# [output] array.integer

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def get_indices_of_item_weights(arr, limit)
  arr.each.with_index do |e, i|
    s = arr[1..-1].find{|n| n + e == limit} if i != arr.size-1
    return [i, arr.index(s)] if s
  end
  nil
end
