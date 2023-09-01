#===============================================================================================================
#                                               Description
#===============================================================================================================

# Every natural number, n, may have a prime factorization like:
#
# https://imgur.com/M5n0WCg
#
# We define the arithmetic derivative of n, n' the value of the expression:
#
# https://imgur.com/D9Ckb8P
#
# Let's do the calculation for n = 231525.
#
# 231525 = 3³5²7³
# n' = (3*3²)*5²7³ + 3³*(2*5)*7³ + 3³*5²*(3*7²) = 231525 + 92610 + 99225 = 423360
# We may make a chain of arithmetic derivatives, starting from a number we apply to the result the transformation and so on until we get the result 1.
#
# n ---> n'  ---> (n')' ---> ((n')')' ---> ..... ---> ((...(n')...)')'
# Let's do it starting with our number, n = 231525 and making a chain of 5 terms:
#
# 231525 ---> 423360 ---> 1899072 ---> 7879680 ---> 51895296
# We need a function chain_arith_deriv() that receives two arguments: start and k, amount of terms of the chain.
#
# The function should output the chain in an array format:
#
# chain_arith_deriv(start, k) ---> [start, term1, term2, .....term(k-1)] # a total of k-terms
# For the case presented above:
#
# chain_arith_deriv(231525, 5) == [231525, 423360, 1899072, 7879680, 51895296]
# The function has to reject prime numbers giving an alerting message
#
# chain_arith_deriv(997, 5) == "997 is a prime number"
# Features of the tests:
#
# Number of Random Tests: 50
# 1000 ≤ start ≤ 99000000
# 3 ≤ k ≤ 15

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def chain_arith_deriv(n, k)
  return "#{n} is a prime number" if n.prime?
  res = [n]
  (k-1).times{ res << (n == 0 ? 0 : n = n.prime_division.sum{|p, k| k * n / p}) }
  res
end
