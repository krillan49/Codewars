#===============================================================================================================
#                                               Description
#===============================================================================================================

# A programmer that loves creating algorithms for security is doing a previous investigation of a special set of primes. Specially, he has to define ranges of values and to have the total number of the required primes.
#
# These primes should fulfill the following requirements:
#
# The primes should have at least 3 digits.
#
# The primes can not include the digit 0.
#
# The sum of the digits should be a multiple of a perfect square number. (Note: even though 1 is a perfect square, do not consider it for obvious reasons)
#
# The product of the first digit by the last one cannot be 45, or in other words, if 5 is the first digit, the last one cannot be 9.
#
# The primes' digits should occur only once. Examples of this kind of primes are: 167, 359. Cases like 113 and 331 have to be discarded because digits 1 and 3 that appear twice respectively.
#
# Once he has these special primes, that fulfill the constraints listed above, he has to classify them in three subsets: bouncy, increasing and decreasing primes. The increasing primes are the ones that have their digits in increasing order, for example : 157, 359, 569.
#
# The decreasing ones, on the other hand, have their digits in decreasing order, for example: 761, 953, 971.
#
# Finally, the bouncy primes are the ones that does not belong to any of both previous subsets: neither increasing nor decreasing ones, for example: 173, 193, 317.
#
# Your Task
# Do you want to have the results of this investigation and accept the challenge? If your answer is affirmative, continue reading.
#
# Your function will accept an integer higher than 100 (and lower than 50000) as an upper bound of the range to work in, so all these special primes should be lower or equal to the given value of n.
#
# The function should output a list of lists with the data in this order:
#
# [ [data for _bouncy_ primes], [data for _increasing_ primes], [data for _decreasing_ primes] ]
# The data required for each subset should be as follows:
#
# [ min. prime found, max. prime found, number of primes in range ]
# Examples
# Let's see some examples for some values of n:
#
# special_primes(101) --> [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
# No special primes at this value (obviously).
#
# special_primes(200) --> [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
# Still no special primes.
#
# special_primes(457) --> [[251, 439, 2], [349, 457, 4], [431, 431, 1]]
# Now we have some values:
#
# bouncy primes: 251, 439 (2 in total)
# increasing primes: 349, 367, 389, 457 (4)
# decreasing primes: 431 (1)
# special_primes(1000) --> [[251, 947, 11], [349, 479, 5], [431, 983, 4]]
# bouncy primes: 251, 439, 547, 587, 619, 659, 673, 691, 839, 857, 947 (11)
# increasing primes: 349, 367, 389, 457, 479 (5)
# decreasing primes: 431, 521, 853, 983 (4)
# Good Luck and happy coding!
#
# Items the programmer has to think after the investigation:
#
# The highest possible prime, with these constraints, is ________.
#
# The larger subset of prime is _______.
#
# The smallest subset of primes is _______.
#
# The sum of the digits of these special primes are always multiples of the perfect squares: __________
#
# If your code passed you have these answers!!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def special_primes(n)
  sp = Prime.entries(n).select do |e|
    e > 100 &&
    !e.to_s.include?('0') &&
    e.digits.uniq == e.digits &&
    !['59', '95'].include?(e.to_s[0] + e.to_s[-1]) &&
    [4, 9, 25].any?{|p| e.digits.sum % p == 0}
  end
  up = sp.select{|n| n == n.digits.sort.join.to_i}
  dp = sp.select{|n| n == n.digits.sort.reverse.join.to_i}
  np = sp - up - dp
  [[np.min || 0, np.max || 0, np.size], [up.min || 0, up.max || 0, up.size], [dp.min || 0, dp.max || 0, dp.size]]
end
