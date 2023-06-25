#===============================================================================================================
#                                               Description
#===============================================================================================================

# Think in all the primes that: if p is prime and p < n , all these following numbers (p + 2) , (p + h) and (p + 2h) are all primes, being h     an even number such that: 2 <= h <= hMax
#
# Your function, give_max_h() , will receive 2 arguments n     and hMax .
#
# It should find for which value or values of  h     , we encounter the maximum amount of primes that satisfy the above constraint, testing for all possible even values from 2 to hMax     included.
#
# So, give_max_h(n, hMax) should ouput a list of lists with the following structure: a) if you find a unique solution:
#
#  [[h0, max amount of primes]] being h0     such that  2 <= h0 <= hMax and is the value that has the highest amount of collected primes
#
# b) if you have more than one solution, suposse 2     , you found two values of h: h0 , h1  such that : 2 <= ho < h1 <= hmax
#
# [[h0, max_amount_of_primes], [h1, max_amount_of_primes]] (lists should be sorted by the value of h) Let's see some cases: For Python and Ruby:
#
# Case 1
# give_max_h(30, 8) ------> [[6, 3]]
# For Javascript:
#
# Case 1
# giveMax_h(30, 8) ------> [[6, 3]]
# we have 4 different sets of steps to test [2, 2, 4], [2, 4, 8], [2, 6, 12] and [2, 8, 16]
#
# ///so that we select primes p in the range (2, 30) that fulfill: p, p + 2, p + 2 and p + 4 all primes --- > only with prime 3 (1 prime)
#
# p, p + 2, p + 4 and  p + 8 all primes ----> only with prime 3 (1 prime)
#
# p, p + 2, p + 6 and p + 12 all primes -----> passed by primes 5, 11, 17 (3 primes)
#
# p, p + 2, p + 8 and p + 16 all primes -----> only with prime 3 (1 prime)
#
# So h is 6 with 3 found primes (max amount of primes) ([6, 3])///
#
# Case 2) For Python and Ruby
#
# give_max_h(100, 10) -----> [[6, 4]] # with h = 6 we found the highest amount of primes (4) : 5, 11, 17, 41
# For Javascript
#
# giveMax_h(100, 10) -----> [[6, 4]]
# Case 3) For Python and Ruby
#
# give_max_h(1000, 100) -----> [[30, 13], [42, 13]] # we have two values of h that #procuded the highest amount of primes (13)
# For Javascript
#
# giveMax_h(1000, 100) -----> [[30, 13], [42, 13]]
# ///h = 30 produced the primes 11, 29, 41, 71, 107, 137, 197, 419, 431, 461, 617, 827, 881
# h = 42 produced the primes 5, 17, 29, 107, 149, 197, 227, 269, 347, 419, 599, 617, 659
# ///
# Happy coding!!
#
# (Advise: You will need a fast prime generator. Do not use primality tests, otherwise the runtimes would exceed our allowed 6000 ms to complete tests)
#
# (To investigate beyond this kata: Do we have a convergence for the value of h, no matter the values of n and hMax are?)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def give_max_h(n, kmax)
  primes = Prime.entries(n)
  hs = (2..kmax).step(2).to_a
  hcounts = hs.map{|h| [ h, primes.count{|p| [p + 2, p + h, p + 2 * h].all?(&:prime?)} ] }
  cmax = hcounts.max_by{|a| a[1]}[1]
  hcounts.select{|a| a[1] == cmax}
end
