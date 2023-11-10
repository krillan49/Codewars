#===============================================================================================================
#                                               Description
#===============================================================================================================

# Four-digit palindromes start with [1001,1111,1221,1331,1441,1551,1551,...] and the number at position 2 is 1111.
#
# You will be given two numbers a and b. Your task is to return the a-digit palindrome at position b if the palindromes were arranged in increasing order.
#
# Therefore, palin(4,2) = 1111, because that is the second element of the 4-digit palindrome series.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def palin(a, b)
  x = a / 2 + (a.odd? ? 1 : 0)
  n = ('1' + '0' * (x - 1)).to_i
  until b == 1
    n += 1
    b -= 1
  end
  (n.to_s + (a.odd? ? n.to_s[0..-2] : n.to_s).reverse).to_i
end
