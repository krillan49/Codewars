#===============================================================================================================
#                                               Description
#===============================================================================================================

# We have the following sequence:
#
# f(0) = 0
# f(1) = 1
# f(2) = 1
# f(3) = 2
# f(4) = 4;
# f(n) = f(n-1) + f(n-2) - f(n-3) + f(n-4) - f(n-5);
# The first term of the sequence that has its last nine digits forms a prime number is the value, 8480150779 (total of 10 digits), and corresponds to the 92-th term, because 480150779 is prime. We can follow this observation in the next terms of the sequence and see the behaviour.
#
# n-th term   k-th lastDig prime         term value   total digits   last9Digit    isPrime(last9Digit)
#    92             1                     8480150779        10        480150779         True
#
#    98             2                    35922495169        11        922495169         True
#
#   110             3                   644603021049        12        603021049         True
#
#   122             4                 11566931883761        14        931883761         True
#
#   134             5                207560170886697        15        170886697         True
# Create a function kth_lastDigPrime(), that receives the value of k as an argument and outputs, the ordinal number that corresponds to the term value and the number formed by the last nine digits. Let's see some cases:
#
# k_thlastDigPrime(1)--------> [92, 480150779]
#
# k_thlastDigPrime(2)--------> [98, 922495169]
#
# k_thlastDigPrime(5)--------> [134, 170886697]
# (Advise: Use a fast primality test, Miller Rabin test or similar)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

KDP = [0, 1, 1, 2, 4]
KDPP = []

def k_thlastDigPrime(k)
  until KDPP.size >= k
    n = KDP[-1] + KDP[-2] - KDP[-3] + KDP[-4] - KDP[-5]
    KDP << n
    KDPP << n if n > 99999999 && n.to_s[-9..-1].to_i.prime?
  end
  [KDP.index(KDPP[k-1]) + 1, KDPP[k-1].to_s[-9..-1].to_i]
end
