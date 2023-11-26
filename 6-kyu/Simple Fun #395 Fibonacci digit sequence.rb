#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given three non negative integers a, b and n, and making an infinite sequence just like fibonacci sequence, use the following rules:
#
# step 1: use ab as the initial sequence.
# step 2: calculate the sum of the last two digits of the sequence, and append it to the end of sequence.
# repeat step 2 until you have enough digits
# Your task is to complete the function which returns the nth digit (0-based) of the sequence.
#
# Notes:
# 0 <= a, b <= 9, 0 <= n <= 10^10
# 16 fixed testcases
# 100 random testcases, testing for correctness of solution
# 100 random testcases, testing for performance of code
# All inputs are valid.
# Pay attention to code performance.
# Examples
# For a = 7, b = 8 and n = 9 the output should be 5, because the sequence is:
#
# 78 -> 7815 -> 78156 -> 7815611 -> 78156112 -> 781561123 -> 7815611235 -> ...
# and the 9th digit of the sequence is 5.
#
# For a = 0, b = 0 and n = 100000000 the output should be 0, because all the digits in this sequence are 0.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find(a, b, n)
  return 0 if a == 0 && b == 0
  arr = [a, b]
  arr += (arr[-1] + arr[-2]).digits.reverse until arr.join.include?('112') || arr.join.include?('459')
  res = arr[0..-4]
  if arr.join.include?('11')
    n < res.size ? res[n] : [1, 1, 2, 3, 5, 8, 1, 3, 4, 7][(n - res.size) % 10]
  elsif arr.join.include?('45')
    n < res.size ? res[n] : [4, 5, 9, 1][(n - res.size) % 4]
  end
end
