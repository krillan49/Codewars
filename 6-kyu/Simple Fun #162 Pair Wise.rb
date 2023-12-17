#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given an array arr and a number n. Call a pair of numbers from the array a Perfect Pair if their sum is equal to n.
#
# Find all of the perfect pairs and return the sum of their indices.
#
# Note that any element of the array can only be counted in one Perfect Pair. Also if there are multiple correct answers, return the smallest one.
#
# Example
# For arr = [1, 4, 2, 3, 0, 5] and n = 7, the result should be 11.
#
# Since the Perfect Pairs are (4, 3) and (2, 5) with indices 1 + 3 + 2 + 5 = 11.
#
# For arr = [1, 3, 2, 4] and n = 4, the result should be 1.
#
# Since the element at index 0 (i.e. 1) and the element at index 1 (i.e. 3) form the only Perfect Pair.
#
# Input/Output
# [input] integer array arr
# array of non-negative integers.
#
# [input] integer n
# positive integer
#
# [output] integer
# sum of indices and 0 if no Perfect Pair exists.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def pairwise(arr, n)
  r = arr.map.with_index{|e, i| [e, i]}.combination(2).select{|a, b| a[0] + b[0] == n}.map{|a, b| [a[1], b[1]]}
  num = r.flatten.uniq.sort
  res = []
  num.each do |e|
    new = r.select{|a| a.include?(e)}.min_by(&:sum)
    res << new
    r = r.reject{|a| a.include?(new[0]) || a.include?(new[1])} if new != nil
  end
  res.compact.flatten.sum
end
