#===============================================================================================================
#                                               Description
#===============================================================================================================

# Perfect powers are numbers that can be written m**k, where m and k are both integers greater than 1.
#
# Your task is to write a function that returns the perfect power nearest any number.
#
# Notes
# When the input itself is a perfect power, return this number
# Since 4 is the smallest perfect power, for inputs < 4 (including 0, 1, and negatives) return 4
# The input can be either a floating-point number or an integer
# If there are two perfect powers equidistant from the input, return the smaller one
# Examples
# For instance,
#
#  0  -->   4
# 11  -->   9    #  9 = 3^2
# 34  -->  32    # 32 = 2^5 and 36 = 6^2 --> same distance, pick the smaller

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def closest_power(n)
  return 4 if n <= 4
  q = 2
  res = []
  until res.include?(1)
    res << (n**(1.0/q)).floor**q
    res << (n**(1.0/q)).ceil**q
    q += 1
  end
  res.map{|e| [(n-e).abs, e]}.min_by{|a| [a[0], a[1]]}[1]
end
