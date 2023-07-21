#===============================================================================================================
#                                               Description
#===============================================================================================================

# Find the closest prime number under a certain integer n that has the maximum possible amount of even digits.
#
# For n = 1000, the highest prime under 1000 is 887, having two even digits (8 twice)
#
# Naming f(), the function that gives that prime, the above case and others will be like the following below.
#
# f(1000) ---> 887 (even digits: 8, 8)
#
# f(1210) ---> 1201 (even digits: 2, 0)
#
# f(10000) ---> 8887
#
# f(500) ---> 487
#
# f(487) ---> 467
# Features of the random tests:
#
# Number of tests = 28
# 1000 <= n <= 5000000

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

EPR = Prime.entries(5000000).select{|p| p.digits.count(&:even?) >= p.to_s.size - 2}

def f(n)
  EPR.take_while{|p| p < n}.reverse.max_by{|p| p.digits.count(&:even?)}
end
