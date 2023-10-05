#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your job is to take a pair of parametric equations, passed in as strings, and convert them into a single rectangular equation by eliminating the parameter. Both parametric halves will represent linear equations of x as a function of time and y as a function of time respectively.
#
# The format of the final equation must be Ax + By = C or Ax - By = C where A and B must be positive and A, B, and C are integers. The final equation also needs to have the lowest possible whole coefficients. Omit coefficients equal to one.
#
# The method is called para_to_rect or EquationsManager.paraToRect and takes in two strings in the form x = at +(or -) b and y = ct +(or -) d respectively, where a and c must be integers, and b and d must be positive integers. If a or c is omitted, the coefficient of t is obviously assumed to be 1 (see final case in the example tests). There will NEVER be double signs in the equations inputted (For example: "x = -12t + -18" and "y = -12t - -18" won't show up.)
#
# Example 1
# "x = 12t + 18", "y = 8t + 7" => "2x - 3y = 15"
#
# CALCULATION:
#     x = 12t + 18
#     y = 8t + 7
#     2x = 24t + 36
#     3y = 24t + 21
#     2x - 3y = (24t + 36) - (24t + 21)
#     2x - 3y = 15
# Example 2
# "x = -12t - 18", "y = 8t + 7" => "2x + 3y = -15"
#
# CALCULATION:
#     x = -12t - 18
#     y = 8t + 7
#     2x = -24t - 36
#     3y = 24t + 21
#     2x + 3y = (-24t - 36) + (24t + 21)
#     2x + 3y = -15
# Example 3
# "x = -t + 12", "y = 12t - 1" => "12x + y = 143"
#
# CALCULATION:
#     x = -t + 12
#     y = 12t - 1
#     12x = -12t + 144
#     y   = 12t  - 1
#     12x + y = 143
# Note
# As you can see above, sometimes you'll need to add the two parametric equations after multiplying by the necessary values; sometimes you'll need to subtract them – just get rid of the t!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def modif(str)
  s = str.split
  s[4] = '-' + s[4] if s[3] == '-'
  s.delete_at(3)
  s.delete_at(1)
  s[1] = s[1].tr('a-z', '')
  s[1] += '1' if s[1].tr('^0-9', '') == ''
  s[1], s[2] = s[1].to_i, s[2].to_i
  s
end

def para_to_rect(eqn1, eqn2)
  e1, e2 = modif(eqn1), modif(eqn2)
  lcm1, lcm2 = e1[1].lcm(e2[1])/e1[1], e1[1].lcm(e2[1])/e2[1]
  per = ("#{lcm1}" + e1[0] + ' - ' + "#{lcm2}" + e2[0]).gsub(/- -/,'+ ')
  per = per.gsub(/1x/, 'x') if lcm1.abs == 1
  per = per.gsub(/1y/, 'y') if lcm2.abs == 1
  res = [per, e1[2] * lcm1 - e2[2] * lcm2]
  if res[0][0] == '-'
    res[0] = res[0].tr('-+', '+-')[1..-1]
    res[1] *= -1
  end
  res.join(' = ')
end
