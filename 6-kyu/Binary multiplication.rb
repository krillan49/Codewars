#===============================================================================================================
#                                               Description
#===============================================================================================================

# The goal of this kata is to multiply two integers using the ancient Egyptian method, which only requires divisions and multiplications by two, and additions.
#
# Your function takes two integers as input. It shall return a list of the steps in the multiplication.
#
# Let m be the largest and n the smallest. While m is superior to 0, at each step:
#
# if m is not divisible by 2, add n to the list
# divide m by 2 (integer division)
# multiply n by 2
# At the end, return the list in ascending order. The result of the multiplication is the sum of the list elements, but you have to return only the list.
#
# Input
# n and m integers, from 0 to 10,000. It is not guaranteed that m > n.
#
# Example
# Start: m = 100, n = 15, list = []
#
# Step 1: m / 2 = 50, m is divisible by 2
#
# m = 50, n = 30, list = []
#
# Step 2: m / 2 = 25, m is divisible by 2
#
# m = 25, n = 60, list = []
#
# Step 3: m / 2 = 12, m is not divisible by 2
#
# m = 12, n = 120, list = [60]
#
# Step 4: m / 2 = 6, m is divisible by 2
#
# m = 6, n = 240, list = [60]
#
# Step 5: m / 2 = 3, m is divisible by 2
#
# m = 3, n = 480, list = [60]
#
# Step 6: m / 2 = 1, m is not divisible by 2
#
# m = 1, n = 960, list = [60, 480]
#
# Step 7: m / 2 = 0, 1 is not divisible by 2
#
# m = 0, n = 1920, list = [60, 480, 960]
#
# End: m = 0, the algorithm stops.
#
# 100 * 15 = 1500 = 60 + 480 + 960

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def bin_mul(m, n)
  y, x = [m, n].minmax
  n = Math.log(x, 2).floor rescue []
  (0..n).map{|e| (x / 2**e).even? ? 0 : y * 2**e}.sort.reverse.reject(&:zero?) rescue []
end
