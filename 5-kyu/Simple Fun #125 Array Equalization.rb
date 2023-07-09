#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given an array a of positive integers and an intger k. You may choose some integer X and update a several times, where to update means to perform the following operations:
#
# pick a contiguous subarray of length not greater than the given k;
# replace all elements in the picked subarray with the chosen X.
# What is the minimum number of updates required to make all the elements of the array the same?
#
# Example
# For a = [1, 2, 2, 1, 2, 1, 2, 2, 2, 1, 1, 1] and k = 2, the output should be 4.
#
# Here's how a will look like after each update:
#
# [1, 2, 2, 1, 2, 1, 2, 2, 2, 1, 1, 1] ->
# [1, 1, 1, 1, 2, 1, 2, 2, 2, 1, 1, 1] ->
# [1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1] ->
# [1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1] ->
# [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
# Input/Output
# [input] integer array a
# An array of positive integers.
#
# Constraints:
#
# 10 ≤ a.length ≤ 50,
#
# 1 ≤ a[i] ≤ 10.
#
# [input] integer k
# A positive integer, the maximum length of a subarray.
#
# Constraints: 2 ≤ k ≤ 9.
#
# [output] an integer
# The minimum number of updates.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def counter(a, k, num)
  counter = 0
  until a.uniq.size == 1
    a.each_with_index do |e, i|
      if e != num
        a[i, k] = a[i, k].map{|e| num}
        break
      end
    end
    counter += 1
  end
  counter
end

def array_equalization(a, k)
  a.uniq.map{|e| counter(a.clone, k, e)}.min
end
