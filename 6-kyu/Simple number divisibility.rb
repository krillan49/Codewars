#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this Kata, you will be given a number and your task will be to rearrange the number so that it is divisible by 25, but without leading zeros. Return the minimum number of digit moves that are needed to make this possible. If impossible, return -1 ( Nothing in Haskell ).
#
# For example:
#
# solve(521) = 3 because:
#     a) Move the digit '1' to the front: 521 -> 512 -> 152. The digit '1' is moved two times.
#     b) Move '5' to the end: 152 -> 125. The digit '5' is moved one time, so total movement = 3.
# Of all the ways to accomplish this, the least digit moves = 3.
#
# solve(100) = 0. Number already divisible by 25.
# solve(1) = -1. Not possible to make number divisible by 25.
#
# solve(0) is not tested.
# More examples in test cases.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def solve n
  return 0 if n % 25 == 0
  res = []
  res << [0, 0] if n.to_s.count('0') >= 2
  res << [2, 5] if n.to_s.include?('2') && n.to_s.include?('5')
  res << [5, 0] if n.to_s.include?('5') && n.to_s.include?('0')
  res << [7, 5] if n.to_s.include?('7') && n.to_s.include?('5')
  return -1 if res.empty?
  res.map do |x, y|
    a = n.digits
    i = a.index(y)
    a = [a[i]] + a[0...i] + a[i+1..-1]
    j = a[1..-1].index(x) + 1
    a = [a[0]] + [a[j]] + a[1...j] + a[j+1..-1]
    k = a.size - 1 - a.rindex{|e| e != 0}
    [i, j-1, k].sum
  end.min
end
