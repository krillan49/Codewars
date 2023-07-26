#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a function that returns an array containing the first l numbers from the nth diagonal of Pascal's triangle.
#
# n = 0 should generate the first diagonal of the triangle (the ones).
# The first number in each diagonal should be 1.
# If l = 0, return an empty array.
# Both n and l will be non-negative integers in all test cases.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def generate_diagonal(n, l)
  return [] if l == 0
  d = [1]
  k, m = n+1, 1
  (l-1).times do
    d << d[-1] * k / m
    k += 1
    m += 1
  end
  d
end
