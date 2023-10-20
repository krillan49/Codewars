#===============================================================================================================
#                                               Description
#===============================================================================================================

# When no more interesting kata can be resolved, I just choose to create the new kata, to solve their own, to enjoy the process --myjinxin2015 said
#
# Description:
# There is a 2D array arr:
#
# [[1],[2,3],[4,5,6],[7,8,9,10]]
# Task1: Write a function split. Split 2D array to two arrays:
#
#  Result:
#  array 1: all numbers in 2D array   array 2: Leave all subarrays and
#                                               fill in the length of
#                                               each subarray
#    [  [1,2,3,4,5,6,7,8,9,10],            [[1],[2],[3],[4]]  ]
# Task2: Write a function join. Join two array(like the result above) to one array(like the arr above)
#
# Some Examples
# split:
#
# arr= [[1],[2,3],[4,5,6],[7,8,9,10]]
# split(arr) === [  [1,2,3,4,5,6,7,8,9,10],  [[1],[2],[3],[4]]  ]
#
# arr= [[1,3,5],[2,4,6],[7,8,9]]
# split(arr) === [  [1,3,5,2,4,6,7,8,9],  [[3],[3],[3]]  ]
#
# join:
#
# arr1=[1,2,3,4,5,6,7,8,9,10],  arr2=[[1],[2],[3],[4]]
# join(arr1,arr2) === [[1],[2,3],[4,5,6],[7,8,9,10]]
#
# arr1=[1,3,5,2,4,6,7,8,9],  arr2=[[3],[3],[3]]
# join(arr1,arr2) === [[1,3,5],[2,4,6],[7,8,9]]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def split(arr)
  [arr.flatten, arr.map{|a| [a.size]}]
end

def join(arr1, arr2)
  j = arr2.map.with_index{|n, i| arr2.flatten[0..i].sum}
  arr1.map.with_index{|e, i| [e, i]}.slice_when{|a, b| j.include?(b[1])}.map{|a| a.map(&:first)}
end
