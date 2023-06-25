#===============================================================================================================
#                                               Description
#===============================================================================================================

# This is the advanced version of the Total Primes kata.
#
# The number 23 is the smallest prime that can be "cut" into multiple primes: 2, 3. Another such prime is 6173, which can be cut into 61, 73 or 617, 3 or 61, 7, 3 (all primes). A third one is 557 which can be sliced into 5, 5, 7. Let's call these numbers total primes.
#
# Notes:
#
# one-digit primes are excluded by definition;
# leading zeros are also excluded: e.g. splitting 307 into 3, 07 is not valid
# Task
# Complete the function that takes a range [a..b] (both limits included) and returns the total primes within that range (a ≤ total primes ≤ b).
#
# The tests go up to 106.
#
# Examples
# (0, 100)    -->  [23, 37, 53, 73]
# (500, 600)  -->  [523, 541, 547, 557, 571, 577, 593]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def total_primes(a, b)
  (Prime.entries(b) - Prime.entries(a - 1)).select do |n|
    arr = (1...n.to_s.size).to_a
    combs = arr.map{|e| arr.combination(e).to_a}.flatten(1)
    combs.map{|a| n.to_s.chars.map.with_index{|c, i| a.include?(i) ? ' ' + c : c}.join.split}
    .reject{|a| a.any?{|e| e[0] == '0'}}.any?{|a| a.map(&:to_i).all?(&:prime?)}
  end
end
