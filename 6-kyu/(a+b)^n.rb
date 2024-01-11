#===============================================================================================================
#                                               Description
#===============================================================================================================

# Similar but fairly harder version : Linked
#
# Create a function that takes a integer number n and returns the formula for (a+b)**n as a string.
#
# formula(0)  --> "1"
# formula(1)  --> "a+b"
# formula(2)  --> "a^2+2ab+b^2"
# formula(-2) --> "1/(a^2+2ab+b^2)"
# formula(3)  --> "a^3+3a^2b+3ab^2+b^3"
# formula(5)  --> "a^5+5a^4b+10a^3b^2+10a^2b^3+5ab^4+b^5"
#
# So the answer would look like so : a^5+5a^4b+10a^3b^2+10a^2b^3+5ab^4+b^5
#
# Important notes :
# Your string may not have spaces so you can't do this : a^5 + 5a^4 b + 10a^3 b^2...
# You will show raised to power of by ^ and not using **.
# You need not put * between each multiplication
# There is no need to show a^1 or b^1 since that is basically a and b
# a^0 and/or b^0 also don't need be shown instead be a normal person and use 1 since that is what they equate to.
# You will need to handle both positive and negative numbers + 0
# Note :
# a**(-n) = 1/a**n
# You will not be tested for float (only negative integers and whole numbers)
# input n goes from -200 to 200.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def bin_coef(k, n)
  (1..n).inject(:*) / ( (1..k).inject(:*) * (1..n-k).inject(:*) )
end

def bin_nuton(pow, a, b)
  (1..pow-1).map{|k| [bin_coef(k, pow), a * (pow - k), b * k]}
end

def formula(n)
  return %w[1 a+b 1/(a+b)][n] if n.abs < 2
  mid = bin_nuton(n.abs, 'a', 'b').map{|a| a.map{|e| e.class == String && e.size > 1 ? "#{e[0]}^#{e.size}" : e }.join }.join('+')
  n > 0 ? "a^#{n.abs}+#{mid}+b^#{n.abs}" : "1/(a^#{n.abs}+#{mid}+b^#{n.abs})"
end
