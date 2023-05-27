#===============================================================================================================
#                                               Description
#===============================================================================================================

# A prime number is an integer greater than 1 that is only evenly divisible by itself and 1.
#
# Write your own Primes class with class method Primes.first(n) that returns an array of the first n prime numbers.
#
# For example:
#
# Primes.first(1)
# # => [2]
#
# Primes.first(2)
# # => [2, 3]
#
# Primes.first(5)
# # => [2, 3, 5, 7, 11]
#
# Primes.first(20).last(5)
# # => [53, 59, 61, 67, 71]
# Note: An inefficient algorithm will time out. Memoization may help.
#
# More info on primes here.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. It is enough to check the divisibility by already found prime numbers

# 2. It makes no sense to check the divisibility further than the checked person is divided by the previous simple of the previously found

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Primes
  PRIMES = [2]

  def Primes.first(n)
    num = PRIMES[-1] + 1
    until PRIMES.size >= n
      value = 'y'
      k = 1
      PRIMES.each do |p|
        break if num/k < p
        if num % p == 0
          value = 'n'
          break
        else
          k = p
        end
      end
      PRIMES << num if value == 'y'
      num += 1
    end
    PRIMES.first(n)
  end
end
