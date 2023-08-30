#===============================================================================================================
#                                               Description
#===============================================================================================================

# Generate and return all possible increasing arithmetic progressions of six primes [a, b, c, d, e, f] between the given limits. Note: the upper and lower limits are inclusive.
#
# An arithmetic progression is a sequence where the difference between consecutive numbers is the same, such as: 2, 4, 6, 8.
#
# A prime number is a number that is divisible only by itself and 1 (e.g. 2, 3, 5, 7, 11)
#
# Your solutions should be returned as lists inside a list in ascending order of the first item (if there are multiple lists with same first item, return in ascending order for the second item etc) are the e.g: [ [a, b, c, d, e, f], [g, h, i, j, k, l] ] where a < g. If there are no solutions, return an empty list: []
#
# Examples
# 0, 200    ==> [ [7, 37, 67, 97, 127, 157] ]
#
# 150, 1000 ==> [ [157, 307, 457, 607, 757, 907],
#                 [239, 359, 479, 599, 719, 839],
#                 [281, 401, 521, 641, 761, 881],
#                 [359, 389, 419, 449, 479, 509],
#                 [503, 593, 683, 773, 863, 953],
#                 [541, 571, 601, 631, 661, 691],
#                 [641, 701, 761, 821, 881, 941] ]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def primes_a_p(x, y)
  primes = Prime.entries(y) - Prime.entries(x-1)
  (30..900).step(30).each_with_object([]) do |n, res|
    primes.each do |p|
      arr = [p]
      arr << arr[-1]+n while (arr[-1] + n).prime? && arr[-1]+n <= primes[-1]
      res << arr[0..5] if arr.size >= 6
    end
  end.sort_by(&:first)
end
