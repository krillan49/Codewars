#===============================================================================================================
#                                               Description
#===============================================================================================================

# This is a hard version of How many are smaller than me?. If you have troubles solving this one, have a look at the easier kata first.
#
# Write
#
# function smaller(arr)
# that given an array arr, you have to return the amount of numbers that are smaller than arr[i] to the right.
#
# For example:
#
# smaller([5, 4, 3, 2, 1]) === [4, 3, 2, 1, 0]
# smaller([1, 2, 0]) === [1, 1, 0]

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. Start from the end

# 2. Indexes in an array are integers, and in tests in arrays they are integers.

# 3. Store negatives separately

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def smaller(arr)
  pos = []
  sum0 = 0
  neg = []; sumn = 0
  res = []
  (arr.size - 1).downto(0) do |i|
    n = arr[i]
    sum = 0
    if n == 0
      sum = sumn
      sum0 += 1
    elsif n > 0
      sum = sumn + sum0 + pos[0..n-1].compact.sum
      pos[n] ? pos[n] += 1 : pos[n] = 1
    else
      sum = (neg[n.abs+1..-1] || []).compact.sum
      n = n.abs
      neg[n] ? neg[n] += 1 : neg[n] = 1
      sumn += 1
    end
    res.unshift(sum)
  end
  res
end
