#===============================================================================================================
#                                               Description
#===============================================================================================================

# An expression is formed by taking the digits 1 to 9 in numerical order and then inserting into each gap between the numbers either a plus sign or a minus sign or neither.
#
# Your task is to write a method which takes one parameter and returns the smallest possible number of plus and minus signs necessary to form such an expression which equals the input.
#
# Note: All digits from 1-9 must be used exactly once.
#
# If there is no possible expression that evaluates to the input, then return null/nil/None.
#
# There are 50 random tests with upper bound of the input = 1000.
#
# Examples
# When the input is 100, you need to return 3, since that is the minimum number of signs required, because: 123 - 45 - 67 + 89 = 100 (3 operators in total).
#
# More examples:
#
#  11  -->  5  #  1 + 2 + 34 + 56 + 7 - 89 = 11
# 100  -->  3  #  123 - 45 - 67 + 89 = 100
# 766  -->  4  #  1 - 2 + 34 - 56 + 789 = 766
# 160  -->  -  #  no solution possible
# Inspired by a puzzle on BBC Radio 4 (which is unfortunately not available anymore)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

nums = (1..9).to_a
syms = ['+', '-', ''].repeated_permutation(8).to_a
$res = {}
syms.each do |arr|
  exp = nums.zip(arr).join
  res = eval(exp)
  sym = exp.chars.count{|e| e == '+' or e == '-'}
  $res[res] = sym if !$res[res] or $res[res] > sym
end

def operator_insertor(n) $res[n] end
