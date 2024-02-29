#===============================================================================================================
#                                               Description
#===============================================================================================================

# Consider an array that has no prime numbers, and none of its elements has any prime digit. It would start with: [1,4,6,8,9,10,14,16,18,40,44..].
#
# 12 and 15 are not in the list because 2 and 5 are primes.
#
# You will be given an integer n and your task will be return the number at that index in the array. For example:
#
# solve(0) = 1
# solve(2) = 6

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

NOP = [1]

def solve(n)
  k = NOP[-1] + 1
  until NOP.size > n
    NOP << k if !k.prime? && k.digits.all?{|d| !d.prime?}
    k += 1
  end
  NOP[n]
end
