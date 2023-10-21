#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this kata you're expected to find the longest consecutive sequence of positive squares that sums up to a number.
#
# E.g,
#
# ** 595 = 62 + 72 + 82 + 92 + 102 + 112 + 122 **.
#
# longest_sequence(50) # => [3, 4, 5]
#     # 9 + 16 + 25 = 50
#
# longest_sequence(595) # => [6, 7, 8, 9, 10, 11, 12]
#
# longest_sequence(10) # => []

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def longest_sequence(n)
  k = (n**0.5).floor
  arr = (1..k).map{|m| m**2}
  res = []
  i = 0
  sum = 0
  until i > arr.size - 1
    return res.map{|e| Math.sqrt(e).to_i} if sum == n
    if sum < n
      res << arr[i]
      i += 1
    elsif sum > n
      res.shift
    end
    sum = res.sum
  end
  []
end
