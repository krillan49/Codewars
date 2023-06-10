#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a function that finds the largest palindromic number made from the product of at least 2 of the given arguments.
#
# Notes
# Only non-negative numbers will be given in the argument
# You don't need to use all the digits of the products
# Single digit numbers are considered palindromes
# Optimization is needed: dealing with ones and zeros in a smart way will help a lot
# Examples
# [937, 113] --> 81518
# As 937 * 113 = 105881 and the largest palindromic number that can be arranged from the digits of result is: 81518
#
# Another one:
#
# [57, 62, 23] --> 82128
#
#              product     palindrome
# 57 * 62      = 3534   -->  353
# 57 * 23      = 1311   -->  131
# 62 * 23      = 1426   -->  6
# 57 * 62 * 23 = 81282  -->  82128
# One more:
#
# [15, 125, 8] --> 8
#
#              product     palindrome
# 15 * 125     = 1875   -->  8
# 15 * 8       = 120    -->  2
# 125 * 8      = 1000   -->  1
# 15 * 125 * 8 = 15000  -->  5

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def products_num(n)
  hh = n.digits.group_by{|e| e}.map{|k, v| [k, v.size]}.to_h
  ones, evens = [], []
  hh.each do |k, v|
    if v == 1
      ones << k
    elsif v.even?
      evens += [k]*(v/2)
    elsif v.odd?
      ones << k
      evens += [k]*((v-1)/2)
    end
  end
  evens = [] if evens.all?{|e| e == 0}
  one = [ones.max]
  res = (evens.sort.reverse + one + evens.sort).join.to_i
end

def numeric_palindrome(*args)
  return 0 if args.count(0) >= args.size-1
  args.delete(0)
  return 1 if args.all?{|e| e == 1}

  products = []
  if args.include?(1)
    args.delete(1)
    products += args
  end
  products+=(2..args.size).map{|k| args.combination(k).map{|a| a.inject(:*)}}.flatten

  products.each_with_object([]) do |p,res|
    res << products_num(p)
  end.max
end
