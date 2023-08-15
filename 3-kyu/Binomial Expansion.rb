#===============================================================================================================
#                                               Description
#===============================================================================================================

# The purpose of this kata is to write a program that can do some algebra.
#
# Write a function expand that takes in an expression with a single, one character variable, and expands it. The expression is in the form (ax+b)^n where a and b are integers which may be positive or negative, x is any single character variable, and n is a natural number. If a = 1, no coefficient will be placed in front of the variable. If a = -1, a "-" will be placed in front of the variable.
#
# The expanded form should be returned as a string in the form ax^b+cx^d+ex^f... where a, c, and e are the coefficients of the term, x is the original one character variable that was passed in the original expression and b, d, and f, are the powers that x is being raised to in each term and are in decreasing order.
#
# If the coefficient of a term is zero, the term should not be included. If the coefficient of a term is one, the coefficient should not be included. If the coefficient of a term is -1, only the "-" should be included. If the power of the term is 0, only the coefficient should be included. If the power of the term is 1, the caret and power should be excluded.
#
# Examples:
# expand("(x+1)^2")      # returns "x^2+2x+1"
# expand("(p-1)^3")      # returns "p^3-3p^2+3p-1"
# expand("(2f+4)^6")     # returns "64f^6+768f^5+3840f^4+10240f^3+15360f^2+12288f+4096"
# expand("(-2a-4)^0")    # returns "1"
# expand("(-12t+43)^2")  # returns "144t^2-1032t+1849"
# expand("(r+0)^203")    # returns "r^203"
# expand("(-x-1)^2")     # returns "x^2+2x+1"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def bin_coef(k, n)
  (1..n).inject(:*) / ((1..k).inject(:*) * (1..n-k).inject(:*))
end

def bin_nuton(pow, a, b)
  (1..pow-1).map{|k| [bin_coef(k, pow), a * (pow - k), b**k]}
end

def expand(expr)
  var = expr.tr('^a-z','') # variable name
  exp, pow = expr.tr('()','').split('^').map{|e| e.tr('0-9', '') == '' ? e.to_i : e} # (-2k-3)^3 => ["-2k-3", 3]
  return '1' if pow == 0
  return exp if pow == 1
  exp = exp.chars.slice_when{|a, b| /[\w]/ === a && /[-+]/ === b}.map(&:join).map{|e| e.tr('^a-zA-Z','') == '' ? e.to_i : e}
  return pow == 1 ? exp[0] + "^#{pow}" : "#{exp[0][0..-2].to_i**pow}" + "#{var}^#{pow}" if exp[1] == 0
  exp[0].sub!(/#{var}/, "1#{var}") if exp[0].tr('^0-9', '') == '' # ["x", 1] => ["1x", 1] || ["-2k", -3] => ["-2k", -3]

  exp_mid = bin_nuton(pow, exp[0], exp[1]) # expansion in Newton's binomial without the 1st and last term
  exp_last = (exp[1]**pow).to_s # last part
  res = ([[exp[0] * pow]] + exp_mid).map{|a| a.join(' ')} # ["-2k-2k-2k", "3 -2k-2k -3", "3 -2k 9"] all without last
  res.map! do |e|
    coef = e.tr('^0-9', ' ').split.map(&:to_i).inject(:*) * (e.count('-').odd? ? -1 : 1)
    coef = coef == -1 ? '-' : coef == 1 ? '' : coef
    vars = e.tr('^a-z', '')
    coef.to_s + (vars.size == 1 ? vars[0] : vars[0] + "^#{vars.size}")
  end #=> ["-8k^3", "-36k^2", "-54k"]
  (res + [exp_last]).map.with_index{|e, i| (e[0] != '-' && i != 0) ? "+#{e}" : e}.join
end
