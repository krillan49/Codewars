#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given a list/array of example equalities such as:
#
# [ "a + a = b", "b - d = c ", "a + b = d" ]
# Use this information to solve a given formula in terms of the remaining symbol such as:
#
# formula = "c + a + b"
# In this example:
#
# "c + a + b" = "2a"
# so the output is "2a".
#
# Notes:
#
# Variables names are case sensitive.
# There might be whitespaces between the different characters. Or not...
# There should be support for parentheses and their coefficient. Example: a + 3 (6b - c).
# You may encounter several imbricated levels of parentheses, but you'll get only constant terms for the accompanying coefficients (never variables).
# All equations will be linear.
# In your final answer, include a leading 1 when the coefficient is 1 (e.g. 1j instead of just j).
# There are no floating-point numbers.
# See the sample tests for clarification on what exactly the input/ouput formatting should be.
#
# Without giving away too many hints, the idea is to substitute the examples into the formula and reduce the resulting equation to one unique term. Look carefully at the example tests: you'll have to identify the pattern used to replace variables in the formula/other equations. Using this pattern, only one solution is possible for each test, so if you keep asking yourself "but what if instead of that I do...", then you've missed the pattern.
#
# Note: eval and other related things have been disabled.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# Tests expect results according to non-obvious logic:

# A. The left part (from the = sign) is always substituted into the formula

# B. You need to substitute examples in the formula in the order in which they are in the array until only 1 variable remains, for example:
# simplify(['y + 6Y - k - 6 K = f', 'F + k + Y - y = K', 'Y = k', 'y = Y', 'y + Y = F'], 'k - f + y')
# 0: 'k - f + y'     <= 'y + 6Y - k - 6 K = f'    == 'k - y - 6Y + k + 6 K + y' == '2k - 6Y + 6 K'
# 1: '2k - 6Y + 6 K' <= 'F + k + Y - y = K'       == '2k - 6Y + 6F + 6k + 6Y - 6y' == '8k + 6F - 6y'
# 2: '8k + 6F - 6y'  <= 'Y = k'                   == '8Y + 6F - 6y'
# 3: '8Y + 6F - 6y'  <= 'y = Y'                   == '8y + 6F - 6y' == '2y + 6F'
# 4: '2y + 6F'       <= 'y + Y = F'               == '2y + 6y + 6Y'
# because the result has not yet been received, we go through the array in the 2nd circle
# 0: '2y + 6y + 6Y'   can't substitute the left side from  'y + 6Y - k - 6 K = f'
# 1: '2y + 6y + 6Y'   can't substitute the left side from  'F + k + Y - y = K'
# 2: '2y + 6y + 6Y'   can't substitute the left side from  'Y = k'
# 3: '2y + 6y + 6Y'  <= 'y = Y'                   == '2y + 6y + 6y' == '14y'

# C. Simplifying the formula to one variable is not enough, you need to move on if there is a possibility of substitution in the formula, apparently until all the examples or something else have been tested.
# I did not try to guess what the author forgot to add to the condition and just made the minimum pass == array length + 1
# for example:
# simplify(['x = b', 'b = c', 'c = d', 'd = e'], 'c') #=> result: 1x

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def summator(terms)
  terms.group_by(&:last).map{|k, v| [v.flatten.select{|e| e.class == Integer}.sum, k]}
end #=> [[-10, "S"], [3, "q"], [-1, "H"], [-6, "w"]]

def open_parentheses(formula_parts)
  return formula_parts if !formula_parts.join.include?('(')
  coefs = [1]
  formula_parts.each.with_index do |e, i|
    if e == '('
      coefs << coefs[-1] * formula_parts[i-1]
    elsif e == ')'
      coefs.pop
    elsif e.class == Array
      formula_parts[i] = [e[0]*coefs[-1], e[1]]
    end
  end
  .select{|e| e.class == Array}
end #=> [[2, "S"], [-3, "q"], [1, "H"], [2, "w"], [-12, "S"], [6, "q"], [-2, "q"], [-8, "w"], [10, "q"], [-8, "q"], [-2, "H"]]

def splitter(formula)
  formula.chars.slice_when{|a, b| /[\(\)]/ === a || /[\(\)]/ === b}
  .map{|arr| arr.slice_when{|a, b| /-|\+/ === b}.to_a }.flatten(1)
  .map{|a| /[a-zA-Z]/ === a[-1] ? [a[0..-2].join.to_i, a[-1]] : /[\(\)]/ === a.join ? a.join : a.join.to_i}
end #=> [[2, "S"], [-3, "q"], [1, "H"], [2, "w"], 2, "(", -3, "(", #...  ...# [-4, "q"], ")", ")", [-1, "H"], ")"]

def add_coef1(formula)
  formula.tr(' ', '').gsub(/(^|[^\d])([a-zA-Z])/, '\11\2').gsub(/(^|[^\d])(\()/, '\11\2').gsub(/(\()(\()/, '\11\2')
end #=> "1(1c + 1a) + 1(-1(1b + 1h))"

def simplify(examples, formula)
  examples = examples.map do |ex|
    ex = ex.split(' = ')
    ["(#{ex[0]})", ex[1]]
  end
  counter = 0
  examples.cycle do |v, k|
    formula.gsub!(/#{k}/, "#{v}")
    counter += 1
    break if counter > examples.size && formula.gsub(/[^a-zA-z]/, '').chars.uniq.size == 1
  end
  summator(open_parentheses(splitter(add_coef1(formula)))).join
end
