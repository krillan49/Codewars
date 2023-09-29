#===============================================================================================================
#                                               Description
#===============================================================================================================

# Task
# Let's say that number a feels comfortable with number b if a ≠ b and b lies in the segment [a - s(a), a + s(a)], where s(x) is the sum of x's digits.
#
# How many pairs (a, b) are there, such that a < b, both a and b lie on the segment [L, R], and each number feels comfortable with the other?
#
# Example
# For L = 10 and R = 12, the output should be 2
#
# Here are all values of s(x) to consider:
#
# s(10) = 1, so 10 is comfortable with 9 and 11;
# s(11) = 2, so 11 is comfortable with 9, 10, 12 and 13;
# s(12) = 3, so 12 is comfortable with 9, 10, 11, 13, 14 and 15.
# Thus, there are 2 pairs of numbers comfortable
# with each other within the segment [10; 12]:
# (10, 11) and (11, 12).
# Input/Output
# [input] integer L
#
# Constraints: 1 ≤ L ≤ R ≤ 1000
#
# [input] integer R
#
# Constraints: 1 ≤ L ≤ R ≤ 1000
#
# [output] an integer
#
# The number of pairs satisfying all the above conditions.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def comfortable_numbers(l, r)
  (l..r).map do |n|
    d = n.digits.sum
    x = n - d < l ? l : n - d
    y = n + d > r ? r : n + d
    c = (x..y).select{|e| e != n && (e-e.digits.sum..e+e.digits.sum).include?(n)}
    [n].product(c).map{|a| a.sort.join('-')}
  end
  .flatten.uniq.size
end
