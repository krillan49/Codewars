#===============================================================================================================
#                                               Description
#===============================================================================================================

# Consider the number triangle below, in which each number is equal to the number above plus the number to the left. If there is no number above, assume it's a 0.
#
# 1
# 1 1
# 1 2 2
# 1 3 5 5
# 1 4 9 14 14
# The triangle has 5 rows and the sum of the last row is sum([1,4,9,14,14]) = 42.
#
# You will be given an integer n and your task will be to return the sum of the last row of a triangle of n rows.
#
# In the example above:
#
# solve(5) = 42

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def solve(n)
  a = [[1]]
  (n-1).times do
    r = []
    (a[-1].size + 1).times do |i|
      i == 0 ? r << 1 : a[i] ? r << (r[-1] + a[-1][i]) : r << r[-1]
    end
    a << r
  end
  a[-1].sum
end
