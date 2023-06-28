#===============================================================================================================
#                                               Description
#===============================================================================================================

# A pandigital number is one that has its digits from 1 to 9 occuring only once (they do not have the digit 0).
#
# The number 169, is the first pandigital square, higher than 100, having its square root, 13, pandigital too.
#
# The number 1728 is the first pandigital cubic, higher than 1000, having its cubic root, 12, pandigital too.
#
# Make the function pow_root_pandigit(), that receives three arguments:
#
# a minimum number, val
#
# the exponent of the n-perfect powers to search, n
#
# k, maximum amount of terms that we want in the output
#
# The function should output a 2D-array with an amount of k pairs of numbers(or an array of an only pair if we have this case). Each pair has a nth-perfect power pandigital higher than val with its respective nth-root that is pandigital, too.
#
# The function should work in this way:
#
# pow_root_pandigit(val, n, k) = [[root1, pow1], [root2, pow2], ...., [rootk, powk]]
# """
# root1 < root2 <.....< rootk
# val < pow1 < pow2 < ....< powk
# root1 ^ n = pow1 // root2 ^ n = pow2 //........// rootk ^ n = powk
# all pairs rooti, powi are pandigitals
# """
# Let's see some examples:
#
# pow_root_pandigit(388, 2, 3)== [[23, 529], [24, 576], [25, 625]] # 3 pairs (k = 3)
# For a different power:
#
# pow_root_pandigit(1750, 3, 5) == [[13, 2197], [17, 4913], [18, 5832], [19, 6859], [21, 9261]] # 5 pairs (k = 5)
# The output in not inclusive for val.
#
# pow_root_pandigit(1728, 3, 4) == [[13, 2197], [17, 4913], [18, 5832], [19, 6859]]
# # ∛1728 = 12
# The result may have less terms than the required:
#
# pow_root_pandigit(600000000, 2, 5) == [25941, 672935481] # If the result has an only one pair, the output is an array
# Furthermore, if the minimum value, val is high enough, the result may be an empty list:
#
# pow_root_pandigit(900000000, 2, 5) == []
# You may suposse that the input val, n will be always: val > 10 and n > 2.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

m = 1000000000
$npn = {}
(2..7).each do |pow|
  max = (m**(1.0 / pow)).floor
  res = (1..max).select{|n| n.digits.uniq.reject(&:zero?) == n.digits && (n**pow).digits.uniq.reject(&:zero?) == (n**pow).digits}
  $npn[pow] = res
end

def pow_root_pandigit(val, n, k)
  return [] if n > 7
  res = $npn[n].select{|e| e**n > val}[0, k].map{|e| [e, e**n]}
  res.size == 1 ? res.flatten : res
end
