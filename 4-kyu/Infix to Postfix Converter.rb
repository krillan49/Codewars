#===============================================================================================================
#                                               Description
#===============================================================================================================

# Construct a function that, when given a string containing an expression in infix notation, will return an identical expression in postfix notation.
#
# The operators used will be +, -, *, /, and ^ with left-associativity of all operators but ^.
#
# The precedence of the operators (most important to least) are : 1) parentheses, 2) exponentiation, 3) times/divide, 4) plus/minus.
#
# The operands will be single-digit integers between 0 and 9, inclusive.
#
# Parentheses may be included in the input, and are guaranteed to be in correct pairs.
#
# to_postfix("2+7*5") # Should return "275*+"
# to_postfix("3*3/(7+1)") # Should return "33*71+/"
# to_postfix("5+(6-2)*9+3^(7-1)") # Should return "562-9*+371-^+"
# to_postfix("1^2^3") # Should return "123^^"
# You may read more about postfix notation, also called Reverse Polish notation, here: http://en.wikipedia.org/wiki/Reverse_Polish_notation

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class PostfixConverter
  def initialize(units)
    @units = units.chars
    @braket_ind = {}
    @levels = [['('], ['^'], ['*','/'], ['+','-']]
    @lvl = 1
  end

  def main
    return convert(@units).join if !@units.include?('(')
    braket_to_ind
    braks = @braket_ind.map{|k, v| [k, v, convert(@units[k+1..v-1]).join] }
    res = []
    k = 0
    braks.each do |i, j, e|
      i == 0 ? res << e : res << @units[k..i-1] << e
      k = j + 1
    end
    res << @units[k..-1] if k != @units.size-1
    convert(res.flatten).join
  end

  private

  def convert(cod)
    res = []
    loop do
      break if cod.size == 1
      @lvl += 1 until @levels[@lvl].any?{|e| cod.include?(e)}
      cod.each.with_index{|e, i|
        if @levels[@lvl].include?(e)
          res += (i - 1 != 0 ? cod[0..i-2] : []) + [cod[i-1] + cod[i+1] + cod[i]] + (i + 1 != cod.size-1 ? cod[i+2..-1] : [])
          break
        end
      }
      cod, res = res, []
    end
    @lvl = 1
    cod
  end

  def braket_to_ind
    @units.each.with_index{|e, i|
      if e == '('
        point = 1
        @units[i+1..-1].each.with_index{|c, j|
          point += 1 if c == '('
          point -= 1 if c == ')'
          if point == 0
            @braket_ind[i] = j + i + 1
            break
          end
        }
      end
    }
  end
end

def to_postfix(infix)
  converter = PostfixConverter.new(infix)
  converter.main
end
