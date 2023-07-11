#===============================================================================================================
#                                               Description
#===============================================================================================================

# The numbers 12, 63 and 119 have something in common related with their divisors and their prime factors, let's see it.
#
# Numbers PrimeFactorsSum(pfs)        DivisorsSum(ds)              Is ds divisible by pfs
# 12         2 + 2 + 3 = 7         1 + 2 + 3 + 4 + 6 + 12 = 28            28 / 7 = 4,  Yes
# 63         3 + 3 + 7 = 13        1 + 3 + 7 + 9 + 21 + 63 = 104         104 / 13 = 8, Yes
# 119        7 + 17 = 24           1 + 7 + 17 + 119 = 144                144 / 24 = 6, Yes
# There is an obvius property you can see: the sum of the divisors of a number is divisible by the sum of its prime factors.
#
# We need the function ds_multof_pfs() that receives two arguments: nMin and nMax, as a lower and upper limit (inclusives), respectively, and outputs a sorted list with the numbers that fulfill the property described above.
#
# We represent the features of the described function:
#
# ds_multof_pfs(nMin, nMax) -----> [n1, n2, ....., nl] # nMin ≤ n1 < n2 < ..< nl ≤ nMax
# Let's see some cases:
#
# ds_multof_pfs(10, 100) == [12, 15, 35, 42, 60, 63, 66, 68, 84, 90, 95]
#
# ds_multof_pfs(20, 120) == [35, 42, 60, 63, 66, 68, 84, 90, 95, 110, 114, 119]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def dels(n)
  arr = n.prime_division.map{|a| (1..a[1]).map{|i| a[0]**i}}
  dels = (1..arr.size).map{|k| arr.combination(k).to_a}.flatten(1).map do |comb|
    comb.size == 1 ? comb.flatten : comb[0].product(*comb[1..-1]).map{|a| a.inject(:*)}
  end.flatten.select{|e| e<n}
  (dels + [1, n]).sum
end

def ds_mult_of_pfs(n1, n2)
  (n1..n2).each_with_object([]){|n, res| res << n if dels(n) % n.prime_division.map{|p, m| [p] * m}.flatten.sum == 0}
end
