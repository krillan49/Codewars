#===============================================================================================================
#                                               Description
#===============================================================================================================

# You have to code a function getAllPrimeFactors, which takes an integer as parameter and returns an array containing its prime decomposition by ascending factors. If a factor appears multiple times in the decomposition, it should appear as many times in the array.
#
# exemple: getAllPrimeFactors(100) returns [2,2,5,5] in this order.
#
# This decomposition may not be the most practical.
#
# You should also write getUniquePrimeFactorsWithCount, a function which will return an array containing two arrays: one with prime numbers appearing in the decomposition and the other containing their respective power.
#
# exemple: getUniquePrimeFactorsWithCount(100) returns [[2,5],[2,2]]
#
# You should also write getUniquePrimeFactorsWithProducts, which returns an array containing the prime factors to their respective powers.
#
# exemple: getUniquePrimeFactorsWithProducts(100) returns [4,25]
#
# Errors, if:
#
# n is not a number
# n not an integer
# n is negative or 0
# The three functions should respectively return [], [[],[]] and [].
#
# Edge cases:
#
# if n=0, the function should respectively return [], [[],[]] and [].
# if n=1, the function should respectively return [1], [[1],[1]], [1].
# if n=2, the function should respectively return [2], [[2],[1]], [2].
# The result for n=2 is normal. The result for n=1 is arbitrary and has been chosen to return a usefull result. The result for n=0 is also arbitrary but can not be chosen to be both usefull and intuitive. ([[0],[0]] would be meaningfull but wont work for general use of decomposition, [[0],[1]] would work but is not intuitive.)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def getAllPrimeFactors(n)
  return [] if n.class != Integer or n < 1
  return [1] if n == 1
  n.prime_division.map{|a| [a[0]] * a[1]}.flatten
end

def getUniquePrimeFactorsWithCount(n)
  return [[], []] if n.class != Integer or n < 1
  return [[1], [1]] if n == 1
  a = n.prime_division
  [a.map(&:first), a.map(&:last)]
end

def getUniquePrimeFactorsWithProducts(n)
  return [] if n.class != Integer or n < 1
  return [1] if n == 1
  n.prime_division.map{|a| a[0]**a[1]}
end
