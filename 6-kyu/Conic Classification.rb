#===============================================================================================================
#                                               Description
#===============================================================================================================

# The conic curves may be obtained doing different sections of a cone and we may obtain the three principal groups: ellipse, hyperbola and parabola.
#
# https://imgur.com/4NdOkgf
#
# The circle is a special case of ellipses.
#
# In mathematics all the conics may be represented by the following equation:
#
# https://imgur.com/SVTomxD
#
# A, B, C, D, E and F are coefficients that may have different values in the real numeric field.
#
# Hesse in the nineteenth century, introduced the use of the invariants, useful tool in order to classify the different conic curves.
#
# The invariants M, N, and S are:
#
# https://imgur.com/v7xVjyX
#
# It may be proved that if the system of coordinates changes, for example moving the center of the system of coordinates or rotating the coordinates axes, or doing both things, the invariants will have the same value, even though the coefficients A, B, C, D, E, and F change.
#
# The following chart shows how the values of M, N and S classify the gender of the conics and the special cases when the conics are degenerated (points or lines) or they are imaginary:
#
# https://imgur.com/2hUJNeN
#
# The function classify_conic() will do this work. This function will receive the different coefficients of the conic equation and will output the result of the classification as a string
#
# classify_conic(a, b, c, d, e, f) == result
# Let's see some cases:
#
# Case1
# A = 1 , B = 1, C = 1, D = 2, E = 2, F = -4
# classify_conic(A, B, C, D, E, F) == "A real ellipse"
#
# Case2
# A = 1 , B = 1, C = -1, D = 2, E = 2, F = 4
# classify_conic(A, B, C, D, E, F) == "A real hyperbola"
#
# Case3
# A =1, B = 0, C = 0, D = 4; E = 4, F = 4
# classify_conic(A, B, C, D, E, F) == "A real parabola"
# Case1
# A = 1 , B = 1, C = 1, D = 2, E = 2, F = -4
# classifyConic(A, B, C, D, E, F) == "A real ellipse"
#
# Case2
# A = 1 , B = 1, C = -1, D = 2, E = 2, F = 4
# classifyConic(A, B, C, D, E, F) == "A real hyperbola"
#
# Case3
# A =1, B = 0, C = 0, D = 4; E = 4, F = 4
# classifyConic(A, B, C, D, E, F) == "A real parabola"
# The graph showing the above three cases is the following:
#
# source: imgur.com
#
# The messages for the special cases, having degenerated or imaginary conics will be:
#
# # For elliptic gender:
# "An imaginary ellipse"
# "A degenerated ellipse: One point"
#
# # For hyperbolic gender:
# "A degenerated hyperbola: two intersecting lines"
#
# # For parabolic gender:
# "A degenerated parabola: two parallel lines"
# "A degenerated parabola: two coinciding lines"
# "A degenerated parabola: two imaginary lines"
# Enjoy it!! #Note:
#
# The given coefficients A, B, C, D, E and F, (a, b, c, d, eandf` in Ruby) will be always integers.
#
# In order to avoid precision problems, the determinant values of M and N should be obtained by the rule of Sarrus. (See: https://en.wikipedia.org/wiki/Rule_of_Sarrus)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def classify_conic(a, b, c, d, e, f)
  m = 8*a*c*f - 2*a*e**2 - 2*f*b**2 + 2*b*e*d - 2*c*d**2
  n = b**2 - 4*a*c
  s = a + c
  p = d**2 - 4*a*f
  if n < 0
    m == 0 ? 'A degenerated ellipse: One point' : (m * s < 0 ? 'A real ellipse' : 'An imaginary ellipse')
  elsif n > 0
    m == 0 ? 'A degenerated hyperbola: two intersecting lines' : 'A real hyperbola'
  else
    if m == 0
      "A degenerated parabola: two #{p > 0 ? 'parallel' : p == 0 ? 'coinciding' : 'imaginary'} lines"
    else
      'A real parabola'
    end
  end
end
