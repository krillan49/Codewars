#===============================================================================================================
#                                               Description
#===============================================================================================================

# A number n is called prime happy if there is at least one prime less than n and the sum of all primes less than n is evenly divisible by n. Write isPrimeHappy(n) which returns true if n is prime happy else false.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def isPrimeHappy(n)
  n > 2 && Prime.entries(n-1).sum % n == 0
end
