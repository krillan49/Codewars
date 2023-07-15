#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given an integer n, lying in range [0; 1_000_000], calculate the number of digits in n! (factorial of n).
#
# Example
# For n = 0, the output should be 1 because 0! = 1 has 1 digit;
# For n = 4, the output should be 2 because 4! = 24 has 2 digits;
# For n = 10, the output should be 7 because 10! = 3628800 has 7 digits.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def factorial_digits(n)
  return 1 if n < 2
  (Math.log10(2 * Math::PI * n) / 2 + n * Math.log10(n / Math::E)).ceil
end
