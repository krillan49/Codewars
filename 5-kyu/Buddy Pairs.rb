#===============================================================================================================
#                                               Description
#===============================================================================================================

# You know what divisors of a number are. The divisors of a positive integer n are said to be proper when you consider only the divisors other than n itself. In the following description, divisors will mean proper divisors. For example for 100 they are 1, 2, 4, 5, 10, 20, 25, and 50.
#
# Let s(n) be the sum of these proper divisors of n. Call buddy two positive integers such that the sum of the proper divisors of each number is one more than the other number:
#
# (n, m) are a pair of buddy if s(m) = n + 1 and s(n) = m + 1
#
# For example 48 & 75 is such a pair:
#
# Divisors of 48 are: 1, 2, 3, 4, 6, 8, 12, 16, 24 --> sum: 76 = 75 + 1
# Divisors of 75 are: 1, 3, 5, 15, 25 --> sum: 49 = 48 + 1
# Task
# Given two positive integers start and limit, the function buddy(start, limit) should return the first pair (n m) of buddy pairs such that n (positive integer) is between start (inclusive) and limit (inclusive); m can be greater than limit and has to be greater than n
#
# If there is no buddy pair satisfying the conditions, then return "Nothing" or (for Go lang) nil or (for Dart) null; (for Lua, Pascal, Perl, D) [-1, -1]; (for Erlang {-1, -1}).
#
# Examples
# (depending on the languages)
#
# buddy(10, 50) returns [48, 75]
# buddy(48, 50) returns [48, 75]
# or
# buddy(10, 50) returns "(48 75)"
# buddy(48, 50) returns "(48 75)"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def all_divs_sum(n)
  arr = n.prime_division.map{|a| (1..a[1]).map{|i| a[0]**i}}
  (1..arr.size).map{|k| arr.combination(k).to_a}.flatten(1).map do |comb|
    comb.size == 1 ? comb.flatten : comb[0].product(*comb[1..-1]).map{|a| a.inject(:*)}
  end.flatten.select{|e| e < n}.sum
end

def buddy(start, nd)
  (start..nd).each do |n|
    m = all_divs_sum(n)
    return "(#{n} #{m})" if all_divs_sum(m) == n if m > n
  end
  'Nothing'
end
