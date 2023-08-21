#===============================================================================================================
#                                               Description
#===============================================================================================================

# 1, 246, 2, 123, 3, 82, 6, 41 are the divisors of number 246. Squaring these divisors we get: 1, 60516, 4, 15129, 9, 6724, 36, 1681. The sum of these squares is 84100 which is 290 * 290.
#
# Task
# Find all integers between m and n (m and n integers with 1 <= m <= n) such that the sum of their squared divisors is itself a square.
#
# We will return an array of subarrays or of tuples (in C an array of Pair) or a string. The subarrays (or tuples or Pairs) will have two elements: first the number the squared divisors of which is a square and then the sum of the squared divisors.
#
# Example:
# list_squared(1, 250) --> [[1, 1], [42, 2500], [246, 84100]]
# list_squared(42, 250) --> [[42, 2500], [246, 84100]]
# The form of the examples may change according to the language, see "Sample Tests".
#
# Note
# In Fortran - as in any other language - the returned string is not permitted to contain any redundant trailing whitespace: you can use dynamically allocated character strings.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

$nums=[[1, 1]]

def list_squared(m, n)
  return $nums.select{|e| e[0] >= m && e[0] <= n} if $nums[-1][0] >= n

  nums = ($nums[-1][0]+1..n).map do |k|
    arr = k.prime_division.map{|a| (1..a[1]).map{|i| a[0]**i}}
    dels = (1..arr.size).map{|k| arr.combination(k).to_a}.flatten(1).map do |comb|
      comb.size == 1 ? comb.flatten : comb[0].product(*comb[1..-1]).map{|a| a.inject(:*)}
    end.flatten.select{|e| e<k}
    [k, dels.map{|d| d**2}.sum + 1 + k**2]
  end
  .select{|k, dss| !k.prime? && dss**0.5 % 1 == 0}

  $nums += nums
  $nums.select{|e| e[0] >= m && e[0] <= n}
end
