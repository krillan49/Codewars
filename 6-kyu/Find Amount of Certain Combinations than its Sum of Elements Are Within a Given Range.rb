#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given a certain array of positive and negative integers which elements occur only once (all of them different from 0), a certain number known as target, t, t ≠ 0, and a number k, k > 0.
#
# You should find the amount of combinations, which numbers are not contiguous elements of the given array and which sums (adding up their numbers) are in the range [t - k, t + k] (extremes included)
#
# array = [-4, 2, 1, 6, 4, -3, -1]
# t = 5
# k = 2
# find_comb_noncontig(array, t, k) == 11
# # The combinations are [6], [4], [2, 4], [1, 4], [6, -3], [6, -1], [4, -1], [2, 6, -3], [2, 6, -1], [2, 4, -1], [1, 4, -1]
# # all of their sums are in the range [3, 7]
# It is possible that no combinations may be found fulfilling these constraints.
#
# array = [-4, 2, 1, 6, 4, -3, -1]
# t = -30
# k = 3
# find_comb_noncontig(array, t, k) == 0

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_comb_noncontig(arr, t, k)
  smej = arr.each_cons(2).to_a
  range = (t-k..t+k)
  (1..arr.size).map do |n|
    arr.combination(n).select{|a| range.include?(a.sum)}
    .reject{|a| a.size > 1 && smej.any?{|s| a.include?(s[0]) && a.include?(s[1])} }
  end.flatten(1).size
end
