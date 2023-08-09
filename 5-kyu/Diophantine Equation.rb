#===============================================================================================================
#                                               Description
#===============================================================================================================

# In mathematics, a Diophantine equation is a polynomial equation, usually with two or more unknowns, such that only the integer solutions are sought or studied.
#
# In this kata we want to find all integers x, y (x >= 0, y >= 0) solutions of a diophantine equation of the form:
#
# x2 - 4 * y2 = n
# (where the unknowns are x and y, and n is a given positive number) in decreasing order of the positive xi.
#
# If there is no solution return [] or "[]" or "". (See "RUN SAMPLE TESTS" for examples of returns).
#
# Examples:
# solEquaStr(90005) --> "[[45003, 22501], [9003, 4499], [981, 467], [309, 37]]"
# solEquaStr(90002) --> "[]"
# Hint:
# x2 - 4 * y2 = (x - 2*y) * (x + 2*y)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def all_divs(n)
  arr = n.prime_division.map{|a| (1..a[1]).map{|i| a[0]**i}}
  dels = (1..arr.size).map{|k| arr.combination(k).to_a}.flatten(1).map do |comb|
    comb.size == 1 ? comb.flatten : comb[0].product(*comb[1..-1]).map{|a| a.inject(:*)}
  end.flatten.select{|e| e < n}
  (dels + [1] + [n]).map{|e| [n/e, e].sort}.uniq
end

def sol_equa(n)
  dels = all_divs(n)
  res = []
  res << [(n**(1 / 2.0)).to_i, 0] if n**(1 / 2.0) % 1 == 0
  dels.each do |a, b|
    y = (b - a) / 4.0
    res << [y.to_i, (a+2*y).to_i] if y % 1 == 0 && y > 0
    y = (a - b) / 4.0
    res << [y.to_i, (b+2*y).to_i] if y % 1 == 0 && y > 0
  end
  res.map{|ar| ar.sort.reverse}.sort_by{|ar| -ar[0]}
end
