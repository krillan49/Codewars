#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this Kata, the goal is to duplicate the functionality of the array transpose method.
#
# Transpose is an array method which takes an existing 2-dimensional array (i.e. a matrix) and flips it on its side.
#
# It looks like this:
#
# arr = [['a', 'b', 'c'],['d', 'e', 'f']]
# arr.transpose
# => [['a', 'd'], ['b', 'e'], ['c', 'f']]
# For your solution:
# Don't use Array#transpose
#
# Don't use Array#zip
#
# A nil array argument should return nil.
#
# An empty array argument should return an empty array.
#
# A non-array argument should return ArgumentError
#
# Any nil or non-array types in the subarrays should return a TypeError
#
# A single demensional array should return a TypeError.
#
# If the length of all the subarrays don't match, raise an IndexError.
#
# Correctly transpose all multi demensional arrays.
#
# Examples:
# A nil array argument should return nil.
#
# my_transpose(nil)
# => nil
# An empty array argument should return an empty array.
#
# my_transpose([])
# => []
# A non array argument should return ArgumentError
#
# my_transpose(1)
# => ArgumentError: Uh Oh!
# Any nil or non-array types in the subarrays should return a TypeError
#
# new_arr = my_transpose([['a', 'b', 'c'],['d', 'e'], nil])
# => TypeError: Uh Oh!
# A single demensional array should return a TypeError.
#
# my_transpose([a])
# => TypeError: Uh Oh!
# If the length of all the subarrays don't match, raise an IndexError.
#
# new_arr = my_transpose([['a', 'b', 'c'],['d', 'e']])
# => IndexError: Uh Oh!
# Valid transpose examples
# my_transpose([['a', 'b', 'c'],['d', 'e', 'f']])
# => [["a", "d"], ["b", "e"], ["c", "f"]]
#
# my_transpose([[a]])
# => [[a]]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def my_transpose(arr)
  return nil if !arr or arr == [nil]
  return [] if arr == []
  res = Array.new(arr[0].size){Array.new}
  arr.each{|a| a.each_with_index{|e, i| res[i] << e} }
  res
end
