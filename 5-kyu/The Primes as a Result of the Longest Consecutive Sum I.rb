#===============================================================================================================
#                                               Description
#===============================================================================================================

# This kata is inspired on the problem #50 of the Project Euler.
#
# The prime  41 is the result of the sum of many consecutive primes.
#
# In fact, 2 + 3 + 5 + 7 + 11 + 13 = 41 , (6 addens)
#
# Furthermore, the prime  41 is the prime below  100 (val_max) that has the longest chain of consecutive prime addens.
#
# The prime with longest chain of addens for val_max = 500 is 499 with 17 addens.
#
# In fact: 3+5+7+11+13+17+19+23+29+31+37+41+43+47+53+59+61= 499
#
# Write a function that receives an integer n as argument and returns a sorted list of prime numbers strictly inferior to n that have the longest longest chain of consecutive prime addens.
#
# Let's see some cases (Input -> Output):
#
# * 100 -> [41]
# * 500 -> [499]
# * 499 -> [379, 491]
# Range for n in random tests:
#
# 100 ≤ n ≤ 500,000

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

$spn = {}
arr = Prime.first(500)
(0..arr.size-2).each do |i|
  (i+1..arr.size-1).each do |j|
    sum, size = arr[i..j].sum, arr[i..j].size
    $spn[sum] = size if sum.prime? && (!$spn[sum] or $spn[sum] < size)
  end
end

def prime_maxlength_chain(val_max)
  arr = $spn.select{|k, v| k < val_max}
  max = arr.values.max
  arr.select{|k,v| v == max}.keys
end
