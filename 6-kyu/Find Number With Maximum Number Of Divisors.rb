#===============================================================================================================
#                                               Description
#===============================================================================================================

# Find the integer from a to b (included) with the greatest number of divisors. For example:
#
# divNum(15, 30)   ==> 24
# divNum(1, 2)     ==> 2
# divNum(0, 0)     ==> 0
# divNum(52, 156)  ==> 120
# If there are several numbers that have the same (maximum) number of divisors, the smallest among them should be returned. Return the string "Error" if a > b.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def divNum(a, b)
  return 'Error' if a > b
  (a..b).max_by{|n| n == 1 ? 1 : n.prime_division.map{|a| a[1] + 1}.inject(:*)}
end
