#===============================================================================================================
#                                               Description
#===============================================================================================================

# Consider the prime number 23. If we sum the square of its digits we get: 2^2 + 3^2 = 13, then for 13: 1^2 + 3^2 = 10, and finally for 10: 1^2 + 0^2 = 1.
#
# Similarly, if we start with prime number 7, the sequence is: 7->49->97->130->10->1.
#
# Given a range, how many primes within that range will eventually end up being 1?
#
# The upperbound for the range is 50,000. A range of (2,25) means that: 2 <= n < 25.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def solve a, b
  d = Prime.entries(b-1) - Prime.entries(a-1)
  c = 0
  d.each do |p|
    arr = []
    loop do
      if p == 1
        c += 1
        break
      end
      arr.include?(p) ? break : arr << p
      p = p.digits.map{|k| k**2}.sum
    end
  end
  c
end
