#===============================================================================================================
#                                               Description
#===============================================================================================================

# Take a look to the kata Maximum Subarray Sum https://www.codewars.com/kata/maximum-subarray-sum In that kata (if you solved it), you had to give the maximum value of the elements of all the subarrays.
#
# In this kata, we have a similar task but you have to find the sub-array or sub-arrays having this maximum value for their corresponding sums of elements. Let's see some examples:
#
# [-2, 1, -3, 4, -1, 2, 1, -5, 4] returns [[4, -1, 2, 1], 6]
# If in the solution we have two or more arrays having the maximum sum value, the result will have an array of arrays in the corresponding order of the array, from left to right.
#
# [4, -1, 2, 1, -40, 1, 2, -1, 4]) returns [[[4, -1, 2, 1], [1, 2, -1, 4]], 6]  # From left to right [4, -1, 2, 1] appears in the array before than [1, 2, -1, 4].
# If the array does not have any sub-array with a positive sum of its terms, the function will return [[], 0].
#
# See more cases in the Example Test Cases Window. Enjoy it!
#
# Thanks to smile67 (Matthias Metzger from Germany for his important observations in the javascript version)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_subarr_maxsum(arr)
  return [[], 0] if arr.all?{|e| e < 0}
  sum = arr.sum; res = []
  arr.each_index{|i| arr.size.times{|n| res << [arr[i..n], arr[i..n].sum] if arr[i..n].sum >= sum}}
  max = res.max_by{|a| a[1]}[1]
  res = res.select{|a| a[1] == max}.map{|a| a[0]}
  res.size > 1 ? [res] + [max] : res + [max]
end
