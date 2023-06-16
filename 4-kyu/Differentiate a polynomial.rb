#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a function that differentiates a polynomial for a given value of x.
#
# Your function will receive 2 arguments: a polynomial as a string, and a point to evaluate the equation as an integer.
#
# Assumptions:
# There will be a coefficient near each x, unless the coefficient equals 1 or -1.
# There will be an exponent near each x, unless the exponent equals 0 or 1.
# All exponents will be greater or equal to zero
# Examples:
# differenatiate("12x+2", 3)      ==>   returns 12
# differenatiate("x^2+3x+2", 3)   ==>   returns 9

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def differentiate(equation, point)
  monomials = equation.chars.slice_when{|a, b| b == '-' or b == '+'}
  .map{|a| a.chunk_while{|a, b| /[0-9]/ === a && /[0-9]/ === b}.map(&:join)}
  .map{|a| a.slice_when{|a, b| /[^a-z]/ === a && /[a-z]/ === b}.map(&:join)}
  .map do |a|
    if a.size == 1
      a[0].include?('x') ? a.unshift(1) : nil
    else
      a[0] == '+' || a[0] == '-' ? ["#{a[0]}1".to_i, a[1]] : [a[0].to_i, a[1]]
    end
  end.compact
  monomials.map do |a|
    e = a[1].split('^')[1].to_i
    a[1].include?('^') ? a[0] * e * point**(e - 1) : a[0]
  end.sum
end
