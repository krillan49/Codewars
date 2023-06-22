#===============================================================================================================
#                                               Description
#===============================================================================================================

# Simpler Interactive interpreter (or REPL)
# You will create an interpreter which takes inputs described below and produces outputs, storing state in between each input. This is a simplified version of the Simple Interactive Interpreter kata with functions removed, so if you have fun with this kata, check out its big brother to add functions into the mix.
#
# If you're not sure where to start with this kata, check out ankr's Evaluate Mathematical Expression kata.
#
# Note that the eval command has been disabled.
#
# Concepts
# The interpreter will take inputs in the language described under the language header below. This section will give an overview of the language constructs.
#
# Variables
# Any identifier which is not a keyword will be treated as a variable. If the identifier is on the left hand side of an assignment operator, the result of the right hand side will be stored in the variable. If a variable occurs as part of an expression, the value held in the variable will be substituted when the expression is evaluated.
#
# Variables are implicitly declared the first time they are assigned to.
#
# Example: Initializing a variable to a constant value and using the variable in another expression (Each line starting with a '>' indicates a separate call to the input method of the interpreter, other lines represent output)
#
# >x = 7
#     7
# >x + 6
#     13
# Referencing a non-existent variable will cause the interpreter to throw an error. The interpreter should be able to continue accepting input even after throwing.
#
# Example: Referencing a non-existent variable
#
# >y + 7
#     ERROR: Invalid identifier. No variable with name 'y' was found."
# Assignments
# An assignment is an expression that has an identifier on left side of an = operator, and any expression on the right. Such expressions should store the value of the right hand side in the specified variable and return the result.
#
# Example: Assigning a constant to a variable
#
# x = 7
#     7
# In this kata, all tests will contain only a single assignment. You do not need to consider chained or nested assignments.
#
# Operator Precedence
# Operator precedence will follow the common order. There is a table in the Language section below that explicitly states the operators and their relative precedence.
#
# Name conflicts
# Because variables are declared implicitly, no naming conflicts are possible. variable assignment will always overwrite any existing value.
#
# Input
# Input will conform to the expression production in the grammar below.
#
# Output
# Output for a valid expression will be the result of the expression.
#
# Output for input consisting entirely of whitespace will be an empty string (null in case of Java).
#
# All other cases will throw an error.
#
# Language
# Grammar
# This section specifies the grammar for the interpreter language in EBNF syntax
#
# expression      ::= factor | expression operator expression
# factor          ::= number | identifier | assignment | '(' expression ')'
# assignment      ::= identifier '=' expression
#
# operator        ::= '+' | '-' | '*' | '/' | '%'
#
# identifier      ::= letter | '_' { identifier-char }
# identifier-char ::= '_' | letter | digit
#
# number          ::= { digit } [ '.' digit { digit } ]
#
# letter          ::= 'a' | 'b' | ... | 'y' | 'z' | 'A' | 'B' | ... | 'Y' | 'Z'
# digit           ::= '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'
# Operator Precedence
# The following table lists the language's operators grouped in order of precedence. Operators within each group have equal precedence.
#
# Category	Operators
# Multiplicative	*, /, %
# Additive	+, -
# Assignment	=

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Interpreter
  def initialize
    @vars = {}
    @tokens = []
  end

  def input(expr)
    return '' if expr == ''
    @tokens = tokenize(expr).map{|a| a[0]}
    return calc(expr) if @tokens.count{|e| /[a-z]/i === e} == 0
    variable_check
  end

  private

  def variable_check
    if @tokens.include?('=')
      vars = @tokens.select{|e| /[a-z]/i === e}
      @tokens = @tokens.map{|e| @vars[e] ? @vars[e] : e} if vars.size > 1 # если в правой части есть переменные
      var, expr = @tokens.join.split('=')[0], @tokens.join.split('=')[1]
      @vars[var] = calc(expr)
    else # без присвоения
      @tokens = @tokens.map{|e| @vars[e] ? @vars[e] : e}
      vars = @tokens.select{|e| /[a-z]/i === e}
      raise Error, "ERROR: Invalid identifier. No variable with name '#{vars.join(' ')}' was found." if vars != []
      calc(@tokens.join)
    end
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

  def calc_unit(expression)
    exp = expression.gsub(/--/, '+').gsub(/-\+|\+-/, '-').gsub(/\+\+/, '+')
    arr = exp.chars.slice_when{|a, b| /[%\/*+-]/ === a or /[%\/*+-]/ === b}.map(&:join).map{|e| /[%\/*+-]/ === e ? e : e.to_f}
    while arr.any?{|e| /[%\/*]/ === e}
      arr.each.with_index do |e, i|
        if e == '*' or e == '/' or e == '%'
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

  def tokenize(program)
    regex = /\s*([-+*\/\%=\(\)]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*\.?[0-9]+)\s*/
    program.scan(regex).select { |s| !(s =~ /^\s*$/) }
  end
end
