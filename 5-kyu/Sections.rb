#===============================================================================================================
#                                               Description
#===============================================================================================================

# Consider the following equation of a surface S: z*z*z = x*x * y*y.
# Take a cross section of S by a plane P: z = k where k is a positive integer (k > 0).
# Call this cross section C(k).
#
# Task
# Find the number of points of C(k) whose coordinates are positive integers.
#
# Examples
# If we call c(k) the function which returns this number we have
#
# c(1) -> 1
# c(4) -> 4
# c(4096576) -> 160
# c(2019) -> 0 which means that no point of C(2019) has integer coordinates.
# Notes
# k can go up to about 10,000,000,000
# Prolog: the function cis called section.
# COBOL: the function cis called sections.
# Please could you ask before translating : some translations are already written.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def c_unit(n)
  arr = n.prime_division.map{|a| (1..a[1]).map{|i| a[0]**i}}
  dels = (1..arr.size).map{|k| arr.combination(k).to_a}.flatten(1).map do |comb|
    comb.size == 1 ? comb.flatten : comb[0].product(*comb[1..-1]).map{|a| a.inject(:*)}
  end.flatten.select{|e| e < n}
  (dels + [1, n]).uniq.sort
end

def c(k)
  z = k**0.5
  return 0 if z % 1 != 0
  c_unit(z.to_i**3).size
end
