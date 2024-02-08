#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a method named getExponent(n,p) that returns the largest integer exponent x such that px evenly divides n. if p<=1 the method should return null/None (throw an ArgumentOutOfRange exception in C#).

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def get_exponent(n, p)
  return nil if p <= 1
  x = 0
  arr = []
  loop do
    break if p**x > n.abs
    arr << x if n % (p**x) == 0
    x += 1
  end
  arr.max
end
