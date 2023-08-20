#===============================================================================================================
#                                               Description
#===============================================================================================================

# Define a function that takes in two non-negative integers a and b and returns the last decimal digit of a**b. Note that a and b may be very large!
#
# For example, the last decimal digit of 9**7 is 9, since 9**7 = 4782969. The last decimal digit of (2**200)**(2**300), which has over 10**92 decimal digits, is 6. Also, please take 0**0 to be 1.
#
# You may assume that the input will always be valid.
#
# Examples
# last_digit(4, 1)                # returns 4
# last_digit(4, 2)                # returns 6
# last_digit(9, 7)                # returns 9
# last_digit(10, 10 ** 10)        # returns 0
# last_digit(2 ** 200, 2 ** 300)  # returns 6

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def last_digit(n1, n2)
  return 1 if n2 == 0
  i = n2 % 4
  return [n1, n1**2, n1**3][i-1].to_s[-1].to_i if i > 0 && i < 4
  if n1.odd?
    n1.to_s[-1] != '5' ? 1 : 5
  elsif n2.even?
    n1.to_s[-1] != '0' ? 6 : 0
  end
end
