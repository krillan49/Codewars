#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your task is to find the last non-zero digit of n! (factorial).
#
# n! = 1 × 2 × 3 × ⋯ × n
#
# Example:
# If n = 12, your function should return 6 since 12! = 479001600
#
# Input
# Non-negative integer n
# Range: 0 - 2.5E6
#
# Output
# Last non-zero digit of n!
#
# Note
# Calculating the whole factorial will timeout.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def last_digit(n)
  return 1 if n < 2
  a, b = n/5, n%5
  res = [a, b].map do |e|
    e < 2 ? 1 : e < 10 && (2..e).inject(:*).digits[0] != 0 ? (2..e).inject(:*).digits[0] : last_digit(e)
  end.inject(:*).digits[0]
  x = a % 4 == 0 ? 6 : 2**(a%4)
  (res * x).digits[0]
end
