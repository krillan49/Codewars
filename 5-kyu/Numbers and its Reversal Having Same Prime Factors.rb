#===============================================================================================================
#                                               Description
#===============================================================================================================

# The number 1089 is the smallest one, non palindromic, that has the same prime factors that its reversal. Thus,
#
# prime factorization of 1089 with 3, 3, 11, 11 -------> 3, 11
#
# prime factorization of 9801 with  3, 3, 3, 3, 11, 11 -------> 3, 11
# The task for this kata is to create a function same_factRev(), that receives a nMax, to find all the numbers with the above property, bellow nMax.
#
# the function same_factRev(), will output a sorted list with the found numbers bellow nMax
#
# Let'se some cases
#
# same_factRev(1100) -----> [1089]
#
# same_factRev(2500) -----> [1089, 2178]
# (Palindromic numbers are like: 171, 454, 4224, these ones should be discarded)
#
# Happy coding!!
#
# (The sequence of these kind of numbers is registered in OEIS as A110819)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

RHSPF = [1089]

def same_factRev(n)
  m = RHSPF[-1]
  until n <= RHSPF[-1]
    l = m.to_s.reverse.to_i
    RHSPF << m if !RHSPF.include?(m) && l != m && m.prime_division.map(&:first) == l.prime_division.map(&:first)
    m += 1
  end
  RHSPF.take_while{|k| k <= n}
end
