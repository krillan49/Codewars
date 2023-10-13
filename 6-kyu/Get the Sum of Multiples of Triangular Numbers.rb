#===============================================================================================================
#                                               Description
#===============================================================================================================

# The triangular numbers, Tn, may be obtained by this formula:
#
# T(n) = n * (n + 1) / 2
# We select, for example, the first 5 (n terms) consecutive terms of this sequence.
#
# They will be: 1, 3, 6, 10 and 15
#
# Now we want to obtain, again for example, the first 8 (m terms) consecutive multiples to all of these five triangular numbers.
#
# The least common multiple of them will be, 30, so the first eight multiple terms (for the sequence of the above five triangular numbers) will be:
#
# 30, 60, 90, 120, 150, 180, 210 and 240
#
# Finally the sum of all these multiples will be: 30 + 60 + 90 + 120 + 150 + 180 + 210 + 240 = 1080
#
# We want the function sum_mult_triangnum() that may calculate this sum with different values of n and m terms.
#
# Let's see some cases:
#
# n = 5
# m = 8
# sum_mult_triangnum(n, m) = 1080
# Another case:
#
# n = 7
# m = 10
# sum_mult_triangnum(n, m) = 23100
# The values of n and m will be always integer values higher than 2.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sum_mult_triangnum(n, m)
  lcm = (1..n).map{|k| k * (k + 1) / 2}.reduce(:lcm)
  (1..m).map{|k| k * lcm}.sum
end
