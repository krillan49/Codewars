#===============================================================================================================
#                                               Description
#===============================================================================================================

# Task
# Given an array of roots of a polynomial equation, you should reconstruct this equation.
#
# Output details:
# If the power equals 1, omit it: x = 0 instead of x^1 = 0
# If the power equals 0, omit the x: x - 2 = 0 instead of x - 2x^0 = 0
# There should be no 2 signs in a row: x - 1 = 0 instead of x + -1 = 0
# If the coefficient equals 0, skip it: x^2 - 1 = 0 instead of x^2 + 0x - 1 = 0
# Repeating roots should not be filtered out: x^2 - 4x + 4 = 0 instead of x - 2 = 0
# The coefficient before q^n is always 1: x^n + ... = 0 instead of Ax^n + ... = 0
# Example:
# polynomialize([0])        =>  "x = 0"
# polynomialize([1])        =>  "x - 1 = 0"
# polynomialize([1, -1])    =>  "x^2 - 1 = 0"
# polynomialize([0, 2, 3])  =>  "x^3 - 5x^2 + 6x = 0"
# Tests:
#       Main suite:                  Edge cases:
#  (Reference - 4000 ms)         (Reference - 20 ms)
#
# N of roots | N of tests      N of roots | N of tests
# -----------------------      -----------------------
#     1-10   |   100              20-40   |    125
#  500-550   |    20               2-20   |    125

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def multiplication(arr1, arr2)
  res = []
  arr1.each{|c1,x1| arr2.each{|c2,x2| res << [c1 * c2, x1 + x2]} }
  res = res.sort_by{|_, x| -x}.slice_when{|a, b| a[1] != b[1]}.to_a
  res.map{|a| a.size == 1 ? a.flatten : [a.map{|a0| a0[0]}.sum, a[0][1]]}
end

def polynomialize(roots)
  mul = roots.map{|e| [ [1, 1], [-e, 0] ]} # [[[1, 1], [-2, 0]], [[1, 1], [-3, 0]]] == (1*x**1 - 2*x**0)*(1*x**1 - 3*x**0)
  mul = mul.each_slice(2).map{|par| par.size == 2 ? multiplication(par[0], par[1]) : par.flatten(1) } until mul.size == 1
  mul.flatten(1).reject{|a| a[0] == 0}.map do |c, pow|
    (c > 0 ? ' + ' : ' - ') + if pow == 0
      c.abs.to_s
    elsif pow == 1
      c.abs == 1 ? 'x' : "#{c.abs}x"
    else
      c.abs == 1 ? "x^#{pow}" : "#{c.abs}x^#{pow}"
    end
  end.join[3..-1] + ' = 0'
end
