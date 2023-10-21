#===============================================================================================================
#                                               Description
#===============================================================================================================

# The Abundancy (A) of a number n is defined as:
#
# (sum of divisors of n) / n
# For example:
#
# A(8) = (1 + 2 + 4 + 8) / 8 = 15/8
#
# A(25) = (1 + 5 + 25) / 25  = 31/25
# Friendly Pairs are pairs of numbers (m, n), such that their abundancies are equal: A(n) = A(m).
#
# Write a function that returns "Friendly!" if the two given numbers are a Friendly Pair. Otherwise return their respective abundacies as strings separated by a space, e.g. "1 15/8"
#
# Notes:
#
# All fractions must be written in their most reduced form (e.g. 2/3 instead of 8/12)
# Every number that is being checked is under 2400
# Floats should be left on without rounding when you compare the abundancies of the two numbers
# Examples
# n = 6, m = 28 ==> "Friendly!"
#
# n = 3, m = 9  ==> "4/3 13/9"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def friendly_numbers(m, n)
  dm, dn = (2..m/2).select{|e| m % e == 0}.sum + 1 + m, (2..n/2).select{|e| n % e == 0}.sum + 1 + n
  res = [[dm/(dm.gcd(m)), m/(dm.gcd(m))], [dn/(dn.gcd(n)), n/(dn.gcd(n))]]
  res[0] == res[1] ? 'Friendly!' : res.map{|a| a.join('/')}.join(' ')
end
