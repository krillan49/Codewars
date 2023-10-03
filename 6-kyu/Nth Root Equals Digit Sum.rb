#===============================================================================================================
#                                               Description
#===============================================================================================================

# There are numbers for which the n-th root equals the sum of their digits. For example:
#
# 512**(1/3) = 5+1+2 = 8
#
# Complete the function that returns all natural numbers (in ascending order) for which the above statement is true for the given n, where 2 ≤ n ≤ 50
#
# Note
# To avoid hardcoding the answers, your code is limited to 1000 characters
#
# Examples
# 2  -->  [1, 81]
# 3  -->  [1, 512, 4913, 5832, 17576, 19683]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

SQRR = (2..50).map{|p| (1..999).select{|e| (e**p).digits.sum == e}}

def nth_root_equals_digit_sum(n)
  SQRR[n-2].map{|e| e**n}
end
