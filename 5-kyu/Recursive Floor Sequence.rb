#===============================================================================================================
#                                               Description
#===============================================================================================================

# This kata is based on Project Euler Problem 546
#
# Objective
# Given the recursive sequence
#
# ...
#
# Define a function f that takes arguments k and n and returns the nth term in the sequence fk
#
# Examples
# f(2, 3) = f2(3) = 6
#
# f(2, 200) = f2(200) = 7389572
#
# f(7, 500) = f7(500) = 74845
#
# f(1000, 0) = f1000(0) = 1
#
# Note: No error checking is needed, k ranges from 2 to 100 and n ranges between 0 and 500000 (mostly small and medium values with a few large ones)
#
# As always any feedback would be much appreciated

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def f(k, n)
  res = [1]
  i = 0
  (1..n).each do |m|
    i += 1 if m % k == 0
    res << res[-1] + res[i]
  end
  res[-1]
end
