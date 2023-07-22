#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this Kata you must convert integers numbers from and to a negative-base binary system.
#
# Negative-base systems can accommodate all the same numbers as standard place-value systems, but both positive and negative numbers are represented without the use of a minus sign (or, in computer representation, a sign bit); this advantage is countered by an increased complexity of arithmetic operations.
#
# To help understand, the first eight digits (in decimal) of the Base(-2) system is:
#
# [1, -2, 4, -8, 16, -32, 64, -128]
#
# Example conversions:
#
# Decimal, negabinary
#
# 6,   '11010'
# -6,  '1110'
# 4,   '100'
# 18,  '10110'
# -11, '110101'

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def div_with_positive_remainder(x, n_base=-2)
  x.positive? ? [x/n_base.abs*(-1), x%n_base.abs] : [(x.to_f/n_base).ceil, x-n_base*(x.to_f/n_base).ceil]
end

def int_to_negabinary(i)
  return '0' if i == 0
  res = []
  until i == 0
    r = div_with_positive_remainder(i)
    i = r[0]
    res << r[1]
  end
  res.reverse.join
end

def negabinary_to_int(s)
  s.chars.reverse.map.with_index{|n, i| n.to_i * (-2)**i}.sum
end
