#===============================================================================================================
#                                               Description
#===============================================================================================================

# We have the following function of two variables x, y (values of x, y are in determined ranges of values):
#
# https://imgur.com/0HdIVic
#
# The function above is studied for x, y, positive integers, and x ≠ y.
#
# ⌊  ⌋ - represents the function floor and |  | the absolute value.
#
# In the image below there is 3D graph that may show some features of the function:
#
# https://imgur.com/pF8WR77
#
# xmin = 0, xmax = 10 ; ymin = 0, ymax = 10 and zmax (the same value of hMax) near 250.
#
# The function has extremely high values for wider ranges of x and y.
#
# We need a function max_val_f(), that accepts four arguments:
#
# (1) range1: m ≤ x ≤ n -----> [m, n] (The values of x belong to the interval range1)
#
# (2) range2: p ≤ y ≤ q -----> [p, q] (The values of y belong to the interval range2)
#
# (3) hMax: f(x, y) ≤ hMax (The values of f(x, y) selected should be bellow or equal hMax)
#
# (4) the length for the wanted array for the output
#
# The function should output the largest values of f(x, y) less or equal than hMax, in increasing order (the amount of highest values coincides with the entry (4))
#
# To explain graphicaly the features of our asked function:
#
# max_val_f([m, n], [p, q], hMax, k) -------> [f(x1, y1), f(x2, y2), ....f(xk, yk)] #
#
# f(x1, y1) < f(x2, y2) < ....< f(xk, yk) ≤ hMax
# Let's see some cases:
#
# range1 = [1, 10]
# range2 = [1, 10]
# hMax = 500
# k = 4
# max_val_f(range1, range2, hMax, k) -----> [81.0, 125.0, 243.0, 256.0]
#
# range1 = [1, 50]
# range2 = [1, 50]
# hMax = 500
# k = 4
# max_val_f(range1, range2, hMax, k) -----> [361.0, 400.0, 441.0, 484.0]
#
# range1 = [1, 50]
# range2 = [1, 50]
# hMax = 1000
# k = 5
# max_val_f(range1, range2, hMax, k) -----> [784.0, 841.0, 900.0, 961.0, 1000.0]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def max_val_f(r1, r2, hmax, k)
  (r1[0]..r1[1]).to_a.product((r2[0]..r2[1]).to_a).map(&:sort).uniq.reject{|x, y| x == y}
  .map{|x, y| ((x + y).to_f / (x - y).abs).floor**(x - y).abs}.uniq.reject{|f| f > hmax}.sort.last(k)
end
