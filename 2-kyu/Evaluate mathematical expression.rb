#===============================================================================================================
#                                               Description
#===============================================================================================================

# Instructions
# Given a mathematical expression as a string you must return the result as a number.
#
# Numbers
# Number may be both whole numbers and/or decimal numbers. The same goes for the returned result.
#
# Operators
# You need to support the following mathematical operators:
#
# Multiplication *
# Division / (as floating point division)
# Addition +
# Subtraction -
# Operators are always evaluated from left-to-right, and * and / must be evaluated before + and -.
#
# Parentheses
# You need to support multiple levels of nested parentheses, ex. (2 / (2 + 3.33) * 4) - -6
#
# Whitespace
# There may or may not be whitespace between numbers and operators.
#
# An addition to this rule is that the minus sign (-) used for negating numbers and parentheses will never be separated by whitespace. I.e all of the following are valid expressions.
#
# 1-1    // 0
# 1 -1   // 0
# 1- 1   // 0
# 1 - 1  // 0
# 1- -1  // 2
# 1 - -1 // 2
# 1--1   // 2
#
# 6 + -(4)   // 2
# 6 + -( -4) // 10
# And the following are invalid expressions
#
# 1 - - 1    // Invalid
# 1- - 1     // Invalid
# 6 + - (4)  // Invalid
# 6 + -(- 4) // Invalid
# Validation
# You do not need to worry about validation - you will only receive valid mathematical expressions following the above rules.
#
# Restricted APIs

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def calc_unit(expression)
  exp = expression.gsub(/--/,'+').gsub(/-\+|\+-/,'-').gsub(/\+\+/,'+')
  arr = exp.chars.slice_when{|a,b| /[\/*+-]/ === a or /[\/*+-]/ === b}.map(&:join).map{|e| /[\/*+-]/ === e ? e : e.to_f}
  while arr.any?{|e| /[\/*]/ === e}
    arr.each.with_index do |e, i|
      if e == '*' or e == '/'
        j, m = (arr[i+1] == '-' ? [i+2, -1] : arr[i+1] == '+' ? [i+2, 1] : [i+1, 1])
        arr[i-1..j] = [arr[i-1].send(e, m * arr[j])]
      end
    end
  end
  while arr.any?{|e| /[+-]/ === e} && arr.size > 2
    arr.each.with_index do |e, i|
      if e == '+' or (e == '-' && i != 0)
        j, m = (i == 2 && arr[0] == '-' ? [0, -1] : [i-1, 1])
        arr[j..i+1] = [(m * arr[i-1]).send(e, arr[i+1])]
      end
    end
  end
  arr
end

def calc(expression)
  arr = expression.tr(' ','').chars
  while arr.include?('(')
    ind = nil
    arr.each.with_index do |e, i|
      if e == '('
        ind = i
      elsif e == ')'
        arr[ind..i] = calc_unit(arr[ind..i][1..-2].join)
        break
      end
    end
  end
  calc_unit(arr.join).join.to_f
end
