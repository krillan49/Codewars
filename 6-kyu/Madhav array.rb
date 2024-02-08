#===============================================================================================================
#                                               Description
#===============================================================================================================

# A Madhav array has the following property:
#
# a[0] = a[1] + a[2] = a[3] + a[4] + a[5] = a[6] + a[7] + a[8] + a[9] = ...
#
# Complete the function/method that returns true if the given array is a Madhav array, otherwise it returns false.
#
# Edge cases: An array of length 0 or 1 should not be considered a Madhav array as there is nothing to compare.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def is_madhav_array(arr)
  return false if arr.size < 2
  res = []
  c = 0
  until arr == []
    res << arr[0..c] rescue return false
    arr = arr[c+1..-1]
    c += 1
  end
  res.map(&:sum).uniq.size == 1
end
