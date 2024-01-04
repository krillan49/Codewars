#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this kata your task is to differentiate a mathematical expression given as a string in prefix notation. The result should be the derivative of the expression returned in prefix notation.
#
# To simplify things we will use a simple list format made up of parentesis and spaces.
#
# The expression format is (func arg1) or (op arg1 arg2) where op means operator, func means function and arg1, arg2 are aguments to the operator or function. For example (+ x 1) or (cos x)
#
# The expressions will always have balanced parentesis and with spaces between list items.
#
# Expression operators, functions and arguments will all be lowercase.
#
# Expressions are single variable expressions using x as the variable.
#
# Expressions can have nested arguments at any depth for example (+ (* 1 x) (* 2 (+ x 1)))
#
# Examples of prefix notation in this format:
#
# (+ x 2)        // prefix notation version of x+2
#
# (* (+ x 3) 5)  // same as 5 * (x + 3)
#
# (cos (+ x 1))  // same as cos(x+1)
#
# (^ x 2)        // same as x^2 meaning x raised to power of 2
# The operators and functions you are required to implement are + - * / ^ cos sin tan exp ln where ^ means raised to power of. exp is the exponential function (same as e^x) and ln is the natural logarithm (base e).
#
# Example of input values and their derivatives:
#
# (* 1 x) => 1
#
# (^ x 3) => (* 3 (^ x 2))
#
# (cos x) => (* -1 (sin x))
# In addition to returning the derivative your solution must also do some simplifications of the result but only what is specified below.
#
# The returned expression should not have unecessary 0 or 1 factors. For example it should not return (* 1 (+ x 1)) but simply the term (+ x 1) similarly it should not return (* 0 (+ x 1)) instead it should return just 0
#
# Results with two constant values such as for example (+ 2 2) should be evaluated and returned as a single value 4
#
# Any argument raised to the zero power should return 1 and if raised to 1 should return the same value or variable. For example (^ x 0) should return 1 and (^ x 1) should return x
#
# No simplifactions are expected for functions like cos, sin, exp, ln... (but their arguments might require a simplification).
#
# Think recursively and build your answer according to the rules of derivation and sample test cases.
#
# If you need to diff any test expressions you can use Wolfram Alpha however remember we use prefix format in this kata.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class DiffExp
  def initialize(exp)
    @exp = exp
  end

  def main
    str_to_a # ["-", ["+", {"x"=>1}, {"x"=>1}], {"x"=>1}]
    @exp = recursion_cycle(@exp, 'simplify') if @exp.class == Array
    @exp = derivative(@exp)
    @exp = recursion_cycle(@exp, 'simplify') if @exp.class == Array
    if @exp.class == Array
      @exp = recursion_cycle(@exp, 'result')
    elsif @exp.class == Hash
      @exp = result_to_s(@exp)
    end
    @exp.to_s
  end

  private

  def str_to_a
    @exp = @exp.tr('()', '[]')
               .split('')
               .map{|e| e.chars.slice_when{|a, b| a == '[' || b == ']'}.map(&:join)}
               .flatten
               .map{|e| /^\d*$|\[|\]| / === e ? e : "'#{e}'"}
               .join
               .gsub(/ /, ',')
               .gsub(/'e''x''p'/, "'exp'")
               .gsub(/'x'/, '{"x" => 1}')
    @exp = eval(@exp)
  end

  def recursion_cycle(exp, option) # inner array for methods simplify_inner_exp(exp) or result_to_s(exp)
    exp = exp.map do |ex|
      if ex.class == Array && option == 'simplify'
        ex.any?{|e| e.class == Array} ? recursion_cycle(ex, option) : simplify_inner_exp(ex)
      elsif ex.class == Array && option == 'result'
        ex.any?{|e| e.class == Array || e.class == Hash} ? recursion_cycle(ex, option) : result_to_s(ex)
      else
        ex
      end
    end
    option == 'simplify' ? simplify_inner_exp(exp) : result_to_s(exp)
  end

  def simplify_inner_exp(exp)
    if exp[1].class == Integer && exp[2].class == Integer
      exp[0] == '**' if exp[0] == '^'
      exp[1].send(exp[0], exp[2])
    elsif exp[0] == '+' && (exp[1] == 0 || exp[2] == 0)
      exp[1] == 0 ? exp[2] : exp[1]
    elsif exp[0] == '-' && (exp[1] == 0 || exp[2] == 0)
      exp[1] == 0 ? -exp[2] : exp[1]
    elsif exp[0] == '*' && (exp[1] == 0 || exp[2] == 0)
      0
    elsif exp[0] == '*' && (exp[1] == 1 || exp[2] == 1)
      exp[1] == 1 ? exp[2] : exp[1]
    elsif exp[0] == '*' && exp[1].class == Integer && exp[2].class == Array && exp[2][0] == '*'
      ['*', exp[1] * exp[2][1], exp[2][2]]
    elsif exp[0] == '^'
      exp[1] == 0 ? 0 : exp[2] == 0 || exp[1] == 1 ? 1 : exp[2] == 1 ? exp[1] : exp
    elsif exp[1..2].all?{|e| e.class == Hash} && %w[+ -].include?(exp[0])  # both has x
      x = exp[1].keys[0]
      exp = {x => exp[1][x].send(exp[0], exp[2][x])}
    elsif exp.count{|e| e.class == Hash} == 1 && %w[* /].include?(exp[0]) # 1 has x
      if exp[1].class == Hash || exp[0] == '*' # ["/", {"x"=>1}, 1], ["*", {"x"=>1}, 1], ["*", 1, {"x"=>1}]
        hh, n = exp[1..-1].find{|e| e.class == Hash}, exp[1..-1].find{|e| e.class != Hash}
        x = hh.keys[0]
        k = hh[x].send(exp[0], n.to_f)
        k = k.to_i if k % 1 == 0
        exp = {x => k}
      else # ["/", 1, {"x"=>1}]
        exp
      end
    else
      exp
    end
  end

  def derivative(exp)
    if exp[0] == 'sin' # sin(n*x) => n*cos(n*x)"
      ['*', derivative(exp[1]), ['cos', exp[1]]]
    elsif exp[0] == 'cos'
      ['*', -1, ['*', derivative(exp[1]), ['sin', exp[1]]]]
    elsif exp[0] == 'tan' # (tan (* 2 x))') -> (* 2 (^ (cos (* 2 x)) -2))
      ['*', derivative(exp[1]), ['^', ['cos', exp[1]], -2]]
    elsif exp[0] == 'exp' # '(exp x)'
      ['*', derivative(exp[1]), ['exp', exp[1]]]
    elsif exp[0] == 'ln' # '(/ 1 x)'
      ['/', 1, exp[1]]
    elsif exp[0] == '^'
      ["^", ["*", exp[2], exp[1]], exp[2] - 1]
    elsif exp[0] == '/' # (u/v)' = (u'v - uv')/v^2
      [ '/', ['-', ['*', derivative(exp[1]), exp[2]], ['*', derivative(exp[2]), exp[1]]], ['^', exp[2], 2] ]
    elsif exp[0] == '*'
      i, j = exp[1].class == Integer ? [2, 1] : [1, 2]
      exp[i] = exp[i].map{|e| e.class == Hash ? {'x' => e['x'] *= exp[j]} : e.class == Integer ? e * exp[j] : e}
      derivative(exp[i]).compact
    elsif exp[0] == '+'
      ["+", derivative(exp[1]), derivative(exp[2])]
    elsif exp.class == Hash
      exp['x']
    elsif exp.class == Integer
      0
    end
  end

  def result_to_s(exp) # ["*", -2, ["sin", {"x"=>2}]] -> (* -2 (sin (* 2 x)))
    exp.to_s
       .tr('"','')
       .gsub(/{x=>1}/, 'x')
       .gsub(/{x=>(\d+)}/, '(* \1 x)')
       .gsub(/^\[([a-z]+), (\(.+?\)|x)\]$/, '(\1 \2)')
       .gsub(/^\[([\*\/\+-^]), (.+?), (.+?)\]$/, '(\1 \2 \3)')
  end
end


def diff(s)
  DiffExp.new(s).main
end
