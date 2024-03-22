#===============================================================================================================
#                                               Description
#===============================================================================================================

# The range of vision of a digit is its own value. 1 can see one digit to the left and one digit to the right, 2 can see two digits, and so on.
#
# Thus, the loneliness of a digit N is the sum of the digits which it can see.
#
# Given a non-negative integer, your funtion must determine if there's at least one digit 1 in this integer such that its loneliness value is minimal.
#
# Example
# number = 34315
# digit	can see on the left	can see on the right	loneliness
# 3	-	431	4 + 3 + 1 = 8
# 4	3	315	3 + 3 + 1 + 5 = 12
# 3	34	15	3 + 4 + 1 + 5 = 13
# 1	3	5	3 + 5 = 8
# 5	3431	-	3 + 4 + 3 + 1 = 11
# Is there a 1 for which the loneliness is minimal? Yes.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def loneliest?(number)
  num = number.digits
  res = num.map.with_index do |n, i|
    l = i - n > 0 ? num[i-n...i].sum : num[0...i].sum
    r = i + n < num.size ? num[i+1..i+n].sum : num[i+1..-1].sum
    [l + r, n]
  end
  min = res.min_by(&:first)[0]
  res.include?([min, 1])
end
