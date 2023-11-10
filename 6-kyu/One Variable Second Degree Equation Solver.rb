#===============================================================================================================
#                                               Description
#===============================================================================================================

# We know the formula to find the solutions of an equation of second degree with only one variable:
#
# https://imgur.com/jXO5HA9
#
# We need the function sec_deg_solver()/secDegSolver(), that accepts three arguments, a, b and c, the coefficients of the above equation.
#
# The outputs of the function may vary depending on the values of coefficients a, b and c, according to the following situations. (used values as examples only):
#
#
# - If a is equal 0:
#                   - If b and c are not 0. It will return: "It is a
#                     first degree equation. Solution: 0.5512345"
#
#                   - If a, b and c are 0. It will return:
#                      "The equation is indeterminate"
#
#                   - If a and b are 0, and c is not 0. It will
#                      return: "Impossible situation. Wrong entries"
#
#                   - If a and c are 0 and b is not 0: It will return: "It is a first
#                     degree equation. Solution: 0.0"
#
# - If a is not 0:
#                   - If Δ < 0 (see image above). It will return: "There are no real
#                     solutions"
#
#                   - If Δ = 0. It will return: "It has one double solution:
#                     1.4142135624"
#
#                   - If Δ > 0. It will return: "Two solutions: 1,7320508076, 2.0"
#                     (solutions should be sorted)
# The results should be expressed up to 10 decimals rounded result Let's see some cases:
#
#
# a = 0
# b = 2
# c = -4
# sec_deg_solver(a, b, c) == It is a first degree equation. Solution: 2.0
#
# a = 10
# b = 2
# c = -4
# sec_deg_solver(a, b, c) == Two solutions: -0.7403124237, 0.5403124237
#
# a = 1.5
# b = 2
# c = 4
# sec_deg_solver(a, b, c) == There are no real solutions
#
# a = 1
# b = -2
# c = 1
# sec_deg_solver(a, b, c) == It has one double solution: 1.0
#
# a = 0
# b = 0
# c = 0
# sec_deg_solver(a, b, c) == The equation is indeterminate
# (Be aware that the result has a string format and -0.0 is not 0.0)
#
# Note on having two solutions: input them sorted numerically; in the JavaScript version, not to put any extra difficulty on this one, sort them with a simple .sort() (which will sort them lexicographically).

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sec_deg_solver(a, b, c)
  d = b**2 - 4*a*c
  if a == 0
    if b != 0 && c != 0
      "It is a first degree equation. Solution: #{(-c/b.to_f).round(10)}"
    elsif b == 0 && c == 0
      "The equation is indeterminate"
    elsif b == 0 && c != 0
      "Impossible situation. Wrong entries"
    elsif b != 0 && c == 0
      "It is a first degree equation. Solution: 0.0"
    end
  else
    if d < 0
      "There are no real solutions"
    elsif d == 0
      "It has one double solution: #{(-b/(2*a).to_f).round(10).abs}"
    elsif d > 0
      sd = Math.sqrt(d)
      x = [((-b-sd)/(2*a)).round(10), ((-b+sd)/(2*a)).round(10)].sort.map{|e| e == 0 ? 0.0 : e}
      "Two solutions: #{x[0]}, #{x[1]}"
    end
  end
end
